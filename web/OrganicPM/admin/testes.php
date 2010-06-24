<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';
include_once '../lib/TipoQuestao.class.php';
include_once '../lib/TipoTeste.class.php';
include_once '../lib/Teste.class.php';
include_once '../lib/Questao.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/FlexiGrid/FlexiGrid.class.php';

global $form, $session;

$actions = array("novo", "listar", "pesquisar", "editar");

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
		if (!in_array($action, $actions))
			$action = "listar";
	}
else
	$action = "listar";

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
$smarty->debugging		= true;

//Variables
$smarty->assign("title", "OrganicPM");
$smarty->assign("subtitle", "People Management System");
$smarty->assign("page", "adminTestes");
$smarty->assign("action", $action);
$smarty->assign("logado", $session->loggedIn);
$smarty->assign("isAdmin", $session->isAdmin());
$smarty->assign("url", "testes.php");

if (isset($_GET['status']))
	$smarty->assign("status", $_GET['status']);

//Novo
if (strcmp($action, "novo") == 0)
	{
		$tipoTeste = new TipoTeste();
		$smarty->assign("listTiposTeste", $tipoTeste->listTiposTeste());
		
		$tipoQuestao = new TipoQuestao();
		$smarty->assign("listTiposQuestao", $tipoQuestao->listTiposQuestao());
	
		//Form values
		$smarty->assign("teste_descricao", $form->value("teste_descricao"));
		$smarty->assign("teste_tipo", $form->value("teste_tipo"));
		
		//Errors
		$smarty->assign("teste_descricao_erro", $form->error("teste_descricao"));
		$smarty->assign("teste_tipo_erro", $form->error("teste_tipo"));
		$smarty->assign("questoes_erro", $form->error("questoes"));
		$smarty->assign("teste_erro", $form->error("teste"));
		
		//Questões
		$questoes 		= array();
		$descricao		= $form->getArray("questao_descricao");
		$tipo			= $form->getArray("questao_tipo");
		$alternativas	= $form->getArray("questao_alternativas");
		$respostas		= $form->getArray("questao_respostas");
		
		$count = count($descricao);
		for ($i = 0; $i < $count; $i++)
			{
				$questoes[$i] = array('DESCRICAO' => $descricao[$i],
									 'TIP_QUE_COD' => $tipo[$i],
									 'ALTERNATIVAS' => $alternativas[$i],
									 'RESPOSTAS' => $respostas[$i],
									 'RESUMO' => substr($descricao[$i], 0, 20));
			}
					
		$smarty->assign("questoes", $questoes);
		
	}
	
//Listar
if (strcmp($action, "listar") == 0)
	{
		$teste = new Teste();
		
		//FlexiGrid
		$flex = new FlexiGrid($teste);
		$flex->setTitle("Testes");
		$flex->setUrl("testeFunctions.php");
		$flex->setEdit(array('caption' => 'Editar', 'url' => 'testes.php?action=editar&id='));
		$flex->setAdd(array('caption' => 'Novo', 'url' => 'testes.php?action=novo'));
			 
		$smarty->assign("flexigrid", $flex->generateConfig());
	}
	
//Editar
if (strcmp($action, "editar") == 0)
	{
		if (isset($_GET['id']))
			{
				$cod = $_GET['id'];
				
				if (is_numeric($cod))
					$smarty->assign("teste_cod", $cod);
				else
					header("Location: testes.php");
			}
			
		$teste = new Teste();
		$teste->setCodigo($cod);
		$data = $teste->getDataByCodigo();
		
		$smarty->assign("teste_descricao", $data['DESCRICAO']);
		$smarty->assign("teste_tipo", $data['TIP_TES_COD']);
		
		$tipoTeste = new TipoTeste();
		$smarty->assign("listTiposTeste", $tipoTeste->listTiposTeste());
		
		//Rows per page
		$lenght = 20;
		
		if (isset($_GET['page']))
			{
				$page = $_GET['page'];
			}
		else
			{
				$page = 1;
			}
			
		$start = ($page - 1) * $lenght;
		
		$questao = new Questao();
		$questao->setTeste($teste);
		$data = $questao->listQuestoesByTeste($start, ($start+$lenght));
		$count = $questao->countByTeste();
		
		$pagination = new Pagination($page, $count, $lenght, 1, "questoes.php?action=editar&id=".$cod);
		
		$count = count($data);
		for ($i = 0; $i < $count; $i++)
			{
				$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2]);
			}
			
		$columns = array(
						'Código',
						'Descrição',
						'Tipo'
		);
				
		$smarty->assign("data", $data);
		$smarty->assign("columns", $columns);
		$smarty->assign("tableTitle", "Questões do Teste");
		$smarty->assign("pagination", $pagination->getPagenavi());
		$smarty->assign("url", "questoes.php");
		
		//Errors
		$smarty->assign("geral_erro", $form->error("geral"));
		$smarty->assign("teste_descricao_erro", $form->error("teste_descricao"));
		$smarty->assign("teste_tipo_erro", $form->error("teste_tipo"));
	}

//Show the page
$smarty->display('admin\index.tpl');