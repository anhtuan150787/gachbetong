<?php
namespace Admin\Model;

class GroupAcl {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getGroupAcl($group_admin_id, $parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT *
                FROM group_acl as gac
                LEFT JOIN acl as ac ON gac.acl_id=ac.acl_id
                WHERE gac.group_admin_id = ' . $group_admin_id . ' AND gac.group_acl_status = 1';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;


    }

    public function saveWhere($data, $where)
    {
        $this->tableGateway->update($data, $where);
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('group_acl_id' => $id));
        }
    }

    public function checkExistAcl($groupAdminId, $acl_id)
    {
        $sql = 'SELECT * FROM group_acl WHERE group_admin_id = ' . $groupAdminId . ' AND acl_id = ' . $acl_id;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result->count();
    }

    public function deleteWhere($where) {
        $this->tableGateway->delete($where);
    }
}