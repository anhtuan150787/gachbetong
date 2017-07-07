<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Home\Form\Contact;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class ContactController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontContactModel');

        $form = new Contact();


        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $form->setData($data);
            if ($form->isValid()) {
                $params = [];
                $params['contact_fullname'] = $this->params()->fromPost('contact_fullname');
                $params['contact_email']    = $this->params()->fromPost('contact_email');
                $params['contact_phone']    = $this->params()->fromPost('contact_phone');
                $params['contact_content']  = $this->params()->fromPost('contact_content');
                $params['contact_date']     = date('Y-m-d H:i:s');

                $model->save($params);

                $this->redirect()->toRoute('home-lien-he-success');
            }
        }

        //Load template
        $dbAdapter = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $statement = $dbAdapter->query('SELECT * FROM template');
        $template = $statement->execute();
        $templateData = [];
        foreach($template as $v) {
            $templateData[$v['template_id']] = $v;
        }

        $view->setVariables([
            'form' => $form,
            'templateData' => $templateData,
        ]);

        return $view;
    }

    public function successAction() {
        $view = new ViewModel();

        //Load template
        $dbAdapter = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $statement = $dbAdapter->query('SELECT * FROM template');
        $template = $statement->execute();
        $templateData = [];
        foreach($template as $v) {
            $templateData[$v['template_id']] = $v;
        }



        $view->setVariables([
            'templateData' => $templateData,
        ]);

        return $view;
    }

}
