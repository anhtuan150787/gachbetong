<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Template {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($group_template_id)
    {
        $select = new Select('template');
        $select->join('group_template', 'template.group_template_id=group_template.group_template_id','group_template_name', 'left');
        $where = '';
        $predicate = new  \Zend\Db\Sql\Where();

        $where = $predicate->isNotNull('template_id');

        if ($group_template_id && $group_template_id != '') {
            $where->and;
            $where = $predicate->equalTo('template.group_template_id', $group_template_id);
        }
        $select->where($where);
        $select->order('template.template_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getAll()
    {
        $sql = 'SELECT * FROM template';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function fetchAllWhereGroup($group_template_id)
    {
        $sql = 'SELECT * FROM template WHERE group_template_id = ' . $group_template_id;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('template_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('template_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('template_id' => $id));

        return $result->current();
    }
}