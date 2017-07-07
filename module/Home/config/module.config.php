 <?php
return array(
    'router' => array(
        'routes' => array(
            'home' => [
                'type' => 'Literal',
                'options' => [
                    'route'    => '/',
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Index',
                        'action'     => 'index',
                    ],
                ],
            ],
            'captcha' => [
                'type' => 'Literal',
                'options' => [
                    'route'    => '/captcha-reload',
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Captcha',
                        'action'     => 'index',
                    ],
                ],
            ],


            'home-product-category' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/[:name]-pc-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\Product',
                        'action' => 'category',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Product',
                        'action' => 'category',
                    ],
                ),
            ],
            'home-product-detail' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/[:name]-pd-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\Product',
                        'action' => 'detail',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Product',
                        'action' => 'detail',
                    ],
                ),
            ],
            'product-all' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/san-pham',
                    'constraints' => [
                        'controller' => 'Home\Controller\Product',
                        'action' => 'all',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Product',
                        'action' => 'all',
                    ],
                ),
            ],
            'product-sale' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/san-pham-sale',
                    'constraints' => [
                        'controller' => 'Home\Controller\Product',
                        'action' => 'sale',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Product',
                        'action' => 'sale',
                    ],
                ),
            ],

            'home-news-category' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/[:name]-nc-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\News',
                        'action' => 'category',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\News',
                        'action' => 'category',
                    ],
                ),
            ],
            'home-news-detail' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/[:name]-n-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\News',
                        'action' => 'detail',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\News',
                        'action' => 'detail',
                    ],
                ),
            ],
            'home-page' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/[:name]-p-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\Page',
                        'action' => 'index',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Page',
                        'action' => 'index',
                    ],
                ),
            ],
            'home-order' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/dat-hang[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\Order',
                        'action' => 'index',
                        'name' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Order',
                        'action' => 'index',
                    ],
                ),
            ],
            'home-order-delete' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/xoa-don-hang-[:id]',
                    'constraints' => [
                        'controller' => 'Home\Controller\Order',
                        'action' => 'delete-item',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Order',
                        'action' => 'delete-item',
                    ],
                ),
            ],
            'home-order-update' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/cap-nhat-don-hang',
                    'constraints' => [
                        'controller' => 'Home\Controller\Order',
                        'action' => 'update',
                        'id' => '[0-9]*'
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Order',
                        'action' => 'update',
                    ],
                ),
            ],
            'home-order-confirm' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/xac-nhan-don-hang',
                    'constraints' => [
                        'controller' => 'Home\Controller\Order',
                        'action' => 'confirm',
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Order',
                        'action' => 'confirm',
                    ],
                ),
            ],
            'home-order-success' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/dat-hang-thanh-cong',
                    'constraints' => [
                        'controller' => 'Home\Controller\Order',
                        'action' => 'success',
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Order',
                        'action' => 'success',
                    ],
                ),
            ],
            'home-lien-he' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/lien-he',
                    'constraints' => [
                        'controller' => 'Home\Controller\Contact',
                        'action' => 'index',
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Contact',
                        'action' => 'index',
                    ],
                ),
            ],
            'home-lien-he-success' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/lien-he-success',
                    'constraints' => [
                        'controller' => 'Home\Controller\Contact',
                        'action' => 'success',
                    ],
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Contact',
                        'action' => 'success',
                    ],
                ),
            ],
            'home-email-customer' => [
                'type' => 'Segment',
                'options' => array(
                    'route' => '/email-customer',
                    'defaults' => [
                        '__NAMESPACE__' => 'Home\Controller',
                        'controller' => 'Home\Controller\Index',
                        'action' => 'email-customer',
                    ],
                ),
            ],
        ),
    ),
    'controllers' => array(
        'invokables' => array(
            'Home\Controller\Index' => 'Home\Controller\IndexController',
            'Home\Controller\Product' => 'Home\Controller\ProductController',
            'Home\Controller\News' => 'Home\Controller\NewsController',
            'Home\Controller\Page' => 'Home\Controller\PageController',
            'Home\Controller\Order' => 'Home\Controller\OrderController',
            'Home\Controller\Contact' => 'Home\Controller\ContactController',
            'Home\Controller\Captcha' => 'Home\Controller\CaptchaController',
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
    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',
        'template_map' => array(
            'error/404'               => __DIR__ . '/../view/error/404.phtml',
            'error/index'             => __DIR__ . '/../view/error/index.phtml',
            'layout/layout'             => __DIR__ . '/../view/layout/home.phtml',
            'home/partial/paginator' => __DIR__ . '/../view/partial/paginator.phtml',
            'home/partial/product-item' => __DIR__ . '/../view/partial/product-item.phtml',
            'home/layout/footer' => __DIR__ . '/../view/layout/footer.phtml',
            'home/layout/header' => __DIR__ . '/../view/layout/header.phtml',
            'home/layout/nav' => __DIR__ . '/../view/layout/nav.phtml',
            'home/partial/product-left' => __DIR__ . '/../view/partial/product-left.phtml',

        ),
        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
        'strategies' => [
            'ViewJsonStrategy',
        ],
    ),
    'view_helpers' => array(
        'invokables' => array(
            'social' => 'Home\View\Helper\Social',
        ),
    ),
);