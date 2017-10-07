<?php

namespace Admin\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;

class Product extends Form {
    public function __construct($name = null) {
        parent::__construct('product');

        $this->add([
            'name' => 'product_name',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Tên',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_position',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Vị trí',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_price_old',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Giá cũ',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_price',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Giá',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_code',
            'type' => 'Text',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Mã sản phẩm',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_type_new',
            'type' => 'Zend\Form\Element\Checkbox',
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Sản phẩm mới',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
                'checked_value' => '1',
                'unchecked_value' => '0'
            ],
        ]);

        $this->add([
            'name' => 'product_type_sale',
            'type' => 'Zend\Form\Element\Checkbox',
            'attributes' => [
                //'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Sản phẩm nổi bật',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
                'checked_value' => '1',
                'unchecked_value' => '0'
            ],
        ]);

        $this->add([
            'name' => 'product_description',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => [
                'class' => 'form-control content',
            ],
            'options' => [
                'label' => 'Mô tả',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_picture',
            'type' => 'file',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Hình đại diện',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_category_id',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Danh mục',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_status',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Trạng thái',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add(array(
            'type' => 'Zend\Form\Element\Csrf',
            'name' => 'csrf',
            'options' => array(
                'csrf_options' => array(
                    'timeout' => 600
                )
            )
        ));

        $this->add([
            'name' => 'submit',
            'type' => 'submit',
            'attributes' => [
                'value' => 'Thêm',
                'id' => 'submit',
                'class' => 'btn btn-primary',
            ],
        ]);
    }

    public function getInputFilter()
    {
        $inputFilter = new InputFilter();
        $inputFilter->add([
            'name' => 'product_name',
            'required' => true,
            'filters' => [
                ['name' => 'StripTags'],
                ['name' => 'Stringtrim'],
            ],
            'validators' => [
                [
                    'name' => 'not_empty',
                    'options' => [
                        'messages' => [
                            \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập thông tin',
                        ]
                    ],
                    'break_chain_on_failure' => true,
                ],
            ],
        ]);


        $inputFilter->add([
            'name' => 'product_picture',
            'required' => false,
            'allow_empty' => true,
            'validators' => [
                [
                    'name' => 'Zend\Validator\File\Size',
                    'options' => [
                        'max' => '20MB' //1MB
                    ],
                ],
                [
                    'name' => 'Zend\Validator\File\Extension',
                    'options' => [
                        'extension' => 'png,jpg,gif,jpeg',
                    ],
                ],
            ],
        ]);



        return $inputFilter;
    }
}