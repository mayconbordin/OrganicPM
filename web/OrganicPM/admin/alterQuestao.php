<?php

include_once '../config/config.inc.php';
include_once '../lib/Form/Form.class.php';

include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoTeste.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/AlternativaQuestao.class.php';

class alterQuestao
	{
		//Classes
		private $questao;
		private $tipoQuestao;
		
		private $form;
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->questao = new Questao();
				
				$this->tipoQuestao = new TipoQuestao();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Quest�o =========================================================
		   		//==================================================================
				{
					//C�digo
					if (isset($_POST['questao_cod']))
						{
							$this->questao->setCodigo($_POST['questao_cod']);
							
							if ($this->questao->getCodigo() == '')
								{
									$this->form->setError("geral", "A quest�o n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!is_numeric($this->questao->getCodigo()))
								{
									$this->form->setError("geral", "Quest�o inv�lida.");
									$this->error = true;
								}
							elseif (!$this->questao->searchByCodigo())
								{
									$this->form->setError("geral", "Quest�o inexistente.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("geral", "A quest�o n�o pode ser vazia.");
							$this->error = true;
						}

					//Descri��o
					if (isset($_POST['questao_descricao']))
						{
							$this->questao->setDescricao($_POST['questao_descricao']);
							
							if ($this->questao->getDescricao() == '')
								{
									$this->form->setError("questao_descricao", "A descri��o n�o pode ser vazia.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("questao_descricao", "A descri��o n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Tipos de Quest�o
					if (isset($_POST['questao_tipo']))
						{
							$this->tipoQuestao->setCodigo($_POST['questao_tipo']);
							
							if ($this->tipoQuestao->getCodigo() == '')
								{
									$this->form->setError("questao_tipo", "O tipo de teste n�o pode ser vazio.");
									$this->error = true;
								}
							else
								{
									if (!is_numeric($this->tipoQuestao->getCodigo()))
										{
											$this->tipoQuestao->setTipo($this->tipoQuestao->getCodigo());
											if (!$this->record())
												{
													$this->form->setError("questao_tipo", "O tipo de teste n�o p�de ser gravado.");
													$this->error = true;
												}
										}
									elseif (!$this->tipoQuestao->searchByCodigo())
										{
											$this->form->setError("questao_tipo", "O tipo de teste n�o existe.");
											$this->error = true;
										}
								}
								
							$this->questao->setTipoQuestao($this->tipoQuestao);
						}
					else
						{
							$this->form->setError("questao_tipo", "O tipo de teste n�o pode ser vazio.");
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
					header("Location: questoes.php?action=editar&id=".$this->questao->getCodigo()."&status=erro");
				else
					header("Location: questoes.php?action=editar&id=".$this->questao->getCodigo()."&status=sucesso");
				die();
			}
		
		public function record()
			{
				//Grava os dados do processo seletivo
				if (!$this->questao->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da quest�o.");
						$this->error = true;
						$this->redirect();
					}
				
				//Redireciona
				$this->redirect();
			}
	}
	
$questao = new alterQuestao();