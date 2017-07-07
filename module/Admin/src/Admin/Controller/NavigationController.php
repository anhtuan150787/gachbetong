<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Admin\View\Helper\Functions;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Admin\Form\Navigation;

class NavigationController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'navigation';

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

        $group_navigation_id = $this->params()->fromQuery('group_navigation_id');

        if (!$group_navigation_id || $group_navigation_id == '') {
            $this->redirect()->toRoute('admin/group-navigation');
        }

        $model = $this->getServiceLocator()->get('NavigationModel');
        $groupNavigationModel = $this->getServiceLocator()->get('GroupNavigationModel');


        $records = $model->getNavigationList($group_navigation_id);

        $groupNavigation = $groupNavigationModel->fetchRow($group_navigation_id);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module, 'groupNavigation' => $groupNavigation]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $functions = new Functions();
        $url = $this->getServiceLocator()->get('viewhelpermanager')->get('url');
        $form = new Navigation();
        $form->init();

        $group_navigation_id = $this->params()->fromQuery('group_navigation_id');
        if (!$group_navigation_id || $group_navigation_id == '') {
            $this->redirect()->toRoute('admin/group-navigation');
        }

        $model = $this->getServiceLocator()->get('NavigationModel');
        $productCategoryModel = $this->getServiceLocator()->get('ProductCategoryModel');
        $newsCategoryModel = $this->getServiceLocator()->get('NewsCategoryModel');
        $pageModel = $this->getServiceLocator()->get('PageModel');
        $groupNavigationModel = $this->getServiceLocator()->get('GroupNavigationModel');

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['navigation_name']          = $this->params()->fromPost('navigation_name');
                $input['navigation_parent']        = $this->params()->fromPost('navigation_parent');
                $input['navigation_status']        = $this->params()->fromPost('navigation_status');
                $input['navigation_url']           = $this->params()->fromPost('navigation_url');
                $input['navigation_url_select']    = $this->params()->fromPost('navigation_url_select');
                $input['navigation_position']      = $this->params()->fromPost('navigation_position');
                $input['group_navigation_id']      = $group_navigation_id;
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/navigation', array('action' => 'index'), array('query' => array('group_navigation_id' => $group_navigation_id)));
            }
        }

        $navigationRoot = $model->getNavigationList($group_navigation_id);
        $optionsNavigation = array(0 => '--- Gốc ---');
        foreach ($navigationRoot as $k => $v) {
            $optionsNavigation[$v['navigation_id']] = str_repeat('__', $v['navigation_level']) . ' ' . $v['navigation_name'];
        }

        $navigationUrlSelect = [];

        $navigationUrlSelectData = array('' => '--- Chọn liên kết đã có ---');

        $productCategory = $productCategoryModel->getProductCategoryList();
        foreach($productCategory as $v) {
            $navigationUrlSelectData[trim($url('home-product-category', array('name' => $functions->formatTitle($v['product_category_name']), 'id' => $v['product_category_id'])), '/')] = '[Danh mục sản phẩm] - ' . $v['product_category_name'];
        }

        $newsCategory = $newsCategoryModel->getNewsCategoryList();
        foreach($newsCategory as $v) {
            $navigationUrlSelectData[trim($url('home-news-category', array('name' => $functions->formatTitle($v['news_category_name']), 'id' => $v['news_category_id'])), '/')] = '[Danh mục bài viết] - ' . $v['news_category_name'];
        }

        $page = $pageModel->getAll();
        foreach($page as $v) {
            $navigationUrlSelectData[trim($url('home-page', array('name' => $functions->formatTitle($v['page_title']), 'id' => $v['page_id'])), '/')] = '[Trang nội dung] - ' . $v['page_title'];
        }

        $groupNavigation = $groupNavigationModel->fetchRow($group_navigation_id);

        $form->get('navigation_parent')->setOptions(array('value_options' => $optionsNavigation));
        $form->get('navigation_status')->setOptions(array('value_options' => $this->status));
        $form->get('navigation_url_select')->setOptions(array('value_options' => $navigationUrlSelectData));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module, 'groupNavigation' => $groupNavigation]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $functions = new Functions();
        $url = $this->getServiceLocator()->get('viewhelpermanager')->get('url');
        $form = new Navigation();
        $form->init();

        $group_navigation_id = $this->params()->fromQuery('group_navigation_id');
        if (!$group_navigation_id || $group_navigation_id == '') {
            $this->redirect()->toRoute('admin/group-navigation');
        }

        $model = $this->getServiceLocator()->get('NavigationModel');
        $productCategoryModel = $this->getServiceLocator()->get('ProductCategoryModel');
        $newsCategoryModel = $this->getServiceLocator()->get('NewsCategoryModel');
        $pageModel = $this->getServiceLocator()->get('PageModel');
        $groupNavigationModel = $this->getServiceLocator()->get('GroupNavigationModel');

        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['navigation_name']          = $this->params()->fromPost('navigation_name');
                $input['navigation_parent']        = $this->params()->fromPost('navigation_parent');
                $input['navigation_status']        = $this->params()->fromPost('navigation_status');
                $input['navigation_url']           = $this->params()->fromPost('navigation_url');
                $input['navigation_url_select']    = $this->params()->fromPost('navigation_url_select');
                $input['navigation_position']      = $this->params()->fromPost('navigation_position');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/navigation', array('action' => 'index'), array('query' => array('group_navigation_id' => $group_navigation_id)));
            }
        }

        $form->bind($record);

        $navigationRoot = $model->getNavigationList($group_navigation_id);
        $optionsNavigation = array(0 => '--- Gốc ---');
        foreach ($navigationRoot as $k => $v) {
            $optionsNavigation[$v['navigation_id']] = str_repeat('__', $v['navigation_level']) . ' ' . $v['navigation_name'];
        }

        $navigationUrlSelect = [];

        $navigationUrlSelectData = array('' => '--- Chọn liên kết đã có ---');

        $productCategory = $productCategoryModel->getProductCategoryList();
        foreach($productCategory as $v) {
            $navigationUrlSelectData[trim($url('home-product-category', array('name' => $functions->formatTitle($v['product_category_name']), 'id' => $v['product_category_id'])), '/')] = '[Danh mục sản phẩm] - ' . $v['product_category_name'];
        }

        $newsCategory = $newsCategoryModel->getNewsCategoryList();
        foreach($newsCategory as $v) {
            $navigationUrlSelectData[trim($url('home-news-category', array('name' => $functions->formatTitle($v['news_category_name']), 'id' => $v['news_category_id'])), '/')] = '[Danh mục bài viết] - ' . $v['news_category_name'];
        }

        $page = $pageModel->getAll();
        foreach($page as $v) {
            $navigationUrlSelectData[trim($url('home-page', array('name' => $functions->formatTitle($v['page_title']), 'id' => $v['page_id'])), '/')] = '[Trang nội dung] - ' . $v['page_title'];
        }

        $groupNavigation = $groupNavigationModel->fetchRow($group_navigation_id);

        $form->get('navigation_parent')->setOptions(array('value_options' => $optionsNavigation));
        $form->get('navigation_status')->setOptions(array('value_options' => $this->status));
        $form->get('navigation_url_select')->setOptions(array('value_options' => $navigationUrlSelectData));

        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module, 'groupNavigation' => $groupNavigation]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deleteAction()
    {

        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
            $group_navigation_id = $this->params()->fromPost('group_navigation_id');
        } else {
            $id[] = $this->params()->fromQuery('id');
            $group_navigation_id = $this->params()->fromQuery('group_navigation_id');
        }

        if (!$group_navigation_id || $group_navigation_id == '') {
            $this->redirect()->toRoute('admin/group-navigation');
        }

        $model  = $this->getServiceLocator()->get('NavigationModel');


        if (is_array($id)) {
            foreach($id as $k => $v) {
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/navigation', array('action' => 'index'), array('query' => array('group_navigation_id' => $group_navigation_id)));

        return $this->response();
    }
}
