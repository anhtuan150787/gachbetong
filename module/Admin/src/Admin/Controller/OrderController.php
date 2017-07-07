<?php
/**
 * Zend Framework (http://framework.zend.com/)
 *
 * @link      http://github.com/zendframework/ZendSkeletonApplication for the canonical source repository
 * @copyright Copyright (c) 2005-2015 Zend Technologies USA Inc. (http://www.zend.com)
 * @license   http://framework.zend.com/license/new-bsd New BSD License
 */

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;

use Admin\Form\Order;

class OrderController extends AbstractActionController
{
    use MasterTrait;

    private $status;

    private $module = 'order';

    public function __construct()
    {
        $this->status = [
            '1' => 'Đã hoàn tất',
            '0' => 'Đang chờ xử lý',
        ];
    }


    public function indexAction()
    {
        $view = new ViewModel();
        $session = new Container();
        $model = $this->getServiceLocator()->get('OrderModel');

        if (!isset($_GET['page'])) {
            $session->offsetUnset('search-order');
        }

        if ($session->offsetExists('search-order')) {
            $search = $session->offsetGet('search-order');
        }

        if ($this->getRequest()->isPost()) {
            $data = $this->params()->fromPost();
            $search['order_code'] = ($data['order_code'] != '') ? $data['order_code'] : null;
            $search['email'] = ($data['email'] != '') ? $data['email'] : null;
            $search['phone'] = ($data['phone'] != '') ? $data['phone'] : null;
            $search['status'] = ($data['status'] !== -1) ? $data['status'] : -1;
            $search['date_from'] = ($data['date_from'] != '') ? $data['date_from'] : '';
            $search['date_to'] = ($data['date_to'] != '') ? $data['date_to'] : '';
            $session->offsetSet('search-order', $search);
        }

        $records = $model->fetchAll($search);
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'search' => $search, 'module' => $this->module]);

        return $view;
    }

    public function editAction()
    {
        $view = new ViewModel();
        $form = new Order();
        //$form->init();

        $model = $this->getServiceLocator()->get('OrderModel');
        $orderDetailModel = $this->getServiceLocator()->get('OrderDetailModel');

        $id = $this->params()->fromQuery('id');

        $record = $model->fetchRow($id);
        $orderDetails = $orderDetailModel->getDetail($record['order_id']);

        $order = [];
        $amount = 0;
        $fee = $record['order_fee'];
        foreach($orderDetails as $v) {
            $order['products'][$v['order_detail_id']] = $v;
            $amount += $order['products'][$v['order_detail_id']]['price_total'] = $v['product_price'] * $v['quality'];
        }

        $amountTotal = $amount + $fee;

        $order['amount'] = $amount;
        $order['fee'] = $fee;
        $order['amountTotal'] = $amountTotal;

        if ($this->getRequest()->isPost()) {
            $form->setData($this->getRequest()->getPost());

            if ($form->isValid()) {
                $input = array();
                $input['order_status'] = $this->params()->fromPost('order_status');
                $model->save($input, $id);

                $this->flashMessenger()->addMessage('Cập nhật thành công.');
                $this->redirect()->toRoute('admin/' . $this->module);
            }
        }

        $form->bind($record);

        $form->get('order_status')->setOptions(array('value_options' => $this->status));
        $form->get('submit')->setAttributes(array('value' => 'Cập nhật'));

        $data['form'] = $form;

        $view->setVariables(['form' => $form, 'record' => $record, 'order' => $order, 'module' => $this->module]);
        $view->setTemplate('admin/' . $this->module . '/form.phtml');

        return $view;
    }

    public function deleteAction()
    {
        if ($this->getRequest()->isPost()) {
            $id = $this->params()->fromPost('check_item');
        } else {
            $id[] = $this->params()->fromQuery('id');
        }
        $model  = $this->getServiceLocator()->get('OrderModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }
}
