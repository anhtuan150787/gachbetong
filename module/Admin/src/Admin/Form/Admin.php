<?php

namespace Admin\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;
use Zend\Validator\Db\NoRecordExists;
use Zend\Validator\EmailAddress;

class Admin extends Form {
    public function init() {
        parent::init();

        $this->add([
            'name' => 'admin_name',
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
            'name' => 'group_admin_id',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Nhóm quản trị',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
                'disable_inarray_validator' => true,
            ],
        ]);

        $this->add([
            'name' => 'admin_email',
            'type' => 'email',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Email',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'admin_password',
            'type' => 'password',
            'attributes' => [
                'class' => 'form-control',
                'id' => 'admin_password'
            ],
            'options' => [
                'label' => 'Mật khẩu',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'admin_password_confirm',
            'type' => 'password',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Nhập lại mật khẩu',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
            ],
        ]);

        $this->add([
            'name' => 'admin_status',
            'type' => 'Zend\Form\Element\Select',
            'attributes' => [
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Trạng thái',
                'label_attributes' => ['class' => 'control-label col-lg-2'],
                'disable_inarray_validator' => true,
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

    public function setDbAdapter($dbAdapter) {
        $this->dbAdapter = $dbAdapter;
    }

    public function getInputFilters()
    {
        $inputFilter = new InputFilter();
        $inputFilter->add([
            'name' => 'admin_name',
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
                ],
            ],
        ]);
        $inputFilter->add([
            'name' => 'admin_email',
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
                ],
                [
                    'name' => 'EmailAddress',
                    'options' => [
                        'messages' => [
                            EmailAddress::INVALID => 'Email không hợp lệ',
                            EmailAddress::INVALID_HOSTNAME => 'Email không hợp lệ',
                            EmailAddress::INVALID_FORMAT => 'Email không hợp lệ',
                            EmailAddress::INVALID_LOCAL_PART => 'Email không hợp lệ',
                            EmailAddress::INVALID_MX_RECORD => 'Email không hợp lệ',
                            EmailAddress::INVALID_SEGMENT => 'Email không hợp lệ',
                        ],
                    ],
                ],
                [
                    'name' => 'Db\NoRecordExists',
                    'options' => [
                        'table' => 'admin',
                        'field' => 'admin_email',
                        'adapter' => $this->dbAdapter,
                        'messages' => [
                            NoRecordExists::ERROR_RECORD_FOUND => 'Email đã tồn tại. Vui lòng nhập Email khác',
                        ],
                    ],
                ]
            ],
        ]);

        $inputFilter->add([
            'name' => 'admin_password',
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
                ],
            ],
        ]);

        return $inputFilter;
    }
}