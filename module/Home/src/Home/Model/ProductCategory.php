<?php
namespace Home\Model;

class ProductCategory {

    public function __construct($tableGateway)
    {
        $this->tableGateway = $tableGateway;
    }

    public function getProductCategoryList($parent = 0, $level = -1, $data = array())
    {
        $sql = 'SELECT * FROM product_category WHERE product_category_parent = ' . $parent . ' AND product_category_status = 1';
        $statement = $this->tableGateway->getAdapter()->query($sql);
        $result = $statement->execute();

        $level++;

        foreach($result as $row) {
            $product_category_id = $row['product_category_id'];

            $data[$product_category_id] = (array) $row;
            $data[$product_category_id]['product_category_level'] = $level;

            $sql = 'SELECT * FROM product_category WHERE product_category_parent = ' . $product_category_id . ' AND product_category_status = 1';

            $statement = $this->tableGateway->getAdapter()->query($sql);
            $result = $statement->execute();

            if ($result->count() > 0) {
                $data = $this->getProductCategoryList($product_category_id, $level, $data);
            }
        }
        return $data;
    }

    public function fetchRow($id)
    {
        $result = $this->tableGateway->select(array('product_category_id' => $id));

        return $result->current();
    }
}