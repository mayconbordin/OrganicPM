<?php /* Smarty version 2.6.26, created on 2010-06-11 15:04:18
         compiled from header.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en-us"> 
	<head> 
		<title><?php echo $this->_tpl_vars['title']; ?>
<?php if ($this->_tpl_vars['subtitle']): ?> | <?php echo $this->_tpl_vars['subtitle']; ?>
<?php endif; ?></title>
		
		<!-- Begin Stylesheets -->
		<link type="text/css" href="<?php echo $this->_config[0]['vars']['cssLibDir']; ?>
reset.css" rel="stylesheet" media="print, projection, screen" />
		<link type="text/css" href="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/css/style.css" rel="stylesheet" media="print, projection, screen" />
		<!--[if IE 6]>
		<link href="css/ie6.css" rel="stylesheet" type="text/css" />
		<![endif]-->
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'dados_login' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'cadastro' || ( ( $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' ) && ( $this->_tpl_vars['action'] == 'editar' || $this->_tpl_vars['action'] == 'novo' ) ) || ( $this->_tpl_vars['page'] == 'adminProcSel' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' ) ) || ( $this->_tpl_vars['page'] == 'adminTestes' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' ) )): ?>
		
		<link type="text/css" href="<?php echo $this->_config[0]['vars']['cssLibDir']; ?>
themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/css/cadastro_candidato.css" type="text/css" id="" media="print, projection, screen" />
		
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' )): ?>
		<?php echo '
		<style type="text/css">
			#tabs-2 #li_4,#tabs-2 #li_5{display:none;}
		</style>
		'; ?>

		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'adminTestes' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' )): ?>
		<?php echo '
		<style type="text/css">
			#li_2{display:none}
			.edit,.delete{margin-right:20px;}
		</style>
		'; ?>

		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'formacao_academica'): ?>
		<?php echo '
		<style type="text/css">
			#li_1,#li_4{display:none}
		</style>
		'; ?>

		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'formacao_adicional'): ?>
		<?php echo '
		<style type="text/css">
			#li_7{display:none}
		</style>
		'; ?>

		<?php endif; ?>
		<!-- End Stylesheets -->
		
		<!-- Begin Javascript -->
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.js"></script>
		
		<?php if ($this->_tpl_vars['page'] == 'login'): ?>
		
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
sha1-min.js"></script>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro' || $this->_tpl_vars['page'] == 'dados_login' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' || ( $this->_tpl_vars['page'] == 'adminProcSel' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' ) ) || ( $this->_tpl_vars['page'] == 'adminTestes' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' ) )): ?>
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery-ui-1.8.custom.min.js"></script>
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.limit-1.2.js"></script>
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.alphanumeric.js"></script>
		<?php endif; ?>
		
		
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "jsReady\open.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		
		<?php if ($this->_tpl_vars['page'] == 'index'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "index\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'login'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "login\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'dados_login' || $this->_tpl_vars['page'] == 'teste' || $this->_tpl_vars['page'] == 'admin' || $this->_tpl_vars['page'] == 'vagas' || $this->_tpl_vars['page'] == 'selecao' || $this->_tpl_vars['page'] == 'fases' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias' || $this->_tpl_vars['page'] == 'content' || $this->_tpl_vars['page'] == 'cadastro' || ( $this->_tpl_vars['page'] == 'adminTestes' && $this->_tpl_vars['action'] == 'listar' ) || ( $this->_tpl_vars['page'] == 'adminProcSel' && $this->_tpl_vars['action'] == 'listar' )): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'adminProcSel' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' )): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'adminTestes' && ( $this->_tpl_vars['action'] == 'novo' || $this->_tpl_vars['action'] == 'editar' )): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\jsTestes.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'cadastro'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\cadastro_candidato\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsReady.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'idiomas' && $this->_tpl_vars['action'] == 'editar'): ?>
			$('#idioma').attr('disabled', 'disabled');
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'dados_pessoais'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsDadosPessoais.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'endereco'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsEndereco.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'contatos'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsContatos.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'conhecimentos'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsConhecimentos.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'experiencia_profissional'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsExperProf.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'formacao_academica'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsFormAcad.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'formacao_adicional'): ?>
				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsFormAdic.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'idiomas'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsIdiomas.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'referencias'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsReferencias.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'dados_login'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "forms\curriculo_candidato\jsDadosLogin.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		<?php endif; ?>
		
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "jsReady\close.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
		
		<!-- End Javascript -->

	</head>
	<body>
		
		<!-- Background -->
		<div id="background">
			<img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/background.jpg" width="100%" height="100%" alt="background" />
		</div>
		
		<!-- Begin Wrapper -->
		<div id="wrapper">
			
			<!-- Begin Header -->
			<div id="header">
				
				<!-- Logo -->
				<a id="logo" href="" title=""><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/logo.png" alt="Logo" /></a>
				
				<!-- Menu -->
				<ul id="menu">
					<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
index.php" title="Página Inicial">Página Inicial</a></li>
					<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/" title="Meu Cadastro">Meu Cadastro</a></li>
					<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
" title="Vagas">Vagas</a></li>
					<li><a href="<?php echo $this->_config[0]['vars']['root']; ?>
login.php" title="Login">Login</a></li>
				</ul>
				
			</div>
			<!-- End Header -->
			
			<!-- Begin Content -->
			<div id="content">