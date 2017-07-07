<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Order {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($search)
    {
        $select = new Select('order');

        $where = '';
        $predicate = new  \Zend\Db\Sql\Where();

        $where = $predicate->isNotNull('order_id');

        if (isset($search['email'])) {
            $where->and;
            $where = $predicate->equalTo('order_email', $search['email']);
        }
        if (isset($search['phone'])) {
            $where->and;
            $where = $predicate->equalTo('order_phone', $search['phone']);
        }
        if (isset($search['status']) && $search['status'] != -1) {
            $where->and;
            $where = $predicate->equalTo('order_status', $search['status']);
        }

        if (isset($search['date_from']) && $search['date_from'] && isset($search['date_to']) && $search['date_to']) {
            $where->and;
            $date_from_arr = explode('/', $search['date_from']);
            $date_from = $date_from_arr[2] . '-' . $date_from_arr['1'] . '-' . $date_from_arr['0'] . ' 00:00:00';

            $date_to_arr = explode('/', $search['date_to']);
            $date_to = $date_to_arr[2] . '-' . $date_to_arr['1'] . '-' . $date_to_arr['0'] . ' 23:59:59';

            $where = $predicate->between('order_date', $date_from, $date_to);
        }

        $select->where($where);

        $select->order('order_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
            return $this->tableGateway->lastInsertValue;
        } else {
            $this->tableGateway->update($data, array('order_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('order_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('order_id' => $id));

        return $result->current();
    }
}