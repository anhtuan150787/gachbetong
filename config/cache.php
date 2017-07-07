<?php
return array(
    'file' => array(
        'adapter' => 'filesystem',
        'options' => [
            'namespace' => 'System',
            'cache_dir' => './data/cache',
            'ttl' => 86400,
        ],
        'plugins' => array(
            'exception_handler' => array('throw_exceptions' => false),
            'Serializer'
        ),
    ),
    'memcache' => array(
        'adapter' => 'memcache',
        'options' => [
            'servers' => array(
                array(
                    '127.0.0.1',
                )
            ),
            'namespace' => 'System',
            'ttl' => 86400,
        ],
        'plugins' => array(
            'exception_handler' => array('throw_exceptions' => false),
            'Serializer'
        )
    ),
    'xcache' => array(
        'adapter' => 'xcache',
        'options' => [
            'namespace' => 'System',
            'ttl' => 86400,
        ],
        'plugins' => array(
            'exception_handler' => array('throw_exceptions' => false),
            'Serializer'
        ),
    ),
);


