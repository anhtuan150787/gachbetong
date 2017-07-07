<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin;

return array(
    'router' => array(
        'routes' => array(
            'admin' => [
                'type' => 'Literal',
                'options' => [
                    'route' => '/admin',
                    'defaults' => [
                        '__NAMESPACE__' => 'Admin\Controller',
                        'controller' => 'Admin\Controller\Index',
                        'action' => 'index',
                    ],
                ],
                'may_terminate' => true,
                'child_routes' => array(
                    'login' => array(
                        'type' => 'literal',
                        'options' => array(
                            'route' => '/login',
                            'defaults' => array(
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Login',
                                'action' => 'index',
                            ),
                        ),
                    ),
                    'logout' => array(
                        'type' => 'literal',
                        'options' => array(
                            'route' => '/logout',
                            'defaults' => array(
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Logout',
                                'action' => 'index',
                            ),
                        ),
                    ),
                    'test' => array(
                        'type' => 'literal',
                        'options' => array(
                            'route' => '/test',
                            'defaults' => array(
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Test',
                                'action' => 'index',
                            ),
                        ),
                    ),
                    'message' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/message[/:action][/:type]',
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Message',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'type' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                        ),
                    ),
                    'build' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/build[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Build',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Build',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'group-admin' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/group-admin[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\GroupAdmin',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\GroupAdmin',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'admin' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/admin[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Admin',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Admin',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'menu' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/menu[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Menu',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Menu',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'acl' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/acl[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Acl',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Acl',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'navigation' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/navigation[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Navigation',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Navigation',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'page' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/page[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Page',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Page',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'news-category' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/news-category[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\NewsCategory',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\NewsCategory',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'news' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/news[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\News',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\News',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'product-category' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/product-category[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\ProductCategory',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\ProductCategory',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'product' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/product[/:action][/:product_id]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Product',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                                'product_id' => '[0-9]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Product',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'order' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/order[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Order',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Order',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'template' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/template[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Template',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Template',
                                'action' => 'index',
                            ],
                        ),
                    ),

                    'website' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/website[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Website',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Website',
                                'action' => 'edit',
                            ],
                        ),
                    ),

                    'email-customer' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/email-customer[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\EmailCustomer',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\EmailCustomer',
                                'action' => 'index',
                            ],
                        ),
                    ),
                    'contact' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/contact[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Contact',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Contact',
                                'action' => 'index',
                            ],
                        ),
                    ),

                    'captcha' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/captcha[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\Captcha',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\Captcha',
                                'action' => 'index',
                            ],
                        ),
                    ),

                    'group-navigation' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/group-navigation[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\GroupNavigation',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\GroupNavigation',
                                'action' => 'index',
                            ],
                        ),
                    ),

                    'group-template' => array(
                        'type' => 'Segment',
                        'options' => array(
                            'route' => '/group-template[/:action]',
                            'constraints' => [
                                'controller' => 'Admin\Controller\GroupTemplate',
                                'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                            ],
                            'defaults' => [
                                '__NAMESPACE__' => 'Admin\Controller',
                                'controller' => 'Admin\Controller\GroupTemplate',
                                'action' => 'index',
                            ],
                        ),
                    ),

                ),

            ],

        ),
    ),

    'controllers' => array(
        'invokables' => array(
            'Admin\Controller\Captcha' => 'Admin\Controller\CaptchaController',
            'Admin\Controller\Index' => 'Admin\Controller\IndexController',
            'Admin\Controller\Login' => 'Admin\Controller\LoginController',
            'Admin\Controller\Logout' => 'Admin\Controller\LogoutController',
            'Admin\Controller\Test' => 'Admin\Controller\TestController',
            'Admin\Controller\Message' => 'Admin\Controller\MessageController',
            'Admin\Controller\Build' => 'Admin\Controller\BuildController',
            'Admin\Controller\GroupAdmin' => 'Admin\Controller\GroupAdminController',
            'Admin\Controller\Admin' => 'Admin\Controller\AdminController',
            'Admin\Controller\Menu' => 'Admin\Controller\MenuController',
            'Admin\Controller\Acl' => 'Admin\Controller\AclController',
            'Admin\Controller\Navigation' => 'Admin\Controller\NavigationController',
            'Admin\Controller\Page' => 'Admin\Controller\PageController',
            'Admin\Controller\NewsCategory' => 'Admin\Controller\NewsCategoryController',
            'Admin\Controller\News' => 'Admin\Controller\NewsController',
            'Admin\Controller\ProductCategory' => 'Admin\Controller\ProductCategoryController',
            'Admin\Controller\Product' => 'Admin\Controller\ProductController',
            'Admin\Controller\Order' => 'Admin\Controller\OrderController',
            'Admin\Controller\Template' => 'Admin\Controller\TemplateController',
            'Admin\Controller\Website' => 'Admin\Controller\WebsiteController',
            'Admin\Controller\EmailCustomer' => 'Admin\Controller\EmailCustomerController',
            'Admin\Controller\Contact' => 'Admin\Controller\ContactController',
            'Admin\Controller\PostGet' => 'Admin\Controller\PostGetController',
            'Admin\Controller\GroupNavigation' => 'Admin\Controller\GroupNavigationController',
            'Admin\Controller\GroupTemplate' => 'Admin\Controller\GroupTemplateController',
        ),
    ),

    'service_manager' => array(
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory',
        ),
        'invokables' => array(
            'upload_file'  => 'Admin\Service\UploadFile',
            'send_mail' => 'Admin\Service\SendMail',
            'encrypt' => 'Admin\Service\Encrypt',
            'cache' => 'Admin\Service\Cache',
        )
    ),

    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions' => true,
        'doctype' => 'HTML5',
        'not_found_template' => 'error/404',
        'exception_template' => 'error/index',
        'template_map' => array(
            'layout/admin' => __DIR__ . '/../view/layout/admin.phtml',
            'layout/login' => __DIR__ . '/../view/layout/login.phtml',
            'layout/simple' => __DIR__ . '/../view/layout/simple.phtml',
            'layout/test' => __DIR__ . '/../view/layout/test.phtml',
            'admin/partial/paginator' => __DIR__ . '/../view/partial/paginator.phtml',
            'admin/partial/title' => __DIR__ . '/../view/partial/title.phtml',
            'admin/partial/action_list' => __DIR__ . '/../view/partial/action_list.phtml',
            'admin/partial/message' => __DIR__ . '/../view/partial/message.phtml',
            'admin/partial/button_add' => __DIR__ . '/../view/partial/button_add.phtml',
        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),
    'view_helper_config' => array(
        'flashmessenger' => array(
            'message_open_format'      => '<div%s style="clear: both">',
            'message_close_string'     => '</div>',
        )
    ),
    'view_helpers' => array(
        'invokables' => array(
            'functions' => 'Admin\View\Helper\Functions',
            'currency' => 'Admin\View\Helper\Currency',
        ),
    ),
    // Placeholder for console routes
    'console' => array(
        'router' => array(
            'routes' => array(),
        ),
    ),

    'translator' => [
        'locale' => 'vi_VN',
        'translation_file_patterns' => [
            [
                'type' => 'phpArray',
                'base_dir' => __DIR__ . '/../language',
                'pattern' => '%s.php',
            ],
        ],
    ],
);
