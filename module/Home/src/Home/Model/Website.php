<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Website {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('website_id' => $id));

        return $result->current();
    }
}