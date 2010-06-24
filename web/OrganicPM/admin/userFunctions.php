<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/LoginSystem/UserLevel.class.php';
include_once '../plugins/validatePassword.function.php';
include_once '../lib/Logs/ActionLog.class.php';

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
		
		private $form;		
		private $log;
		
		private $pessoa;
		private $nivel;
		private $error;
		
		private $flag = 0;
		
		public function __construct()
			{
				$this->user 	= new User();
				$this->action	= $_POST['action'];
				
				//ActionLog
				$this->log = new ActionLog();
				
				if (strcmp($this->action, "list") == 0)
					$this->getList();
					
				if (strcmp($this->action, "delete") == 0)
					$this->delete();
					
				if (strcmp($this->action, "editar") == 0)
					{
						//Form
						session_start();
						$this->form = new Form();

						$this->nivel = new UserLevel();
						
						$this->pessoa = new Pessoa();
						
						$this->getPost();
						
						$this->editarUsuario();
					}
					
				//------------------------------------------
				if (!$this->action)
					if (isset($_GET['action']))
						$this->action	= $_GET['action'];
						
				if (strcmp($this->action, "get") == 0)
					$this->getRow();
			}
			
		public function getPost()
			{
				//Pessoa
				if (isset($_POST['pessoa_cod']))
					{
						$this->pessoa->setCodigo($_POST['pessoa_cod']);
						
						if ($this->pessoa->getCodigo() == '')
							{
								$this->form->setError("geral", "A pessoa não pode ser vazia.");
								$this->error = true;
							}
						elseif (!is_numeric($this->pessoa->getCodigo()))
							{
								$this->form->setError("geral", "Pessoa inválida.");
								$this->error = true;
							}
						elseif (!$this->pessoa->searchByCodigo())
							{
								$this->form->setError("geral", "Pessoa inexistente.");
								$this->error = true;
							}
							
						$this->user->setPessoa($this->pessoa);
					}
				else
					{
						$this->form->setError("geral", "A pessoa não pode ser vazia.");
						$this->error = true;
					}
					
				//Nível de acesso
				if (isset($_POST['nivel_acesso']))
					{
						$this->nivel->setNivel($_POST['nivel_acesso']);
						
						if ($this->nivel->getNivel() == '')
							{
								$this->form->setError("nivel_acesso", "O nível de acesso não pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->nivel->getNivel()))
							{
								$this->form->setError("nivel_acesso", "Nível de acesso inválido.");
								$this->error = true;
							}
						elseif (!$this->nivel->searchByLevel())
							{
								$this->form->setError("nivel_acesso", "Nível de acesso inexistente.");
								$this->error = true;
							}
						
						$this->user->setLevel($this->nivel);
					}
				else
					{
						$this->form->setError("nivel_acesso", "O nível de acesso não pode ser vazio.");
						$this->error = true;
					}
					
				//Usuário
				if (isset($_POST['usuario']))
					{
						$this->user->setUsername($_POST['usuario']);
						
						if ($this->user->getUsername() == '')
		   					{
		   						$this->form->setError("usuario", "O usuário precisa ser preenchido.");
								$this->error = true;
		   					}
		   				elseif (!validateUsername($this->user->getUsername()))
		   					{
		   						$this->form->setError("usuario", "O usuário contém caracteres inválidos.");
								$this->error = true;
		   					}
		   				elseif ($this->user->usernameTaken())
							{
		   						$this->flag = 1;
		   					}
					}
				else
					{
						$this->form->setError("usuario", "O usuário não pode ser vazio.");
						$this->error = true;
					}
					
				//Status
				if (isset($_POST['status']))
					{
						$enabledStatus = array("active", "blocked", "disabled");
						
						$this->user->setStatus($_POST['status']);
						
						if ($this->user->getStatus() == '')
		   					{
		   						$this->form->setError("status", "O status precisa ser preenchido.");
								$this->error = true;
		   					}
		   				elseif (!in_array($this->user->getStatus(), $enabledStatus))
		   					{
		   						$this->form->setError("status", "O status é inválido.");
								$this->error = true;
		   					}
					}
				else
					{
						$this->form->setError("status", "O status não pode ser vazio.");
						$this->error = true;
					}
				
				//Senha
				if (isset($_POST['senha']) && !empty($_POST['senha']))
					{
						$senha = $_POST['senha'];
						$confirmacao = $_POST['senha_conf'];
						
		   				if (!validatePassword($senha))
		   					{
		   						$this->form->setError("senha", "A senha contém caracteres inválidos.");
								$this->error = true;
		   					}
		   				if (strlen($senha) < 5)
		   					{
		   						$this->form->setError("senha", "A senha precisa ter no mínimo 5 caracteres.");
								$this->error = true;
		   					}
						if (strcmp($senha, $confirmacao) != 0)
		   					{
		   						$this->form->setError("senha_conf", "As senhas são diferentes.");
								$this->error = true;
		   					}
		   					
		   				if (!$this->error)
		   					$this->user->setPassword($senha);
					}

				if ($this->error === true)
					$this->redirect();
			}
		
		public function redirect()
			{
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
								
				//Redirect
				if ($this->error)
					header("Location: usuarios.php?action=".$this->action."&id=".$this->pessoa->getCodigo()."&status=erro");
				else
					header("Location: usuarios.php?action=".$this->action."&id=".$this->pessoa->getCodigo()."&status=sucesso");
				die();
			}
		
		public function editarUsuario()
			{
				//Grava os dados do processo seletivo
				if ($this->flag == 0)
					{
						if (!$this->user->updateUserName())
							{
								$this->form->setError("geral", "Não foi possível gravar os dados do usuário.");
								$this->error = true;
							}
					}
				elseif (!$this->user->updateStatus())
					{
						$this->form->setError("geral", "Não foi possível gravar os dados do usuário.");
						$this->error = true;
					}
				elseif (!$this->user->updateUserLevel())
					{
						$this->form->setError("geral", "Não foi possível gravar os dados do usuário.");
						$this->error = true;
					}
				elseif ($this->user->getPassword())
					{
						if (!$this->user->updatePassword())
							{
								$this->form->setError("geral", "Não foi possível gravar os dados do usuário.");
								$this->error = true;
							}
					}
				
				//Redireciona
				$this->redirect();
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