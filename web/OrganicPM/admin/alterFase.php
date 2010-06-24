<?php

include_once '../config/config.inc.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Cargo.class.php';
include_once '../lib/TipoFase.class.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/FaseTeste.class.php';
include_once '../lib/Triagem.class.php';
include_once '../lib/Entrevista.class.php';
include_once '../lib/Logs/ActionLog.class.php';

include_once '../plugins/checkDateFormat.function.php';

class alterFase
	{
		//Classes
		private $fase;
		private $tipo;
		private $teste;
		private $nota;
		private $faseTeste;
		
		private $form;
		private $log;
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->fase = new Fases();
				
				$this->tipo = new TipoFase();
				
				$this->teste = new Teste();
				
				$this->nota = new Notas();
				
				//ActionLog
				$this->log = new ActionLog();
				
				$this->getPost();
				
				$this->record();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Fase ============================================================
		   		//==================================================================
				{
					//C�digo
					if (isset($_POST['fase_cod']))
						{
							$this->fase->setCodigo($_POST['fase_cod']);
							
							if ($this->fase->getCodigo() == '')
								{
									$this->form->setError("geral", "A fase n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!is_numeric($this->fase->getCodigo()))
								{
									$this->form->setError("geral", "Fase inv�lida.");
									$this->error = true;
								}
							elseif (!$this->fase->searchByCodigo())
								{
									$this->form->setError("geral", "Fase inexistente.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("geral", "A fase n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Tipo
					if (isset($_POST['fase_tipo']))
						{
							$this->tipo->setCodigo($_POST['fase_tipo']);
							
							if ($this->tipo->getCodigo() == '')
								{
									$this->form->setError("fase_tipo", "O tipo de fase n�o pode ser vazio.");
									$this->error = true;
								}
							elseif (!is_numeric($this->tipo->getCodigo()))
								{
									$this->form->setError("fase_tipo", "Tipo de fase inv�lido.");
									$this->error = true;
								}
							elseif (!$this->tipo->searchByCodigo())
								{
									$this->form->setError("fase_tipo", "Tipo de fase inexistente.");
									$this->error = true;
								}
								
							$this->tipo->getFaseByCodigo();
							$this->fase->setTipoFase($this->tipo);
						}

					//Teste
					if (!isset($_POST['fase_tipo']))
						{
							//Teste
							if (isset($_POST['teste']))
								{
									$this->teste->setCodigo($_POST['teste']);
									
									if ($this->teste->getCodigo() == '')
										{
											$this->form->setError("teste", "O tipo de fase n�o pode ser vazio.");
											$this->error = true;
										}
									elseif (!is_numeric($this->teste->getCodigo()))
										{
											$this->form->setError("teste", "Tipo de fase inv�lido.");
											$this->error = true;
										}
									elseif (!$this->teste->searchByCodigo())
										{
											$this->form->setError("teste", "Tipo de fase inexistente.");
											$this->error = true;
										}
								}
							else
								{
									$this->form->setError("teste", "O tipo de fase n�o pode ser vazio.");
									$this->error = true;
								}
								
							//Nota
							if (isset($_POST['nota']))
								{
									$this->nota->setNota($_POST['nota']);
									
									if ($this->nota->getNota() == '')
										{
											$this->form->setError("nota", "O tipo de fase n�o pode ser vazio.");
											$this->error = true;
										}
									elseif (!$this->nota->searchByNota())
										{
											$this->form->setError("nota", "Tipo de fase inexistente.");
											$this->error = true;
										}
								}
							else
								{
									$this->form->setError("nota", "O tipo de fase n�o pode ser vazio.");
									$this->error = true;
								}
								
							$this->fase->getTipoFaseByCodigo();
								
							$this->faseTeste = new FaseTeste();
							$this->faseTeste->setFase($this->fase);
							$this->faseTeste->setTeste($this->teste);
							$this->faseTeste->setNota($this->nota);
						}
						
					//Data de In�cio
					if (isset($_POST['fase_data_inicio']))
						{
							$this->fase->setDataInicio($_POST['fase_data_inicio']);
							
							if ($this->fase->getDataInicio() == '')
								{
									$this->form->setError("fase_data_inicio", "A data de in�cio n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->fase->getDataInicio()))
								{
									$this->form->setError("fase_data_inicio", "A data de in�cio n�o � v�lida.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("fase_data_inicio", "A data de in�cio n�o pode ser vazia.");
							$this->error = true;
						}
						
					//Data de Fim
					if (isset($_POST['fase_data_fim']))
						{
							$this->fase->setDataFim($_POST['fase_data_fim']);
							
							if ($this->fase->getDataFim() == '')
								{
									$this->form->setError("fase_data_fim", "A data de in�cio n�o pode ser vazia.");
									$this->error = true;
								}
							elseif (!checkDateFormat($this->fase->getDataFim()))
								{
									$this->form->setError("fase_data_fim", "A data de in�cio n�o � v�lida.");
									$this->error = true;
								}
						}
					else
						{
							$this->form->setError("fase_data_fim", "A data de in�cio n�o pode ser vazia.");
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
         		
         		//ActionLog
         		if ($this->error)
         			$this->log->recordAction("Falha ao modificar dados da fase do processo seletivo de c�digo ".$this->fase->getCodigo());
         		else
         			$this->log->recordAction("Modificou dados da fase do processo seletivo de c�digo ".$this->fase->getCodigo());
								
				//Redirect
				if ($this->error)
					header("Location: fase.php?action=editar&id=".$this->fase->getCodigo()."&status=erro");
				else
					header("Location: fase.php?action=editar&id=".$this->fase->getCodigo()."&status=sucesso");
				die();
			}
			
		public function recordFaseTeste()
			{
				if (!$this->faseTeste->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da fase.");
						$this->error = true;
						$this->redirect();
					}
			}
		
		public function record()
			{
				//Grava os dados do processo seletivo
				if (!$this->fase->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da fase.");
						$this->error = true;
						$this->redirect();
					}
					
				if ($this->faseTeste)
					$this->recordFaseTeste();

				//Redireciona
				$this->redirect();
			}
	}
	
$fase = new alterFase();