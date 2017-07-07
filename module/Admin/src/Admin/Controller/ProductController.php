<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Admin\Form\ProductDetail;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

use Admin\Form\Product;

class ProductController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'product';

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
        $session = new Container();
        $search = [];

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search-product');
        }

        if ($session->offsetExists('search-product')) {
            $search = $session->offsetGet('search-product');
        }

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $search['name'] = ($data['name'] != '') ? $data['name'] : null;
            $search['category'] = ($data['category'] != '') ? $data['category'] : null;
            $session->offsetSet('search-product', $search);
        }

        $model = $this->getServiceLocator()->get('ProductModel');

        $records = $model->fetchAll($search);
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $productCategoryModel = $this->getServiceLocator()->get('ProductCategoryModel');
        $productCategory = $productCategoryModel->getProductCategoryList();

        $view->setVariables(['records' => $records, 'status' => $this->status, 'search' => $search, 'productCategory' => $productCategory, 'module' => $this->module]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new Product();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('ProductModel');
        $productCategoryModel = $this->getServiceLocator()->get('ProductCategoryModel');

        if ($this->getRequest()->isPost()) {
            $pictureInfo = $this->params()->fromFiles('product_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            if ($form->isValid()) {

                $pictureNewName = '';
                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/products');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('product_');
                    $uploadService->upload();
                    $pictureNewName = $uploadService->getNewFile();
                }

                $input = array();
                $input['product_category_id'] = $this->params()->fromPost('product_category_id');
                $input['product_name'] = $this->params()->fromPost('product_name');
                $input['product_code'] = $this->params()->fromPost('product_code');
                $input['product_description'] = $this->params()->fromPost('product_description');
                $input['product_price'] = $this->params()->fromPost('product_price');
                $input['product_price_old'] = $this->params()->fromPost('product_price_old');
                $input['product_type_new'] = $this->params()->fromPost('product_type_new');
                $input['product_type_sale'] = $this->params()->fromPost('product_type_sale');
                $input['product_status'] = $this->params()->fromPost('product_status');
                $input['product_picture'] = $pictureNewName;
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $productCategoryRoot = $productCategoryModel->getProductCategoryList();
        $optionsProductCategory = array(0 => '--- Chọn Danh mục ---');
        foreach ($productCategoryRoot as $k => $v) {
            $optionsProductCategory[$v['product_category_id']] = str_repeat('__', $v['product_category_level']) . ' ' . $v['product_category_name'];
        }
        $form->get('product_status')->setOptions(array('value_options' => $this->status));
        $form->get('product_category_id')->setOptions(array('value_options' => $optionsProductCategory));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new Product();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('ProductModel');
        $productCategoryModel = $this->getServiceLocator()->get('ProductCategoryModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $pictureInfo = $this->params()->fromFiles('product_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            if ($form->isValid()) {

                $input = array();

                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/products');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('product_');
                    $uploadService->upload();

                    unlink('public/pictures/products/' . $record['product_picture']);

                    $input['product_picture'] = $uploadService->getNewFile();
                }
                $input['product_category_id'] = $this->params()->fromPost('product_category_id');
                $input['product_name'] = $this->params()->fromPost('product_name');
                $input['product_code'] = $this->params()->fromPost('product_code');
                $input['product_description'] = $this->params()->fromPost('product_description');
                $input['product_price'] = $this->params()->fromPost('product_price');
                $input['product_price_old'] = $this->params()->fromPost('product_price_old');
                $input['product_type_new'] = $this->params()->fromPost('product_type_new');
                $input['product_type_sale'] = $this->params()->fromPost('product_type_sale');
                $input['product_status'] = $this->params()->fromPost('product_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $productCategoryRoot = $productCategoryModel->getProductCategoryList();
        $optionsProductCategory = array(0 => '--- Chọn Danh mục ---');
        foreach ($productCategoryRoot as $k => $v) {
            $optionsProductCategory[$v['product_category_id']] = str_repeat('__', $v['product_category_level']) . ' ' . $v['product_category_name'];
        }
        $form->get('product_status')->setOptions(array('value_options' => $this->status));
        $form->get('product_category_id')->setOptions(array('value_options' => $optionsProductCategory));
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'record' => $record, 'actionTitle' => $actionTitle, 'id' => $id, 'module' => $this->module]);
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
        $model  = $this->getServiceLocator()->get('ProductModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $record = $model->fetchRow($v);

                $model->delete($v);
                unlink('public/pictures/products/' . $record['product_picture']);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }

    public function deletePictureAction()
    {
        $id     = $this->params()->fromPost('id');
        $model  = $this->getServiceLocator()->get('ProductModel');
        $record = $model->fetchRow($id);

        unlink('public/pictures/products/' . $record['product_picture']);

        $params                     = array();
        $params['product_picture']  = null;
        $model->save($params, $id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
