<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Conhecimento.class.php';


class gravarConhecimento
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $conhecimento;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Conhecimento
				$this->conhecimento = new Conhecimento();
				
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
							
						$this->conhecimento->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Conhecimento ====================================================
		   		//==================================================================					
				//Código
				if ($this->action == "editar")
					{
						if (isset($_POST['conhecimento_cod']))
							{
								$this->conhecimento->setCodigo($_POST['conhecimento_cod']);
								
								if ($this->conhecimento->getCodigo() == '')
									{
										$this->form->setError("geral", "Código de conhecimento inexistente.");
										$this->error = true;
									}
								elseif (!is_numeric($this->conhecimento->getCodigo()))
									{
										$this->form->setError("geral", "Código de conhecimento inexistente");
										$this->error = true;
									}
								elseif (!$this->conhecimento->searchByCodigo())
									{
										$this->form->setError("geral", "Conhecimento inválido.");
										$this->error = true;
									}
							}
					}
					
				//Grupo de Conhecimento
				if (isset($_POST['grupo_conhecimento']))
					{
						$this->conhecimento->setGrupo($_POST['grupo_conhecimento']);
												
						if ($this->conhecimento->getGrupo() == '')
							{
								$this->form->setError("grupo_conhecimento", "Grupo não pode ser vazio.");
								$this->error = true;
							}
					}
					
				//Conhecimento
				if (isset($_POST['conhecimento']))
					{
						$this->conhecimento->setConhecimento($_POST['conhecimento']);
												
						if ($this->conhecimento->getConhecimento() == '')
							{
								$this->form->setError("conhecimento", "Conhecimento não pode ser vazio.");
								$this->error = true;
							}
					}
					
				//Proficiência
				if (isset($_POST['proficiencia']))
					{
						$this->conhecimento->setProficiencia($_POST['proficiencia']);
												
						if ($this->conhecimento->getProficiencia() == '')
							{
								$this->form->setError("proficiencia", "Proficiência não pode ser vazia.");
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
         		
         		$url = "conhecimentos.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->conhecimento->getCodigo();
								
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
				if (!$this->conhecimento->record())
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
				if (!$this->conhecimento->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$conhecimento = new gravarConhecimento();