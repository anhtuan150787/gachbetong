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
use Zend\Session\Container;

use Admin\Form\News;

class NewsController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'news';

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
            $session->offsetUnset('search-news');
        }

        if ($session->offsetExists('search-news')) {
            $search = $session->offsetGet('search-news');
        }

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $search['name'] = ($data['name'] != '') ? $data['name'] : null;
            $search['category'] = ($data['category'] != '') ? $data['category'] : null;
            $session->offsetSet('search-news', $search);
        }

        $model = $this->getServiceLocator()->get('NewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('NewsCategoryModel');

        $records = $model->fetchAll($search);
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $newsCategory = $newsCategoryModel->getNewsCategoryList();

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module, 'newsCategory' => $newsCategory, 'search' => $search]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new News();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('NewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('NewsCategoryModel');

        if ($this->getRequest()->isPost()) {
            $pictureInfo = $this->params()->fromFiles('news_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            if ($form->isValid()) {

                $pictureNewName = '';
                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/news');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('news_');
                    $uploadService->upload();
                    $pictureNewName = $uploadService->getNewFile();
                }

                $input = array();
                $input['news_category_id'] = $this->params()->fromPost('news_category_id');
                $input['news_title'] = $this->params()->fromPost('news_title');
                $input['news_quote'] = $this->params()->fromPost('news_quote');
                $input['news_content'] = $this->params()->fromPost('news_content');
                $input['news_status'] = $this->params()->fromPost('news_status');
                $input['news_picture'] = $pictureNewName;
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $newsCategoryRoot = $newsCategoryModel->getNewsCategoryList();
        $optionsNewsCategory = array(0 => '--- Chọn Danh mục ---');
        foreach ($newsCategoryRoot as $k => $v) {
            $optionsNewsCategory[$v['news_category_id']] = str_repeat('__', $v['news_category_level']) . ' ' . $v['news_category_name'];
        }
        $form->get('news_status')->setOptions(array('value_options' => $this->status));
        $form->get('news_category_id')->setOptions(array('value_options' => $optionsNewsCategory));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new News();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('NewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('NewsCategoryModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $pictureInfo = $this->params()->fromFiles('news_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            if ($form->isValid()) {

                $input = array();

                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/news');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('news_');
                    $uploadService->upload();

                    unlink('public/pictures/news/' . $record['news_picture']);

                    $input['news_picture'] = $uploadService->getNewFile();
                }
                $input['news_category_id'] = $this->params()->fromPost('news_category_id');
                $input['news_title'] = $this->params()->fromPost('news_title');
                $input['news_quote'] = $this->params()->fromPost('news_quote');
                $input['news_content'] = $this->params()->fromPost('news_content');
                $input['news_status'] = $this->params()->fromPost('news_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $newsCategoryRoot = $newsCategoryModel->getNewsCategoryList();
        $optionsNewsCategory = array(0 => '--- Chọn Danh mục ---');
        foreach ($newsCategoryRoot as $k => $v) {
            $optionsNewsCategory[$v['news_category_id']] = str_repeat('__', $v['news_category_level']) . ' ' . $v['news_category_name'];
        }
        $form->get('news_status')->setOptions(array('value_options' => $this->status));
        $form->get('news_category_id')->setOptions(array('value_options' => $optionsNewsCategory));
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

        $model  = $this->getServiceLocator()->get('NewsModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $record = $model->fetchRow($v);
                $model->delete($v);
                unlink('public/pictures/news/' . $record['news_picture']);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }

    public function deletePictureAction()
    {
        $id     = $this->params()->fromPost('id');
        $model  = $this->getServiceLocator()->get('NewsModel');
        $record = $model->fetchRow($id);

        unlink('public/pictures/news/' . $record['news_picture']);

        $params                     = array();
        $params['news_picture']     = null;
        $model->save($params, $id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
