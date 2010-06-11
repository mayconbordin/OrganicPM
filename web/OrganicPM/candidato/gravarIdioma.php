<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/IdiomaCandidato.class.php';
include_once '../lib/Idioma.class.php';

class gravarIdioma
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $idioma;
		private $idiomaCand;
		
		private $error = false;
		
		private $idiVals	= array("sim", "não");
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Idioma
				$this->idioma = new Idioma();
				
				//Idioma Candidato
				$this->idiomaCand = new IdiomaCandidato();
				
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
				//Código
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
								$this->form->setError("geral", "Dados de pessoa inválidos.");
								$this->error = true;
							}
						elseif (!$this->pessoa->searchByCodigo())
							{
								$this->form->setError("geral", "Essa pessoa não existe.");
								$this->error = true;
							}
							
						$this->idiomaCand->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Idioma ==========================================================
		   		//==================================================================
				//Idioma atual
				if ($this->action == "editar")
					{
						if (isset($_POST['idioma_cod']))
							{
								$this->idioma->setCodigo($_POST['idioma_cod']);
														
								if ($this->idioma->getCodigo() == '')
									{
										$this->form->setError("idioma", "Idioma não pode ser vazio.");
										$this->error = true;
									}
								elseif (!is_numeric($this->idioma->getCodigo()))
									{
										$this->form->setError("idioma", "Idioma inválido.");
										$this->error = true;
									}
								elseif (!$this->idioma->searchByCodigo())
									{
										$this->form->setError("idioma", "Idioma não existe.");
										$this->error = true;
									}
									
								$this->idiomaCand->setIdioma($this->idioma);
								
								if (!$this->idiomaCand->searchByCodigo())
									{
										$this->form->setError("geral", "Idioma inválido.");
										$this->error = true;
									}
							}
					}
				elseif ($this->action == "novo")
					{
						if (isset($_POST['idioma']))
							{
								$this->idioma->setCodigo($_POST['idioma']);
														
								if ($this->idioma->getCodigo() == '')
									{
										$this->form->setError("idioma", "Idioma não pode ser vazio.");
										$this->error = true;
									}
								elseif (!is_numeric($this->idioma->getCodigo()))
									{
										$this->form->setError("idioma", "Idioma inválido.");
										$this->error = true;
									}
								elseif (!$this->idioma->searchByCodigo())
									{
										$this->form->setError("idioma", "Idioma não existe.");
										$this->error = true;
									}
									
								$this->idiomaCand->setIdioma($this->idioma);
								
								if ($this->idiomaCand->searchByCodigo())
									{
										$this->form->setError("geral", "Idioma já existe no seu currículo.");
										$this->error = true;
									}
							}
					}
					
				//Leitura
				if (isset($_POST['leitura']))
					{
						$this->idiomaCand->setLeitura($_POST['leitura']);
												
						if ($this->idiomaCand->getLeitura() == '')
							{
								$this->form->setError("leitura", "Leitura não pode ser vazio.");
								$this->error = true;
							}
						elseif (!in_array($this->idiomaCand->getLeitura(), $this->idiVals))
							{
								$this->form->setError("leitura", "Valor de leitura inválido.");
								$this->error = true;
							}
					}
					
				//Conversação
				if (isset($_POST['conversacao']))
					{
						$this->idiomaCand->setConversacao($_POST['conversacao']);
												
						if ($this->idiomaCand->getConversacao() == '')
							{
								$this->form->setError("conversacao", "Conversação não pode ser vazio.");
								$this->error = true;
							}
						elseif (!in_array($this->idiomaCand->getConversacao(), $this->idiVals))
							{
								$this->form->setError("conversacao", "Valor de conversação inválido.");
								$this->error = true;
							}
					}
						
				//Escrita
				if (isset($_POST['escrita']))
					{
						$this->idiomaCand->setEscrita($_POST['escrita']);
												
						if ($this->idiomaCand->getEscrita() == '')
							{
								$this->form->setError("escrita", "Escrita não pode ser vazio.");
								$this->error = true;
							}
						elseif (!in_array($this->idiomaCand->getEscrita(), $this->idiVals))
							{
								$this->form->setError("escrita", "Valor de escrita inválido.");
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
         		
         		$url = "idiomas.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->idioma->getCodigo();
								
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
				if (!$this->idiomaCand->record())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
			
		public function alterar()
			{
				//Grava os dados
				if (!$this->idiomaCand->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$idioma = new gravarIdioma();