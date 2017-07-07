<?php
namespace Home\Model;

class NewsCategory {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getNewsCategoryList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM news_category WHERE news_category_parent = ' . $parent;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $news_category_id = $row['news_category_id'];

            $data[$news_category_id] = (array) $row;
            $data[$news_category_id]['news_category_level'] = $level;

            $sql = 'SELECT * FROM news_category WHERE news_category_parent = ' . $news_category_id;

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getNewsCategoryList($news_category_id, $level, $data);
            }
        }
        return $data;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('news_category_id' => $id));

        return $result->current();
    }
}