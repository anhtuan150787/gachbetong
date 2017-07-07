<?php
namespace Admin\Model;

class GroupMenu {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getGroupMenu($group_admin_id, $parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM group_menu as gm
                LEFT JOIN menu as m ON gm.menu_id=m.menu_id
                WHERE gm.group_admin_id = ' . $group_admin_id . '
                    AND gm.group_menu_status = 1
                    AND m.menu_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $menu_id = $row['menu_id'];

            $data[$menu_id] = (array) $row;
            $data[$menu_id]['menu_level'] = $level;

            $sql = 'SELECT * FROM group_menu as gm
                    LEFT JOIN menu as m ON gm.menu_id=m.menu_id
                    WHERE gm.group_admin_id = ' . $group_admin_id . '
                    AND gm.group_menu_status = 1
                    AND m.menu_parent = ' . $menu_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getGroupMenu($group_admin_id, $menu_id, $level, $data);
            }
        }
        return $data;
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
            $this->tableGateway->update($data, array('group_menu_id' => $id));
        }
    }

    public function checkExistMenu($groupAdminId, $menu_id)
    {
        $sql = 'SELECT * FROM group_menu WHERE group_admin_id = ' . $groupAdminId . ' AND menu_id = ' . $menu_id;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result->count();
    }

    public function deleteWhere($where) {
        $this->tableGateway->delete($where);
    }
}