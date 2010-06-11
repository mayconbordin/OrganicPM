<?php

include_once '../config/config.inc.php';
include_once '../lib/Form/Form.class.php';
include_once '../lib/LoginSystem/User.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/FaseTeste.class.php';
include_once '../lib/Fases.class.php';
include_once '../lib/AlternativaQuestao.class.php';
include_once '../lib/RespostasCandidatos.class.php';
include_once '../lib/ValorGabarito.class.php';
include_once '../lib/TesteCandidato.class.php';
include_once '../lib/CandidatoProcessoSeletivo.class.php';


class gravarTeste
	{
		private $form;
		private $pessoa;
		private $fase;
		private $processoSeletivo;
		private $teste;
		
		private $questoes = array();
		
		private $error = false;
		private $errorMsg = array();
		
		
		function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				$this->pessoa = new Pessoa();
				$this->fase = new Fases();
				$this->teste = new Teste();
				
				$this->getPost();
				
				$this->gravarRespostas();
				
				$this->avaliarResultado();
				
				$this->redirect();
			}
			
		public function getPost()
			{
				//C�digo da pessoa
				if (isset($_POST['pessoa_cod']))
					{
						if (is_numeric($_POST['pessoa_cod']))
							{
								$this->pessoa->setCodigo($_POST['pessoa_cod']);
							}
						else
							{
								$this->error = true;
								$this->errorMsg[] = "C�digo da pessoa inv�lido";
							}
					}
				else
					{
						$this->error = true;
						$this->errorMsg[] = "C�digo da pessoa n�o pode ser vazio.";
					}
					
				//C�digo da fase seletiva
				if (isset($_POST['fase_cod']))
					{
						if (is_numeric($_POST['fase_cod']))
							{
								$this->fase->setCodigo($_POST['fase_cod']);
							}
						else
							{
								$this->error = true;
								$this->errorMsg[] = "C�digo da fase seletiva inv�lido";
							}
					}
				else
					{
						$this->error = true;
						$this->errorMsg[] = "C�digo da fase seletiva n�o pode ser vazio.";
					}
					
				//C�digo do teste
				if (isset($_POST['teste_cod']))
					{
						if (is_numeric($_POST['teste_cod']))
							{
								$this->teste->setCodigo($_POST['teste_cod']);
							}
						else
							{
								$this->error = true;
								$this->errorMsg[] = "C�digo do teste seletiva inv�lido";
							}
					}
				else
					{
						$this->error = true;
						$this->errorMsg[] = "C�digo do teste n�o pode ser vazio.";
					}
					
				//Quest�es
				if (isset($_POST['questao_cod']) && is_array($_POST['questao_cod']))
					{
						$this->questoes = $_POST['questao_cod'];
					}
				else
					{
						$this->error = true;
						$this->errorMsg[] = "C�digo das quest�es n�o pode ser vazio.";
					}
					
				if ($this->error)
					{
						$this->redirect();
					}
			}
			
		public function redirect()
			{
				foreach ($this->errorMsg as $erro)
					$errorMsg = $erro."<br />";
					
				$this->form->setError("teste", $errorMsg);
				
				//Set the form values
				$_SESSION['value_array'] = $_POST;
         		$_SESSION['error_array'] = $this->form->getErrorArray();
								
				//Redirect
				if ($this->error)
					header("Location: teste.php?status=erro");
				else
					header("Location: teste.php?status=sucesso");
				die();
			}
			
		public function gravarRespostas()
			{
				$this->fase->getProcessoSeletivoByCodigo();
				$this->processoSeletivo = $this->fase->getProcessoSeletivo();
				
				foreach ($this->questoes as $questao)
					{
						$questaoObj = new Questao();
						$questaoObj->setCodigo($questao);
						
						$alt = new AlternativaQuestao();
						$alt->setQuestao($questaoObj);
						$alts = $alt->listAlternativasByQuestao();
						
						foreach ($alts as $alternativa)
							{
								$cod = "alt".$alternativa['ALT_QUE_COD'];
								if (isset($_POST[$cod]) && is_numeric($_POST[$cod]))
									{
										$altObj = new AlternativaQuestao();
										$altObj->setCodigo($alternativa['ALT_QUE_COD']);
										
										$resp = new RespostasCandidatos();
										$resp->setAlternativaQuestao($altObj);
										$resp->setPessoa($this->pessoa);
										$resp->setProcessoSeletivo($this->processoSeletivo);
										$resp->setQuestao($questaoObj);
										$resp->setResposta("1");
										$resp->setTeste($this->teste);
										
										if (!$resp->record())
											{
												$this->error = true;
												$this->errorMsg[] = "N�o foi poss�vel gravar as respostas.";
												$this->redirect();
											}
									}
							}
					}
			}
			
		public function avaliarResultado()
			{
				$acertos = 0;
				
				foreach ($this->questoes as $questao)
					{
						$questaoObj = new Questao();
						$questaoObj->setCodigo($questao);
						
						$valorGabObj = new ValorGabarito();
						$valorGabObj->setCodigo(1);
						
						$alt = new AlternativaQuestao();
						$alt->setQuestao($questaoObj);
						$alt->setValorGabarito($valorGabObj);
						$alts = $alt->listAlternativasCorretasByQuestao();
						
						$count = 0;
						$list = array();
						
						foreach ($alts as $alter)
							{
								$count += $alter['TOTAL'];
								$list[] = $alter['ALT_QUE_COD'];
							}
							
						$list = implode(",", $list);
						
						$respCand = new RespostasCandidatos();
						$respCand->setPessoa($this->pessoa);
						$respCand->setProcessoSeletivo($this->processoSeletivo);
						$respCand->setQuestao($questaoObj);
						$respCand->setTeste($this->teste);
						
						$countResp = $respCand->countRespostasCorretas($list);
						
						//Resposta correta
						if ($count == $countResp)
							{
								$acertos++;
							}
					}
					
				//Total de quest�es
				$questaoObj = new Questao();
				$questaoObj->setTeste($this->teste);
				$total = $questaoObj->countByTeste();
				
				$media = round((($acertos/$total) * 10), 1);
				$nota = new Notas();
				$nota->setNota($media);
				
				$faseTeste = new FaseTeste();
				$faseTeste->setFase($this->fase);
				$notaMin = $faseTeste->getNotaMinimaByFase();
				
				//Aprovado ou reprovado
				if ($media >= $notaMin)
					{
						$status = "Aprovado";
						$candProcSel = new CandidatoProcessoSeletivo();
						$candProcSel->setPessoa($this->pessoa);
						$candProcSel->setProcessoSeletivo($this->processoSeletivo);
						$candProcSel->setStatus("Classificado");
						
						$candProcSel->updateStatus();
					}
				else
					{
						$status = "Reprovado";
						
						$candProcSel = new CandidatoProcessoSeletivo();
						$candProcSel->setPessoa($this->pessoa);
						$candProcSel->setProcessoSeletivo($this->processoSeletivo);
						$candProcSel->setStatus("Desclassificado");
						
						$candProcSel->updateStatus();
					}
				
				$testeCand = new TesteCandidato();
				$testeCand->setFase($this->fase);
				$testeCand->setPessoa($this->pessoa);
				$testeCand->setProcessoSeletivo($this->processoSeletivo);
				$testeCand->setNota($nota);
				$testeCand->setStatus($status);
				
				if (!$testeCand->record())
					{
						$this->error = true;
						$this->errorMsg[] = "N�o foi poss�vel gravar as respostas.";
						$this->redirect();
					}
			}
	}
	
$teste = new gravarTeste();