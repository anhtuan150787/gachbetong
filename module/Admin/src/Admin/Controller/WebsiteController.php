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

use Admin\Form\Website;

class WebsiteController extends AbstractActionController
{
    use MasterTrait;

    private $module = 'website';

    public function editAction()
    {
        $actionTitle = 'Cập nhật';
        $view = new ViewModel();
        $form = new Website();
        $form->init();

        $uploadService = $this->getServiceLocator()->get('upload_file');
        $model = $this->getServiceLocator()->get('WebsiteModel');
        $id = 1;
        $record = $model->fetchRow($id);

        if ($this->getRequest()->isPost()) {
            $pictureInfo = $this->params()->fromFiles('website_icon');
            if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                $postData = array_merge_recursive($this->getRequest()->getPost()->toArray(), $this->getRequest()->getFiles()->toArray());
            } else {
                $postData = $this->getRequest()->getPost();
            }
            $form->setData($postData);

            $input = array();

            if ($form->isValid()) {

                $pictureNewName = '';
                if (!empty($pictureInfo) && $pictureInfo['name'] != '') {
                    $uploadService->setPath('public/pictures/websites');
                    $uploadService->setFile($pictureInfo['name']);
                    $uploadService->setPrefix('favico_');
                    $uploadService->upload();
                    $pictureNewName = $uploadService->getNewFile();

                    unlink('public/pictures/' . $record['website_icon']);

                    $input['website_icon'] = $pictureNewName;
                }


                $input['website_name'] = $this->params()->fromPost('website_name');
                $input['website_title'] = $this->params()->fromPost('website_title');
                $input['website_description'] = $this->params()->fromPost('website_description');
                $input['website_keyword'] = $this->params()->fromPost('website_keyword');

                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'record' => $record, 'actionTitle' => $actionTitle, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deletePictureAction()
    {
        $id     = 1;
        $model  = $this->getServiceLocator()->get('WebsiteModel');
        $record = $model->fetchRow($id);

        unlink('public/pictures/websites/' . $record['website_icon']);

        $params                     = array();
        $params['website_icon']     = null;
        $model->save($params, $id);

        echo json_encode(array('return' => 1));

        return $this->response;
    }
}
