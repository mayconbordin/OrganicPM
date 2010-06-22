<?php /* Smarty version 2.6.26, created on 2010-06-18 11:35:48
         compiled from admin%5CedicaoAlternativa.tpl */ ?>
							<form id="cand_form" class="appnitro" action="alterAlternativa.php" method="post">
								<h2>Alternativa</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<ul>
									<li id="li_3" >
										<label class="description" for="alternativa">Alternativa: </label>
										<div>
											<input id="alternativa" name="alternativa" type="text" value="<?php echo $this->_tpl_vars['alternativa']; ?>
" />
											<p class="error"></p>
											<?php if ($this->_tpl_vars['alternativa_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['alternativa_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
			
									<li id="li_5" >
										<label class="description" for="resposta">Resposta: </label>
										<div>
										<select class="element select medium" id="resposta" name="resposta"> 
											<option value="" selected="selected"></option>
											<?php $_from = $this->_tpl_vars['valores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['val']):
?>
											<?php if ($this->_tpl_vars['resposta'] == $this->_tpl_vars['val']['VAL_GAB_COD']): ?>
											<option value="<?php echo $this->_tpl_vars['val']['VAL_GAB_COD']; ?>
" selected="selected"><?php echo $this->_tpl_vars['val']['VALOR']; ?>
</option>
											<?php else: ?>
											<option value="<?php echo $this->_tpl_vars['val']['VAL_GAB_COD']; ?>
"><?php echo $this->_tpl_vars['val']['VALOR']; ?>
</option>
											<?php endif; ?>
											<?php endforeach; endif; unset($_from); ?>
										</select>
										<p class="error"></p>
										<?php if ($this->_tpl_vars['resposta_erro']): ?>
										<p class="form_error"><?php echo $this->_tpl_vars['resposta_erro']; ?>
</p>
										<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="alt_que_cod" type="hidden" value="<?php echo $this->_tpl_vars['alt_que_cod']; ?>
"/>
									<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>