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
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;

class PageController extends AbstractActionController
{
    public function indexAction()
    {
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontPageModel');
        $data = $this->params()->fromRoute();
        $id = $data['id'];

        $page = $model->fetchRow($id);

        $view->setVariables([
            'page' => $page,

        ]);

        return $view;
    }


}
