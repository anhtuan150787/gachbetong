<?php
namespace Admin\Service;


class Encrypt  {

    public function HashPass($pass) {
        return md5(md5($pass));
    }

}