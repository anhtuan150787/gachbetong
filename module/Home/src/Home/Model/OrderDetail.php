<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class OrderDetail {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }


    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
            return $this->tableGateway->lastInsertValue;
        } else {
            $this->tableGateway->update($data, array('order_detail_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('order_detail_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('order_detail_id' => $id));

        return $result->current();
    }

    public function getDetail($orderId) {
        $sql = 'SELECT * FROM order_detail WHERE order_id = ' . $orderId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}