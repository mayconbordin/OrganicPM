<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/EstadoCivil.class.php';
include_once '../lib/UnidadeFederativa.class.php';
include_once '../lib/TipoTelefone.class.php';
include_once '../lib/CursoFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/NivelFormacao.class.php';
include_once '../lib/AndamentoCurso.class.php';
include_once '../lib/Setor.class.php';
include_once '../lib/Idioma.class.php';

global $form;


//==================================================================
// Template ========================================================
//==================================================================

$smarty = new Smarty;

//Smarty Configs
$smarty->template_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates';
$smarty->compile_dir	= ROOT.'templates/'.DEFAULT_TEMPLATE.'/templates_c';
$smarty->cache_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/cache';
$smarty->config_dir		= ROOT.'templates/'.DEFAULT_TEMPLATE.'/configs';
$smarty->compile_check	= true;
$smarty->debugging		= false;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "cadastro");
$smarty->assign("logado", $session->loggedIn);

//Errors
if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//List values
$estadoCivil = new EstadoCivil();
$smarty->assign("listEstadosCivis", $estadoCivil->listEstadosCivis());

$uf = new UnidadeFederativa();
$smarty->assign("listUF", $uf->listUnidadesFederativas());

$tipoTelefone = new TipoTelefone();
$smarty->assign("listTiposTelefone", $tipoTelefone->listTiposTelefone());

$cursoFormacao = new CursoFormacao();
$smarty->assign("listCursos", $cursoFormacao->listCursos());

$instituicao = new Instituicao();
$smarty->assign("listInstituicoes", $instituicao->listInstituicoes());

$nivel = new NivelFormacao();
$smarty->assign("listNiveis", $nivel->listNiveis());

$andamento = new AndamentoCurso();
$smarty->assign("listAndamento", $andamento->listAndamentos());

$setor = new Setor();
$smarty->assign("listSetores", $setor->listSetores());

$idioma = new Idioma();
$smarty->assign("listIdiomas", $idioma->listIdiomas());

//Form values
$smarty->assign("nome", $form->value("nome"));
$smarty->assign("email", $form->value("email"));
$smarty->assign("email_sec", $form->value("email_sec"));
$smarty->assign("cpf", $form->value("cpf"));
$smarty->assign("data_nascimento", $form->value("data_nascimento"));
$smarty->assign("naturalidade", $form->value("naturalidade"));
$smarty->assign("sexo", $form->value("sexo"));
$smarty->assign("endereco", $form->value("endereco"));
$smarty->assign("numero", $form->value("numero"));
$smarty->assign("complemento", $form->value("complemento"));
$smarty->assign("cep", $form->value("cep"));
$smarty->assign("bairro", $form->value("bairro"));
$smarty->assign("cidade", $form->value("cidade"));
$smarty->assign("uf", $form->value("uf"));
$smarty->assign("estado_civil", $form->value("estado_civil"));
$smarty->assign("pais", $form->value("pais"));
$smarty->assign("usuario", $form->value("usuario"));

//Contatos
$contatos = array();
$tipo = $form->getArray("tipo_tel");
$ddd = $form->getArray("ddd");
$num = $form->getArray("numero_tel");

$count = count($tipo);
for ($i = 1; $i < $count; $i++)
	$contatos[$i-1] = array('tipo' => $tipo[$i], 'ddd' => $ddd[$i], 'num' => $num[$i]);
			
$smarty->assign("contatos", $contatos);

//Formação Acadêmica
$formAcad 	= array();
$curso 		= $form->getArray("curso");
$nivel 		= $form->getArray("nivel");
$dataIni 	= $form->getArray("acad_data_inicio");
$dataFim	= $form->getArray("acad_data_fim");
$instit 	= $form->getArray("instituicao");
$andam 		= $form->getArray("andamento");

