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
use Zend\View\Model\JsonModel;
use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;

class CaptchaController extends AbstractActionController
{
    public function indexAction() {
        $configCaptcha = include 'config/captcha.php';

        $captchaImage = new CaptchaImage($configCaptcha);
        $captchaImage->generate();

        $basePath = $this->getServiceLocator()->get('ViewHelperManager')->get('basePath');

        return new JsonModel([
            'id' => $captchaImage->getId(),
            'url' => $basePath($captchaImage->getImgUrl() . $captchaImage->getId() . $captchaImage->getSuffix())
        ]);
    }


}
