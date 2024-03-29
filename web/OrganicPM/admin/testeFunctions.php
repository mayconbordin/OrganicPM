<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Teste.class.php';

/**
 * This class is meant to handle functions in the 
 * flexigrid with the user table.
 * 
 * @author BlackNRoll
 *
 */
class TesteFlexiGridFunctions
	{
		private $teste;
		private $action;
		
		public function __construct()
			{
				$this->teste 	= new Teste();
				$this->action	= $_POST['action'];
				
				if (strcmp($this->action, "list") == 0)
					$this->getList();
					
				if (strcmp($this->action, "delete") == 0)
					$this->delete();
			}
			
		public function getList()
			{
				$page			= $_POST['page'];
				$rp				= $_POST['rp'];
				$sortName		= $_POST['sortname'];
				$sortOrder		= $_POST['sortorder'];
				$query			= $_POST['query'];
				$qType			= $_POST['qtype'];
				$letterPressed	= $_POST['letter_pressed'];
				
				if (!$page)
					$page = 1;
				if (!$rp)
					$rp = 10;
					
				$data = $this->teste->getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $_POST);
								
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				echo json_encode($data);
			}
			
		public function delete()
			{
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				$this->teste->deleteList(rtrim($_POST['items'], ','));
			}
	}
	
/**
 * Start UserFlexiGridFunctions
 */
global $session;

if($session->loggedIn)
	$testeFlexiGrid = new TesteFlexiGridFunctions();