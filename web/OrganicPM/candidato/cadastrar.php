<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/Form/Form.class.php';

session_start();
$form = new Form();

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
		
		//Show the page
		$smarty->display('index.tpl');