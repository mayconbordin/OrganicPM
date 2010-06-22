<?php

include_once ROOT.'lib/Database/Transactions.class.php';
include_once ROOT.'plugins/getIPAddress.function.php';
include_once ROOT.'lib/LoginSystem/Session.class.php';

class ActionLog extends Transactions
	{
		private $session;
		private $id;
		private $user;
		private $ip;
		private $date;
		private $action;
	
		public function __construct($action)
			{
				global $session;
				$this->session = $session;
				
				$this->date		= date('Y-m-d H:i:s');
				$this->ip 		= getIPAddress();
				$this->user		= $this->session->user->getId();
				$this->action	= $action;
				
				//Record the action log
				$this->record();
			}

		public function record()
			{
				$this
					->insert()
						->into()
							->{TBL_LOGS}()
								->usuario()
								->data()
								->ip()
								->acao()
							->string($this->user)
							->string($this->date)
							->string($this->ip)
							->string($this->action);
							
				$result = $this->run();
																
				if ($result !== false)
					{
						$this->getInsertedCodigo();
						return $result;
					}
				else
					return false;
			}
			
		public function getInsertedCodigo()
			{
				$seq = "log_cod_seq.currval";
				$this
					->select()
						->$seq()
					->from()
						->dual();
						
				$this->run();
				
				$this->id = $this->db->fetchField("CURRVAL");
			}
		
	}