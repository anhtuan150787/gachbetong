<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Home\Controller;

use Admin\View\Helper\Currency;
use Zend\Mvc\Controller\AbstractActionController;
use Zend\Session\Container;
use Zend\View\Model\ViewModel;
use Zend\Authentication\AuthenticationService;
use Home\Form\Order;

class OrderController extends AbstractActionController
{
    public function indexAction()
    {
        $session = new Container('cart');
        $view = new ViewModel();
        $model = $this->getServiceLocator()->get('FrontProductModel');
        $sizeModel = $this->getServiceLocator()->get('FrontSizeModel');
        $colorModel = $this->getServiceLocator()->get('FrontColorModel');

        $data = $this->params()->fromPost();

        $id = $data['product_id'];
        $colorId = $data['color'];
        $sizeId = $data['size'];

        $color = $colorModel->fetchRow($colorId);
        $size = $sizeModel->fetchRow($sizeId);

        $product = $model->fetchRow($id);

        if ($id != '') {
            if ($session->offsetExists('order')) {
                $order = $session->offsetGet('order');
                if (!isset($order['products'][$product['product_id']])) {
                    $order['products'][$product['product_id']] = $product;
                    $order['products'][$product['product_id']]['color'] = $color['color_name'];
                    $order['products'][$product['product_id']]['size'] = $size['size_name'];
                    if ($this->params()->fromPost('quality') != '') {
                        $order['products'][$product['product_id']]['quality'] = $this->params()->fromPost('quality');
                    } else {
                        $order['products'][$product['product_id']]['quality'] = 1;
                    }
                }
            } else {
                $order = [];
                $order['products'][$product['product_id']] = $product;
                $order['products'][$product['product_id']]['color'] = $color['color_name'];
                $order['products'][$product['product_id']]['size'] = $size['size_name'];
                if ($this->params()->fromPost('quality') != '') {
                    $order['products'][$product['product_id']]['quality'] = $this->params()->fromPost('quality');
                } else {
                    $order['products'][$product['product_id']]['quality'] = 1;
                }

            }
        } else {
            $order = $session->offsetGet('order');
        }

        $order = $this->calculateAmount($order);

        $session->offsetSet('order', $order);

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">Giỏ hàng</span>
                        </div>';

        $view->setVariables([
            'order' => $order,
            'breadcrumbs' => $breadcrumbs,
        ]);

        return $view;
    }

    public function deleteItemAction()
    {
        $session = new Container('cart');

        $view = new ViewModel();
        $data = $this->params()->fromRoute();
        $id = $data['id'];
        $order = $session->offsetGet('order');

        if (isset($order['products'][$id])) {
            unset($order['products'][$id]);
        }

        $session->offsetSet('order', $order);

        $this->redirect()->toRoute('home-order');
    }

    public function updateAction()
    {
        if ($this->getRequest()->isPost()) {
            $view = new ViewModel();
            $session = new Container('cart');
            $order = $session->offsetGet('order');

            $data = $this->params()->fromPost();
            foreach ($data['quality'] as $k => $v) {
                if (isset($order['products'][$k])) {
                    if ($v > 0) {
                        $order['products'][$k]['quality'] = $v;
                    }
                }
            }
            $session->offsetSet('order', $order);
            $this->redirect()->toRoute('home-order');
        }
    }

    public function calculateAmount($order)
    {
        $amount = 0;
        foreach ($order['products'] as $k => $v) {
            $amount += $order['products'][$k]['price_total'] = $v['product_price'] * $v['quality'];
        }

        $fee = 0;
        $amountTotal = $amount + $fee;

        $order['amount'] = $amount;
        $order['fee'] = $fee;
        $order['amountTotal'] = $amountTotal;

        return $order;
    }

