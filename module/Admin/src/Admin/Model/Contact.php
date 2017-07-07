<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Contact {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('contact');
        $select->order('contact_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM contact ORDER BY contact_id DESC';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('contact_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('contact_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('contact_id' => $id));

        return $result->current();
    }
}