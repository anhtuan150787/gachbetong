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

use Admin\Form\Template;

class TemplateController extends AbstractActionController
{
    use MasterTrait;

    private $module = 'template';

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

        $group_template_id = $this->params()->fromQuery('group_template_id');

        if (!$group_template_id || $group_template_id == '') {
            $this->redirect()->toRoute('admin/group-template');
        }

        $model = $this->getServiceLocator()->get('TemplateModel');
        $groupTemplateModel = $this->getServiceLocator()->get('GroupTemplateModel');

        $records = $model->fetchAll($group_template_id);
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $groupTemplate = $groupTemplateModel->fetchRow($group_template_id);

        $view->setVariables(['records' => $records, 'module' => $this->module, 'groupTemplate' => $groupTemplate, 'status' => $this->status]);

        return $view;
    }

    public function addAction()
    {
        $actionTitle = 'Thêm';
        $view = new ViewModel();
        $form = new Template();
        $form->init();

        $group_template_id = $this->params()->fromQuery('group_template_id');

        if (!$group_template_id || $group_template_id == '') {
            $this->redirect()->toRoute('admin/group-template');
        }

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('TemplateModel');
        $groupTemplateModel = $this->getServiceLocator()->get('GroupTemplateModel');

        if ($this->getRequest()->isPost()) {
            $pictureInfo = $this->params()->fromFiles('template_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            if ($form->isValid()) {

                $pictureNewName = '';
                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/templates');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('news_');
                    $uploadService->upload();
                    $pictureNewName = $uploadService->getNewFile();
                }

                $input = array();
                $input['template_name'] = $this->params()->fromPost('template_name');
                $input['group_template_id'] = $this->params()->fromQuery('group_template_id');
                $input['template_content'] = $this->params()->fromPost('template_content');
                $input['template_url'] = $this->params()->fromPost('template_url');
                $input['template_status'] = $this->params()->fromPost('template_status');
                $input['template_picture'] = $pictureNewName;
                $model->save($input);

                $this->flashMessenger()->addMessage('Thêm thành công.');
                $this->redirect()->toRoute('admin/' . $this->module, array('action' => 'index'), array('query' => array('group_template_id' => $group_template_id)));
            }
        }

        $groupTemplate = $groupTemplateModel->fetchRow($group_template_id);

        $form->get('template_status')->setOptions(array('value_options' => $this->status));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'actionTitle' => $actionTitle, 'module' => $this->module, 'groupTemplate' => $groupTemplate]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function editAction()
    {
        $view = new ViewModel();
        $form = new Template();
        $form->init();

        $group_template_id = $this->params()->fromQuery('group_template_id');

        if (!$group_template_id || $group_template_id == '') {
            $this->redirect()->toRoute('admin/group-template');
        }

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('TemplateModel');
        $groupTemplateModel = $this->getServiceLocator()->get('GroupTemplateModel');


        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {

            $pictureInfo = $this->params()->fromFiles('template_picture');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }

            $form->setData($postData);

            if ($form->isValid()) {
                $input = array();

                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/templates');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('template_');
                    $uploadService->upload();

                    unlink('public/pictures/templates/' . $record['template_picture']);

                    $input['template_picture'] = $uploadService->getNewFile();
                }
                $input['template_name'] = $this->params()->fromPost('template_name');
                $input['template_content'] = $this->params()->fromPost('template_content');
                $input['template_url'] = $this->params()->fromPost('template_url');
                $input['template_status'] = $this->params()->fromPost('template_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module, array('action' => 'index'), array('query' => array('group_template_id' => $group_template_id)));
            }
        }

        $form->bind($record);

        $data['form'] = $form;

        $groupTemplate = $groupTemplateModel->fetchRow($group_template_id);

        $form->get('template_status')->setOptions(array('value_options' => $this->status));

        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $view->setVariables(['form' => $form, 'record' => $record, 'module' => $this->module, 'groupTemplate' => $groupTemplate]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deleteAction()
    {

        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
            $group_template_id = $this->params()->fromPost('group_template_id');
        } else {
            $id[] = $this->params()->fromQuery('id');
            $group_template_id = $this->params()->fromQuery('group_template_id');
        }

        if (!$group_template_id || $group_template_id == '') {
            $this->redirect()->toRoute('admin/group-template');
        }

        $model  = $this->getServiceLocator()->get('TemplateModel');


        if (is_array($id)) {
            foreach($id as $k => $v) {
                $record = $model->fetchRow($v);
                unlink('public/pictures/templates/' . $record['template_picture']);
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module, array('action' => 'index'), array('query' => array('group_template_id' => $group_template_id)));

        return $this->response();
    }

    public function deletePictureAction()
    {
        $id     = $this->params()->fromPost('id');
        $model  = $this->getServiceLocator()->get('TemplateModel');
        $record = $model->fetchRow($id);

        unlink('public/pictures/templates/' . $record['template_picture']);

        $params                     = array();
        $params['template_picture']     = null;
        $model->save($params, $id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
