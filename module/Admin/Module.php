<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin;

use Admin\Model\Color;
use Admin\Model\Contact;
use Admin\Model\EmailCustomer;
use Admin\Model\GroupAcl;
use Admin\Model\GroupNavigation;
use Admin\Model\GroupTemplate;
use Admin\Model\Navigation;
use Admin\Model\News;
use Admin\Model\NewsCategory;
use Admin\Model\Order;
use Admin\Model\OrderDetail;
use Admin\Model\Page;
use Admin\Model\Product;
use Admin\Model\ProductCategory;
use Admin\Model\ProductDetail;
use Admin\Model\ProductPicture;
use Admin\Model\Size;
use Admin\Model\Structure;
use Admin\Model\Vocabulary;
use Admin\Model\Website;
use Zend\ModuleManager\Listener\ModuleLoaderListener;
use Zend\Mvc\MvcEvent;
use Zend\Authentication\AuthenticationService;

use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Role\GenericRole as Role;
use Zend\Permissions\Acl\Resource\GenericResource as Resource;

use Zend\Db\TableGateway\TableGateway;

use Admin\Model\Menu;
use Admin\Model\Build;
use Admin\Model\GroupAdmin;
use Admin\Model\Admin;
use Admin\Model\GroupMenu;
use Admin\Model\Acl as AclAdmin;
use Admin\Model\Template;

