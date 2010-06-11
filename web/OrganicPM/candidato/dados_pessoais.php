<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/EstadoCivil.class.php';
include_once '../lib/UnidadeFederativa.class.php';
include_once '../lib/Pessoa.class.php';


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
$smarty->assign("page", "dados_pessoais");
$smarty->assign("logado", $session->loggedIn);

//Errors
if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);
	
//Código da pessoa
$pessoa = new Pessoa();
$pessoa->setUsuario($session->user);
$pessoa->getCodigoByUsuario();
$smarty->assign("pessoa_cod", $pessoa->getCodigo());


if ($session->loggedIn)
	{
		//List values
		$estadoCivil = new EstadoCivil();
		$smarty->assign("listEstadosCivis", $estadoCivil->listEstadosCivis());
		
		if ($form->value("action"))
			{
				//Form values
				$smarty->assign("nome", $form->value("nome"));
				$smarty->assign("email", $form->value("email"));
				$smarty->assign("email_sec", $form->value("email_sec"));
				$smarty->assign("cpf", $form->value("cpf"));
				$smarty->assign("data_nascimento", $form->value("data_nascimento"));
				$smarty->assign("naturalidade", $form->value("naturalidade"));
				$smarty->assign("sexo", $form->value("sexo"));
				$smarty->assign("estado_civil", $form->value("estado_civil"));
				
				//Form errors
				$smarty->assign("nome_erro", $form->error("nome"));
				$smarty->assign("email_erro", $form->error("email"));
				$smarty->assign("email_sec_erro", $form->error("email_sec"));
				$smarty->assign("cpf_erro", $form->error("cpf"));
				$smarty->assign("data_nascimento_erro", $form->error("data_nascimento"));
				$smarty->assign("naturalidade_erro", $form->error("naturalidade"));
				$smarty->assign("sexo_erro", $form->error("sexo"));
				$smarty->assign("estado_civil_erro", $form->error("estado_civil"));
				$smarty->assign("geral_erro", $form->error("geral"));
			}
		else
			{
				//Pega dados da pessoa
				$data = $pessoa->getDataByUsuario();
				
				//Form values
				$smarty->assign("nome", $data['NOME']);
				$smarty->assign("email", $data['EMAIL_1']);
				$smarty->assign("email_sec", $data['EMAIL_2']);
				$smarty->assign("cpf", $data['CPF']);
				$smarty->assign("data_nascimento", $data['DATA_NASC']);
				$smarty->assign("naturalidade", $data['NATURALIDADE']);
				$smarty->assign("sexo", $data['SEXO']);
				$smarty->assign("estado_civil", $data['EST_CIV_COD']);
			}
	}
	

//Show the page
$smarty->display('index.tpl');