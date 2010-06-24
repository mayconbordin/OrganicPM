<?php

include_once '../config/config.inc.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Form/Form.class.php';

include_once '../lib/Pessoa.class.php';
include_once '../lib/EntrevistaCandidato.class.php';
include_once '../lib/ProcessoSeletivo.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/CandidatoProcessoSeletivo.class.php';
include_once '../lib/Logs/ActionLog.class.php';

include_once '../plugins/checkDateTimeFormat.function.php';

class entrevistaFunc
	{
		//Classes
		private $pessoa;
		private $fase;
		private $procSel;
		private $entrev;
		
		private $candProcSel;
		
		private $form;
		
		private $action;
		
		private $log;
		
		//Erro
		private $error = false;
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->pessoa = new Pessoa();
				
				$this->fase = new Fases();
				
				$this->procSel = new ProcessoSeletivo();
				
				$this->entrev = new EntrevistaCandidato();
				
				$this->candProcSel = new CandidatoProcessoSeletivo();
				
				//ActionLog
				$this->log = new ActionLog();
				
				if (isset($_POST['action']))
					$this->action = $_POST['action'];
				
				if ($this->action == "agendar" || $this->action == "registrar" || $this->action == "editar")
					$this->getPost();
				
				if ($this->action == "agendar")
					$this->recordAgendar();
				elseif ($this->action == "registrar")
					$this->recordRegistrar();
				elseif ($this->action == "editar")
					$this->updateEntrevista();
				elseif (strcmp($this->action, "list") == 0)
					$this->getList();
				elseif (strcmp($this->action, "delete") == 0)
					$this->delete();
			}
			
		public function getPost()
			{
				//Pessoa
				if (isset($_POST['pessoa_cod']))
					{
						$this->pessoa->setCodigo($_POST['pessoa_cod']);
						
						if ($this->pessoa->getCodigo() == '')
							{
								$this->form->setError("geral", "A pessoa n�o pode ser vazia.");
								$this->error = true;
							}
						elseif (!is_numeric($this->pessoa->getCodigo()))
							{
								$this->form->setError("geral", "Pessoa inv�lida.");
								$this->error = true;
							}
						elseif (!$this->pessoa->searchByCodigo())
							{
								$this->form->setError("geral", "Pessoa inexistente.");
								$this->error = true;
							}
							
						$this->entrev->setPessoa($this->pessoa);
					}
				else
					{
						$this->form->setError("geral", "A pessoa n�o pode ser vazia.");
						$this->error = true;
					}
					
				//Processo Seletivo
				if (isset($_POST['pro_sel_cod']))
					{
						$this->procSel->setCodigo($_POST['pro_sel_cod']);
						
						if ($this->procSel->getCodigo() == '')
							{
								$this->form->setError("geral", "O processo seletivo n�o pode ser vazio.");
								$this->error = true;
							}
						elseif (!is_numeric($this->procSel->getCodigo()))
							{
								$this->form->setError("geral", "Processo seletivo inv�lido.");
								$this->error = true;
							}
						elseif (!$this->procSel->searchByCodigo())
							{
								$this->form->setError("geral", "Processo seletivo inexistente.");
								$this->error = true;
							}
						
						$this->entrev->setProcessoSeletivo($this->procSel);
					}
				else
					{
						$this->form->setError("geral", "O processo seletivo n�o pode ser vazio.");
						$this->error = true;
					}
					
				//Fase
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
							
						$this->entrev->setFase($this->fase);
					}
				else
					{
						$this->form->setError("geral", "A fase n�o pode ser vazia.");
						$this->error = true;
					}
				
				//Agendamento de entrevista
				if ($this->action == "agendar" || $this->action == "editar")
					{
						$data = $this->fase->getDataByCodigo();
						
						$dataInicial = explode("/",$data['DATA_INICIO']);
						$dataInicial = $dataInicial[1]."/".$dataInicial[0]."/".$dataInicial[2];
						
						$dataFinal = explode("/",$data['DATA_FIM']);
						$dataFinal = $dataFinal[1]."/".$dataFinal[0]."/".$dataFinal[2];
						
						//Data de In�cio
						if (isset($_POST['data_agendada']))
							{
								$this->entrev->setDataAgendada($_POST['data_agendada']);
								
								if ($this->entrev->getDataAgendada() == '')
									{
										$this->form->setError("data_agendada", "A data agendada n�o pode ser vazia.");
										$this->error = true;
									}
								elseif (!checkDateTimeFormat($this->entrev->getDataAgendada()))
									{
										$this->form->setError("data_agendada", "A data agendada n�o � v�lida.");
										$this->error = true;
									}
								elseif (strtotime($this->entrev->getDataAgendada()) < strtotime($dataInicial)
								|| strtotime($this->entrev->getDataAgendada()) > strtotime($dataFinal) )
									{
										$this->form->setError("data_agendada", "A data agendada deve estar entre a data de in�cio e fim desta fase.");
										$this->error = true;
									}
							}
						else
							{
								$this->form->setError("data_agendada", "A data agendada n�o pode ser vazia.");
								$this->error = true;
							}
					}
				//Registro da entrevista
				if ($this->action == "registrar" || $this->action == "editar")
					{
						//Data da entrevista
						if (isset($_POST['data_efetiva']))
							{
								$this->entrev->setDataEfetiva($_POST['data_efetiva']);
								
								if ($this->entrev->getDataEfetiva() == '')
									{
										$this->form->setError("data_efetiva", "A data da entrevista n�o pode ser vazia.");
										$this->error = true;
									}
								elseif (!checkDateTimeFormat($this->entrev->getDataEfetiva()))
									{
										$this->form->setError("data_efetiva", "A data  da entrevista n�o � v�lida.");
										$this->error = true;
									}
							}
						else
							{
								$this->form->setError("data_efetiva", "A data  da entrevista n�o pode ser vazia.");
								$this->error = true;
							}
							
						//Entrevistador
						if (isset($_POST['entrevistador']))
							{
								$this->entrev->setEntrevistador($_POST['entrevistador']);
								
								if ($this->entrev->getEntrevistador() == '')
									{
										$this->form->setError("entrevistador", "O entrevistador n�o pode ser vazio.");
										$this->error = true;
									}
							}
						else
							{
								$this->form->setError("entrevistador", "O entrevistador n�o pode ser vazio.");
								$this->error = true;
							}
							
						//Coment�rios
						if (isset($_POST['comentario']))
							{
								$this->entrev->setComentario($_POST['comentario']);
								
								if ($this->entrev->getComentario() == '')
									{
										$this->form->setError("comentario", "Os coment�rios n�o podem ser vazio.");
										$this->error = true;
									}
							}
						else
							{
								$this->form->setError("comentario", "Os coment�rios n�o podem ser vazio.");
								$this->error = true;
							}
							
						//Status
						if (isset($_POST['status']))
							{
								$this->entrev->setStatus($_POST['status']);
								
								$status = array("classificado", "desclassificado");
								
								if ($this->entrev->getStatus() == '')
									{
										$this->form->setError("status", "O status n�o pode ser vazio.");
										$this->error = true;
									}
								elseif (!in_array($this->entrev->getStatus(), $status))
									{
										$this->form->setError("status", "O status � inv�lido.");
										$this->error = true;
									}
							}
						else
							{
								$this->form->setError("status", "O status n�o pode ser vazio.");
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
					header("Location: entrevistas.php?action=".$this->action."&pid=".$this->pessoa->getCodigo()."&psid=".$this->procSel->getCodigo()."&fid=".$this->fase->getCodigo()."&status=erro");
				else
					header("Location: entrevistas.php?action=".$this->action."&pid=".$this->pessoa->getCodigo()."&psid=".$this->procSel->getCodigo()."&fid=".$this->fase->getCodigo()."&status=sucesso");
				die();
			}
		
		public function recordAgendar()
			{
				//Grava os dados do processo seletivo
				if (!$this->entrev->recordDataAgendada())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da entrevista.");
						$this->error = true;
						$this->redirect();
					}
				
				//Redireciona
				$this->redirect();
			}
			
		public function recordRegistrar()
			{
				//Grava os dados do processo seletivo
				if (!$this->entrev->recordRegistro())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da entrevista.");
						$this->error = true;
						$this->redirect();
					}
				else
					{
						$this->candProcSel = new CandidatoProcessoSeletivo();
						$this->candProcSel->setPessoa($this->pessoa);
						$this->candProcSel->setProcessoSeletivo($this->procSel);
						$this->candProcSel->setStatus($this->entrev->getStatus());
						
						$this->candProcSel->updateStatus();
					}
				
				//Redireciona
				$this->redirect();
			}
			
		public function updateEntrevista()
			{
				//Grava os dados do processo seletivo
				if (!$this->entrev->alter())
					{
						$this->form->setError("geral", "N�o foi poss�vel gravar os dados da entrevista.");
						$this->error = true;
						$this->redirect();
					}
				else
					{
						$this->candProcSel = new CandidatoProcessoSeletivo();
						$this->candProcSel->setPessoa($this->pessoa);
						$this->candProcSel->setProcessoSeletivo($this->procSel);
						$this->candProcSel->setStatus($this->entrev->getStatus());
						
						$this->candProcSel->updateStatus();
					}
				
				//Redireciona
				$this->redirect();
			}
			
		public function getList()
			{
				$page			= $_POST['page'];
				$rp				= $_POST['rp'];
				$sortName		= $_POST['sortname'];
				$sortOrder		= $_POST['sortorder'];
				$query			= $_POST['query'];
				$qType			= $_POST['qtype'];
				$letterPressed	= $_POST['letter_pressed'];
				
				if (!$page)
					$page = 1;
				if (!$rp)
					$rp = 10;
					
				$data = $this->entrev->getFlexiGridData($query, $qType, $letterPressed, $page, $rp, $sortName, $sortOrder, $_POST);
								
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				echo json_encode($data);
			}
			
		public function delete()
			{
				header("Expires: Mon, 26 Jul 1997 05:00:00 GMT" );
				header("Last-Modified: " . gmdate( "D, d M Y H:i:s" ) . "GMT" );
				header("Cache-Control: no-cache, must-revalidate" );
				header("Pragma: no-cache" );
				header("Content-type: text/x-json");
				
				$this->entrev->deleteUsers(rtrim($_POST['items'], ','));
			}
	}
	
$entrevista = new entrevistaFunc();