<?php

require_once ROOT.'lib/vendor/PHPMailer/class.phpmailer.php';

class Mailer
	{
		private $mail;
		
		private $body;
		private $pessoa;
		private $subject;

		public function __construct()
			{
				$this->mail = new PHPMailer();
			}
			
		private function loadConfig()
			{
				$this->mail->IsSMTP(); // telling the class to use SMTP
				$this->mail->Host       = "mail.yourdomain.com"; // SMTP server
				$this->mail->SMTPDebug  = 2;                     // enables SMTP debug information (for testing)
				$this->mail->SMTPAuth   = true;                  // enable SMTP authentication
				$this->mail->SMTPSecure = "ssl";                 // sets the prefix to the servier
				$this->mail->Host       = "smtp.gmail.com";      // sets GMAIL as the SMTP server
				$this->mail->Port       = 465;                   // set the SMTP port for the GMAIL server
				$this->mail->Username   = EMAIL_FROM_ADDR;  	 // GMAIL username
				$this->mail->Password   = EMAIL_PASSWORD;        // GMAIL password
				
				$this->mail->SetFrom(EMAIL_FROM_ADDR, EMAIL_FROM_NAME);
				
				$this->mail->SMTPDebug = false;
			}
			
		public function sendWelcomeEmail()
			{
				$this->loadConfig();
				
				$this->mail->Subject = "Seja Bem Vindo ao OrganicPM!";
				
				$this->mail->IsHTML(true);
				
				// attach file logo.jpg, and later link to it using identfier logoimg
				$this->mail->AddEmbeddedImage(ROOT.'email/images/logo_small.png', 'logoimg', 'logo_small.png');
				
				$this->mail->Body = "
    			<p><img src=\"cid:logoimg\" /></p>
    			<p>Bem vindo ao OrganicPM.</p>
				<p>A partir de agora você pode efetuar seu login no nosso portal através deste <a href=\"http://localhost/OrganicPM\">link</a>.</p>
    			";

				$this->mail->AltBody = "To view the message, please use an HTML compatible email viewer!"; // optional, comment out and test

				//$this->mail->MsgHTML($this->body);
				
				//$this->mail->AddAttachment(ROOT.'email/images/logo_small.png');      // attachment

				$this->mail->AddAddress($this->pessoa->getEmailPrimario(), $this->pessoa->getNome());
				
				if(!$this->mail->Send())
					return false;
				else
					return true;
			}
	
		/**
		 * @return the $mail
		 */
		public function getMail() {
			return $this->mail;
		}
	
			/**
		 * @return the $body
		 */
		public function getBody() {
			return $this->body;
		}
	
			/**
		 * @return the $subject
		 */
		public function getSubject() {
			return $this->subject;
		}
	
			/**
		 * @param $mail the $mail to set
		 */
		public function setMail($mail) {
			$this->mail = $mail;
		}
	
			/**
		 * @param $body the $body to set
		 */
		public function setBody($body) {
			$this->body = $body;
		}
	
			/**
		 * @param $subject the $subject to set
		 */
		public function setSubject($subject) {
			$this->subject = $subject;
		}
		
		/**
		 * @return the $pessoa
		 */
		public function getPessoa() {
			return $this->pessoa;
		}
	
			/**
		 * @param $pessoa the $pessoa to set
		 */
		public function setPessoa($pessoa) {
			$this->pessoa = $pessoa;
		}
	}