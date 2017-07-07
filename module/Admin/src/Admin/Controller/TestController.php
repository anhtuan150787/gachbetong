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

use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Role\GenericRole as Role;
use Zend\Permissions\Acl\Resource\GenericResource as Resource;

class TestController extends AbstractActionController
{
    public function indexAction()
    {
        $layout = $this->layout('layout/test');
        /*
         * Group: test
         * Controller: admin
         * Action: add, edit...
         */
        $acl = new Acl();
        $acl->addRole(new Role('test'));

        $acl->addResource(new Resource('admin'));
        $acl->addResource(new Resource('home'));

        $acl->allow('test', 'admin', array('add', 'edit', 'delete'));
        $acl->deny('test', 'home', array('add', 'edit', 'delete'));

        //echo ($acl->isAllowed('test', 'admin', 'delete')) ? 'Allow' : 'Deny';

        $view = new ViewModel();
        return $view;
    }
}
