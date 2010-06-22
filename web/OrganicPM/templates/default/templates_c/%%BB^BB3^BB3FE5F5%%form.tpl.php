<?php /* Smarty version 2.6.26, created on 2010-06-12 09:02:12
         compiled from teste%5Cform.tpl */ ?>
					<?php if ($this->_tpl_vars['status_teste']): ?>
						<div id="teste">
						<form action="gravarTeste.php" method="post">
						
						<?php $_from = $this->_tpl_vars['questoes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['que']):
?>
						<div class="question">
							<table width="75%" align="center" border="0">
								<tbody>
									<tr>
										<td align="center">
											<table width="100%" cellspacing="0">
												<tbody>
														<tr>
															<td class="questiontext">
																<?php echo $this->_tpl_vars['que']['DESCRICAO']; ?>

															</td>
														</tr>
													<tr>
														<td class="answer">
															<ul>
																<?php if ($this->_tpl_vars['que']['TIP_QUE_COD'] == 3): ?>
																<?php $_from = $this->_tpl_vars['que']['ALTERNATIVAS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['alt']):
?>
																<li>
																	<input class="radio" type="radio" value="1" name="alt<?php echo $this->_tpl_vars['alt']['ALT_QUE_COD']; ?>
" />
																	<label for="" class="answertext"><?php echo $this->_tpl_vars['alt']['DESCRICAO']; ?>
</label>
																</li>
																<?php endforeach; endif; unset($_from); ?>
																<?php endif; ?>
																
																<?php if ($this->_tpl_vars['que']['TIP_QUE_COD'] == 1): ?>
																<?php $_from = $this->_tpl_vars['que']['ALTERNATIVAS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['alt']):
?>
																<li>
																	<select name="alt<?php echo $this->_tpl_vars['alt']['ALT_QUE_COD']; ?>
">
																		<option value=""></option>
																		<option value="1">Verdadeiro</option>
																		<option value="2">Falso</option>
																	</select>
																	<label for="" class="answertext"><?php echo $this->_tpl_vars['alt']['DESCRICAO']; ?>
</label>
																</li>
																<?php endforeach; endif; unset($_from); ?>
																<?php endif; ?>
																
																<?php if ($this->_tpl_vars['que']['TIP_QUE_COD'] == 2): ?>
																<?php $_from = $this->_tpl_vars['que']['ALTERNATIVAS']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['alt']):
?>
																<li>
																	<input class="checkbox" type="checkbox" value="1" name="alt<?php echo $this->_tpl_vars['alt']['ALT_QUE_COD']; ?>
" />
																	<label for="" class="answertext"><?php echo $this->_tpl_vars['alt']['DESCRICAO']; ?>
</label>
																</li>
																<?php endforeach; endif; unset($_from); ?>
																<?php endif; ?>
																
																<input type="hidden" value="<?php echo $this->_tpl_vars['que']['QUESTAO_COD']; ?>
" name="questao_cod[]" />
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<?php endforeach; endif; unset($_from); ?>
						
						<!-- Dados adicionais -->
						<input type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
" name="pessoa_cod" />
						<input type="hidden" value="<?php echo $this->_tpl_vars['fase_cod']; ?>
" name="fase_cod" />
						<input type="hidden" value="<?php echo $this->_tpl_vars['teste_cod']; ?>
" name="teste_cod" />
						
						<input type="submit" value="Enviar" />
						
						</form>
						</div>
					<?php else: ?>
					<h2>Teste já foi realizado</h2>
					<?php endif; ?>