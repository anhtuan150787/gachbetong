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
use Zend\Authentication\Adapter\DbTable;

use Admin\Form\Login;
use Admin\View\Helper\Encrypt;

use Zend\Authentication\Storage\Session;
use Zend\Authentication\AuthenticationService;

class LoginController extends AbstractActionController
{
    public function indexAction()
    {
        $this->layout('layout/login');

        $view = new ViewModel();

        $encrypt = $this->getServiceLocator()->get('encrypt');

        $form = new Login();
        $form->init();

        $authService = new AuthenticationService();

        $message_error  = '';

        if ($authService->hasIdentity()) {
            $this->redirect()->toRoute('admin');
        }

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();

            $form->setData($data);

            if ($form->isValid()) {
                $email      = $data['email'];
                $password   = $data['password'];

                $dbAdapter      = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
                $authAdapter    = new DbTable($dbAdapter);

                $authAdapter->setTableName('admin')->setIdentityColumn('admin_email')->setCredentialColumn('admin_password');
                $authAdapter->setIdentity($email)->setCredential($encrypt->HashPass($password));

                $result = $authAdapter->authenticate();

                if ($result->isValid()) {

                    $storage = new Session();
                    $storage->write($authAdapter->getResultRowObject(array(
                        'admin_id',
                        'admin_email',
                        'admin_name',
                        'admin_picture',
                        'group_admin_id'
                    )));

                    $authService->setStorage($storage)->setAdapter($authAdapter);

                    $this->redirect()->toRoute('admin');
                } else {
                    $message_error = 'Email hoặc mật khẩu không đúng';
                }
            }
        }

        $view->setVariables([
            'form' => $form,
            'message_error' => $message_error,
        ]);

        return $view;
    }


}
