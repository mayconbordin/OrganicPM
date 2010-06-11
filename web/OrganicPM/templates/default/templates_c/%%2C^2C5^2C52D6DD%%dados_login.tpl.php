<?php /* Smarty version 2.6.26, created on 2010-06-11 15:44:44
         compiled from admin%5Cdados_login.tpl */ ?>
					<form id="cand_form" class="appnitro" action="gravarDadosLogin.php" method="post">
						<h2>Login</h2>
						<?php if ($this->_tpl_vars['geral_erro']): ?>
						<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
						<?php endif; ?>
						<ul>
							<li id="li_1" >
								<label class="description" for="usuario">Usuário: </label>
								<div>
									<input id="usuario" name="usuario" class="element text medium" type="text" maxlength="60" value="<?php echo $this->_tpl_vars['usuario']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['usuario_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['usuario_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_5" >
								<label class="description" for="data_registro">Data de Registro: </label>
								<div>
									<input id="data_registro" name="data_registro" class="element text medium" type="text" maxlength="60" value="<?php echo $this->_tpl_vars['data_registro']; ?>
"/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['data_registro_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['data_registro_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_6" >
								<label class="description" for="nivel_acesso">Nível de Acesso: </label>
								<div>
									<div>
									<select class="element select small" id="nivel_acesso" name="nivel_acesso"> 
										<option value="" selected="selected"></option>
										
										<?php $_from = $this->_tpl_vars['niveis']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['niv']):
?>
											
										<?php if ($this->_tpl_vars['nivel_acesso'] == $this->_tpl_vars['niv']['ALIAS']): ?>
										<option value="<?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
" selected="selected"><?php echo $this->_tpl_vars['niv']['ALIAS']; ?>
</option>
										<?php else: ?>
										<option value="<?php echo $this->_tpl_vars['niv']['NIVEL']; ?>
"><?php echo $this->_tpl_vars['niv']['ALIAS']; ?>
</option>
										<?php endif; ?>
											
										<?php endforeach; endif; unset($_from); ?>
									</select>
									<p class="error"></p>
									<?php if ($this->_tpl_vars['nivel_acesso_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['nivel_acesso_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['nivel_acesso_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['nivel_acesso_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_2" >
								<label class="description" for="senha_atual">Senha Atual: </label>
								<div>
									<input id="senha_atual" name="senha_atual" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_atual_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_atual_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_3" >
								<label class="description" for="senha_nova">Nova Senha: </label>
								<div>
									<input id="senha_nova" name="senha_nova" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_nova_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_nova_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							
							<li id="li_4" >
								<label class="description" for="senha_nova_conf">Confirme a Nova Senha: </label>
								<div>
									<input id="senha_nova_conf" name="senha_nova_conf" class="element text medium" type="password" maxlength="100" value=""/> 
									<p class="error"></p>
									<?php if ($this->_tpl_vars['senha_nova_conf_erro']): ?>
									<p class="form_error"><?php echo $this->_tpl_vars['senha_nova_conf_erro']; ?>
</p>
									<?php endif; ?>
								</div> 
							</li>
							<!-- Dados Adicionais -->
							<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
							<input name="action" type="hidden" value="edit"/>
							<input type="submit" id="submit" value="Salvar" />
						</ul>
					</form>