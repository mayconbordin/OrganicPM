<?php

include_once '../config/config.inc.php';
include_once '../lib/Form/Form.class.php';

include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoTeste.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';

class alterTeste
	{
		//Classes
		private $teste;
		private $tipoTeste;
		
		private $form;
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->teste = new Teste();
				
				$this->tipoTeste = new TipoTeste();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Teste ===========================================================
		   		//==================================================================
				{
					//Código
					if (isset($_POST['teste_cod']))
						{
							$this->teste->setCodigo($_POST['teste_cod']);
							
							if ($this->teste->getCodigo() == '')
								{
									$this->form->setError("geral", "O teste não pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->teste->getCodigo()))
								{
									$this->form->setError("geral", "Teste inválido.");
									$this->error = true;
								}
							elseif (!$this->teste->searchByCodigo())
								{
									$this->form->setError("geral", "Teste inexistente.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("geral", "O teste não pode ser vazio.");
							$this->error = true;
						}

					//Descrição
					if (isset($_POST['teste_descricao']))
						{
							$this->teste->setDescricao($_POST['teste_descricao']);
							
							if ($this->teste->getDescricao() == '')
								{
									$this->form->setError("teste_descricao", "A descrição não pode ser vazia.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("teste_descricao", "A descrição não pode ser vazia.");
							$this->error = true;
						}
						
					//Tipos de Testes
					if (isset($_POST['teste_tipo']))
						{
							$this->tipoTeste->setCodigo($_POST['teste_tipo']);
							
							if ($this->tipoTeste->getCodigo() == '')
								{
									$this->form->setError("teste_tipo", "O tipo de teste não pode ser vazio.");
									$this->error = true;
								}
							else
								{
									if (!is_numeric($this->tipoTeste->getCodigo()))
										{
											$this->tipoTeste->setTipo($this->tipoTeste->getCodigo());
											if (!$this->record())
												{
													$this->form->setError("teste_tipo", "O tipo de teste não pôde ser gravado.");
													$this->error = true;
												}
										}
									elseif (!$this->tipoTeste->searchByCodigo())
										{
											$this->form->setError("teste_tipo", "O tipo de teste não existe.");
											$this->error = true;
										}
								}
								
							$this->teste->setTipoTeste($this->tipoTeste);
						}
					else
						{
							$this->form->setError("teste_tipo", "O tipo de teste não pode ser vazio.");
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
					header("Location: testes.php?action=editar&id=".$this->teste->getCodigo()."&status=erro");
				else
					header("Location: testes.php?action=editar&id=".$this->teste->getCodigo()."&status=sucesso");
				die();
			}
		
		public function record()
			{
				//Grava os dados do processo seletivo
				if (!$this->teste->alter())
					{
						$this->form->setError("geral", "Não foi possível gravar os dados do teste.");
						$this->error = true;
						$this->redirect();
					}
				
				//Redireciona
				$this->redirect();
			}
	}
	
$fase = new alterTeste();