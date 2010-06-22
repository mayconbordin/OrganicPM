<?php /* Smarty version 2.6.26, created on 2010-06-18 10:36:07
         compiled from admin%5CedicaoTeste.tpl */ ?>
							<form id="cand_form" class="appnitro" action="alterTeste.php" method="post">
								<h2>Teste</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<ul>
									<li id="li_1" >
										<label class="description" for="teste_descricao">Descrição: </label>
										<div>
											<textarea id="teste_descricao" name="teste_descricao" class="element textarea small"><?php echo $this->_tpl_vars['teste_descricao']; ?>
</textarea> 
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['teste_descricao_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['teste_descricao_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_4" >
										<label class="description" for="teste_tipo">Tipo: </label>
										<div>
										<select class="element select medium" id="teste_tipo" name="teste_tipo"> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listTiposTeste']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoTeste']):
?>
											<?php if ($this->_tpl_vars['teste_tipo'] == $this->_tpl_vars['tipoTeste']['TIP_TES_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['tipoTeste']['TIP_TES_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['tipoTeste']['TIPO']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['tipoTeste']['TIP_TES_COD']; ?>
"><?php echo $this->_tpl_vars['tipoTeste']['TIPO']; ?>
</option>
											<?php endif; ?>
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<input class="new" type="button" value="Novo" />
										<p class="error"></p>
										<?php if ($this->_tpl_vars['teste_tipo_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['teste_tipo_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_2" >
										<label class="description" for="teste_novo_tipo">Novo Tipo: </label>
										<div>
											<input id="teste_novo_tipo" name="teste_novo_tipo" class="element text medium" type="text" maxlength="255" value=""/> 
											<input class="save" type="button" value="Salvar" />
											<input class="cancel" type="button" value="Cancelar" />
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="teste_cod" type="hidden" value="<?php echo $this->_tpl_vars['teste_cod']; ?>
"/>
									<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>

							</form>
							
							
							<div style="margin:30px 20px 0 20px;border-top:2px solid #ffffff;padding-top:20px;">
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin\\table2.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
							</div>