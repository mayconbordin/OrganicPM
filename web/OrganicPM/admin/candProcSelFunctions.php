<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/CandidatoProcessoSeletivo.class.php';
include_once '../lib/ProcessoSeletivo.class.php';

/**
 * This class is meant to handle functions in the 
 * flexigrid with the user table.
 * 
 * @author BlackNRoll
 *
 */
class inscritosFlexiGridFunctions
	{
		private $candProcSel;
		private $procSel;
		private $action;
		
		public function __construct()
			{
				$this->candProcSel = new CandidatoProcessoSeletivo();
				$this->procSel = new ProcessoSeletivo();
				$this->action = $_POST['action'];
				
				if (strcmp($this->action, "list") == 0)
					$this->getList();
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
				
				if (isset($_GET['id']) && is_numeric($_GET['id']))
					{
						$this->procSel->setCodigo($_GET['id']);
						$this->candProcSel->setProcessoSeletivo($this->procSel);
					}
				else
					die("Código inválido");
				
				
				if (!$page)
					$page = 1;
				if (!$rp)
					$rp = 10;
					
				$data = $this->candProcSel->getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $_POST);
								
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				echo json_encode($data);
			}
	}
	
/**
 * Start UserFlexiGridFunctions
 */
global $session;

if($session->loggedIn)
	$inscritosFlexiGrid = new inscritosFlexiGridFunctions();