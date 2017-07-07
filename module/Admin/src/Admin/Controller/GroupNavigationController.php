<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Admin\Form\GroupNavigation;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class GroupNavigationController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'group-navigation';

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

        $model = $this->getServiceLocator()->get('GroupNavigationModel');

        $records = $model->fetchAll();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new GroupNavigation();
        $form->init();

        $model = $this->getServiceLocator()->get('GroupNavigationModel');

        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['group_navigation_name'] = $this->params()->fromPost('group_navigation_name');
                $input['group_navigation_status'] = $this->params()->fromPost('group_navigation_status');
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->get('group_navigation_status')->setOptions(array('value_options' => $this->status));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new GroupNavigation();
        $form->init();

        $model = $this->getServiceLocator()->get('GroupNavigationModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['group_navigation_name'] = $this->params()->fromPost('group_navigation_name');
                $input['group_navigation_status'] = $this->params()->fromPost('group_navigation_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $form->get('group_navigation_status')->setOptions(array('value_options' => $this->status));
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'record' => $record, 'actionTitle' => $actionTitle, 'module' => $this->module]);
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

        $model  = $this->getServiceLocator()->get('GroupNavigationModel');
        $navigationModel  = $this->getServiceLocator()->get('NavigationModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {

                $navigations = $navigationModel->getNavigationList($v);
                foreach($navigations as $vv) {
                    $navigationModel->delete($vv['navigation_id']);
                }

                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }
}
