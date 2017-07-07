<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Admin\Form\GroupAdminAcl;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Admin\Form\GroupAdmin;


class GroupAdminController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'group-admin';

    public function __construct()
    {
        $this->status = [
            '1' => 'Kích hoạt',
            '0' => 'Tạm dừng',
        ];
    }
    public function indexAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('GroupAdminModel');

        $records = $model->fetchList();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new GroupAdmin();
        $form->init();

        $model = $this->getServiceLocator()->get('GroupAdminModel');

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['group_admin_name']          = $this->params()->fromPost('group_admin_name');
                $input['group_admin_status']        = $this->params()->fromPost('group_admin_status');
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/'. $this->module);
            }
        }

        $form->get('group_admin_status')->setOptions(array('value_options' => $this->status));
        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new GroupAdmin();
        $form->init();

        $model = $this->getServiceLocator()->get('GroupAdminModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['group_admin_name']          = $this->params()->fromPost('group_admin_name');
                $input['group_admin_status']        = $this->params()->fromPost('group_admin_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));
        $form->get('group_admin_status')->setOptions(array('value_options' => $this->status));
        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deleteAction()
    {
        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
        } else {
            $id[] = $this->params()->fromQuery('id');
        }

        $model  = $this->getServiceLocator()->get('GroupAdminModel');
        $userModel = $this->getServiceLocator()->get('AdminModel');
        $groupAclModel = $this->getServiceLocator()->get('GroupAclModel');
        $groupMenuModel = $this->getServiceLocator()->get('GroupMenuModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $userModel->deleteWhere(array('group_admin_id' => $v));
                $groupAclModel->deleteWhere(array('group_admin_id' => $v));
                $groupMenuModel->deleteWhere(array('group_admin_id' => $v));
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }

    public function aclAction()
    {
        $view = new ViewModel();
        $form =  new GroupAdminAcl();

        $cache  = $this->getServiceLocator()->get('cache');

        $groupAdminModel = $this->getServiceLocator()->get('GroupAdminModel');

        $menuModel  = $this->getServiceLocator()->get('MenuModel');
        $groupMenuModel = $this->getServiceLocator()->get('GroupMenuModel');

        $aclModel = $this->getServiceLocator()->get('AclModel');
        $groupAclModel = $this->getServiceLocator()->get('GroupAclModel');

        $id = $this->params()->fromQuery('id');

        if ($this->getRequest()->isPost()) {
            $menus = $this->params()->fromPost('menu');
            $acls = $this->params()->fromPost('acl');

            $groupMenuModel->saveWhere(['group_menu_status' => 0], ['group_admin_id' => $id]);
            foreach($menus as $k => $v) {
                $checkExist = $groupMenuModel->checkExistMenu($id, $k);

                if ($checkExist > 0) {
                    $groupMenuModel->saveWhere(['group_menu_status' => $v], ['group_admin_id' => $id, 'menu_id' => $k]);
                } else {
                    $groupMenuModel->save(['group_admin_id' => $id, 'menu_id' => $k, 'group_menu_status' => $v]);
                }
            }

            $groupAclModel->saveWhere(['group_acl_status' => 0], ['group_admin_id' => $id]);
            foreach($acls as $k => $v) {
                $checkExist = $groupAclModel->checkExistAcl($id, $k);

                if ($checkExist > 0) {
                    $groupAclModel->saveWhere(['group_acl_status' => $v], ['group_admin_id' => $id, 'acl_id' => $k]);
                } else {
                    $groupAclModel->save(['group_admin_id' => $id, 'acl_id' => $k, 'group_acl_status' => $v]);
                }
            }

            //Cache
            $cache->clear('permission_menu_' . $id);
            $cache->clear('permission_group_' . $id);
            $cache->clear('permission_resource_' . $id);
            $cache->clear('permission_allow_' . $id);

            $this->flashMessenger()->addMessage('Cập nhật quyền thành công');
            $this->redirect()->toRoute('admin/' . $this->module);
        }

        $groupMenuResults = $groupMenuModel->getGroupMenu($id);
        $groupMenus = [];
        foreach($groupMenuResults as $v) {
            $groupMenus[$v['menu_id']] = $v;
        }
        //$menus = $menuModel->getMenuList();
        if (!$cache->checkItem('admin_menu')) {
            $menus = $menuModel->getMenuList();
            $cache->set('admin_menu', $menus);
        } else {
            $menus = $cache->get('admin_menu');
        }

        $groupAclResults = $groupAclModel->getGroupAcl($id);
        $groupAcls = [];
        foreach($groupAclResults as $v) {
            $groupAcls[$v['acl_id']] = $v;
        }
        //$acls = $aclModel->getAclList();
        if (!$cache->checkItem('admin_acl')) {
            $acls = $aclModel->getAclList();
            $cache->set('admin_acl', $acls);
        } else {
            $acls = $cache->get('admin_acl');
        }

        $groupInfo = $groupAdminModel->fetchRow($id);

        $view->setVariables([
            'groupMenus' => $groupMenus,
            'menus' => $menus,
            'groupAcls' => $groupAcls,
            'acls' => $acls,
            'form' => $form,
            'groupInfo' => $groupInfo,
            'module' => $this->module
        ]);

        return $view;
    }
}
