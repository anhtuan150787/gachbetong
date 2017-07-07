<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Admin\View\Helper\Functions;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;

class ProductController extends AbstractActionController
{
    public function indexAction()
    {
        return $view = new ViewModel();
    }

    public function allAction()
    {
        $view   = new ViewModel();
        $data   = $this->params()->fromRoute();

        $model                  = $this->getServiceLocator()->get('FrontProductModel');
        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');

        $products = $model->getListProductAll();
        $products->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $products->setItemCountPerPage(20);

        $view->setVariables([
            'products'          => $products,
            'name'              => $data['name'],
            'id'                => $data['id'],
        ]);

        return $view;
    }



    public function categoryAction()
    {
        $view   = new ViewModel();

        $data   = $this->params()->fromRoute();
        $productCategoryId = $data['id'];

        $model                  = $this->getServiceLocator()->get('FrontProductModel');
        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');


        $products = $model->getListProductByCategory($productCategoryId);
        $products->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $products->setItemCountPerPage(20);

        $productCategory = $productCategoryModel->fetchRow($productCategoryId);

        $view->setVariables([
            'products'          => $products,
            'productCategory'   => $productCategory,
            'name'              => $data['name'],
            'id'                => $data['id'],
        ]);

        return $view;
    }

    public function detailAction()
    {
        $functions  = new Functions();
        $view       = new ViewModel();

        $data       = $this->params()->fromRoute();
        $productId  = $data['id'];

        $productCategoryModel   = $this->getServiceLocator()->get('FrontProductCategoryModel');
        $model                  = $this->getServiceLocator()->get('FrontProductModel');

        $product            = $model->fetchRow($productId);
        $productsOther      = $model->getProductOther($product['product_category_id'], $product['product_id']);
        $productCategory    = $productCategoryModel->fetchRow($product['product_category_id']);

        $view->setVariables([
            'product'       => $product,
            'productsOther' => $productsOther,
        ]);

        return $view;
    }

    public function productAction()
    {
        $view = new ViewModel();

        return $view;
    }


}


