<?php

include_once '../config/config.inc.php';
include_once '../lib/Form/Form.class.php';

include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoTeste.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/AlternativaQuestao.class.php';
include_once '../lib/TipoGabarito.class.php';
include_once '../lib/ValorGabarito.class.php';

class alterAlternativa
	{
		//Classes
		private $alter;
		private $valGab;
		
		private $form;
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->valGab = new ValorGabarito();
				
				$this->alter = new AlternativaQuestao();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Questão =========================================================
		   		//==================================================================
				{
					//Código
					if (isset($_POST['alt_que_cod']))
						{
							$this->alter->setCodigo($_POST['alt_que_cod']);
							
							if ($this->alter->getCodigo() == '')
								{
									$this->form->setError("geral", "A alternativa não pode ser vazia.");
									$this->error = true;
								}
							elseif (!is_numeric($this->alter->getCodigo()))
								{
									$this->form->setError("geral", "Alternativa inválida.");
									$this->error = true;
								}
							elseif (!$this->alter->searchByCodigo())
								{
									$this->form->setError("geral", "Alternativa inexistente.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("geral", "A alternativa não pode ser vazia.");
							$this->error = true;
						}

					//Descrição
					if (isset($_POST['alternativa']))
						{
							$this->alter->setDescricao($_POST['alternativa']);
							
							if ($this->alter->getDescricao() == '')
								{
									$this->form->setError("alternativa", "A descrição não pode ser vazia.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("alternativa", "A descrição não pode ser vazia.");
							$this->error = true;
						}
						
					//Tipos de Questão
					if (isset($_POST['resposta']))
						{
							$this->valGab->setCodigo($_POST['resposta']);
							
							if ($this->valGab->getCodigo() == '')
								{
									$this->form->setError("resposta", "A resposta não pode ser vazia.");
									$this->error = true;
								}
							else
								{
									if (!is_numeric($this->valGab->getCodigo()))
										{
											$this->form->setError("resposta", "A resposta é inválida.");
											$this->error = true;
										}
									elseif (!$this->valGab->searchByCodigo())
										{
											$this->form->setError("resposta", "A resposta não existe.");
											$this->error = true;
										}
								}
								
							$this->alter->setValorGabarito($this->valGab);
						}
					else
						{
							$this->form->setError("resposta", "A resposta não pode ser vazia.");
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
								
				//Redirect
				if ($this->error)
					header("Location: alternativas.php?action=editar&id=".$this->alter->getCodigo()."&status=erro");
				else
					header("Location: alternativas.php?action=editar&id=".$this->alter->getCodigo()."&status=sucesso");
				die();
			}
		
		public function record()
			{
				//Grava os dados do processo seletivo
				if (!$this->alter->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os dados da questão.");
						$this->error = true;
						$this->redirect();
					}
				
				//Redireciona
				$this->redirect();
			}
	}
	
$questao = new alterAlternativa();