class Module
{
    public function getConfig()
    {
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig()
    {
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }

    public function getServiceConfig()
    {
        return array(
            'factories' => array(
                'MenuModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('menu', $dbAdapter);
                    return new Menu($tableGateway);
                },
                'GroupMenuModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('group_menu', $dbAdapter);
                    return new GroupMenu($tableGateway);
                },
                'BuildModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('build', $dbAdapter);
                    return new Build($tableGateway);
                },
                'GroupAdminModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('group_admin', $dbAdapter);
                    return new GroupAdmin($tableGateway, $dbAdapter);
                },
                'AdminModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('admin', $dbAdapter);
                    return new Admin($tableGateway, $dbAdapter);
                },
                'AclModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('acl', $dbAdapter);
                    return new AclAdmin($tableGateway);
                },
                'GroupAclModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('group_acl', $dbAdapter);
                    return new GroupAcl($tableGateway);
                },
                'NavigationModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('navigation', $dbAdapter);
                    return new Navigation($tableGateway);
                },
                'PageModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('page', $dbAdapter);
                    return new Page($tableGateway);
                },
                'NewsCategoryModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('news_category', $dbAdapter);
                    return new NewsCategory($tableGateway);
                },
                'NewsModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('news', $dbAdapter);
                    return new News($tableGateway);
                },
                'ProductCategoryModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product_category', $dbAdapter);
                    return new ProductCategory($tableGateway);
                },
                'ProductModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product', $dbAdapter);
                    return new Product($tableGateway);
                },
                'OrderModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('order', $dbAdapter);
                    return new Order($tableGateway);
                },
                'OrderDetailModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('order_detail', $dbAdapter);
                    return new OrderDetail($tableGateway);
                },
                'TemplateModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('template', $dbAdapter);
                    return new Template($tableGateway);
                },
                'WebsiteModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('website', $dbAdapter);
                    return new Website($tableGateway);
                },
                'EmailCustomerModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('email_customer', $dbAdapter);
                    return new EmailCustomer($tableGateway);
                },
                'ContactModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('contact', $dbAdapter);
                    return new Contact($tableGateway);
                },
                'GroupNavigationModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('group_navigation', $dbAdapter);
                    return new GroupNavigation($tableGateway);
                },
                'GroupTemplateModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('group_template', $dbAdapter);
                    return new GroupTemplate($tableGateway);
                },
            ),
        );
    }

    public function onBootstrap(MvcEvent $e)
    {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleLoaderListener();
        $moduleRouteListener->attach($eventManager);

        $eventManager->attach('dispatch', function (MvcEvent $e) {
            $viewModel = $e->getApplication()->getMvcEvent()->getViewModel();
            $auth = new AuthenticationService();
            $groupMenuModel = $e->getApplication()->getServiceManager()->get('GroupMenuModel');
            $cache = $e->getApplication()->getServiceManager()->get('cache');

            $c = $e->getTarget();
            $match = $e->getRouteMatch();
            $controllerArr = explode('\\', $match->getParam('controller'));
            $controller = strtolower($controllerArr[2]);
            $module = strtolower($controllerArr[0]);

            if ($auth->hasIdentity()) {
                $user = $auth->getIdentity();

                /*
                 * Menu
                 */
                if (!$cache->checkItem('permission_menu_' . $user->group_admin_id)) {
                    $menu = $groupMenuModel->getGroupMenu($user->group_admin_id);
                    $cache->set('permission_menu_' . $user->group_admin_id, $menu);
                } else {
                    $menu = $cache->get('permission_menu_' . $user->group_admin_id);
                }

                /*
                 * Get module title
                 */
                foreach ($menu as $v) {
                    if (str_replace('-', '', $v['menu_url']) == $module . '/' . $controller) {
                        $moduleCurrentTitle = $v['menu_name'];
                        $moduleCurrentUrl = $v['menu_url'];
                    }
                }

                $serverUrl = $e->getApplication()->getServiceManager()->get('ViewHelperManager')->get('serverUrl')->__invoke();

                /*
                 * Breadcrumb
                 */
                $breadcrumbsHtml = '<div class="breadcrumbs"><ul>';
                $breadcrumbsHtml .= '<li><a href="' . $serverUrl . '/' . $module . '">' . ucfirst($module) . '</a></li>';

                foreach ($menu as $v) {
                    if ($v['menu_parent'] == 0) {
                        foreach ($menu as $vv) {

                            if ($vv['menu_parent'] == $v['menu_id']) {

                                if (str_replace('-', '', $vv['menu_url']) == $module . '/' . $controller) {
                                    $breadcrumbModuleParentName = $v['menu_name'];

                                    $breadcrumbModuleLevel2Name = $moduleCurrentTitle;
                                    $breadcrumbModuleLevel2Url = $vv['menu_url'];

                                    break;

                                } else {

                                    foreach ($menu as $vvv) {
                                        if ($vvv['menu_parent'] == $vv['menu_id']) {

                                            if (str_replace('-', '', $vvv['menu_url']) == $module . '/' . $controller) {
                                                $breadcrumbModuleParentName = $v['menu_name'];

                                                $breadcrumbModuleLevel2Name = $vv['menu_name'];
                                                $breadcrumbModuleLevel2Url = $vv['menu_url'];

                                                $breadcrumbModuleLevel3Name = $vvv['menu_name'];
                                                $breadcrumbModuleLevel3Url = $vvv['menu_url'];

                                                break;
                                            }
                                        }
                                    }
                                }
                            }

                        }
                    }
                }

                if ($breadcrumbModuleParentName != '') {
                    $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="#">' . $breadcrumbModuleParentName . '</a></li>';
                }
                if ($breadcrumbModuleLevel2Name != '') {
                    $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="' . $serverUrl . '/' . $breadcrumbModuleLevel2Url . '">' . $breadcrumbModuleLevel2Name . '</a></li>';
                }
                if ($breadcrumbModuleLevel3Name != '') {
                    $breadcrumbsHtml .= '<li><i class="icon-angle-right"></i><a href="' . $serverUrl . '/' . $breadcrumbModuleLevel3Url . '">' . $breadcrumbModuleLevel3Name . '</a></li>';
                }
                $breadcrumbsHtml .= '</ul><div class="close-bread"><a href="#"><i class="icon-remove"></i></a></div></div>';

                $viewModel->menu = $menu;
                $viewModel->user = $user;
                $viewModel->moduleCurrentTitle = $moduleCurrentTitle;
                $viewModel->breadcrumbsHtml = $breadcrumbsHtml;
            }

            $viewModel->controller_name = $controller;

        });
    }
}
