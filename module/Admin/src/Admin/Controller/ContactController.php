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

use Admin\Form\Page;

class ContactController extends AbstractActionController
{
    use MasterTrait;

    private $module = 'contact';

    public function indexAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('ContactModel');

        $records = $model->fetchAll();
        $records->setCurrentPageNumber($this->params()->fromQuery('page', 1));
        $records->setItemCountPerPage(20);

        $view->setVariables(['records' => $records, 'status' => $this->status, 'module' => $this->module]);

        return $view;
    }

    public function editAction()
    {
        $view = new ViewModel();

        $model = $this->getServiceLocator()->get('ContactModel');
        $id = $this->params()->fromQuery('id');
        $record = $model->fetchRow($id);

        $model->save(array('contact_viewed' => 1), $id);

        $view->setVariables(['record' => $record, 'module' => $this->module]);
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
        $model  = $this->getServiceLocator()->get('ContactModel');

        if (is_array($id)) {
            foreach($id as $k => $v) {
                $model->delete($v);
            }
        }

        $this->flashMessenger()->addMessage('Xóa thành công');
        $this->redirect()->toRoute('admin/' . $this->module);

        return $this->response();
    }

    public function exportAction()
    {
        $model = $this->getServiceLocator()->get('ContactModel');

        $records = $model->getAll();

        $str = '<table border="1">
                    <tr>
                        <td>Tên</td>
                        <td>Email</td>
                        <td>Điện thoại</td>
                        <td>Lời nhắn</td>
                    </tr>';

        foreach ($records as $record) {
            $str .= '<tr>
                        <td>' . $record['contact_fullname'] . '</td>
                        <td>' . $record['contact_email'] . '</td>
                        <td>' . $record['contact_phone'] . '</td>
                        <td>' . $record['contact_content'] . '</td>
                    </tr>';
        }

        $str .= '</tbody></table>';

        header("Content-Type:   application/vnd.ms-excel; charset=utf-8");
        header("Content-Disposition: attachment; filename=contact.xls");
        header("Pragma: no-cache");
        header("Expires: 0");

        echo $str;

        exit();
    }
}
