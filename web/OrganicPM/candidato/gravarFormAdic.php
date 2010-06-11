<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/FormacaoAdicional.class.php';

include_once '../plugins/checkDateFormat.function.php';

class gravarFormAdic
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $instituicao;
		private $formAdic;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Instituição
				$this->instituicao = new Instituicao();
				
				//Formação Adicional
				$this->formAdic = new FormacaoAdicional();
				
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
							
						$this->formAdic->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Formação Adicional ==============================================
		   		//==================================================================					
				//Código
				if ($this->action == "editar")
					{
						if (isset($_POST['form_adic_cod']))
							{
								$this->formAdic->setCodigo($_POST['form_adic_cod']);
								
								if ($this->formAdic->getCodigo() == '')
									{
										$this->form->setError("geral", "Código de formação adicional inexistente.");
										$this->error = true;
									}
								elseif (!is_numeric($this->formAdic->getCodigo()))
									{
										$this->form->setError("geral", "Código de formação adicional inexistente");
										$this->error = true;
									}
								elseif (!$this->formAdic->searchByCodigo())
									{
										$this->form->setError("geral", "Formação adicional inválida.");
										$this->error = true;
									}
							}
					}
					
				//Tipo
				if (isset($_POST['tipo']))
					{
						$this->formAdic->setTipo($_POST['tipo']);
												
						if ($this->formAdic->getTipo() == '')
							{
								$this->form->setError("tipo", "Tipo não pode ser vazio.");
								$this->error = true;
							}
					}
					
				//Curso
				if (isset($_POST['adic_curso']))
					{
						$this->formAdic->setNome($_POST['adic_curso']);
												
						if ($this->formAdic->getNome() == '')
							{
								$this->form->setError("adic_curso", "Curso não pode ser vazio.");
								$this->error = true;
							}
					}
					
				//Data de início
				if (isset($_POST['adic_data_inicio']))
					{
						$this->formAdic->setDataInicio($_POST['adic_data_inicio']);
												
						if ($this->formAdic->getDataInicio() == '')
							{
								$this->form->setError("adic_data_inicio", "Data de início não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->formAdic->getDataInicio()))
							{
								$this->form->setError("adic_data_inicio", "Data de início inválida.");
								$this->error = true;
							}
					}
					
				//Data de fim
				if (isset($_POST['adic_data_fim']))
					{
						$this->formAdic->setDataFim($_POST['adic_data_fim']);
												
						if ($this->formAdic->getDataFim() == '')
							{
								$this->form->setError("adic_data_fim", "Data de fim não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->formAdic->getDataFim()))
							{
								$this->form->setError("adic_data_fim", "Data de fim inválida.");
								$this->error = true;
							}
					}
					
				//Carga Horária
				if (isset($_POST['carga_horaria']))
					{
						$this->formAdic->setCargaHoraria($_POST['carga_horaria']);
												
						if ($this->formAdic->getCargaHoraria() == '')
							{
								$this->form->setError("carga_horaria", "Carga horária não pode ser vazia.");
								$this->error = true;
							}
						elseif (!is_numeric($this->formAdic->getCargaHoraria()))
							{
								$this->form->setError("carga_horaria", "Carga horária só pode conter números.");
								$this->error = true;
							}
					}
				
				//Instituição
				if (isset($_POST['adic_instituicao']))
					{
						$this->instituicao->setCodigo($_POST['adic_instituicao']);
												
						if ($this->instituicao->getCodigo() == '')
							{
								$this->form->setError("adic_instituicao", "Instituição não pode ser vazia.");
								$this->error = true;
							}
						elseif (!is_numeric($this->instituicao->getCodigo()))
							{
								$this->instituicao->setNome($this->instituicao->getCodigo());
								if (!$this->instituicao->record())
									{
										$this->form->setError("adic_instituicao", "Erro ao adicionar nova instituição.");
										$this->error = true;
									}
							}
						elseif (!$this->instituicao->searchByCodigo())
							{
								$this->form->setError("adic_instituicao", "Instituição não existe.");
								$this->error = true;
							}
							
						$this->formAdic->setInstituicao($this->instituicao);
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
         		
         		$url = "form_adic.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->formAdic->getCodigo();
								
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
				if (!$this->formAdic->record())
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
				if (!$this->formAdic->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$formAdic = new gravarFormAdic();