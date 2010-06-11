<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/UnidadeFederativa.class.php';


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
$smarty->assign("page", "endereco");
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
		$uf = new UnidadeFederativa();
		$smarty->assign("listUF", $uf->listUnidadesFederativas());
		
		if ($form->value("action"))
			{
				//Form values
				$smarty->assign("endereco", $form->value("endereco"));
				$smarty->assign("numero", $form->value("numero"));
				$smarty->assign("complemento", $form->value("complemento"));
				$smarty->assign("cep", $form->value("cep"));
				$smarty->assign("bairro", $form->value("bairro"));
				$smarty->assign("cidade", $form->value("cidade"));
				$smarty->assign("uf", $form->value("uf"));
				$smarty->assign("pais", $form->value("pais"));
				
				//Form errors
				$smarty->assign("endereco_erro", $form->error("endereco"));
				$smarty->assign("numero_erro", $form->error("numero"));
				$smarty->assign("complemento_erro", $form->error("complemento"));
				$smarty->assign("cep_erro", $form->error("cep"));
				$smarty->assign("bairro_erro", $form->error("bairro"));
				$smarty->assign("cidade_erro", $form->error("cidade"));
				$smarty->assign("uf_erro", $form->error("uf"));
				$smarty->assign("pais_erro", $form->error("pais"));
			}
		else
			{
				//Pega dados da pessoa
				$data = $pessoa->getDataByUsuario();

				//Form values
				$smarty->assign("endereco", $data['ENDERECO']);
				$smarty->assign("numero", $data['NUMERO']);
				$smarty->assign("complemento", $data['COMPLEMENTO']);
				$smarty->assign("cep", $data['CEP']);
				$smarty->assign("bairro", $data['BAIRRO']);
				$smarty->assign("cidade", $data['CIDADE']);
				$smarty->assign("pais", $data['PAIS']);
				$smarty->assign("uf", $data['UNI_FED_COD']);
			}
	}
	

//Show the page
$smarty->display('index.tpl');