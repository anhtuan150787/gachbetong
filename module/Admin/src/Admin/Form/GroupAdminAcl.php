<?php

namespace Admin\Form;

use \Zend\Form\Form;
use Zend\InputFilter\InputFilter;
use Zend\Validator\Db\NoRecordExists;
use Zend\Validator\EmailAddress;

class GroupAdminAcl extends Form {
    public function __construct($name = null) {
        parent::__construct('groupAdminAcl');

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
                'value' => 'Đồng ý',
                'class' => 'btn btn-primary',
            ]
        ]);
    }

}