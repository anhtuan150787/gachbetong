<?php

namespace Admin\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;
use Zend\Form\Element\Captcha;
use Zend\Captcha\Image as CaptchaImage;
use Zend\InputFilter\InputFilterProviderInterface;


class Login extends Form implements InputFilterProviderInterface {
    public function init()
    {
        parent::init();

        $this->add([
            'name' => 'email',
            'type' => 'Text',
            'attributes' => [
                'placeholder' => 'Email',
                'class' => 'input-block-level',
            ]
        ]);
        $this->add([
            'name' => 'password',
            'type' => 'Password',
            'attributes' => [
                'placeholder' => 'Mật khẩu',
                'class' => 'input-block-level',
            ],
        ]);

        $configCaptcha = include 'config/captcha.php';

        $captchaImage = new CaptchaImage($configCaptcha);

        $this->add(array(
            'type' => 'Zend\Form\Element\Captcha',
            'name' => 'Captcha',
            'options' => [
                'captcha' => $captchaImage,
            ],
            'attributes' => [
                'placeholder' => 'Mã xác thực',
                'class' => 'input-block-level captcha-input',
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
            'type' => 'Submit',
            'attributes' => [
                'value' => 'Tiếp tục',
                'class' => 'btn btn-primary',
            ]
        ]);
    }
    public function getInputFilterSpecification() {
        return [
            'email' => [///Tên element
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
                                \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập Email',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                    [
                        'name' => 'EmailAddress',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\EmailAddress::INVALID_FORMAT => 'Email không đúng định dạng',
                            ]
                        ]
                    ],
                ],
            ],
            'password' => [
                'required' => true,
                'filters' => [
                    ['name' => 'Stringtrim'],
                ],
                'validators' => [
                    [
                        'name' => 'not_empty',
                        'options' => [
                            'messages' => [
                                \Zend\Validator\NotEmpty::IS_EMPTY => 'Vui lòng nhập Mật khẩu',
                            ]
                        ],
                        'break_chain_on_failure' => true,
                    ],
                ],
            ],
        ];
    }
}