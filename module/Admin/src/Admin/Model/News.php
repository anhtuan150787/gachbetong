<?php
namespace Admin\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class News {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll()
    {
        $select = new Select('news');
        $select->join('news_category', 'news.news_category_id=news_category.news_category_id', array('news_category_name'), 'left');
        $select->order('news_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function fetchAllWhereCategory($categoryId)
    {
        $sql = 'SELECT * FROM news WHERE news_category_id = ' . $categoryId;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function save($data, $id = null)
    {
        if ($id == null) {
            $this->tableGateway->insert($data);
        } else {
            $this->tableGateway->update($data, array('news_id' => $id));
        }
    }

    public function delete($id)
    {
        $this->tableGateway->delete(array('news_id' => $id));
    }

    public function deleteWhere($where)
    {
        $this->tableGateway->delete($where);
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('news_id' => $id));

        return $result->current();
    }
}