$count = count($curso);
for ($i = 1; $i < $count; $i++)
	{
		if (is_numeric($curso[$i]))
			{
				//Curso
				$cursoForm = new CursoFormacao();
				$cursoForm->setCodigo($curso[$i]);
				if ($cursoForm->getNomeByCodigo() !== false)
					$cursoNome = $cursoForm->getNome();
				else
					$cursoNome = $curso[$i];
			}
		else
			$cursoNome = $curso[$i];
			
		//Nivel
		$nivForm = new NivelFormacao();
		$nivForm->setCodigo($nivel[$i]);
		if ($nivForm->getNivelByCodigo() !== false)
			$nivelNome = $nivForm->getNivel();
		else
			$nivelNome = $nivel[$i];
			
		if (is_numeric($instit[$i]))
			{
				//Instituição
				$insForm = new Instituicao();
				$insForm->setCodigo($instit[$i]);
				if ($insForm->getNomeByCodigo() !== false)
					$institNome = $insForm->getNome();
				else
					$institNome = $instit[$i];
			}
		else
			$institNome = $instit[$i];
			
		//Andamento
		$andForm = new AndamentoCurso();
		$andForm->setCodigo($andam[$i]);
		if ($andForm->getStatusByCodigo() !== false)
			$andamNome = $andForm->getStatus();
		else
			$andamNome = $andam[$i];
		
		$formAcad[$i-1] = array('curso' => $curso[$i],
							'nivel' => $nivel[$i],
							'acad_data_inicio' => $dataIni[$i],
							'acad_data_fim' => $dataFim[$i],
							'instituicao' => $instit[$i],
							'andamento' => $andam[$i],
							'cursoNome' => $cursoNome,
							'nivelNome' => $nivelNome,
							'instituicaoNome' => $institNome,
							'andamentoNome' => $andamNome
						);
	}
			
$smarty->assign("formAcademicas", $formAcad);

//Experiências Profissionais
$expProf 	= array();
$empresa 	= $form->getArray("empresa");
$funcao 	= $form->getArray("funcao");
$atrib 		= $form->getArray("atribuicoes");
$dataIni 	= $form->getArray("exp_data_inicio");
$dataFim	= $form->getArray("exp_data_fim");
$setor 		= $form->getArray("setor");

$count = count($empresa);
for ($i = 1; $i < $count; $i++)
	{
		//Setor
		$setExp = new Setor();
		$setExp->setCodigo($setor[$i]);
		if ($setExp->getSetorByCodigo() !== false)
			$setorNome = $setExp->getSetor();
		else
			$setorNome = $setor[$i];
		
		$expProf[$i-1] = array('empresa' => $empresa[$i],
							   'funcao' => $funcao[$i],
							   'atribuicoes' => $atrib[$i],
							   'exp_data_inicio' => $dataIni[$i],
							   'exp_data_fim' => $dataFim[$i],
							   'setor' => $setor[$i],
							   'setorNome' => $setorNome);
	}
			
$smarty->assign("expProfissionais", $expProf);


//Formações adicionais
$forAdic 	= array();
$tipo 		= $form->getArray("tipo");
$curso 		= $form->getArray("adic_curso");
$dataIni 	= $form->getArray("adic_data_inicio");
$dataFim 	= $form->getArray("adic_data_fim");
$cargaHor	= $form->getArray("carga_horaria");
$instit		= $form->getArray("adic_instituicao");

$count = count($tipo);
for ($i = 1; $i < $count; $i++)
	{
		if (is_numeric($instit[$i]))
			{
				//Instituição
				$insForm = new Instituicao();
				$insForm->setCodigo($instit[$i]);
				if ($insForm->getNomeByCodigo() !== false)
					$institNome = $insForm->getNome();
				else
					$institNome = $instit[$i];
			}
		else
			$institNome = $instit[$i];
		
		$forAdic[$i-1] = array('tipo' => $tipo[$i],
							   'adic_curso' => $curso[$i],
							   'adic_data_inicio' => $dataIni[$i],
							   'adic_data_fim' => $dataFim[$i],
							   'carga_horaria' => $cargaHor[$i],
							   'adic_instituicao' => $instit[$i],
							   'adic_instituicaoNome' => $institNome);
	}
			
$smarty->assign("forAdicionais", $forAdic);


