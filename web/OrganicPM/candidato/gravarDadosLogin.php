<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/LoginSystem/User.class.php';

include_once '../plugins/validatePassword.function.php';

class gravarDadosLogin
	{
		private $form;
		
		private $pessoa;
				
		private $user;
		
		private $action;
				
		private $error = false;
		
		public function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->action = $_POST['action'];
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//User
				$this->user = new User();
				
				//Pega os dados do post
				$this->getPost();
				
				//grava
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Dados Pessoais ==================================================
		   		//==================================================================
				//Código
				if (isset($_POST['pessoa_cod']))
					{
						$this->pessoa->setCodigo($_POST['pessoa_cod']);
						
						if ($this->pessoa->getCodigo() == '')
							{
								$this->form->setError("geral", "Dados da pessoa inválidos.");
								$this->error = true;
							}
						elseif (!is_numeric($this->pessoa->getCodigo()))
							{
								$this->form->setError("geral", "Dados da pessoa inválidos.");
								$this->error = true;
							}
						elseif (!$this->pessoa->searchByCodigo())
							{
								$this->form->setError("geral", "Pessoa inexistente.");
								$this->error = true;
							}
							
						$this->user->setPessoa($this->pessoa);
					}
					
				//Senha atual
				if (isset($_POST['senha_atual']))
					{
						$senha = $_POST['senha_atual'];
						
						if ($senha == '')
							{
								$this->form->setError("senha_atual", "A senha atual não pode ser vazia.");
								$this->error = true;
							}
						elseif (!validatePassword($senha))
		   					{
		   						$this->form->setError("senha_atual", "A senha atual contém caracteres inválidos.");
								$this->error = true;
		   					}
						elseif (strlen($senha) < 5)
		   					{
		   						$this->form->setError("senha_atual", "A senha atual precisa ter no mínimo 5 caracteres.");
								$this->error = true;
		   					}
		   					
		   				$this->user->getPasswordFieldByCodigo();
		   				
						if (strcmp(sha1($senha), $this->user->getPassword()) != 0)
		   					{
		   						$this->form->setError("senha_atual", "Senha incorreta.");
								$this->error = true;
		   					}
					}
					
				//Senha nova
				if (isset($_POST['senha_nova']))
					{
						$senha = $_POST['senha_nova'];
						
						if ($senha == '')
							{
								$this->form->setError("senha_nova", "A senha nova não pode ser vazia.");
								$this->error = true;
							}
						elseif (!validatePassword($senha))
		   					{
		   						$this->form->setError("senha_nova", "A senha nova contém caracteres inválidos.");
								$this->error = true;
		   					}
						elseif (strlen($senha) < 5)
		   					{
		   						$this->form->setError("senha_nova", "A senha nova precisa ter no mínimo 5 caracteres.");
								$this->error = true;
		   					}
		   					
		   				$conf = $_POST['senha_nova_conf'];
		   				
						if (strcmp($senha, $conf) != 0)
		   					{
		   						$this->form->setError("senha_nova_conf", "As senhas são diferentes.");
								$this->error = true;
		   					}
		   					
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
					header("Location: dados_login.php?status=erro&action=".$this->action);
				else
					header("Location: dados_login.php?status=sucesso&action=".$this->action);
				die();
			}

		public function record()
			{
				if (!$this->user->updatePassword())
					{
						$this->form->setError("geral", "Não foi possível alterar sua senha.");
						$this->redirect();
					}

				
				//Redireciona
				$this->redirect();
			}
	}
	
$curriculo = new gravarDadosLogin();