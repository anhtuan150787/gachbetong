<?php
namespace Admin\Service;

use Zend\Mail\Message;
use Zend\Mail\Transport\Smtp as SmtpTransport;
use Zend\Mail\Transport\SmtpOptions;
use Zend\Mime\Part as MimePart;
use Zend\Mime\Message as MimeMessage;

class SendMail  {

    private $to;
    private $from;
    private $subject;
    private $body;
    private $toSecond;
    private $fromName;

    public function action() {
        $config = include 'config/mailer.php';

        $html = new MimePart($this->body);
        $html->type = "text/html";

        $body = new MimeMessage();
        $body->setParts(array($html));

        $this->from = $config['from'];
        $this->fromName = $config['from_name'];

        $message = new Message();
        $message->addTo($this->to)
            ->addFrom($this->from, $this->fromName)
            ->setSubject($this->subject)
            ->setBody($body)
            ->setEncoding('UTF-8');

        $transport = new SmtpTransport();
        $options   = new SmtpOptions($config['system']);
        $transport->setOptions($options);
        $transport->send($message);
    }

    public function setTo($to) {
        $this->to = $to;
        return $this;
    }

    public function setToSecond($toSecond) {
        $this->toSecond = $toSecond;
        return $this;
    }

    public function setFrom($from) {
        $this->from = $from;
        return $this;
    }

    public function setFromName($fromName) {
        $this->fromName = $fromName;
        return $this;
    }

    public function setSubject($subject) {
        $this->subject = $subject;
        return $this;
    }

    public function setBody($body) {
        $this->body = $body;
        return $this;
    }
}