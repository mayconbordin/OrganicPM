<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Referencia.class.php';

include_once '../plugins/validateEmail.function.php';

class gravarReferencia
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $referencia;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Refer�ncia
				$this->referencia = new Referencia();
				
				//Pega os dados do post
				$this->getPost();
				
				if ($this->action == "novo")
					{	
						//Insere
						$this->novo();
					}
				else
					{
						//Altera
						$this->alterar();
					}
			}
			
		public function getPost()
			{
				//C�digo
				if (isset($_POST['pessoa_cod']))
					{
						$this->pessoa->setCodigo($_POST['pessoa_cod']);

						if ($this->pessoa->getCodigo() == '')
							{
								$this->form->setError("geral", "Dados de pessoa incorretos.");
								$this->error = true;
							}
						elseif (!is_numeric($this->pessoa->getCodigo()))
							{
								$this->form->setError("geral", "Dados de pessoa inv�lidos.");
								$this->error = true;
							}
						elseif (!$this->pessoa->searchByCodigo())
							{
								$this->form->setError("geral", "Essa pessoa n�o existe.");
								$this->error = true;
							}
							
						$this->referencia->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Refer�ncia ======================================================
		   		//==================================================================					
				//C�digo
				if ($this->action == "editar")
					{
						if (isset($_POST['referencia_cod']))
							{
								$this->referencia->setCodigo($_POST['referencia_cod']);
								
								if ($this->referencia->getCodigo() == '')
									{
										$this->form->setError("geral", "C�digo da refer�ncia inexistente.");
										$this->error = true;
									}
								elseif (!is_numeric($this->referencia->getCodigo()))
									{
										$this->form->setError("geral", "C�digo da refer�ncia  inexistente");
										$this->error = true;
									}
								elseif (!$this->referencia->searchByCodigo())
									{
										$this->form->setError("geral", "Refer�ncia inv�lida.");
										$this->error = true;
									}
							}
					}
					
				//Nome
				if (isset($_POST['ref_nome']))
					{
						$this->referencia->setNome($_POST['ref_nome']);
												
						if ($this->referencia->getNome() == '')
							{
								$this->form->setError("ref_nome", "Nome n�o pode ser vazio.");
								$this->error = true;
							}
					}
					
				//Empresa
				if (isset($_POST['ref_empresa']))
					{
						$this->referencia->setEmpresa($_POST['ref_empresa']);
					}
					
				//V�nculo
				if (isset($_POST['ref_vinculo']))
					{
						$this->referencia->setVinculo($_POST['ref_vinculo']);
					}
					
				//Telefone
				if (isset($_POST['ref_telefone']))
					{
						$this->referencia->setFone($_POST['ref_telefone']);
												
						if ($this->referencia->getFone() == '')
							{
								$this->form->setError("ref_telefone", "Telefone n�o pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->referencia->getFone()))
							{
								$this->form->setError("ref_telefone", "Telefone deve conter somente n�meros.");
								$this->error = true;
							}
					}
					
				//Email
				if (isset($_POST['ref_email']))
					{
						$this->referencia->setEmail($_POST['ref_email']);
												
						if (!validateEmail($this->referencia->getEmail()))
							{
								$this->form->setError("ref_email", "Formato de email inv�lido.");
								$this->error = true;
							}
					}
				
				//Erro
				if ($this->error === true)
					$this->redirect();
			}
			
		public function redirect()
			{
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
         		
         		$url = "referencias.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->referencia->getCodigo();
								
				//Redirect
				if ($this->error)
					header("Location: ".$url."&status=erro");
				else
					header("Location: ".$url."&status=sucesso");
				die();
			}

		public function novo()
			{
				//Grava os dados
				if (!$this->referencia->record())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
			
		public function alterar()
			{
				//Grava os dados
				if (!$this->referencia->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$referencia = new gravarReferencia();