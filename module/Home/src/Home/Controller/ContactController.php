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
        $message = '';

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


                $patterns = [];
                $patterns[0] = '/{fullname}/';
                $patterns[1] = '/{email}/';
                $patterns[2] = '/{phone}/';
                $patterns[3] = '/{content}/';

                $replacements = [];
                $replacements[0] = $params['contact_fullname'];
                $replacements[1] = $params['contact_email'];
                $replacements[2] = $params['contact_phone'];
                $replacements[3] = $params['contact_content'];

                $bodyMail = file_get_contents('data/email-template/contact.php');
                $bodyMail = preg_replace($patterns, $replacements, $bodyMail);

                $sendMail = $this->getServiceLocator()->get('send_mail');

                $config = include 'config/mailer.php';
                $sendMail->setTo($config['to_second']);
                $sendMail->setSubject('Liên hệ');
                $sendMail->setBody($bodyMail);
                $sendMail->action();

                $this->redirect()->toRoute('home-lien-he-success');
            } else {
                $message = $form->getMessages();
                if (isset($message['Captcha'])) {
                    $message = 'Mã xác thực không chính xác';
                }
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
            'message' => $message,
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
