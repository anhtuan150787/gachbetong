<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class GroupAdmin {

    public function __construct($tableGateway, $dbAdapter)
    {
        $this->tableGateway = $tableGateway;
        $this->dbAdapter = $dbAdapter;
    }

    public function fetchList()
    {
        $select = new Select('group_admin');
        $select->order('group_admin_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function fetchAll()
    {
        $sql = new Sql($this->dbAdapter);
        $select = $sql->select();
        $select->from('group_admin');

        $statement = $sql->prepareStatementForSqlObject($select);
        $results = $statement->execute();

        return $results;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('group_admin_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('group_admin_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('group_admin_id' => $id));

        return $result->current();
    }
}