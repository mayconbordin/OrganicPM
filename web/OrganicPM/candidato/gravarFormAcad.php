<?php

include_once '../config/config.inc.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/FormacaoAcademica.class.php';
include_once '../lib/CursoFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/NivelFormacao.class.php';
include_once '../lib/AndamentoCurso.class.php';

include_once '../plugins/checkDateFormat.function.php';

class gravarFormAcad
	{
		private $form;
		private $pessoa;
		private $action;
				
		private $curso;
		private $instituicao;
		private $nivel;
		private $andamento;
		
		private $formAcad;
		
		private $error = false;
		
		public function __construct()
			{
				$this->action = $_POST['action'];
				
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//Curso
				$this->curso = new CursoFormacao();
				
				//Instituição
				$this->instituicao = new Instituicao();
				
				//Nível
				$this->nivel = new NivelFormacao();
				
				//Andamento
				$this->andamento = new AndamentoCurso();
				
				//Formação Acadêmica
				$this->formAcad = new FormacaoAcademica();
				
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
							
						$this->formAcad->setPessoa($this->pessoa);
					}
				//==================================================================
		   		// Contatos ========================================================
		   		//==================================================================					
				//Código
				if ($this->action == "editar")
					{
						if (isset($_POST['form_acad_cod']))
							{
								$this->formAcad->setCodigo($_POST['form_acad_cod']);
								
								if ($this->formAcad->getCodigo() == '')
									{
										$this->form->setError("geral", "Código de formação acadêmica inexistente.");
										$this->error = true;
									}
								elseif (!is_numeric($this->formAcad->getCodigo()))
									{
										$this->form->setError("geral", "Código de formação acadêmica inexistente");
										$this->error = true;
									}
								elseif (!$this->formAcad->searchByCodigo())
									{
										$this->form->setError("geral", "Formação acadêmica inválida.");
										$this->error = true;
									}
							}
					}
					
				//Curso
				if (isset($_POST['curso']))
					{
						$this->curso->setCodigo($_POST['curso']);
												
						if ($this->curso->getCodigo() == '')
							{
								$this->form->setError("curso", "Curso não pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->curso->getCodigo()))
							{
								$this->curso->setNome($this->curso->getCodigo());
								if (!$this->curso->record())
									{
										$this->form->setError("curso", "Erro ao adicionar novo curso.");
										$this->error = true;
									}
							}
						elseif (!$this->curso->searchByCodigo())
							{
								$this->form->setError("curso", "Curso não existe.");
								$this->error = true;
							}
							
						$this->formAcad->setCurso($this->curso);
					}
				
				//Nível
				if (isset($_POST['nivel']))
					{
						$this->nivel->setCodigo($_POST['nivel']);
												
						if ($this->nivel->getCodigo() == '')
							{
								$this->form->setError("nivel", "Nível não pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->nivel->getCodigo()))
							{
								$this->form->setError("nivel", "Nível inválido.");
								$this->error = true;
							}
						elseif (!$this->nivel->searchByCodigo())
							{
								$this->form->setError("nivel", "Nível não existe.");
								$this->error = true;
							}
							
						$this->formAcad->setNivel($this->nivel);
					}
					
				//Data de início
				if (isset($_POST['acad_data_inicio']))
					{
						$this->formAcad->setDataInicio($_POST['acad_data_inicio']);
												
						if ($this->formAcad->getDataInicio() == '')
							{
								$this->form->setError("acad_data_inicio", "Data de início não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->formAcad->getDataInicio()))
							{
								$this->form->setError("acad_data_inicio", "Data de início inválida.");
								$this->error = true;
							}
					}
					
				//Data de fim
				if (isset($_POST['acad_data_fim']))
					{
						$this->formAcad->setDataFim($_POST['acad_data_fim']);
												
						if ($this->formAcad->getDataFim() == '')
							{
								$this->form->setError("acad_data_fim", "Data de fim não pode ser vazia.");
								$this->error = true;
							}
						elseif (!checkDateFormat($this->formAcad->getDataFim()))
							{
								$this->form->setError("acad_data_fim", "Data de fim inválida.");
								$this->error = true;
							}
					}
					
				//Instituição
				if (isset($_POST['instituicao']))
					{
						$this->instituicao->setCodigo($_POST['instituicao']);
												
						if ($this->instituicao->getCodigo() == '')
							{
								$this->form->setError("instituicao", "Instituição não pode ser vazia.");
								$this->error = true;
							}
						elseif (!is_numeric($this->instituicao->getCodigo()))
							{
								$this->instituicao->setNome($this->instituicao->getCodigo());
								if (!$this->instituicao->record())
									{
										$this->form->setError("instituicao", "Erro ao adicionar nova instituição.");
										$this->error = true;
									}
							}
						elseif (!$this->instituicao->searchByCodigo())
							{
								$this->form->setError("instituicao", "Instituição não existe.");
								$this->error = true;
							}
							
						$this->formAcad->setInstituicao($this->instituicao);
					}
					
				//Andamento
				if (isset($_POST['andamento']))
					{
						$this->andamento->setCodigo($_POST['andamento']);
												
						if ($this->andamento->getCodigo() == '')
							{
								$this->form->setError("andamento", "Andamento não pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->andamento->getCodigo()))
							{
								$this->form->setError("andamento", "Andamento inválido.");
								$this->error = true;
							}
						elseif (!$this->andamento->searchByCodigo())
							{
								$this->form->setError("andamento", "Andamento não existe.");
								$this->error = true;
							}
							
						$this->formAcad->setAndamento($this->andamento);
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
         		
         		$url = "form_acad.php?";
         		
         		if ($this->action == "novo")
         			$url .= "action=novo";
         		else
         			$url .= "action=editar&id=".$this->formAcad->getCodigo();
								
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
				if (!$this->formAcad->record())
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
				if (!$this->formAcad->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}

				//Redireciona
				$this->redirect();
			}
	}
	
$formAcad = new gravarFormAcad();