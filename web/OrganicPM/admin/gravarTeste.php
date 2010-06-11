<?php

include_once '../config/config.inc.php';
include_once '../lib/Teste.class.php';
include_once '../lib/TipoTeste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoGabarito.class.php';
include_once '../lib/ValorGabarito.class.php';
include_once '../lib/AlternativaQuestao.class.php';
include_once '../lib/Form/Form.class.php';

class gravarTeste
	{
		//Vals
		private $descricao;
		
		//Classes
		private $teste;
		private $tipoTeste;
		
		private $form;
		
		//Arrays
		private $questoes = array();
		
		//Error
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
					//Descrição
					if (isset($_POST['teste_descricao']))
						{
							$this->descricao = $_POST['teste_descricao'];
							
							if ($this->descricao == '')
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
							$tipo = $_POST['teste_tipo'];
							$this->tipoTeste->setCodigo($tipo);
							
							if ($tipo == '')
								{
									$this->form->setError("teste_tipo", "O tipo de teste não pode ser vazio.");
									$this->error = true;
								}
							else
								{
									if (!is_numeric($tipo))
										{
											$this->tipoTeste->setTipo($tipo);
											
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
						}
					else
						{
							$this->form->setError("teste_tipo", "O tipo de teste não pode ser vazio.");
							$this->error = true;
						}
				}
				
				//==================================================================
		   		// Questões ========================================================
		   		//==================================================================
				{
					if (
					(isset($_POST['questao_descricao']) && is_array($_POST['questao_descricao']) && count($_POST['questao_descricao']) > 0) && 
			   		(isset($_POST['questao_tipo']) && is_array($_POST['questao_tipo']) && count($_POST['questao_tipo']) > 0) &&
			   		(isset($_POST['questao_alternativas']) && is_array($_POST['questao_alternativas']) && count($_POST['questao_alternativas']) > 0) &&
			   		(isset($_POST['questao_respostas']) && is_array($_POST['questao_respostas']) && count($_POST['questao_respostas']) > 0))
			   			{
			   				if ( count($_POST['questao_descricao']) == count($_POST['questao_tipo']) && 
			   				count($_POST['questao_tipo']) == count($_POST['questao_alternativas']) &&
			   				count($_POST['questao_alternativas']) == count($_POST['questao_respostas']))
		   						{
		   							$count = count($_POST['questao_descricao']);
		   									   						
			   						$descricao 		= $_POST['questao_descricao'];
			   						$tipo 			= $_POST['questao_tipo'];
			   						$alternativas 	= $_POST['questao_alternativas'];
			   						$respostas		= $_POST['questao_respostas'];
			   						
		   							for ($i = 0; $i < $count; $i++)
		   								{
		   									if ($descricao[$i] == '' || $tipo[$i] == '' || $alternativas[$i] == '' || $respostas[$i] == '')
		   										{
		   											$this->form->setError("questoes", "Todos os campos das questões precisam ser preenchidos.");
													$this->error = true;
		   										}
		   									
		   									if ($this->error === false)
		   										{
		   											if (!is_numeric($tipo[$i]))
		   												{
		   													$this->form->setError("questoes", "O tipo de questão informado não é válido.");
															$this->error = true;
		   												}
		   											else
		   												{
				   											$tipoQue = new TipoQuestao();
				   											$tipoQue->setCodigo($tipo[$i]);
				   											
				   											if (!$tipoQue->searchByCodigo())
				   												{
				   													$this->form->setError("questoes", "O tipo de questão informado não é válido.");
																	$this->error = true;
				   												}
		   												}
		   												
		   											if ($this->error === false)
		   												{
		   													if (strpos($alternativas[$i], '|') !== false)
		   														{
		   															$alternativas[$i] = explode('|', $alternativas[$i]);
		   															$respostas[$i] = explode('|', $respostas[$i]);
		   														}
		   														
		   													if ($this->error === false)
		   														{
		   															$this->questoes[$i] = array(
		   																						'questao_descricao' => $descricao[$i],
		   																						'questao_tipo' => $tipoQue,
		   																						'questao_alternativas' => $alternativas[$i],
		   																						'questao_respostas' => $respostas[$i]
		   																					);
		   														}
		   												}
		   										}
		   								}
		   						}
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
					header("Location: testes.php?action=novo&status=erro");
				else
					header("Location: testes.php?action=novo&status=sucesso");
				die();
			}
			
		public function recordQuestoes()
			{
				foreach ($this->questoes as $questao)
					{
						$quest = new Questao();
						$quest->setDescricao(htmlentities(str_replace('\"', '"', str_replace("'", '"', $questao['questao_descricao']))), ENT_QUOTES);
						$quest->setTeste($this->teste);
						$quest->setTipoQuestao($questao['questao_tipo']);
						
						if (!$quest->record())
							{
								$this->form->setError("questoes", "Não foi possível gravar os dados das questões.");
								$this->error = true;
								$this->redirect();
							}
							
						$count = count($questao['questao_alternativas']);
						
						for ($i = 0; $i < $count; $i++)
							{
								$valGab = new ValorGabarito();
								$valGab->setCodigo($questao['questao_respostas'][$i]);
								
								$altQue = new AlternativaQuestao();
								$altQue->setDescricao(htmlentities(str_replace('\"', '"', str_replace("'", '"', $questao['questao_alternativas'][$i]))), ENT_QUOTES);
								$altQue->setQuestao($quest);
								$altQue->setTeste($this->teste);
								$altQue->setValorGabarito($valGab);
								
								if (!$altQue->record())
									{
										$this->form->setError("questoes", "Não foi possível gravar os dados das questões.");
										$this->error = true;
										$this->redirect();
									}
							}
						
					}
			}
			
		public function record()
			{
				$this->teste->setDescricao($this->descricao);
				$this->teste->setTipoTeste($this->tipoTeste);
				
				if (!$this->teste->record())
					{
						$this->form->setError("teste", "Não foi possível gravar os dados do teste.");
						$this->error = true;
						$this->redirect();
					}
					
				//Grava as questões
				$this->recordQuestoes();
				
				$this->redirect();
			}
	}
	
$teste = new gravarTeste();