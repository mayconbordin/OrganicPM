<?php /* Smarty version 2.6.26, created on 2010-06-18 11:13:08
         compiled from admin%5CedicaoQuestao.tpl */ ?>
							<form id="cand_form" class="appnitro" action="alterQuestao.php" method="post">
								<h2>Questão</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<ul>
									<li id="li_3" >
										<label class="description" for="questao_descricao">Questão: </label>
										<div>
											<textarea id="questao_descricao" name="questao_descricao" class="element textarea medium"><?php echo $this->_tpl_vars['questao_descricao']; ?>
</textarea> 
											<p><span class="left"></span> caracteres restantes.</p>
											<p class="error"></p>
											<?php if ($this->_tpl_vars['questao_descricao_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['questao_descricao_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
			
									<li id="li_5" >
										<label class="description" for="questao_tipo">Tipo de Questão: </label>
										<div>
										<select class="element select medium" id="questao_tipo" name="questao_tipo"> 
											<option value="" selected="selected"></option>
											<?php $_from = $this->_tpl_vars['listTiposQuestao']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['tipoQuestao']):
?>
											<?php if ($this->_tpl_vars['questao_tipo'] == $this->_tpl_vars['tipoQuestao']['TIP_QUE_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['tipoQuestao']['TIP_QUE_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['tipoQuestao']['TIPO']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['tipoQuestao']['TIP_QUE_COD']; ?>
"><?php echo $this->_tpl_vars['tipoQuestao']['TIPO']; ?>
</option>
											<?php endif; ?>
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['questao_tipo_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['questao_tipo_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="questao_cod" type="hidden" value="<?php echo $this->_tpl_vars['questao_cod']; ?>
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