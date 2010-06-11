<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Experiencia.class.php';
include_once '../lib/Setor.class.php';

include_once '../plugins/checkDateFormat.function.php';

class gravarExperProf
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $setor;
		private $experProf;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Setor
				$this->setor = new Setor();
				
				//Experiência Profissional
				$this->experProf = new Experiencia();
				
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
							
						$this->experProf->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Experiência Profissional ========================================
		   		//==================================================================					
				//Código
				if ($this->action == "editar")
					{
						if (isset($_POST['exper_prof_cod']))
							{
								$this->experProf->setCodigo($_POST['exper_prof_cod']);
								
								if ($this->experProf->getCodigo() == '')
									{
										$this->form->setError("geral", "Código de experiência profissional inexistente.");
										$this->error = true;
									}
								elseif (!is_numeric($this->experProf->getCodigo()))
									{
										$this->form->setError("geral", "Código de experiência profissional inexistente");
										$this->error = true;
									}
								elseif (!$this->experProf->searchByCodigo())
									{
										$this->form->setError("geral", "Experiência profissional inválida.");
										$this->error = true;
									}
							}
					}
					
				//Empresa
				if (isset($_POST['empresa']))
					{
						$this->experProf->setEmpresa($_POST['empresa']);
												
						if ($this->experProf->getEmpresa() == '')
							{
								$this->form->setError("empresa", "Empresa não pode ser vazia.");
								$this->error = true;
							}
					}
					
				//Função
				if (isset($_POST['funcao']))
					{
						$this->experProf->setFuncao($_POST['funcao']);
												
						if ($this->experProf->getFuncao() == '')
							{
								$this->form->setError("funcao", "Função não pode ser vazia.");
								$this->error = true;
							}
					}
					
				//Atribuições
				if (isset($_POST['atribuicoes']))
					{
						$this->experProf->setAtribuicoes($_POST['atribuicoes']);
												
						if ($this->experProf->getAtribuicoes() == '')
							{
								$this->form->setError("atribuicoes", "Atribuições não podem ser vazias.");
								$this->error = true;
							}
					}
					
				//Data de início
				if (isset($_POST['exp_data_inicio']))
					{
						$this->experProf->setDataInicio($_POST['exp_data_inicio']);
												
						if ($this->experProf->getDataInicio() == '')
							{
								$this->form->setError("exp_data_inicio", "Data de início não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->experProf->getDataInicio()))
							{
								$this->form->setError("exp_data_inicio", "Data de início inválida.");
								$this->error = true;
							}
					}
					
				//Data de fim
				if (isset($_POST['exp_data_fim']))
					{
						$this->experProf->setDataFim($_POST['exp_data_fim']);
												
						if ($this->experProf->getDataFim() == '')
							{
								$this->form->setError("exp_data_fim", "Data de fim não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->experProf->getDataFim()))
							{
								$this->form->setError("exp_data_fim", "Data de fim inválida.");
								$this->error = true;
							}
					}
				
				//Setor
				if (isset($_POST['setor']))
					{
						$this->setor->setCodigo($_POST['setor']);
												
						if ($this->setor->getCodigo() == '')
							{
								$this->form->setError("setor", "Setor não pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->setor->getCodigo()))
							{
								$this->form->setError("setor", "Setor inválido.");
								$this->error = true;
							}
						elseif (!$this->setor->searchByCodigo())
							{
								$this->form->setError("setor", "Setor não existe.");
								$this->error = true;
							}
							
						$this->experProf->setSetor($this->setor);
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
         		
         		$url = "exper_prof.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->experProf->getCodigo();
								
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
				if (!$this->experProf->record())
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
				if (!$this->experProf->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$experProf = new gravarExperProf();