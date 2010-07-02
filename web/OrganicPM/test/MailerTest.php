<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Mailer/Mailer.class.php';

class MailerTest
	{
		private $mail;
		private $pessoa;
		
		public function __construct(){
			$this->mail = new Mailer();
			$this->pessoa = new Pessoa();
			
			$this->sendWelcomeMessageTest();
			
		}
		
		public function sendWelcomeMessageTest(){
			$this->pessoa->setNome("Maycon");
			$this->pessoa->setEmailPrimario("mayconbordin@gmail.com");
			
			$this->mail->setPessoa($this->pessoa);
			$this->mail->sendWelcomeEmail();
		}
		
	}
	
$mail = new MailerTest();