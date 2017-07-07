<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Build {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('build');
        $select->order('status DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('id' => $id));

        return $result->current();
    }
}