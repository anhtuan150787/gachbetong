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
use Zend\Authentication\AuthenticationService;

class LogoutController extends AbstractActionController
{
    public function indexAction()
    {
        $auth =  new AuthenticationService();
        $user = $auth->getIdentity();
        $auth->clearIdentity();

        $cache = $this->getServiceLocator()->get('cache');

        $cache->clear('admin_menu');
        $cache->clear('admin_acl');

        $cache->clear('permission_group_' . $user->group_admin_id);
        $cache->clear('permission_resource_' . $user->group_admin_id);
        $cache->clear('permission_allow_' . $user->group_admin_id);

        $cache->clear('permission_menu_' . $user->group_admin_id);


        $this->redirect()->toRoute('admin');
    }
}
