<?php

namespace Home\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterProviderInterface;
use Zend\Validator\EmailAddress;

use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;
use Zend\Validator\StringLength;

class Contact extends Form implements InputFilterProviderInterface
{

    public function __construct($name = null)
    {
        parent::__construct('contact');

        $this->add([
            'name' => 'contact_fullname',
            'type' => 'Text',
            'attributes' => [
                'placeholder' => 'Họ tên',
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Họ tên',
                //'label_attributes' => ['class' => 'control-label'],
            ],
        ]);

        $this->add([
            'name' => 'contact_email',
            'type' => 'Text',
            'attributes' => [
                'placeholder' => 'Email',
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Email',
                //'label_attributes' => ['class' => 'control-label'],
            ],
        ]);

        $this->add([
            'name' => 'contact_phone',
            'type' => 'Text',
            'attributes' => [
                'placeholder' => 'Điện thoại',
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Điện thoại',
                //'label_attributes' => ['class' => 'control-label'],
            ],
        ]);

        $this->add([
            'name' => 'contact_content',
            'type' => 'Zend\Form\Element\Textarea',
            'attributes' => [
                'placeholder' => 'Lời nhắn',
                'class' => 'form-control',
            ],
            'options' => [
                'label' => 'Lời nhắn',
                //'label_attributes' => ['class' => 'control-label'],
            ],
        ]);

        $configCaptcha = include 'config/captcha.php';

        $captchaImage = new CaptchaImage($configCaptcha);

        $this->add(array(
            'type' => 'Zend\Form\Element\Captcha',
            'name' => 'Captcha',
            'attributes' => [
                'class' => 'form-control',
                'style' => 'width: 150px'
            ],
            'options' => [
                'captcha' => $captchaImage,
                'label' => 'Mã xác thực',
            ],
        ));


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
            'type' => 'button',
            'attributes' => [
                'value' => 'Gửi liên hệ',
                'id' => 'btn-submit',
                'class' => 'btn btn-success',
                'data-loading-text' => 'Đang gửi'
            ],
        ]);
    }


    public function getInputFilterSpecification() {
        return [
            'contact_fullname'  => [
                'required' => true,
                'filters' => [
                    ['name' => 'StringTrim'],
                    ['name' => 'StripTags']
                ],
                'validators' => [///Validators
                    [
                        'name' => 'not_empty',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập thông tin',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                ]
            ],
            'contact_phone' => [
                'required' => true,
                'filters' => [
                    ['name' => 'StringTrim'],
                    ['name' => 'StripTags']
                ],
                'validators' => [///Validators
                    [
                        'name' => 'not_empty',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập thông tin',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                    [
                        'name' => 'Digits',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\Digits::NOT_DIGITS => 'Thông tin không hợp lệ',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                ]
            ],
            'contact_email' => [
                'required' => true,
                'filters' => [
                    ['name' => 'StringTrim'],
                    ['name' => 'StripTags']
                ],
                'validators' => [///Validators
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
                                EmailAddress::INVALID => 'Thông tin không hợp lệ',
                                EmailAddress::INVALID_HOSTNAME => 'Thông tin không hợp lệ',
                                EmailAddress::INVALID_FORMAT => 'Thông tin không hợp lệ',
                                EmailAddress::INVALID_LOCAL_PART => 'Thông tin không hợp lệ',
                                EmailAddress::INVALID_MX_RECORD => 'Thông tin không hợp lệ',
                                EmailAddress::INVALID_SEGMENT => 'Thông tin không hợp lệ',
                            ],
                        ],
                    ],
                ]
            ],
            'contact_content' => [
                'required' => true,
                'filters' => [
                    ['name' => 'StringTrim'],
                    ['name' => 'StripTags']
                ],
                'validators' => [///Validators
                    [
                        'name' => 'not_empty',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập thông tin',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                    [
                        'name' => 'StringLength',
                        'break_chain_on_failure' => true,
                        'options' => [
                            'max' => 300,
                            'messages' => [
                                StringLength::TOO_LONG => 'Lời nhắn không quá 300 ký tự',
                            ]
                        ]
                    ],
                ]
            ],
        ];
    }
}