<?php
namespace Admin\View\Helper;

use Zend\View\Helper\AbstractHelper;

class Functions extends AbstractHelper {

    function formatTitle($str)
    {
        if (!$str)
        {
            return false;
        }
        $str = strip_tags($str);
        $unicode = array(
            'a' => 'á|à|ả|ã|ạ|ă|ắ|ặ|ằ|ẳ|ẵ|â|ấ|ầ|ẩ|ẫ|ậ',
            'd' => 'đ', 'e' => 'é|è|ẻ|ẽ|ẹ|ê|ế|ề|ể|ễ|ệ',
            'i' => 'í|ì|ỉ|ĩ|ị', 'o' => 'ó|ò|ỏ|õ|ọ|ô|ố|ồ|ổ|ỗ|ộ|ơ|ớ|ờ|ở|ỡ|ợ',
            'u' => 'ú|ù|ủ|ũ|ụ|ư|ứ|ừ|ử|ữ|ự',
            'y' => 'ý|ỳ|ỷ|ỹ|ỵ',
            'A' => 'Á|À|Ả|Ã|Ạ|Ă|Ắ|Ặ|Ằ|Ẳ|Ẵ|Â|Ấ|Ầ|Ẩ|Ẫ|Ậ',
            'D' => 'Đ',
            'E' => 'É|È|Ẻ|Ẽ|Ẹ|Ê|Ế|Ề|Ể|Ễ|Ệ',
            'I' => 'Í|Ì|Ỉ|Ĩ|Ị',
            'O' => 'Ó|Ò|Ỏ|Õ|Ọ|Ô|Ố|Ồ|Ổ|Ỗ|Ộ|Ơ|Ớ|Ờ|Ở|Ỡ|Ợ',
            'U' => 'Ú|Ù|Ủ|Ũ|Ụ|Ư|Ứ|Ừ|Ử|Ữ|Ự',
            'Y' => 'Ý|Ỳ|Ỷ|Ỹ|Ỵ',);
        foreach ($unicode as $nonUnicode => $uni)
        {
            $str = preg_replace("/($uni)/i", $nonUnicode, $str);
        }
        $strText = preg_replace('/[^A-Za-z0-9-]/', ' ', $str);
        $strText = preg_replace('/ +/', ' ', $strText);
        $strText = trim($strText);
        $strText = str_replace(' ', '-', $strText);
        $strText = preg_replace('/-+/', '-', $strText);
        $strText = preg_replace("/-$/", "", $strText);

        return strtolower($strText);
    }

    function formatDate($date)
    {
        $dateArr = explode(' ', $date);
        $day = explode('-', $dateArr[0]);

        return $day[2] . '/' . $day[1] . '/' . $day[0] . ' ' . $dateArr[1];
    }
}