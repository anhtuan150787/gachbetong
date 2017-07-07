<?php
namespace Admin\Model;

class Acl {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getAclList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM acl WHERE acl_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $acl_id = $row['acl_id'];

            $data[$acl_id] = (array) $row;
            $data[$acl_id]['acl_level'] = $level;

            $sql = 'SELECT * FROM acl WHERE acl_parent = ' . $acl_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getAclList($acl_id, $level, $data);
            }
        }
        return $data;
    }

    public function getAclRoot()
    {
        $sql = 'SELECT * FROM acl WHERE acl_parent = 0';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('acl_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('acl_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('acl_id' => $id));

        return $result->current();
    }
}