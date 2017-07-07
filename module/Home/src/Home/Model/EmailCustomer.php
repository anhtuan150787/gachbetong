<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class EmailCustomer {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('email_customer');
        $select->order('email_customer_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }


    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('email_customer_id' => $id));

        return $result->current();
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('email_customer_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('email_customer_id' => $id));
    }
}