//Conhecimentos
$conhec 		= array();
$grupo 			= $form->getArray("grupo_conhecimento");
$conhecimento	= $form->getArray("conhecimento");
$proficiencia	= $form->getArray("proficiencia");

$count = count($grupo);
for ($i = 1; $i < $count; $i++)
	{
		$conhec[$i-1] = array('grupo_conhecimento' => $grupo[$i],
							   'conhecimento' => $conhecimento[$i],
							   'proficiencia' => $proficiencia[$i]);
	}
			
$smarty->assign("conhecimentos", $conhec);

//Idiomas
$idiomas 		= array();
$idioma 		= $form->getArray("idioma");
$escrita		= $form->getArray("escrita");
$conversacao	= $form->getArray("conversacao");
$leitura		= $form->getArray("leitura");


$count = count($idioma);
for ($i = 1; $i < $count; $i++)
	{
		//Idioma
		$idi = new Idioma();
		$idi->setCodigo($idioma[$i]);
		if ($idi->getIdiomaByCodigo() !== false)
			$idiomaNome = $idi->getIdioma();
		else
			$idiomaNome = $idioma[$i];
		
		$idiomas[$i-1] = array('idioma' => $idioma[$i],
							   'escrita' => $escrita[$i],
							   'conversacao' => $conversacao[$i],
							   'leitura' => $leitura[$i],
							   'idiomaNome' => $idiomaNome);
	}
			
$smarty->assign("idiomas", $idiomas);

//Referências
$refer	 		= array();
$nome 			= $form->getArray("ref_nome");
$empresa		= $form->getArray("ref_empresa");
$vinculo		= $form->getArray("ref_vinculo");
$telefone		= $form->getArray("ref_telefone");
$email			= $form->getArray("ref_email");


$count = count($nome);
for ($i = 1; $i < $count; $i++)
	{
		$refer[$i-1] = array('ref_nome' => $nome[$i],
							 'ref_empresa' => $empresa[$i],
							 'ref_vinculo' => $vinculo[$i],
							 'ref_telefone' => $telefone[$i],
							 'ref_email' => $email[$i]);
	}
			
$smarty->assign("referencias", $refer);

//Form errors
$smarty->assign("nome_erro", $form->error("nome"));
$smarty->assign("email_erro", $form->error("email"));
$smarty->assign("email_sec_erro", $form->error("email_sec"));
$smarty->assign("cpf_erro", $form->error("cpf"));
$smarty->assign("data_nascimento_erro", $form->error("data_nascimento"));
$smarty->assign("naturalidade_erro", $form->error("naturalidade"));
$smarty->assign("sexo_erro", $form->error("sexo"));
$smarty->assign("endereco_erro", $form->error("endereco"));
$smarty->assign("numero_erro", $form->error("numero"));
$smarty->assign("complemento_erro", $form->error("complemento"));
$smarty->assign("cep_erro", $form->error("cep"));
$smarty->assign("bairro_erro", $form->error("bairro"));
$smarty->assign("cidade_erro", $form->error("cidade"));
$smarty->assign("uf_erro", $form->error("uf"));
$smarty->assign("estado_civil_erro", $form->error("estado_civil"));
$smarty->assign("pais_erro", $form->error("pais"));
$smarty->assign("contato_erro", $form->error("contato"));
$smarty->assign("formacao_academica_erro", $form->error("formacao_academica"));
$smarty->assign("experiencia_profissional_erro", $form->error("experiencia_profissional"));
$smarty->assign("formacao_adicional_erro", $form->error("formacao_adicional"));
$smarty->assign("conhecimento_erro", $form->error("conhecimento"));
$smarty->assign("idioma_erro", $form->error("idioma"));
$smarty->assign("referencia_erro", $form->error("referencia"));
$smarty->assign("acesso_erro", $form->error("acesso"));
$smarty->assign("usuario_erro", $form->error("usuario"));
$smarty->assign("senha_erro", $form->error("senha"));
$smarty->assign("senha_conf_erro", $form->error("senha_conf"));

//Show the page
$smarty->display('index.tpl');