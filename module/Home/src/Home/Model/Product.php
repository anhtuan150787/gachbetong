<?php
namespace Home\Model;

use Zend\Db\Sql\Select;
use Zend\Db\Sql\Sql;
use Zend\Paginator\Adapter\DbSelect;
use Zend\Paginator\Paginator;

class Product {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function fetchAll($search)
    {
        $select = new Select('product');
        $select->join('product_category', 'product.product_category_id=product_category.product_category_id', array('product_category_name'), 'left');

        $where = '';
        $predicate = new  \Zend\Db\Sql\Where();

        $where = $predicate->isNotNull('product_id');

        if (isset($search['name'])) {
            $where->and;
            $select->where($predicate->like('product_name', '%' . $search['name'] . '%'));
        }
        if (isset($search['category'])) {
            $where->and;
            $select->where($predicate->equalTo('product.product_category_id', $search['category']));
        }

        $select->where($where);

        $select->order('product_id DESC');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('product_id' => $id));

        return $result->current();
    }

    public function getProductHot() {
        $sql = 'SELECT * FROM product WHERE product_status = 1 AND product_type_sale = 1 ORDER BY product_id DESC LIMIT 8';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function getProductNew()
    {
        $sql = 'SELECT * FROM product WHERE product_status = 1 AND product_type_new = 1 ORDER BY product_id DESC LIMIT 8';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }

    public function getListProductByCategory($productCategoryId = null, $search = array())
    {
        $select = new Select('product');
        $select->join(
            'product_category', 'product.product_category_id=product_category.product_category_id',
            array('product_category_name'), 'left'
        );


        $predicate = new  \Zend\Db\Sql\Where();
        if ($productCategoryId != null) {
            $select->where($predicate->equalTo('product.product_category_id', $productCategoryId));
        }

        if (!empty($search) && isset($search['color_search']) && $search['color_search'] != '') {
            $select->where($predicate->equalTo('product_detail.color_id', $search['color_search']));
            $select->where($predicate->equalTo('product_detail.product_detail_status', 1));
        }

        if (!empty($search) && isset($search['size_search']) && $search['size_search'] != '') {
            $select->where($predicate->like('product_detail.size_id', "%," . $search['size_search'] . ",%"));
        }

        if (!empty($search) && isset($search['sale_search']) && $search['sale_search'] != '') {
            $select->where($predicate->equalTo('product.product_type_sale', 1));
        }

        if (!empty($search) && isset($search['sort_search']) && $search['sort_search'] != '') {
            switch($search['sort_search']) {
                case 'new':
                    $select->order('product_id DESC');
                    break;
                case 'price_low_high':
                    $select->order('product_price ASC');
                    break;
                case 'price_high_low':
                    $select->order('product_price DESC');
                    break;
            }
        } else {
            $select->order('product_id DESC');
        }

        $select->group('product.product_id');

        $paginatorAdapter   = new DbSelect($select, $this->tableGateway->getAdapter());
        $result             = new Paginator($paginatorAdapter);

        return $result;
    }

    public function getProductDetailByResultList($result) {
        $data = [];
        foreach($result as $v) {
            $data[$v['product_id']] = $v;

            $sql = 'SELECT *
                    FROM product_detail
                    LEFT JOIN color ON product_detail.color_id=color.color_id
                    LEFT JOIN product_picture ON product_detail.product_detail_id=product_picture.product_detail_id
                    WHERE product_detail.product_id = ' . $v['product_id'] . ' AND product_picture.product_picture_position = 1';

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $resultProductDetail = $statement->execute();

            foreach($resultProductDetail as $vv) {
                $data[$v['product_id']]['product_detail'][$vv['product_detail_id']] = $vv;
                $data[$v['product_id']]['product_detail'][$vv['product_detail_id']]['color_picture'] = $vv['color_picture'];
            }

        }
        return $data;
    }

    public function getListProductAll($search) {
        return $this->getListProductByCategory(null, $search);
    }

    public function getListProductSale($search) {
        $search['sale_search'] = 1;
        return $this->getListProductByCategory(null, $search);
    }



    public function getProductNewByListCategory($productCategoryId)
    {
        $sql = 'SELECT * FROM product_category';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $data = [];
        foreach($result as $k => $v) {
            $data[$v['product_category_id']]['product_category_name'] = $v['product_category_name'];

            $sql = 'SELECT * FROM product WHERE product_category_id =' . $v['product_category_id'] . ' ORDER BY product_id DESC LIMIT 6';
            $statement = $this->tableGateway->getAdapter()->query($sql);
            $resultProduct = $statement->execute();
            foreach($resultProduct as $kk => $vv) {
                $data[$v['product_category_id']]['products'][$kk] = $vv;
            }
        }

        return $data;
    }

    public function getProductOther($productCategoryId, $productId)
    {
        $sql = 'SELECT * FROM product WHERE product_category_id = ' . $productCategoryId  . ' AND product_id <> '. $productId . ' AND product_status = 1 ORDER BY product_id DESC LIMIT 8';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        return $result;
    }
}