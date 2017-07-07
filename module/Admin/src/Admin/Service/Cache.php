<?php
namespace Admin\Service;

use Zend\Cache\StorageFactory;

class Cache  {

    private $cache;

    public function __construct() {
        $config = include 'config/cache.php';
        $cacheType = 'file';
        $this->cache = StorageFactory::factory($config[$cacheType]);
    }

    public function checkItem($key) {
        return $this->cache->hasItem($key);
    }

    public function set($key, $value) {
        if ($this->cache->hasItem($key)) {
            $this->cache->replaceItem($key, $value);
        } else {
            $this->cache->setItem($key, $value);
        }

        return $this;
    }

    public function get($key) {
        if ($this->cache->hasItem($key)) {
            return $this->cache->getItem($key);
        }
        return null;
    }

    public function clear($key) {
        $this->cache->removeItem($key);
    }

}