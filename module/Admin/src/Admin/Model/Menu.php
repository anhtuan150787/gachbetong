<?php
namespace Admin\Model;

class Menu {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getMenuList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM menu WHERE menu_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $menu_id = $row['menu_id'];

            $data[$menu_id] = (array) $row;
            $data[$menu_id]['menu_level'] = $level;

            $sql = 'SELECT * FROM menu WHERE menu_parent = ' . $menu_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getMenuList($menu_id, $level, $data);
            }
        }
        return $data;
    }

    public function getMenuRoot()
    {
        $sql = 'SELECT * FROM menu WHERE menu_parent = 0';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('menu_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('menu_id' => $id));
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('menu_id' => $id));

        return $result->current();
    }
}