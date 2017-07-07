<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Admin\Form\Menu;

class MenuController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'menu';

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

        $cache = $this->getServiceLocator()->get('cache');
        $model = $this->getServiceLocator()->get('MenuModel');

        if (!$cache->checkItem('admin_menu')) {
            $records = $model->getMenuList();
            $cache->set('admin_menu', $records);
        } else {
            $records = $cache->get('admin_menu');
        }

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new Menu();
        $form->init();

        $cache = $this->getServiceLocator()->get('cache');
        $model = $this->getServiceLocator()->get('MenuModel');

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['menu_name']          = $this->params()->fromPost('menu_name');
                $input['menu_parent']        = $this->params()->fromPost('menu_parent');
                $input['menu_status']        = $this->params()->fromPost('menu_status');
                $input['menu_url']        = $this->params()->fromPost('menu_url');
                $model->save($input);

                $cache->clear('admin_menu');

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $menuRoot = $model->getMenuList();
        $optionsMenuRoot = array(0 => '--- Gốc ---');
        foreach ($menuRoot as $k => $v) {
            $optionsMenuRoot[$v['menu_id']] = str_repeat('__', $v['menu_level']) . ' ' . $v['menu_name'];
        }
        $form->get('menu_parent')->setOptions(array('value_options' => $optionsMenuRoot));
        $form->get('menu_status')->setOptions(array('value_options' => $this->status));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new Menu();
        $form->init();

        $cache = $this->getServiceLocator()->get('cache');
        $model = $this->getServiceLocator()->get('MenuModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['menu_name']          = $this->params()->fromPost('menu_name');
                $input['menu_parent']        = $this->params()->fromPost('menu_parent');
                $input['menu_status']        = $this->params()->fromPost('menu_status');
                $input['menu_url']        = $this->params()->fromPost('menu_url');
                $model->save($input, $id);

                $cache->clear('admin_menu');

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $menuRoot = $model->getMenuList();
        $optionsMenuRoot = array(0 => '--- Gốc ---');
        foreach ($menuRoot as $k => $v) {
            $optionsMenuRoot[$v['menu_id']] = str_repeat('__', $v['menu_level']) . ' ' . $v['menu_name'];
        }
        $form->get('menu_parent')->setOptions(array('value_options' => $optionsMenuRoot));
        $form->get('menu_status')->setOptions(array('value_options' => $this->status));
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

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

        $model  = $this->getServiceLocator()->get('MenuModel');
        $cache = $this->getServiceLocator()->get('cache');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $model->delete($v);
            }
        }

        $cache->clear('admin_menu');

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }
}
