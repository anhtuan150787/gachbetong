<?php
namespace Admin\Controller;

use Zend\Authentication\AuthenticationService;
use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Role\GenericRole as Role;
use Zend\Permissions\Acl\Resource\GenericResource as Resource;
use Zend\Stdlib\RequestInterface as Request;
use Zend\Stdlib\ResponseInterface as Response;

trait MasterTrait {

    public function dispatch(Request $request, Response $response = null) {
        $this->layout('layout/admin');

        $auth = new AuthenticationService();

        if (!$auth->hasIdentity()) {
            $this->redirect()->toRoute('admin/login');
        }

        $acl = new Acl();
        $dbAdapter = $this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $cache = $this->getServiceLocator()->get('cache');


        /*
         * Check Permission
         */
        if ($auth->hasIdentity()) {
            $controllerArr = explode('\\', $this->params()->fromRoute('controller'));
            $controller = strtolower($controllerArr[2]);
            $module = strtolower($controllerArr[0]);
            $action = $this->params()->fromRoute('action');
            $user = $auth->getIdentity();

            //Add Groups
            if (!$cache->checkItem('permission_group_' . $user->group_admin_id)) {

                $statement = $dbAdapter->query('SELECT * FROM group_admin');
                $groups = $statement->execute();

                $dataGroups = [];
                foreach ($groups as $v) {
                    $dataGroups[] = $v;
                }
                $groups = $dataGroups;

                $cache->set('permission_group_' . $user->group_admin_id, $groups);
            } else {
                $groups = $cache->get('permission_group_' . $user->group_admin_id);
            }


            foreach ($groups as $group) {
                $acl->addRole(new Role($group['group_admin_id']));
            }

            //Add Resouces
            if (!$cache->checkItem('permission_resource_' . $user->group_admin_id)) {

                $statement = $dbAdapter->query('SELECT *
                                                FROM group_acl as gac
                                                LEFT JOIN acl as a ON gac.acl_id=a.acl_id
                                                LEFT JOIN group_admin as g ON gac.group_admin_id = gac.group_admin_id
                                                WHERE gac.group_admin_id = ' . $user->group_admin_id . ' AND a.acl_module = "admin" AND gac.group_acl_status = 1
                                                GROUP BY a.acl_controller');
                $resources = $statement->execute();

                $dataResources = [];
                foreach ($resources as $v) {
                    $dataResources[] = $v;
                }
                $resources = $dataResources;

                $cache->set('permission_resource_' . $user->group_admin_id, $resources);
            } else {
                $resources = $cache->get('permission_resource_' . $user->group_admin_id);
            }

            foreach ($resources as $resource) {
                $acl->addResource(new Resource($resource['acl_controller']));
            }

            //Add Permission Allow
            if (!$cache->checkItem('permission_allow_' . $user->group_admin_id)) {

                $statement = $dbAdapter->query('SELECT *
                                                FROM group_acl as gac
                                                LEFT JOIN acl as ac ON gac.acl_id=ac.acl_id
                                                LEFT JOIN group_admin as g ON gac.group_admin_id = g.group_admin_id
                                                WHERE gac.group_admin_id = ' . $user->group_admin_id . ' AND ac.acl_module = "admin" AND gac.group_acl_status = 1');
                $permissionAllows = $statement->execute();

                $dataPermissionAllows = [];
                foreach ($permissionAllows as $v) {
                    $dataPermissionAllows[] = $v;
                }
                $permissionAllows = $dataPermissionAllows;

                $cache->set('permission_allow_' . $user->group_admin_id, $permissionAllows);
            } else {
                $permissionAllows = $cache->get('permission_allow_' . $user->group_admin_id);
            }

            foreach ($permissionAllows as $permission) {
                $acl->allow($permission['group_admin_id'], $permission['acl_controller'], $permission['acl_action']);
            }


            $allow = false;
            if ($acl->hasResource($controller)) {
                if ($acl->isAllowed($user->group_admin_id, $controller, $action)) {
                    $allow = true;
                }
            }

            if (!$allow) {
                $this->redirect()->toRoute('admin/message', array('action' => 'index', 'type' => 'deny'));
                return;
            }
        }

        return parent::dispatch($request, $response);
    }
}