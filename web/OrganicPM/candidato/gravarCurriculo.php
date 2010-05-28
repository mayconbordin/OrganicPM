<?php

include_once '../config/config.inc.php';
include_once '../lib/Candidato.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/EstadoCivil.class.php';
include_once '../lib/UnidadeFederativa.class.php';
include_once '../lib/Telefone.class.php';
include_once '../lib/TipoTelefone.class.php';
include_once '../lib/IdiomaCandidato.class.php';
include_once '../lib/Referencia.class.php';
include_once '../lib/Experiencia.class.php';
include_once '../lib/FormacaoAcademica.class.php';
include_once '../lib/CursoFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/FormacaoAdicional.class.php';
include_once '../lib/NivelFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/AndamentoCurso.class.php';
include_once '../lib/Setor.class.php';
include_once '../lib/Conhecimento.class.php';
include_once '../lib/Idioma.class.php';
include_once '../lib/IdiomaCandidato.class.php';
include_once '../lib/Referencia.class.php';
include_once '../lib/LoginSystem/User.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../plugins/validateEmail.function.php';
include_once '../plugins/validateUsername.function.php';
include_once '../plugins/validatePassword.function.php';
include_once '../plugins/checkDateFormat.function.php';
include_once '../plugins/validateCPF.function.php';
include_once '../plugins/getRandomKey.php';

