<?php

namespace Admin\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;

class ProductDetail extends Form {
    public function __construct($name = null) {
        parent::__construct('build');

        $this->add([
            'name' => 'color_id',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control chosen-select',
            ],
            'options' => [
                'label' => 'Màu',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'size_id',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control chosen-select input-xxlarge',
                'multiple' => 'multiple',
            ],
            'options' => [
                'label' => 'Kích thước',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'product_detail_status',
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
            'name' => 'color_id',
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
                            \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng chọn thông tin',
                        ]
                    ],
                    'break_chain_on_failure' => true,
                ],
            ],
        ]);

        return $inputFilter;
    }
}