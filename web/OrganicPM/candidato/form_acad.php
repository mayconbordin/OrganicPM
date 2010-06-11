<?php 

include_once '../config/config.inc.php';
include_once '../lib/vendor/Smarty/libs/Smarty.class.php';
include_once '../lib/LoginSystem/Session.class.php';
include_once '../lib/LoginSystem/Visit.class.php';

include_once '../lib/Form/Form.class.php';
include_once '../lib/Pessoa.class.php';
include_once '../lib/Pagination/pagination.class.php';
include_once '../lib/FormacaoAcademica.class.php';
include_once '../lib/CursoFormacao.class.php';
include_once '../lib/Instituicao.class.php';
include_once '../lib/NivelFormacao.class.php';
include_once '../lib/AndamentoCurso.class.php';

$actions = array("listar", "deletar", "editar", "novo");

if (isset($_GET['action']))
	{
		$action = $_GET['action'];
		if (!in_array($action, $actions))
			$action = "listar";
	}
else
	$action = "listar";


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
$smarty->assign("page", "formacao_academica");
$smarty->assign("action", $action);
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
		if ($action == "listar")
			{
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
				
				//Formação Acadêmica
				$formacao = new FormacaoAcademica();
				$formacao->setPessoa($pessoa);
				$data = $formacao->listFormAcadByPage($start, ($start+$lenght));
				
				$count = count($data);
				for ($i = 0; $i < $count; $i++)
					{
						$data[$i] = array($data[$i][0], $data[$i][1], $data[$i][2], $data[$i][3], $data[$i][4], $data[$i][5], $data[$i][6]);
					}
				
				$count = $formacao->count();
				$pagination = new Pagination($page, $count, $lenght, 1, "form_acad.php?action=listar");
					
				$columns = array(
								'Código',
								'Data de Início',
								'Data de Fim',
								'Instituição',
								'Nível',
								'Andamento',
								'Curso'		
				);
						
				$smarty->assign("data", $data);
				$smarty->assign("columns", $columns);
				$smarty->assign("tableTitle", "Formações Acadêmicas");
				$smarty->assign("pagination", $pagination->getPagenavi());
				
				$smarty->assign("novo", true);
				$smarty->assign("novo_link", "form_acad.php?action=novo");
			}
		elseif ($action == "editar")
			{
				$cursoFormacao = new CursoFormacao();
				$smarty->assign("listCursos", $cursoFormacao->listCursos());
				
				$instituicao = new Instituicao();
				$smarty->assign("listInstituicoes", $instituicao->listInstituicoes());
				
				$nivel = new NivelFormacao();
				$smarty->assign("listNiveis", $nivel->listNiveis());
				
				$andamento = new AndamentoCurso();
				$smarty->assign("listAndamento", $andamento->listAndamentos());
				
				if (isset($_GET['id']))
					{
						$cod = $_GET['id'];
						
						if (is_numeric($cod))
							$smarty->assign("form_acad_cod", $_GET['id']);
						else
							header("Location: contatos.php");
					}
					
					
				$formAcad = new FormacaoAcademica();
				$formAcad->setCodigo($cod);
				$data = $formAcad->getDataByCodigo();
				
				$smarty->assign("acad_data_inicio", $data[0]);
				$smarty->assign("acad_data_fim", $data[1]);
				$smarty->assign("curso", $data[2]);
				$smarty->assign("instituicao", $data[3]);
				$smarty->assign("nivel", $data[4]);
				$smarty->assign("andamento", $data[5]);
			}
		elseif ($action == "novo")
			{
				$cursoFormacao = new CursoFormacao();
				$smarty->assign("listCursos", $cursoFormacao->listCursos());
				
				$instituicao = new Instituicao();
				$smarty->assign("listInstituicoes", $instituicao->listInstituicoes());
				
				$nivel = new NivelFormacao();
				$smarty->assign("listNiveis", $nivel->listNiveis());
				
				$andamento = new AndamentoCurso();
				$smarty->assign("listAndamento", $andamento->listAndamentos());
			}
	}
	

//Show the page
$smarty->display('index.tpl');