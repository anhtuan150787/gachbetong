<?php
namespace Home\Model;

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

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('news_id' => $id));

        return $result->current();
    }

    public function getHomeNewFront($limit)
    {
        $sql = 'SELECT * FROM news WHERE news_status = 1 ORDER BY news_id DESC LIMIT ' . $limit;
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function getListNewsByCategory($newsCategoryId)
    {
        $select = new Select('news');
        $select->join('news_category', 'news.news_category_id=news_category.news_category_id', array('news_category_name'), 'left');

        $predicate = new  \Zend\Db\Sql\Where();
        $select->where($predicate->equalTo('news.news_category_id', $newsCategoryId));
        $select->where($predicate->equalTo('news.news_status', 1));

        $select->order('news_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getNewsOther($categoryId)
    {
        $sql = 'SELECT * FROM news WHERE news_category_id = ' . $categoryId  . ' AND news_status = 1 ORDER BY news_id DESC LIMIT 6';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}