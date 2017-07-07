<?php
namespace Home\View\Helper;

use Zend\View\Helper\AbstractHelper;

class Social extends AbstractHelper {

    function shareFacebook($params)
    {
        $str = '<script>
                window.fbAsyncInit = function () {
                    FB.init({
                        appId: \'222160068265713\',
                        xfbml: true,
                        version: \'v2.8\'
                    });
                };

                // Load the SDK asynchronously
                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) return;
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//connect.facebook.net/en_US/sdk.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, \'script\', \'facebook-jssdk\'));
            </script>';

        $str .= '<meta property="og:url" content="' . $params['url'] . '" />
                        <meta property="og:type"          content="website" />
                        <meta property="og:title"         content="' . $params['title'] . '" />
                        <meta property="og:description"   content="' . htmlentities($params['description']) . '" />
                        <meta property="og:image"         content="' . $params['image'] . '" />

                        <div class="fb-share-button"
                             data-href="' . $params['url'] . '"
                             data-layout="button_count" data-size="small">
                        </div>
                        ';
        return $str;
    }

    function shareGoogle() {
        $str = '<script src="https://apis.google.com/js/platform.js" async defer></script>
                <div class="g-plus" data-action="share" data-annotation="none" data-height="20"></div>';

        return $str;
    }

    function shareTweet() {
        $str = '<script>window.twttr = (function(d, s, id) {
                  var js, fjs = d.getElementsByTagName(s)[0],
                    t = window.twttr || {};
                  if (d.getElementById(id)) return t;
                  js = d.createElement(s);
                  js.id = id;
                  js.src = "https://platform.twitter.com/widgets.js";
                  fjs.parentNode.insertBefore(js, fjs);

                  t._e = [];
                  t.ready = function(f) {
                    t._e.push(f);
                  };

                  return t;
                }(document, "script", "twitter-wjs"));</script>';

        $str .= '<a class="twitter-share-button"
                  href="https://twitter.com/intent/tweet?text=Hello%20world"
                  data-size="default" data-height="24">
                Tweet</a>';

        return $str;
    }
}