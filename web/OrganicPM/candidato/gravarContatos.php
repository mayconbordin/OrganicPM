<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Telefone.class.php';
include_once '../lib/TipoTelefone.class.php';
include_once '../lib/Form/Form.class.php';

class gravarContato
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $tipo;
		
		private $contato;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Telefone
				$this->contato = new Telefone();
				
				//Tipo
				$this->tipo = new TipoTelefone();
				
				//Pega os dados do post
				$this->getPost();
				
				if ($this->action == "novo")
					{	
						//Insere o curr�culo
						$this->novo();
					}
				else
					{
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
							
						$this->contato->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Contatos ========================================================
		   		//==================================================================					
				//C�digo
				if ($this->action == "editar")
					{
						if (isset($_POST['contato_cod']))
							{
								$this->contato->setCodigo($_POST['contato_cod']);
								
								if ($this->contato->getCodigo() == '')
									{
										$this->form->setError("geral", "C�digo de contato inexistente.");
										$this->error = true;
									}
								else
									if (!is_numeric($this->contato->getCodigo()))
										{
											$this->form->setError("geral", "C�digo de contato inexistente");
											$this->error = true;
										}
							}
					}
					
				//Tipo de telefone
				if (isset($_POST['tipo_tel']))
					{
						$this->tipo->setTipo($_POST['tipo_tel']);
												
						if ($this->tipo->getTipo() == '')
							{
								$this->form->setError("tipo_tel", "Tipo de telefone inv�lido.");
								$this->error = true;
							}
						elseif (!$this->tipo->searchByTipo())
							{
								$this->form->setError("tipo_tel", "Tipo de telefone inv�lido.");
								$this->error = true;
							}
							
						$this->contato->setTipo($this->tipo);
					}
					
				//C�digo
				if (isset($_POST['ddd']))
					{
						$this->contato->setArea($_POST['ddd']);
						
						if ($this->contato->getArea() == '')
							{
								$this->form->setError("ddd", "C�digo de �rea n�o pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->contato->getArea()))
								{
									$this->form->setError("ddd", "C�digo de �rea precisa ser num�rico.");
									$this->error = true;
								}
					}
					
				//N�mero
				if (isset($_POST['numero_tel']))
					{
						$this->contato->setNumero($_POST['numero_tel']);
						
						if ($this->contato->getNumero() == '')
							{
								$this->form->setError("ddd", "O n�mero n�o pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->contato->getNumero()))
								{
									$this->form->setError("ddd", "O n�mero precisa ser num�rico.");
									$this->error = true;
								}
					}
				
				if ($this->error === true)
					$this->redirect();
			}
			
		public function redirect()
			{
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
         		
         		$url = "contatos.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->contato->getCodigo();
								
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
				if (!$this->contato->record())
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
				if (!$this->contato->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$contato = new gravarContato();