    public function confirmAction()
    {
        $currency = new Currency();
        $view = new ViewModel();
        $session = new Container('cart');
        $orderModel = $this->getServiceLocator()->get('FrontOrderModel');
        $orderDetailModel = $this->getServiceLocator()->get('FrontOrderDetailModel');
        $form = new Order();

        $order = $session->offsetGet('order');

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $form->setData($data);

            if ($form->isValid()) {
                $params = [];
                $params['order_fullname'] = $data['order_fullname'];
                $params['order_phone'] = $data['order_phone'];
                $params['order_address'] = $data['order_address'];
                $params['order_email'] = $data['order_email'];
                $params['order_note'] = $data['order_note'];
                $params['order_fee'] = $order['fee'];
                $params['order_amount'] = $order['amountTotal'];
                $params['order_date'] = date('Y-m-d H:i:s');
                $params['order_status'] = 0;
                $orderId = $orderModel->save($params);
                $orderCode = strtoupper(substr(str_shuffle('zxcvbnmasdfghjklqwertyuiop'), 0, 2) . substr(time(), -3) . $orderId);

                $orderModel->save(array('order_code' => $orderCode), $orderId);

                $contentMail = '';

                foreach ($order['products'] as $v) {
                    $paramsOrderDetail = [];
                    $paramsOrderDetail['order_id'] = $orderId;
                    $paramsOrderDetail['product_name'] = $v['product_name'];
                    $paramsOrderDetail['product_price'] = $v['product_price'];
                    $paramsOrderDetail['product_id'] = $v['product_id'];
                    $paramsOrderDetail['quality'] = $v['quality'];
                    $paramsOrderDetail['product_picture'] = $v['product_picture'];
                    $paramsOrderDetail['product_code'] = $v['product_code'];
                    $paramsOrderDetail['size'] = $v['size'];
                    $paramsOrderDetail['color'] = $v['color'];
                    $orderDetailModel->save($paramsOrderDetail);


                    $contentMail .= '<tr>
                                        <td>
                                            <div class="cart-item">
                                                <div class="cart-image">
                                                        <img src="/public/thumbs/timthumb.php?src=/public/pictures/' . $v['product_picture'] . '&w=81&h=100">
                                                </div>
                                                <div class="cart-title">
                                                    <p>' . $v['product_name'] . ' - ' . $v['color'] . ' / ' . $v['size'] . '</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <p><span class="money">' . $currency->__invoke($v['product_price']) . '</span></p>
                                        </td>
                                        <td>
                                            ' . $v['quality'] . '
                                        </td>

                                        <td>
                                            <p><span class="money"> ' . $currency->__invoke($v['price_total']) . '</span></p>
                                        </td>
                                    </tr>';

                }

                $bodyMail = file_get_contents('data/email-template/customer_email_template.php');

                //Replace
                $patterns = [];
                $patterns[0] = '/{fullname}/';
                $patterns[1] = '/{email}/';
                $patterns[2] = '/{address}/';
                $patterns[3] = '/{phone}/';
                $patterns[4] = '/{content}/';

                $patterns[5] = '/{amount}/';
                $patterns[6] = '/{fee}/';
                $patterns[7] = '/{amountTotal}/';

                $patterns[8] = '/{note}/';
                $patterns[9] = '/{order_code}/';

                $replacements = [];
                $replacements[0] = $data['order_fullname'];
                $replacements[1] = $data['order_email'];
                $replacements[2] = $data['order_address'];
                $replacements[3] = $data['order_phone'];
                $replacements[4] = $contentMail;

                $replacements[5] = $currency->__invoke($order['amount']);
                $replacements[6] = $currency->__invoke($order['fee']);
                $replacements[7] = $currency->__invoke($order['amountTotal']);

                $replacements[8] = $data['order_note'];
                $replacements[9] = $orderCode;


                $bodyMail = preg_replace($patterns, $replacements, $bodyMail);

                $sendMail = $this->getServiceLocator()->get('send_mail');
                $sendMail->setFrom('anhtuan150787@gmail.com');
                $sendMail->setTo('anhtuan150787@gmail.com');
                $sendMail->setSubject('Đơn đặt hàng tại Kaylee.vn');
                $sendMail->setBody($bodyMail);
                $sendMail->action();

                $session->offsetUnset('order');
                $this->redirect()->toRoute('home-order-success');

            } else {

            }
        }

        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <a href="' . $this->url()->fromRoute('home-order') . '">Giỏ hàng</a>
                            <span class="separator">»</span>
                            <span class="page-title">Thanh toán</span>
                        </div>';

        $view->setVariables([
            'order' => $order,
            'form' => $form,
            'breadcrumbs' => $breadcrumbs,
        ]);

        return $view;
    }

    public function successAction()
    {
        $breadcrumbs = '<div id="breadcrumb" class="desktop-12">
                            <a href="./" class="homepage-link">Trang chủ</a>
                            <span class="separator">»</span>
                            <span class="page-title">Thanh toán</span>
                        </div>';

        $view = new ViewModel(['breadcrumbs' => $breadcrumbs]);
        return $view;
    }

}
