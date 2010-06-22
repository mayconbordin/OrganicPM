<?php /* Smarty version 2.6.26, created on 2010-06-17 10:39:47
         compiled from admin%5CedicaoProcSel.tpl */ ?>
							<form id="cand_form" class="appnitro" action="alterProcSel.php" method="post">
								<h2>Processo Seletivo</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<ul>
									<li id="li_1" >
										<label class="description" for="descricao">Descrição: </label>
										<div>
											<textarea id="descricao" name="descricao" class="element textarea small"><?php echo $this->_tpl_vars['descricao']; ?>
</textarea>
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['descricao_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['descricao_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_2" >
										<label class="description" for="data_inicio">Data de Início: </label>
										<div>
											<input id="data_inicio" name="data_inicio" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['data_inicio']; ?>
"/>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['data_inicio_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['data_inicio_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_3" >
										<label class="description" for="data_fim">Data de Término: </label>
										<div>
											<input id="data_fim" name="data_fim" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['data_fim']; ?>
"/>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['data_fim_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['data_fim_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_4" >
										<label class="description" for="vagas">Vagas: </label>
										<div>
											<input id="vagas" name="vagas" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['vagas']; ?>
"/>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['vagas_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['vagas_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
				
									<li id="li_5" >
										<label class="description" for="cargo">Cargo: </label>
										<div>
										<select class="element select medium" id="cargo" name="cargo"> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listCargos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['carg']):
?>
													
											<?php if ($this->_tpl_vars['cargo'] == $this->_tpl_vars['carg']['CARGO_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['carg']['CARGO_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['carg']['DESCRICAO']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['carg']['CARGO_COD']; ?>
"><?php echo $this->_tpl_vars['carg']['DESCRICAO']; ?>
</option>
											<?php endif; ?>
											
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['cargo_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['cargo_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="pro_sel_cod" type="hidden" value="<?php echo $this->_tpl_vars['pro_sel_cod']; ?>
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