<?php /* Smarty version 2.6.26, created on 2010-06-18 21:17:21
         compiled from admin%5CagendarEntrevista.tpl */ ?>
							<form id="cand_form" class="appnitro" action="entrevistaFunc.php" method="post">
								<h2>Agendar Entrevista</h2>
								<?php if ($this->_tpl_vars['geral_erro']): ?>
								<p class="form_error"><?php echo $this->_tpl_vars['geral_erro']; ?>
</p>
								<?php endif; ?>
								<table cellspacing="1" class="tablesorter"> 
									<tbody>
										<tr>
											<td>Candidato:</td>
											<td><?php echo $this->_tpl_vars['nome']; ?>
</td>
										</tr>
										<tr>
											<td>Processo Seletivo:</td>
											<td><?php echo $this->_tpl_vars['descricao']; ?>
</td>
										</tr>
										<tr>
											<td>Data de Início:</td>
											<td><?php echo $this->_tpl_vars['data_inicio']; ?>
</td>
										</tr>
										<tr>
											<td>Data de Término:</td>
											<td><?php echo $this->_tpl_vars['data_fim']; ?>
</td>
										</tr>
									</tbody>
								</table>
								<ul>
									<li id="li_1" >
										<label class="description" for="data_agendada">Data agendada: </label>
										<div>
											<input id="data_agendada" name="data_agendada" type="text"  value="<?php echo $this->_tpl_vars['data_agendada']; ?>
" />
											<p class="error"></p>
											<?php if ($this->_tpl_vars['data_agendada_erro']): ?>
											<p class="form_error"><?php echo $this->_tpl_vars['data_agendada_erro']; ?>
</p>
											<?php endif; ?>
										</div> 
									</li>
									<!-- Dados Adicionais -->
									<input name="fase_cod" type="hidden" value="<?php echo $this->_tpl_vars['fase_cod']; ?>
"/>
									<input name="pessoa_cod" type="hidden" value="<?php echo $this->_tpl_vars['pessoa_cod']; ?>
"/>
									<input name="pro_sel_cod" type="hidden" value="<?php echo $this->_tpl_vars['pro_sel_cod']; ?>
"/>
									<input name="action" type="hidden" value="<?php echo $this->_tpl_vars['action']; ?>
"/>
									<input type="submit" id="submit" value="Salvar" />
								</ul>
							</form>