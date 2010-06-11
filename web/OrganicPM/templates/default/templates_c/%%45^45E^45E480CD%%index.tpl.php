<?php /* Smarty version 2.6.26, created on 2010-06-11 14:50:52
         compiled from index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'config_load', 'index.tpl', 1, false),)), $this); ?>
<?php echo smarty_function_config_load(array('file' => "config.conf"), $this);?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

<?php if ($this->_tpl_vars['page'] == 'index'): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "index\content.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['page'] == 'login'): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "login\content.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php if ($this->_tpl_vars['page'] == 'content' || $this->_tpl_vars['page'] == 'dados_login' || $this->_tpl_vars['page'] == 'vagas' || $this->_tpl_vars['page'] == 'selecao' || $this->_tpl_vars['page'] == 'fases' || $this->_tpl_vars['page'] == 'curriculo' || $this->_tpl_vars['page'] == 'cadastro' || $this->_tpl_vars['page'] == 'admin' || $this->_tpl_vars['page'] == 'dados_pessoais' || $this->_tpl_vars['page'] == 'endereco' || $this->_tpl_vars['page'] == 'contatos' || $this->_tpl_vars['page'] == 'conhecimentos' || $this->_tpl_vars['page'] == 'experiencia_profissional' || $this->_tpl_vars['page'] == 'formacao_academica' || $this->_tpl_vars['page'] == 'formacao_adicional' || $this->_tpl_vars['page'] == 'idiomas' || $this->_tpl_vars['page'] == 'referencias'): ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "content\content.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<?php endif; ?>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>