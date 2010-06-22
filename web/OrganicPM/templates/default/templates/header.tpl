<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us"> 
	<head> 
		<title>{$title}{if $subtitle} | {$subtitle}{/if}</title>
		
		<!-- Begin Stylesheets -->
		<link type="text/css" href="{#cssLibDir#}reset.css" rel="stylesheet" media="print, projection, screen" />
		<link type="text/css" href="{#templateDir#}resources/css/style.css" rel="stylesheet" media="print, projection, screen" />
		<!--[if IE 6]>
		<link href="css/ie6.css" rel="stylesheet" type="text/css" />
		<![endif]-->
		
		{if $page == "curriculo" || $page == "entrevistas" || $page == "alternativas" || $page == "questoes" || $page == "fases" || $page == "usuarios" || $page == "reports" || $page == "dados_login" || $page == "dados_pessoais" || $page == "endereco" || $page == "cadastro" || (($page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias") && ($action == "editar" || $action == "novo")) || ($page == "adminProcSel"  && ($action == "novo" || $action == "editar")) || $page == "adminTestes"}
		
		<link type="text/css" href="{#cssLibDir#}themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="{#templateDir#}resources/css/cadastro_candidato.css" type="text/css" id="" media="print, projection, screen" />
		
		{/if}
		
		{if $page == "entrevistas"}
		<link rel="stylesheet" type="text/css" href="{#cssLibDir#}timepicker.css">
		{/if}
		
		{if $page == "usuarios" || ($page == "adminProcSel" && $action == "inscritos" && $flexigrid) || ($page == "adminProcSel" && $action == "listar") || ($page == "adminTestes" && $action == "listar")}
		<link type="text/css" href="{#templateDir#}resources/css/flexigrid.css" rel="stylesheet" />
		{/if}
		
		{if $page == "adminProcSel" && ($action == "novo" || $action == "editar")}
		{literal}
		<style type="text/css">
			#tabs-2 #li_4,#tabs-2 #li_5{display:none;}
		</style>
		{/literal}
		{/if}
		
		{if $page == "adminTestes" && ($action == "novo" || $action == "editar")}
		{literal}
		<style type="text/css">
			#li_2{display:none}
			.edit,.delete{margin-right:20px;}
		</style>
		{/literal}
		{/if}
		
		{if $page == "formacao_academica"}
		{literal}
		<style type="text/css">
			#li_1,#li_4{display:none;}
		</style>
		{/literal}
		{/if}
		
		{if $page == "formacao_adicional"}
		{literal}
		<style type="text/css">
			#li_7{display:none;}
		</style>
		{/literal}
		{/if}
		<!-- End Stylesheets -->
		
		<!-- Begin Javascript -->
		<script type="text/javascript" src="{#jsLibDir#}jquery.js"></script>
		
		{if $page == "login"}
		
		<script type="text/javascript" src="{#jsLibDir#}sha1-min.js"></script>
		{/if}
		
		{if $page == "curriculo" || $page == "alternativas" || $page == "questoes" || $page == "fases" || $page == "usuarios" || $page == "reports" || $page == "cadastro" || $page == "dados_login" || $page == "dados_pessoais" || $page == "endereco" || $page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias" || ($page == "adminProcSel" && ($action == "novo" || $action == "editar")) || $page == "adminTestes"}
		<script type="text/javascript" src="{#jsLibDir#}jquery-ui-1.8.custom.min.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.limit-1.2.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.alphanumeric.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.datepicker-pt-BR.js"></script>
		{/if}
		
		{if $page == "entrevistas"}
		<script type="text/javascript" src="{#jsLibDir#}jquery.limit-1.2.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}timepicker/jquery_ui_datepicker.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}timepicker/ui.datepicker-pt-BR.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}timepicker/timepicker.js"></script>
		
		{/if}
		
		{if $page == "usuarios" || ($page == "adminProcSel" && $action == "inscritos" && $flexigrid) || ($page == "adminProcSel" && $action == "listar") || ($page == "adminTestes" && $action == "listar")}
		<script type="text/javascript" src="{#jsLibDir#}flexigrid.js"></script>
		{/if}
		
		{if $page == "reports"}
		<script src="{#jsLibDir#}highcharts.js" type="text/javascript"></script>
		<!--[if IE]>
		   <script src="{#jsLibDir#}excanvas.compiled.js" type="text/javascript"></script>
		<![endif]-->
		{/if}
		
		{include file="jsReady\open.tpl"}
		
		{if $page == "index"}
		{include file="index\jsReady.tpl"}
		{/if}
		
		{if $page == "login"}
		{include file="login\jsReady.tpl"}
		{/if}
		
		{if $page == "curriculo" || $page == "entrevistas" || $page == "alternativas" || $page == "questoes" || $page == "usuarios" || $page == "reports" || $page == "dados_login" || $page == "teste" || $page == "admin" || $page == "vagas" || $page == "selecao" || $page == "fases" || $page == "dados_pessoais" || $page == "endereco" || $page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias" || $page == "content" || $page == "cadastro" || ($page == "adminTestes" && $action == "listar") || ($page == "adminProcSel" && $action == "listar")}
		{include file="content\jsReady.tpl"}
		{/if}
		
		{if $page == "adminProcSel" && ($action == "novo" || $action == "editar")}
		{include file="admin\jsReady.tpl"}
		{/if}
		
		{if $page == "adminTestes" && ($action == "novo" || $action == "editar")}
		{include file="admin\jsTestes.tpl"}
		{/if}
		
		{if $page == "cadastro"}
		{include file="forms\cadastro_candidato\jsReady.tpl"}
		{/if}
		
		{if $page == "curriculo"}
		{include file="forms\curriculo_candidato\jsReady.tpl"}
		{/if}
		
		{if $page == "idiomas" && $action == "editar"}
			$('#idioma').attr('disabled', 'disabled');
		{/if}
		
		{if $page == "dados_pessoais"}
		{include file="forms\curriculo_candidato\jsDadosPessoais.tpl"}
		{/if}
		
		{if $page == "reports"}
		{include file="report\jsReady.tpl"}
		{/if}
		
		{if $page == "endereco"}
		{include file="forms\curriculo_candidato\jsEndereco.tpl"}
		{/if}
		
		{if $page == "contatos"}
		{include file="forms\curriculo_candidato\jsContatos.tpl"}
		{/if}
		
		{if $page == "conhecimentos"}
		{include file="forms\curriculo_candidato\jsConhecimentos.tpl"}
		{/if}
		
		{if $page == "experiencia_profissional"}
		{include file="forms\curriculo_candidato\jsExperProf.tpl"}
		{/if}
		
		{if $page == "formacao_academica"}
		{include file="forms\curriculo_candidato\jsFormAcad.tpl"}
		{/if}
		
		{if $page == "formacao_adicional"}
				{include file="forms\curriculo_candidato\jsFormAdic.tpl"}
		{/if}
		
		{if $page == "idiomas"}
		{include file="forms\curriculo_candidato\jsIdiomas.tpl"}
		{/if}
		
		{if $page == "referencias"}
		{include file="forms\curriculo_candidato\jsReferencias.tpl"}
		{/if}
		
		{if $page == "dados_login"}
		{include file="forms\curriculo_candidato\jsDadosLogin.tpl"}
		{/if}
		
		{if $page == "fases"}
		{include file="admin\jsFases.tpl"}
		{/if}
		
		{if $page == "usuarios" || ($page == "adminProcSel" && $action == "listar") || ($page == "adminTestes" && $action == "listar")}
			{$flexigrid}
		{/if}
		
		{if $page == "adminProcSel" && $action == "inscritos" && $flexigrid}
			{$flexigrid}
		{/if}
		
		{if $page == "entrevistas"}
			{literal}
			$('#data_agendada, #data_efetiva').datetime({userLang:'pt-BR',americanMode:true,});
			$('#comentario').limit('4000','#li_3 .left');
			{/literal}
		{/if}
		
		{include file="jsReady\close.tpl"}
		
		<!-- End Javascript -->

	</head>
	<body>
		
		<!-- Background -->
		<div id="background">
			<img src="{#templateDir#}resources/images/background.jpg" width="100%" height="100%" alt="background" />
		</div>
		
		<!-- Begin Wrapper -->
		<div id="wrapper">
			
			<!-- Begin Header -->
			<div id="header">
				
				<!-- Logo -->
				<a id="logo" href="" title=""><img src="{#templateDir#}resources/images/logo.png" alt="Logo" /></a>
				
				<!-- Menu -->
				<ul id="menu">
					<li><a href="{#root#}index.php" title="P�gina Inicial">P�gina Inicial</a></li>
					<li><a href="{#root#}candidato/" title="Meu Cadastro">Meu Cadastro</a></li>
					<li><a href="{#root#}" title="Vagas">Vagas</a></li>
					{if $logado && $isAdmin}
					<li><a href="{#root#}admin/" title="Administra��o">Admin</a></li>
					{else}
					<li><a href="{#root#}login.php" title="Login">Login</a></li>
					{/if}
				</ul>
				
			</div>
			<!-- End Header -->
			
			<!-- Begin Content -->
			<div id="content">