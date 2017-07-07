<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;

use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;
use Zend\View\Model\JsonModel;

class IndexController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();

        $productModel = $this->getServiceLocator()->get('FrontProductModel');

        $productHots = $productModel->getProductHot();
        $productNews = $productModel->getProductNew();

        $view->setVariables(['productHots' => $productHots, 'productNews' => $productNews]);

        return $view;
    }

}
