<?php
namespace Admin\Service;

use Zend\File\Transfer\Adapter\Http;

class UploadFile extends Http
{
    protected $path;

    protected $file;

    protected $fileNew;

    protected $prefix = 'Pic_';

    public function upload()
    {
        $this->setNewFile();

        $this->addFilter('Rename', array(
            'target' => $this->path . '/' . $this->fileNew,
            'randomize' => false,
            //'overwrite' => true,
        ));

        $this->receive($this->file);
    }

    public function setPrefix($prefix)
    {
        $this->prefix = $prefix;
    }

    public function setPath($path)
    {
        $this->path = $path;
    }

    public function setFile($file)
    {
        $this->file = $file;
    }

    public function setNewFile()
    {
        $this->fileNew = $this->prefix . microtime(TRUE) . '_' . $this->file;
    }

    public function getNewFile()
    {
        return $this->fileNew;
    }
}