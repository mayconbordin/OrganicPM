<?php /* Smarty version 2.6.26, created on 2010-05-27 14:09:07
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
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro'): ?>
		
		<link type="text/css" href="<?php echo $this->_config[0]['vars']['cssLibDir']; ?>
themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/css/cadastro_candidato.css" type="text/css" id="" media="print, projection, screen" />
		
		<?php endif; ?>
		<!-- End Stylesheets -->
		
		<!-- Begin Javascript -->
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.js"></script>
		
		<?php if ($this->_tpl_vars['page'] == 'login'): ?>
		
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
sha1-min.js"></script>
		<?php endif; ?>
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro'): ?>
		
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.validate.js"></script>
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.ui.core.js"></script> 
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.ui.widget.js"></script> 
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.ui.datepicker.js"></script>
		<script type="text/javascript" src="<?php echo $this->_config[0]['vars']['jsLibDir']; ?>
jquery.ui.tabs.js"></script>
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
		
		<?php if ($this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'content' || $this->_tpl_vars['page'] == 'cadastro'): ?>
		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\jsReady.tpl", 'smarty_include_vars' => array()));
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