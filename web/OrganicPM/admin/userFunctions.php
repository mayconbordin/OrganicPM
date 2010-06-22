<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/LoginSystem/User.class.php';

/**
 * This class is meant to handle functions in the 
 * flexigrid with the user table.
 * 
 * @author BlackNRoll
 *
 */
class UserFlexiGridFunctions
	{
		private $user;
		private $action;
		
		public function __construct()
			{
				$this->user 	= new User();
				$this->action	= $_POST['action'];
				
				if (strcmp($this->action, "list") == 0)
					$this->getList();
					
				if (strcmp($this->action, "delete") == 0)
					$this->delete();
					
				//------------------------------------------
				if (!$this->action)
					if (isset($_GET['action']))
						$this->action	= $_GET['action'];
						
				if (strcmp($this->action, "get") == 0)
					$this->getRow();
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
					
				$data = $this->user->getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $_POST);
				
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
				
				$this->user->deleteUsers(rtrim($_POST['items'], ','));
			}
			
		public function getRow()
			{
				if (isset($_GET['id']) && is_numeric($_GET['id']))
					$id = $_GET['id'];
				else
					die("Código inválido.");
				
				$pessoa = new Pessoa();
				$pessoa->setCodigo($id);
				
				$this->user->setPessoa($pessoa);
				$this->user->getDataByPessoa();
				
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				echo json_encode(array("nome" => $this->user->getUsername(),
				"status" => $this->user->getStatus(), "nivel" => $this->user->getLevel()));
			}
			
	}
	
/**
 * Start UserFlexiGridFunctions
 */
global $session;

if($session->loggedIn)
	$userFlexiGrid = new UserFlexiGridFunctions();