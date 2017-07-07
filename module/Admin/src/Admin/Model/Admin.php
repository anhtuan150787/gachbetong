<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;


class Admin {

    public function __construct($tableGateway, $dbAdapter)
    {
        $this->tableGateway = $tableGateway;
        $this->dbAdapter = $dbAdapter;
    }

    public function fetchList()
    {
        $select = new Select('admin');
        $select->join('group_admin', 'admin.group_admin_id=group_admin.group_admin_id', array('group_admin_name'), 'left');
        $select->order('admin_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function checkEmailExist($email)
    {
        $sql = new Sql($this->dbAdapter);
        $select = $sql->select();
        $select->from('admin');
        $select->where('admin_email = "' . $email . '"');

        $statement = $sql->prepareStatementForSqlObject($select);
        $results = $statement->execute();
        $results->count();

        return $results->count();
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('admin_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('admin_id' => $id));
    }

    public function deleteWhere($where) {
        $this->tableGateway->delete($where);
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('admin_id' => $id));

        return $result->current();
    }
}