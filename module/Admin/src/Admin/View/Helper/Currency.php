<?php
namespace Admin\View\Helper;

use Zend\I18n\View\Helper\CurrencyFormat;
use Zend\Session\Container;

class Currency extends CurrencyFormat {
    public function __invoke(
        $number,
        $currencyCode = null,
        $showDecimals = null,
        $locale = null,
        $pattern = null
    ) {
        $currencyCode = 'VND';
        $showDecimals = false;
        $locale = 'vi_VN';
        $pattern = '#,##0';
        $currencyStr = parent::__invoke($number, $currencyCode, $showDecimals, $locale, $pattern);

        return $currencyStr;
    }

}
