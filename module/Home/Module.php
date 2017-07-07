<?php
namespace Home;

use Home\Model\Color;
use Home\Model\Contact;
use Home\Model\EmailCustomer;
use Home\Model\Navigation;
use Home\Model\News;
use Home\Model\NewsCategory;
use Home\Model\Order;
use Home\Model\OrderDetail;
use Home\Model\Page;
use Home\Model\Product;
use Home\Model\ProductCategory;
use Home\Model\ProductDetail;
use Home\Model\ProductPicture;
use Home\Model\Size;
use Home\Model\Structure;
use Home\Model\Template;
use Home\Model\Website;
use Zend\Db\TableGateway\TableGateway;
use Zend\ModuleManager\Listener\ModuleLoaderListener;
use Zend\Mvc\MvcEvent;
use Zend\Authentication\AuthenticationService;
use Zend\Session\Container;

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
                'FrontNavigationModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('navigation', $dbAdapter);
                    return new Navigation($tableGateway);
                },
                'FrontPageModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('page', $dbAdapter);
                    return new Page($tableGateway);
                },
                'FrontNewsModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('news', $dbAdapter);
                    return new News($tableGateway);
                },
                'FrontProductModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product', $dbAdapter);
                    return new Product($tableGateway);
                },
                'FrontTemplateModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('template', $dbAdapter);
                    return new Template($tableGateway);
                },
                'FrontWebsiteModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('website', $dbAdapter);
                    return new Website($tableGateway);
                },
                'FrontNewsCategoryModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('news_category', $dbAdapter);
                    return new NewsCategory($tableGateway);
                },
                'FrontEmailCustomerModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('email_customer', $dbAdapter);
                    return new EmailCustomer($tableGateway);
                },
                'FrontContactModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('contact', $dbAdapter);
                    return new Contact($tableGateway);
                },
                'FrontProductCategoryModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product_category', $dbAdapter);
                    return new ProductCategory($tableGateway);
                },
                'FrontColorModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('color', $dbAdapter);
                    return new Color($tableGateway);
                },
                'FrontSizeModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('size', $dbAdapter);
                    return new Size($tableGateway);
                },
                'FrontProductPictureModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product_picture', $dbAdapter);
                    return new ProductPicture($tableGateway);
                },
                'FrontProductDetailModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('product_detail', $dbAdapter);
                    return new ProductDetail($tableGateway);
                },
                'FrontOrderDetailModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('order_detail', $dbAdapter);
                    return new OrderDetail($tableGateway);
                },
                'FrontOrderModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('order', $dbAdapter);
                    return new Order($tableGateway);
                },
                'FrontStructureModel' => function ($sm) {
                    $dbAdapter = $sm->get('Zend/Db/Adapter/Adapter');
                    $tableGateway = new TableGateway('structure', $dbAdapter);
                    return new Structure($tableGateway);
                },
            ),
        );
    }

    public function onBootstrap(MvcEvent $e)
    {
        $eventManager = $e->getApplication()->getEventManager();
        $moduleRouteListener = new ModuleLoaderListener();
        $moduleRouteListener->attach($eventManager);

        /*
         * Apply Layout
         */
        $eventManager->attach('dispatch', function (MvcEvent $e) {

            $c = $e->getTarget();
            $match = $e->getRouteMatch();
            $controllerArr = explode('\\', $match->getParam('controller'));
            $controller = strtolower($controllerArr[2]);
            $module = strtolower($controllerArr[0]);

            if ($module == 'home') {
                $c->layout('layout/layout');

                $dbAdapter = $e->getApplication()->getServiceManager()->get('Zend\Db\Adapter\Adapter');
                $viewModel = $e->getApplication()->getMvcEvent()->getViewModel();

                //Website information
                $statement = $dbAdapter->query('SELECT * FROM website WHERE website_id = 1');
                $websiteResult = $statement->execute();
                $viewModel->website = $websiteResult->current();

                //Load menu top
                $navigations = $this->getNavigationList($dbAdapter);
                $viewModel->navigations = $navigations;

                //Load Danh muc san pham
                $sql = 'SELECT * FROM product_category WHERE product_category_status = 1 ORDER BY product_category_id ASC';
                $statement = $dbAdapter->query($sql);
                $result = $statement->execute();
                $viewModel->productCategorys = $result;

                //Load san pham moi
                $sql = 'SELECT * FROM product WHERE product_status = 1 AND product_type_new = 1  ORDER BY product_id DESC LIMIT 6';
                $statement = $dbAdapter->query($sql);
                $result = $statement->execute();
                $viewModel->productNews = $result;

                //Load template
                $statement = $dbAdapter->query('SELECT * FROM template');
                $template = $statement->execute();
                $templateData = [];
                foreach($template as $v) {
                    $templateData[$v['template_id']] = $v;
                }
                $viewModel->template = $templateData;


                $session = new Container('cart');
                if ($session->offsetExists('order')) {
                    $order = $session->offsetGet('order');
                    $viewModel->orderCount = count($order['products']);
                }
            }
        });
    }

    public function getNavigationList($dbAdapter, $parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM navigation WHERE group_navigation_id=12 AND navigation_parent = ' . $parent . ' AND navigation_status = 1 ORDER BY navigation_position ASC';
        $statement = $dbAdapter->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $navigation_id = $row['navigation_id'];

            $data[$navigation_id] = (array) $row;
            $data[$navigation_id]['navigation_level'] = $level;

            $sql = 'SELECT * FROM navigation WHERE group_navigation_id=12 AND navigation_parent = ' . $navigation_id . ' AND navigation_status = 1 ORDER BY navigation_position ASC';

            $statement = $dbAdapter->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getNavigationList($dbAdapter, $navigation_id, $level, $data);
            }
        }
        return $data;
    }
}
