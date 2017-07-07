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
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;

class NewsController extends AbstractActionController
{
    public function categoryAction()
    {
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontNewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('FrontNewsCategoryModel');
        $data = $this->params()->fromRoute();
        $id = $data['id'];
        $newsCategory = $newsCategoryModel->fetchRow($id);

        $view->setVariables([
            'news' => $model->getListNewsByCategory($id),
            'newsCategory' => $newsCategory,
            'name' => $data['name'],
            'id' => $data['id'],
        ]);

        return $view;
    }

    public function detailAction()
    {
        $functions = new Functions();
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontNewsModel');
        $newsCategoryModel = $this->getServiceLocator()->get('FrontNewsCategoryModel');
        $data = $this->params()->fromRoute();
        $id = $data['id'];

        $news = $model->fetchRow($id);
        $newsCategory = $newsCategoryModel->fetchRow($news['news_category_id']);
        $newsOther = $model->getNewsOther($news['news_category_id']);


        $view->setVariables([
            'news' => $news,
            'newsOther' => $newsOther,
        ]);

        return $view;
    }


}
