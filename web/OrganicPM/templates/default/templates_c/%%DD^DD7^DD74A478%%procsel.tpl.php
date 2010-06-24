<?php /* Smarty version 2.6.26, created on 2010-06-24 16:00:02
         compiled from report%5Cprocsel.tpl */ ?>

							<div class="report">
								<form method="get" action="relatorio.php">
									<p>
										<label>Processo Seletivo:</label>
										<select id="pro_sel_cod" name="pro_sel_cod">
										<?php $_from = $this->_tpl_vars['procSel']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?>
											<option value="<?php echo $this->_tpl_vars['p']['PRO_SEL_COD']; ?>
"><?php echo $this->_tpl_vars['p']['PRO_SEL_COD']; ?>
</option>
										<?php endforeach; endif; unset($_from); ?>
										</select>
										<input id="type" type="hidden" name="type" value="full" />
										<input id="gerarProcSel" type="submit" value="Gerar" />
									</p>
								</form>
							</div>