class gravarCurriculo
	{
		private $form;
		
		private $pessoa;
		private $telefone;
		
		
		private $codigo;
		private $nome;
		private $dataNasc;
		private $cpf;
		private $endereco;
		private $bairro;
		private $emailPrimario;
		private $emailSecundario;
		private $naturalidade;
		private $cidade;
		private $cep;
		private $pais;
		private $numero;
		private $complemento;
		private $sexo;
		
		private $estadoCivil;
		private $unidadeFederativa;
		private $tipoTelefone;
		
		private $usuario;
		private $senha;
		
		private $contatos	= array();
		private $formAcad 	= array();
		private $expProf	= array();
		private $formAdic	= array();
		private $conhec		= array();
		private $idiomas	= array();
		private $refer		= array();
		
		private $idiVals	= array("sim", "não");
		private $sexoList 	= array("masculino", "feminino");
				
		private $error = false;
		
		public function __construct()
			{
				//Form
				session_start();
				$this->form = new Form();
				
				//Pessoa
				$this->pessoa = new Pessoa();
				
				//UF
				$this->unidadeFederativa = new UnidadeFederativa();
				
				//Estado Civil
				$this->estadoCivil = new EstadoCivil();
								
				//Pega os dados do post
				$this->getPost();
				
				//Insere o currículo
				$this->novo();
			}
			
		public function getPost()
			{
				//==================================================================
		   		// Dados Pessoais ==================================================
		   		//==================================================================
				//Nome
				if (isset($_POST['nome']))
					{
						$this->nome = $_POST['nome'];
						
						if ($this->nome == '')
							{
								$this->form->setError("nome", "O nome não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_string($this->nome))
								{
									$this->form->setError("nome", "O nome não é uma string válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("nome", "O nome não pode ser vazio.");
						$this->error = true;
					}
					
				//Email Primário
				if (isset($_POST['email']))
					{
						$this->emailPrimario = $_POST['email'];
						
						if ($this->emailPrimario == '')
							{
								$this->form->setError("email", "O email primário não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!validateEmail($this->emailPrimario))
								{
									$this->form->setError("email", "O email primário não é válido.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("email", "O email primário não pode ser vazio.");
						$this->error = true;
					}
					
				//Email Secundário
				if (isset($_POST['email_sec']))
					{
						$this->emailSecundario = $_POST['email_sec'];
						
						if ($this->emailSecundario == '')
							$this->emailSecundario = "";
						else
							if (!validateEmail($this->emailSecundario))
								{
									$this->form->setError("email_sec", "O email secundário não é válido.");
									$this->error = true;
								}
					}
				else
					$this->emailSecundario = "";
					
				//CPF
				if (isset($_POST['cpf']))
					{
						$this->cpf = $_POST['cpf'];
						$this->pessoa->setCpf($this->cpf);
						
						if ($this->cpf == '')
							{
								$this->form->setError("cpf", "O cpf não pode ser vazio.");
								$this->error = true;
							}
						else
							{
								if (is_numeric($this->cpf))
									{								
										if (strlen($this->cpf) != 11)
											{
												$this->form->setError("cpf", "O cpf possui 11 caracteres.");
												$this->error = true;
											}
										elseif (!validateCPF($this->cpf))
											{
												$this->form->setError("cpf", "O cpf digitado é inválido.");
												$this->error = true;
											}
										elseif ($this->pessoa->searchByCpf())
											{
												$this->form->setError("cpf", "O cpf digitado já existe em nossa base de dados.");
												$this->error = true;
											}
									}
								else
									{
										$this->form->setError("cpf", "O cpf é composto apenas por números.");
										$this->error = true;
									}
							}
						
					}
				else
					{
						$this->form->setError("cpf", "O cpf não pode ser vazio.");
						$this->error = true;
					}
					
				//Data Nascimento
				if (isset($_POST['data_nascimento']))
					{
						$this->dataNasc = $_POST['data_nascimento'];
						
						if ($this->dataNasc == '')
							{
								$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!checkDateFormat($this->dataNasc))
								{
									$this->form->setError("data_nascimento", "A data de nascimento não é válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("data_nascimento", "A data de nascimento não pode ser vazia.");
						$this->error = true;
					}
					
				//Naturalidade
				if (isset($_POST['naturalidade']))
					{
						$this->naturalidade = $_POST['naturalidade'];
						
						if ($this->naturalidade == '')
							{
								$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!is_string($this->naturalidade))
								{
									$this->form->setError("naturalidade", "A naturalidade não é válida.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("naturalidade", "A naturalidade não pode ser vazia.");
						$this->error = true;
					}
					
				//Sexo
				if (isset($_POST['sexo']))
					{
						$this->sexo = $_POST['sexo'];
						
						if ($this->sexo == '')
							{
								$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
								$this->error = true;
							}
						else
							if (!in_array(strtolower($this->sexo), $this->sexoList))
								{
									$this->form->setError("sexo", "Opção sexo possui valor inválido.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("sexo", "A opção sexo não pode ser vazia.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Endereço ========================================================
		   		//==================================================================					
				//Endereço
				if (isset($_POST['endereco']))
					{
						$this->endereco = $_POST['endereco'];
						
						if ($this->endereco == '')
							{
								$this->form->setError("endereco", "O endereço não pode ser vazio.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("endereco", "O endereço não pode ser vazio.");
						$this->error = true;
					}
					
				//Numero
				if (isset($_POST['numero']))
					{
						$this->numero = $_POST['numero'];
						
						if ($this->numero == '')
							{
								$this->form->setError("numero", "O número não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->numero))
								{
									$this->form->setError("numero", "O número deve conter apenas números.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("numero", "O número não pode ser vazio.");
						$this->error = true;
					}
					
				//Complemento
				if (isset($_POST['complemento']))
					{
						$this->complemento = $_POST['complemento'];
					}
				else
					{
						$this->complemento = "";
					}
					
				//CEP
				if (isset($_POST['cep']))
					{
						$this->cep = $_POST['cep'];
						
						if ($this->cep == '')
							{
								$this->form->setError("cep", "O CEP não pode ser vazio.");
								$this->error = true;
							}
						else
							if (!is_numeric($this->cep))
								{
									$this->form->setError("cep", "O CEP deve conter apenas números.");
									$this->error = true;
								}
					}
				else
					{
						$this->form->setError("cep", "O CEP não pode ser vazio.");
						$this->error = true;
					}
					
				//Bairro
				if (isset($_POST['bairro']))
					{
						$this->bairro = $_POST['bairro'];
						
						if ($this->bairro == '')
							{
								$this->form->setError("bairro", "O bairro não pode ser vazio.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("bairro", "O bairro não pode ser vazio.");
						$this->error = true;
					}
				
				//Cidade
				if (isset($_POST['cidade']))
					{
						$this->cidade = $_POST['cidade'];
						
						if ($this->cidade == '')
							{
								$this->form->setError("cidade", "A cidade não pode ser vazia.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("cidade", "A cidade não pode ser vazia.");
						$this->error = true;
					}
					
				//UF
				if (isset($_POST['uf']))
					{
						$uf = $_POST['uf'];
						
						if ($uf == '')
							$this->unidadeFederativa = null;
						else
							{
								if (is_numeric($uf))
									{
										$this->unidadeFederativa->setCodigo($uf);
										
										if (!$this->unidadeFederativa->searchByCodigo())
											{
												$this->form->setError("uf", "Unidade Federativa inválida.");
												$this->error = true;
											}
									}
								else
									{
										$this->form->setError("uf", "Unidade Federativa inválida.");
										$this->error = true;
									}
							}
					}
				else
					{
						$this->unidadeFederativa = null;
					}
					
				//Estado Civil
				if (isset($_POST['estado_civil']))
					{
						$estadoCivil = $_POST['estado_civil'];
						
						if ($this->estadoCivil == '')
							{
								$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
								$this->error = true;
							}
						else
							{
								if (is_numeric($estadoCivil))
									{
										$this->estadoCivil->setCodigo($estadoCivil);
										
										if (!$this->estadoCivil->searchByCodigo())
											{
												$this->form->setError("estado_civil", "Estado civil inválido.");
												$this->error = true;
											}
									}
								else
									{
										$this->form->setError("estado_civil", "Estado civil inválido.");
										$this->error = true;
									}
							}
					}
				else
					{
						$this->form->setError("estado_civil", "O estado civil não pode ser vazio.");
						$this->error = true;
					}
					
				//País
				if (isset($_POST['pais']))
					{
						$this->pais = $_POST['pais'];
						
						if ($this->pais == '')
							{
								$this->form->setError("pais", "O país não pode ser vazia.");
								$this->error = true;
							}
					}
				else
					{
						$this->form->setError("pais", "O país não pode ser vazia.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Contatos ========================================================
		   		//==================================================================
		   		if ( (isset($_POST['tipo_tel']) && is_array($_POST['tipo_tel']) && count($_POST['tipo_tel']) > 0) 
		   		&& (isset($_POST['ddd']) && is_array($_POST['ddd']) && count($_POST['ddd']) > 0) 
		   		&& (isset($_POST['numero_tel']) && is_array($_POST['numero_tel']) && count($_POST['numero_tel']) > 0))
		   			{
		   				if ( count($_POST['tipo_tel']) == count($_POST['ddd']) && count($_POST['ddd']) == count($_POST['numero_tel']))
		   					{
		   						$count = count($_POST['tipo_tel']);
		   						
		   						$tipo = $_POST['tipo_tel'];
		   						$ddd = $_POST['ddd'];
		   						$numero = $_POST['numero_tel'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{
		   								if ($tipo[$i] == '' || $ddd[$i] == '' || $numero[$i] == '')
						   					{
												$this->form->setError("contato", "Todos os campos de contato precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!is_numeric($ddd[$i]) || !is_numeric($numero[$i]))
		   									{
												$this->form->setError("contato", "O numero e/ou área devem conter apenas números.");
												$this->error = true;
											}
										else
		   									$this->contatos[$i] = array('tipo_tel' => $tipo[$i], 'ddd' => $ddd[$i], 'numero_tel' => $numero[$i]);
		   							
		   							}
		   					}
			   			else
							{
								$this->form->setError("contato", "Todos os campos de contato precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("contato", "Um do(s) contato(s) possui valores inválidos.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Formações Acadêmicas ============================================
		   		//==================================================================
		   		if ( (isset($_POST['curso']) && is_array($_POST['curso']) && count($_POST['curso']) > 0) 
		   		&& (isset($_POST['nivel']) && is_array($_POST['nivel']) && count($_POST['nivel']) > 0) 
		   		&& (isset($_POST['acad_data_inicio']) && is_array($_POST['acad_data_inicio']) && count($_POST['acad_data_inicio']) > 0)
		   		&& (isset($_POST['acad_data_fim']) && is_array($_POST['acad_data_fim']) && count($_POST['acad_data_fim']) > 0)
		   		&& (isset($_POST['instituicao']) && is_array($_POST['instituicao']) && count($_POST['instituicao']) > 0)
		   		&& (isset($_POST['andamento']) && is_array($_POST['andamento']) && count($_POST['andamento']) > 0)
		   		)
		   			{
		   				if ( count($_POST['curso']) == count($_POST['nivel']) && count($_POST['nivel']) == count($_POST['acad_data_inicio'])
		   				&& count($_POST['acad_data_inicio']) == count($_POST['acad_data_fim']) && count($_POST['acad_data_fim']) == count($_POST['instituicao'])
		   				&& count($_POST['instituicao']) == count($_POST['andamento']) )
		   					{
		   						$count = count($_POST['curso']);
		   						
		   						$curso 			= $_POST['curso'];
		   						$nivel			= $_POST['nivel'];
		   						$dataInicial	= $_POST['acad_data_inicio'];
		   						$dataFinal 		= $_POST['acad_data_fim'];
		   						$instituicao	= $_POST['instituicao'];
		   						$andamento 		= $_POST['andamento'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{
		   								if ($curso[$i] == '' || $nivel[$i] == '' || $dataInicial[$i] == '' || $dataFinal[$i] == '' || $instituicao[$i] == '' || $andamento[$i] == '')
						   					{
												$this->form->setError("formacao_academica", "Todos os campos da formação acadêmica precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!checkDateFormat($dataInicial[$i]) || !checkDateFormat($dataFinal[$i]))
		   									{
												$this->form->setError("formacao_academica", "Uma das datas da formação acadêmica é inválida.");
												$this->error = true;
											}

										if ($this->error === false)
											{
												if (!is_numeric($curso[$i]))
				   									{
														$cursoForm = new CursoFormacao();
														$cursoForm->setNome($curso[$i]);
														$cursoForm->record();
														$curso[$i] = $cursoForm->getCodigo();
													}
												else
													{
														$cursoForm = new CursoFormacao();
														$cursoForm->setCodigo($curso[$i]);
														if (!$cursoForm->searchByCodigo())
															{
																$this->form->setError("formacao_academica", "O curso informado não existe.");
																$this->error = true;
															}
													}
												
												if (!is_numeric($instituicao[$i]))
				   									{
														$instit = new Instituicao();
														$instit->setNome($instituicao[$i]);
														$instit->record();
														$instituicao[$i] = $instit->getCodigo();
													}
												else
													{
														$instit = new Instituicao();
														$instit->setCodigo($instituicao[$i]);
														if (!$instit->searchByCodigo())
															{
																$this->form->setError("formacao_academica", "A instituição informada não existe.");
																$this->error = true;
															}
													}
													
				   								if (!is_numeric($nivel[$i]))
				   									{
														$this->form->setError("formacao_academica", "Nível de formação inválido.");
														$this->error = true;
													}
												else
													{
														$nivelForm = new NivelFormacao();
														$nivelForm->setCodigo($nivel[$i]);
														if (!$nivelForm->searchByCodigo())
															{
																$this->form->setError("formacao_academica", "Nível de formação inexistente.");
																$this->error = true;
															}
													}
													
				   								if (!is_numeric($andamento[$i]))
				   									{
														$this->form->setError("formacao_academica", "Andamento de curso inválido.");
														$this->error = true;
													}
												else
													{
														$andCurso = new AndamentoCurso();
														$andCurso->setCodigo($andamento[$i]);
														if (!$andCurso->searchByCodigo())
															{
																$this->form->setError("formacao_academica", "Andamento de curso inexistente.");
																$this->error = true;
															}
													}
												
												if ($this->error === false)
													{
														$this->formAcad[$i] = array(
																				'curso' => $cursoForm,
																				'nivel' => $nivelForm,
																				'acad_data_inicio' => $dataInicial[$i],
																				'acad_data_fim' => $dataFinal[$i],
																				'instituicao' => $instit,
																				'andamento' => $andCurso
																			);
													}
											}
		   							
		   							}
		   					}
			   			else
							{
								$this->form->setError("formacao_academica", "Todos os campos de formações acadêmicas precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("formacao_academica", "As formações acadêmicas possuem valores inválidos.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Experiências Profissionais ======================================
		   		//==================================================================
		   		if ( (isset($_POST['empresa']) && is_array($_POST['empresa']) && count($_POST['empresa']) > 0) 
		   		&& (isset($_POST['funcao']) && is_array($_POST['funcao']) && count($_POST['funcao']) > 0) 
		   		&& (isset($_POST['atribuicoes']) && is_array($_POST['atribuicoes']) && count($_POST['atribuicoes']) > 0)
		   		&& (isset($_POST['exp_data_inicio']) && is_array($_POST['exp_data_inicio']) && count($_POST['exp_data_inicio']) > 0)
		   		&& (isset($_POST['exp_data_fim']) && is_array($_POST['exp_data_fim']) && count($_POST['exp_data_fim']) > 0)
		   		&& (isset($_POST['setor']) && is_array($_POST['setor']) && count($_POST['setor']) > 0)
		   		)
		   			{
		   				if ( count($_POST['empresa']) == count($_POST['funcao']) && count($_POST['funcao']) == count($_POST['atribuicoes'])
		   				&& count($_POST['atribuicoes']) == count($_POST['exp_data_inicio']) && count($_POST['exp_data_inicio']) == count($_POST['exp_data_fim'])
		   				&& count($_POST['exp_data_fim']) == count($_POST['setor']) )
		   					{
		   						$count = count($_POST['empresa']);
		   						
		   						$empresa	= $_POST['empresa'];
		   						$funcao		= $_POST['funcao'];
		   						$atrib		= $_POST['atribuicoes'];
		   						$dataIni	= $_POST['exp_data_inicio'];
		   						$dataFim	= $_POST['exp_data_fim'];
		   						$setor		= $_POST['setor'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{
		   								if ($empresa[$i] == '' || $funcao[$i] == '' || $atrib[$i] == '' || $dataIni[$i] == '' || $dataFim[$i] == '' || $setor[$i] == '')
						   					{
												$this->form->setError("experiencia_profissional", "Todos os campos da experiência profissional precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!checkDateFormat($dataIni[$i]) || !checkDateFormat($dataFim[$i]))
		   									{
												$this->form->setError("experiencia_profissional", "Uma das datas da formação acadêmica é inválida.");
												$this->error = true;
											}

										if ($this->error === false)
											{
												if (!is_numeric($setor[$i]))
				   									{
														$expSetor = new Setor();
														$expSetor->setSetor($setor[$i]);
														$expSetor->record();
														$setor[$i] = $expSetor->getCodigo();
													}
												else
													{
														$expSetor = new Setor();
														$expSetor->setCodigo($setor[$i]);
														if (!$expSetor->searchByCodigo())
															{
																$this->form->setError("experiencia_profissional", "O setor informado não existe.");
																$this->error = true;
															}
													}
												
												if ($this->error === false)
													{
														$this->expProf[$i] = array(
																				'empresa' => $empresa[$i],
																				'funcao' => $funcao[$i],
																				'atribuicoes' => $atrib[$i],
																				'exp_data_inicio' => $dataIni[$i],
																				'exp_data_fim' => $dataFim[$i],
																				'setor' => $expSetor
																			);
													}
											}
		   							
		   							}
		   					}
		   				else
		   					{
								$this->form->setError("experiencia_profissional", "Todos os campos das experiências profissionais precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("experiencia_profissional", "As experiências profissionais possuem valores inválidos.");
						$this->error = true;
					}
					
					
				//==================================================================
		   		// Formação Adicional ==============================================
		   		//==================================================================
		   		if ( (isset($_POST['tipo']) && is_array($_POST['tipo']) && count($_POST['tipo']) > 0) 
		   		&& (isset($_POST['adic_curso']) && is_array($_POST['adic_curso']) && count($_POST['adic_curso']) > 0) 
		   		&& (isset($_POST['adic_data_inicio']) && is_array($_POST['adic_data_inicio']) && count($_POST['adic_data_inicio']) > 0)
		   		&& (isset($_POST['adic_data_fim']) && is_array($_POST['adic_data_fim']) && count($_POST['adic_data_fim']) > 0)
		   		&& (isset($_POST['carga_horaria']) && is_array($_POST['carga_horaria']) && count($_POST['carga_horaria']) > 0)
		   		&& (isset($_POST['adic_instituicao']) && is_array($_POST['adic_instituicao']) && count($_POST['adic_instituicao']) > 0)
		   		)
		   			{
		   				if ( count($_POST['tipo']) == count($_POST['adic_curso']) && count($_POST['adic_curso']) == count($_POST['adic_data_inicio'])
		   				&& count($_POST['adic_data_inicio']) == count($_POST['adic_data_fim']) && count($_POST['adic_data_fim']) == count($_POST['carga_horaria'])
		   				&& count($_POST['carga_horaria']) == count($_POST['adic_instituicao']) )
		   					{
		   						$count = count($_POST['tipo']);
		   						
		   						$tipo			= $_POST['tipo'];
		   						$curso			= $_POST['adic_curso'];
		   						$dataIni		= $_POST['adic_data_inicio'];
		   						$dataFim		= $_POST['adic_data_fim'];
		   						$cargaHor		= $_POST['carga_horaria'];
		   						$instituicao	= $_POST['adic_instituicao'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{	   								
		   								if ($tipo[$i] == '' || $curso[$i] == '' || $dataIni[$i] == '' || $dataFim[$i] == '' || $cargaHor[$i] == '' || $instituicao[$i] == '')
						   					{
												$this->form->setError("formacao_adicional", "Todos os campos da formação adicional precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!checkDateFormat($dataIni[$i]) || !checkDateFormat($dataFim[$i]))
		   									{
												$this->form->setError("formacao_adicional", "Uma das datas da formação adicional é inválida.");
												$this->error = true;
											}

										if ($this->error === false)
											{												
												if (!is_numeric($instituicao[$i]))
				   									{
														$instit = new Instituicao();
														$instit->setNome($instituicao[$i]);
														$instit->record();
														$instituicao[$i] = $instit->getCodigo();
													}
												else
													{
														$instit = new Instituicao();
														$instit->setCodigo($instituicao[$i]);
														if (!$instit->searchByCodigo())
															{
																$this->form->setError("formacao_adicional", "A instituição informada não existe.");
																$this->error = true;
															}
													}
													
												if ($this->error === false)
													{
														$this->formAdic[$i] = array(
																			'tipo' => $tipo[$i],
																			'adic_curso' => $curso[$i],
																			'adic_data_inicio' => $dataIni[$i],
																			'adic_data_fim' => $dataFim[$i],
																			'carga_horaria' => $cargaHor[$i],
																			'adic_instituicao' => $instit
																		);																		
													}
											}
		   							
		   							}
		   					}
		   				else
		   					{
								$this->form->setError("formacao_adicional", "Todos os campos das formações adicionais precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("formacao_adicional", "As formações adicionais possuem valores inválidos.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Conhecimentos ===================================================
		   		//==================================================================
		   		if ( (isset($_POST['grupo_conhecimento']) && is_array($_POST['grupo_conhecimento']) && count($_POST['grupo_conhecimento']) > 0) 
		   		&& (isset($_POST['conhecimento']) && is_array($_POST['conhecimento']) && count($_POST['conhecimento']) > 0) 
		   		&& (isset($_POST['proficiencia']) && is_array($_POST['proficiencia']) && count($_POST['proficiencia']) > 0)
		   		)
		   			{
		   				if ( count($_POST['grupo_conhecimento']) == count($_POST['conhecimento']) && count($_POST['conhecimento']) == count($_POST['proficiencia']) )
		   					{
		   						$count = count($_POST['grupo_conhecimento']);
		   						
		   						$grupo			= $_POST['grupo_conhecimento'];
		   						$conhecimento	= $_POST['conhecimento'];
		   						$proficiencia	= $_POST['proficiencia'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{	   								
		   								if ($grupo[$i] == '' || $conhecimento[$i] == '' || $proficiencia[$i] == '')
						   					{
												$this->form->setError("conhecimento", "Todos os campos do conhecimento precisam ser preenchidos.");
												$this->error = true;
											}

										if ($this->error === false)
											{												
												$this->conhec[$i] = array(
																		'grupo_conhecimento' => $grupo[$i],
																		'conhecimento' => $conhecimento[$i],
																		'proficiencia' => $proficiencia[$i]
																	);
											}
		   							
		   							}
		   					}
		   				else
		   					{
								$this->form->setError("conhecimento", "Todos os campos dos conhecimentos precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("conhecimento", "As formações adicionais possuem valores inválidos.");
						$this->error = true;
					}
					
				
				//==================================================================
		   		// Idiomas =========================================================
		   		//==================================================================
		   		if ( (isset($_POST['idioma']) && is_array($_POST['idioma']) && count($_POST['idioma']) > 0) 
		   		&& (isset($_POST['leitura']) && is_array($_POST['leitura']) && count($_POST['leitura']) > 0) 
		   		&& (isset($_POST['conversacao']) && is_array($_POST['conversacao']) && count($_POST['conversacao']) > 0)
		   		&& (isset($_POST['escrita']) && is_array($_POST['escrita']) && count($_POST['escrita']) > 0)
		   		)
		   			{
		   				if ( count($_POST['idioma']) == count($_POST['leitura']) && count($_POST['leitura']) == count($_POST['conversacao'])
		   				&& count($_POST['conversacao']) == count($_POST['escrita']) )
		   					{
		   						$count = count($_POST['idioma']);
		   						
		   						$idioma			= $_POST['idioma'];
		   						$leitura		= $_POST['leitura'];
		   						$conversacao	= $_POST['conversacao'];
		   						$escrita		= $_POST['escrita'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{	   								
		   								if ($idioma[$i] == '' || $leitura[$i] == '' || $conversacao[$i] == '' || $escrita[$i] == '')
						   					{
												$this->form->setError("idioma", "Todos os campos da formação adicional precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!in_array($leitura[$i], $this->idiVals) || !in_array($conversacao[$i], $this->idiVals) || !in_array($escrita[$i], $this->idiVals))
		   									{
												$this->form->setError("idioma", "Os valores inseridos em leitura/escrita/conversação são inválidos.");
												$this->error = true;
											}

										if ($this->error === false)
											{												
												if (!is_numeric($idioma[$i]))
				   									{
														$this->form->setError("idioma", "O idioma informado é inválido.");
														$this->error = true;
													}
												else
													{
														$idi = new Idioma();
														$idi->setCodigo($idioma[$i]);
														
														if (!$idi->searchByCodigo())
															{
																$this->form->setError("idioma", "O idioma informado não existe.");
																$this->error = true;
															}
													}
													
												if ($this->error === false)
													{
														$this->idiomas[$i] = array(
																			'idioma' => $idi,
																			'leitura' => $leitura[$i],
																			'conversacao' => $conversacao[$i],
																			'escrita' => $escrita[$i]
																		);																		
													}
											}
		   							
		   							}
		   					}
		   				else
		   					{
								$this->form->setError("formacao_adicional", "Todos os campos das formações adicionais precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("formacao_adicional", "As formações adicionais possuem valores inválidos.");
						$this->error = true;
					}
					
					
				//==================================================================
		   		// Referências =====================================================
		   		//==================================================================
		   		if ( (isset($_POST['ref_nome']) && is_array($_POST['ref_nome']) && count($_POST['ref_nome']) > 0) 
		   		&& (isset($_POST['ref_empresa']) && is_array($_POST['ref_empresa']) && count($_POST['ref_empresa']) > 0) 
		   		&& (isset($_POST['ref_vinculo']) && is_array($_POST['ref_vinculo']) && count($_POST['ref_vinculo']) > 0)
		   		&& (isset($_POST['ref_telefone']) && is_array($_POST['ref_telefone']) && count($_POST['ref_telefone']) > 0)
		   		&& (isset($_POST['ref_email']) && is_array($_POST['ref_email']) && count($_POST['ref_email']) > 0)
		   		)
		   			{
		   				if ( count($_POST['ref_nome']) == count($_POST['ref_empresa']) && count($_POST['ref_empresa']) == count($_POST['ref_vinculo'])
		   				&& count($_POST['ref_vinculo']) == count($_POST['ref_telefone']) && count($_POST['ref_telefone']) == count($_POST['ref_email']) )
		   					{
		   						$count = count($_POST['ref_nome']);
		   						
		   						$nome			= $_POST['ref_nome'];
		   						$empresa		= $_POST['ref_empresa'];
		   						$vinculo		= $_POST['ref_vinculo'];
		   						$telefone		= $_POST['ref_telefone'];
		   						$email			= $_POST['ref_email'];
		   						
		   						//Sempre começa em um, pois o primeiro valor é vazio
		   						for ($i = 1; $i < $count; $i++)
		   							{	   								
		   								if ($nome[$i] == '' || $empresa[$i] == '' || $vinculo[$i] == '' || $telefone[$i] == '' || $email[$i] == '')
						   					{
												$this->form->setError("referencia", "Todos os campos da formação adicional precisam ser preenchidos.");
												$this->error = true;
											}
										elseif (!validateEmail($email[$i]))
		   									{
												$this->form->setError("referencia", "O email inserido é inválido.");
												$this->error = true;
											}
										elseif(!is_numeric($telefone[$i]))
											{
												$this->form->setError("referencia", "O telefone informado não é válido.");
												$this->error = true;
											}

										if ($this->error === false)
											{
												$this->refer[$i] = array(
																		'ref_nome' => $nome[$i],
																		'ref_empresa' => $empresa[$i],
																		'ref_vinculo' => $vinculo[$i],
																		'ref_telefone' => $telefone[$i],
																		'ref_email' => $email[$i]
																	);
											}
		   							
		   							}
		   					}
		   				else
		   					{
								$this->form->setError("referencia", "Todos os campos das referências precisam ser preenchidos.");
								$this->error = true;
							}
		   			}
				else
					{
						$this->form->setError("referencia", "As referências possuem valores inválidos.");
						$this->error = true;
					}
					
				//==================================================================
		   		// Acesso ==========================================================
		   		//==================================================================

   				if (isset($_POST['usuario']))
   					$this->usuario 	= $_POST['usuario'];
   					
   				if (isset($_POST['senha']))
   					$this->senha	= $_POST['senha'];
   					
   				if (isset($_POST['senha_conf']))
   					$confirmacao	= $_POST['senha_conf'];

   				if ($this->usuario == '')
   					{
   						$this->form->setError("usuario", "O usuário precisa ser preenchido.");
						$this->error = true;
   					}
   				elseif (!validateUsername($this->usuario))
   					{
   						$this->form->setError("usuario", "O usuário contém caracteres inválidos.");
						$this->error = true;
   					}
   					
   				if ($this->senha == '')
   					{
   						$this->form->setError("senha", "A senha precisa ser preenchida.");
						$this->error = true;
   					}
   				elseif (!validatePassword($this->senha))
   					{
   						$this->form->setError("senha", "A senha contém caracteres inválidos.");
						$this->error = true;
   					}
   				elseif (strlen($this->senha) < 5)
   					{
   						$this->form->setError("senha", "A senha precisa ter no mínimo 5 caracteres.");
						$this->error = true;
   					}
   					
   				if (strcmp($this->senha, $confirmacao) != 0)
   					{
   						$this->form->setError("senha_conf", "As senhas são diferentes.");
						$this->error = true;
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
					header("Location: cadastrar.php?status=erro");
				else
					header("Location: cadastrar.php?status=sucesso");
				die();
			}
			
		public function recordContatos()
			{
				foreach ($this->contatos as $contato)
					{
						$this->tipoTelefone = new TipoTelefone();
						$this->tipoTelefone->setTipo($contato['tipo_tel']);
												
						if ($this->tipoTelefone->searchByTipo())
							{
								$this->telefone = new Telefone();
								$this->telefone->setPessoa($this->pessoa);
								$this->telefone->setTipo($this->tipoTelefone);
								$this->telefone->setArea($contato['ddd']);
								$this->telefone->setNumero($contato['numero_tel']);
								
								if (!$this->telefone->record())
									{
										$this->form->setError("telefone", "Não foi possível gravar os dados de contato.");
										$this->error = true;
									}
							}
					}
			}
			
		public function recordFormAcad()
			{
				foreach ($this->formAcad as $form)
					{
						$formAcad = new FormacaoAcademica();
						$formAcad->setAndamento($form['andamento']);
						$formAcad->setCurso($form['curso']);
						$formAcad->setDataFim($form['acad_data_fim']);
						$formAcad->setDataInicio($form['acad_data_inicio']);
						$formAcad->setInstituicao($form['instituicao']);
						$formAcad->setNivel($form['nivel']);
						$formAcad->setPessoa($this->pessoa);
								
						if (!$formAcad->record())
							{
								$this->form->setError("formacao_academica", "Não foi possível gravar os dados de formação acadêmica.");
								$this->error = true;
							}
					}
			}
			
		public function recordExpProf()
			{
				foreach ($this->expProf as $exp)
					{
						$expProf = new Experiencia();
						$expProf->setAtribuicoes($exp['atribuicoes']);
						$expProf->setDataFim($exp['exp_data_fim']);
						$expProf->setDataInicio($exp['exp_data_inicio']);
						$expProf->setEmpresa($exp['empresa']);
						$expProf->setFuncao($exp['funcao']);
						$expProf->setPessoa($this->pessoa);
						$expProf->setSetor($exp['setor']);
						
						if (!$expProf->record())
							{
								$this->form->setError("experiencia_profissional", "Não foi possível gravar os dados de experiências profissionais.");
								$this->error = true;
							}
					}
			}
			
		public function recordFormAdic()
			{
				foreach ($this->formAdic as $form)
					{
						$formAdic = new FormacaoAdicional();
						$formAdic->setCargaHoraria($form['carga_horaria']);
						$formAdic->setDataFim($form['adic_data_fim']);
						$formAdic->setDataInicio($form['adic_data_inicio']);
						$formAdic->setInstituicao($form['adic_instituicao']);
						$formAdic->setNome($form['adic_curso']);
						$formAdic->setPessoa($this->pessoa);
						$formAdic->setTipo($form['tipo']);
												
						if (!$formAdic->record())
							{
								$this->form->setError("formacao_adicional", "Não foi possível gravar os dados das formações adicionais.");
								$this->error = true;
							}
					}
			}
			
		public function recordConhec()
			{
				foreach ($this->conhec as $conhecimento)
					{
						$conhec = new Conhecimento();
						$conhec->setConhecimento($conhecimento['conhecimento']);
						$conhec->setGrupo($conhecimento['grupo_conhecimento']);
						$conhec->setPessoa($this->pessoa);
						$conhec->setProficiencia($conhecimento['proficiencia']);
						
						if (!$conhec->record())
							{
								$this->form->setError("conhecimento", "Não foi possível gravar os dados das formações adicionais.");
								$this->error = true;
							}
					}
			}
			
		public function recordIdiCand()
			{
				foreach ($this->idiomas as $idioma)
					{
						$idiCand = new IdiomaCandidato();
						$idiCand->setConversacao($idioma['conversacao']);
						$idiCand->setEscrita($idioma['escrita']);
						$idiCand->setIdioma($idioma['idioma']);
						$idiCand->setLeitura($idioma['leitura']);
						$idiCand->setPessoa($this->pessoa);
						
						if (!$idiCand->record())
							{
								$this->form->setError("idioma", "Não foi possível gravar os dados dos idiomas.");
								$this->error = true;
							}
					}
			}
			
		public function recordRefer()
			{
				foreach ($this->refer as $referencia)
					{
						$refer = new Referencia();
						$refer->setEmail($referencia['ref_email']);
						$refer->setEmpresa($referencia['ref_empresa']);
						$refer->setFone($referencia['ref_telefone']);
						$refer->setNome($referencia['ref_nome']);
						$refer->setVinculo($referencia['ref_vinculo']);
						$refer->setPessoa($this->pessoa);
						
						if (!$refer->record())
							{
								$this->form->setError("referencia", "Não foi possível gravar os dados das referências.");
								$this->error = true;
							}
					}
			}
			
		public function recordUsuario()
			{
				$user = new User();
				$user->setKey(getRandomKey());
				$user->setLevel(USER_LEVEL);
				$user->setPassword($this->senha);				
				$user->setPessoa($this->pessoa);
				$user->setStatus('active');
				$user->setUsername($this->usuario);
				
				if (!$user->addNewUser())
					{
						$this->form->setError("acesso", "Não foi possível gravar os dados de acesso.");
						$this->error = true;
					}
			}
			
		public function recordCandidato()
			{
				$candidato = new Candidato();
				$candidato->setPessoa($this->pessoa);
				$candidato->record();
			}
					
		public function novo()
			{
				$this->error = false;
				
				//Variáveis
				$this->pessoa->setNome($this->nome);
				$this->pessoa->setEmailPrimario($this->emailPrimario);
				$this->pessoa->setEmailSecundario($this->emailSecundario);
				$this->pessoa->setCpf($this->cpf);
				$this->pessoa->setDataNasc($this->dataNasc);
				$this->pessoa->setNaturalidade($this->naturalidade);
				$this->pessoa->setSexo($this->sexo);
				$this->pessoa->setEndereco($this->endereco);
				$this->pessoa->setNumero($this->numero);
				$this->pessoa->setComplemento($this->complemento);
				$this->pessoa->setCep($this->cep);
				$this->pessoa->setBairro($this->bairro);
				$this->pessoa->setCidade($this->cidade);
				$this->pessoa->setPais($this->pais);
				
				//Objetos
				$this->pessoa->setUnidadeFederativa($this->unidadeFederativa);
				$this->pessoa->setEstadoCivil($this->estadoCivil);
				
				//Grava os dados da pessoa
				if (!$this->pessoa->record())
					{
						$this->form->setError("pessoa", "Não foi possível gravar os seus dados.");
						$this->redirect();
					}
				
				//Grava os contatos da pessoa
				$this->recordContatos();
				
				//Grava o candidato
				$this->recordCandidato();
				
				//Grava formações acadêmicas
				$this->recordFormAcad();
				
				//Grava experiências profissionais
				$this->recordExpProf();
				
				//Grava formações adicionais
				$this->recordFormAdic();
				
				//Grava conhecimentos
				$this->recordConhec();
				
				//Grava Idiomas
				$this->recordIdiCand();
				
				//Grava referências
				$this->recordRefer();
				
				//Grava usuário
				$this->recordUsuario();
				
				//Redireciona
				$this->redirect();
			}
	}
	
$curriculo = new gravarCurriculo();