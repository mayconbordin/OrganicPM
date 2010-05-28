<?php /* Smarty version 2.6.26, created on 2010-05-27 13:47:35
         compiled from login%5Ccontent.tpl */ ?>
				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<?php if ($this->_tpl_vars['logado']): ?>
					<!-- Begin Right Block -->
					<div id="right">
						
						<h1 class="title-message">Você já está logado</h1>
						
						<p class="log-message">Você pode fazer sair do sistema <a href="<?php echo $this->_config[0]['vars']['root']; ?>
process.php" title="Sair">aqui</a>.</p>
						
					</div>
					<!-- End Right Block -->
					<?php endif; ?>
					
					<?php if ($this->_tpl_vars['logado'] === false): ?>
					<!-- Begin Login Panel -->
					<div id="login-panel">
						
						<div id="login-form">
							<h1>Autenticação</h1>
							
							<?php if ($this->_tpl_vars['userError'] || $this->_tpl_vars['passError']): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Usuário ou Senha incorretos.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php if ($this->_tpl_vars['genError']): ?>
								<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => $this->_tpl_vars['genError'],'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							<?php endif; ?>
							
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'warning','msgText' => "",'msgVis' => 'hide')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							
							<form method="post" action="process.php">
								<div id="username-input">
									<label>USUÁRIO:</label>
									<input id="user" name="user" type="text" value="" />
								</div>
								
								<div id="password-input">
									<label>SENHA:</label>
									<input id="pass" name="pass" type="password" value="" />
								</div>
								
								<div id="remember">
									<input type="checkbox" name="remember"  />Remember me
								</div>
								
								<div id="submit">
									<input type="hidden" name="sublogin" value="1">
									<input id="challenge" type="hidden" name="challenge" value="">
									<input id="signin" type="submit" value="LOGAR"/>
								</div>
								
							</form>
					
						</div>
						
					</div>
					<!-- End Login Panel -->
					<?php endif; ?>
					
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				