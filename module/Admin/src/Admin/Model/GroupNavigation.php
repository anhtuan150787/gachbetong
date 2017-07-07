<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class GroupNavigation {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('group_navigation');
        $select->order('group_navigation_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM group_navigation ORDER BY group_navigation_id DESC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('group_navigation_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('group_navigation_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('group_navigation_id' => $id));

        return $result->current();
    }
}