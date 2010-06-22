<?php /* Smarty version 2.6.26, created on 2010-06-17 14:24:26
         compiled from admin%5Cfase.tpl */ ?>
							<form id="cand_form" class="appnitro" action="alterFase.php" method="post">
								<h2>Fase</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<ul>
									<li id="li_1">
										<label class="description" for="fase_tipo">Tipo: </label>
										<div>
										<select class="element select medium" id="fase_tipo" name="fase_tipo" <?php if ($this->_tpl_vars['teste']): ?>disabled="disabled"<?php endif; ?>> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listTiposFase']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoFase']):
?>
												
											<?php if ($this->_tpl_vars['fase_tipo'] == $this->_tpl_vars['tipoFase']['TIP_FAS_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['tipoFase']['TIP_FAS_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['tipoFase']['FASE']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['tipoFase']['TIP_FAS_COD']; ?>
"><?php echo $this->_tpl_vars['tipoFase']['FASE']; ?>
</option>
											<?php endif; ?>
											
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['fase_tipo_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['fase_tipo_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									
									<?php if ($this->_tpl_vars['teste']): ?>
									<li id="li_4">
										<label class="description" for="teste">Teste: </label>
										<div>
										<select class="element select medium" id="teste" name="teste"> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listTestes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['teste']):
?>
												
											<?php if ($this->_tpl_vars['fase_teste'] == $this->_tpl_vars['teste']['TESTE_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['teste']['TESTE_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['teste']['DESCRICAO']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['teste']['TESTE_COD']; ?>
"><?php echo $this->_tpl_vars['teste']['DESCRICAO']; ?>
</option>
											<?php endif; ?>
											
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['teste_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['teste_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									
									<li id="li_5">
										<label class="description" for="nota">Nota Mínima para Aprovação: </label>
										<div>
										<select class="element select medium" id="nota" name="nota"> 
											<option value=""></option>
											<?php $_from = $this->_tpl_vars['listNotas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['nota']):
?>
												
											<?php if ($this->_tpl_vars['fase_nota'] == $this->_tpl_vars['nota']['NOTA']): ?>
											<option value="<?php echo $this->_tpl_vars['nota']['NOTA']; ?>
" selected="selected"><?php echo $this->_tpl_vars['nota']['NOTA']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['nota']['NOTA']; ?>
"><?php echo $this->_tpl_vars['nota']['NOTA']; ?>
</option>
											<?php endif; ?>
											
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['nota_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['nota_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									<?php endif; ?>
									
									<li id="li_2" >
										<label class="description" for="fase_data_inicio">Data de Início: </label>
										<div>
											<input id="fase_data_inicio" name="fase_data_inicio" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['fase_data_inicio']; ?>
"/>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['fase_data_inicio_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['fase_data_inicio_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
			
									<li id="li_3" >
										<label class="description" for="fase_data_fim">Data de Término: </label>
										<div>
											<input id="fase_data_fim" name="fase_data_fim" class="element text small" type="text" maxlength="255" value="<?php echo $this->_tpl_vars['fase_data_fim']; ?>
"/>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['fase_data_fim_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['fase_data_fim_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="fase_cod" type="hidden" value="<?php echo $this->_tpl_vars['fase_cod']; ?>
"/>
									<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>