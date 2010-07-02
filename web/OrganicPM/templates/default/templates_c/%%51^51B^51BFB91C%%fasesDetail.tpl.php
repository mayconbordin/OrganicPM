<?php /* Smarty version 2.6.26, created on 2010-06-25 10:57:35
         compiled from content%5CfasesDetail.tpl */ ?>
					<div id="cand_form">
						<h2>Fase</h2>
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<?php if ($this->_tpl_vars['fase']): ?>
								<tr>
									<td>Tipo de fase:</td>
									<td><?php echo $this->_tpl_vars['fase']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['data_inicio']): ?>
								<tr>
									<td>Data de Início da fase:</td>
									<td><?php echo $this->_tpl_vars['data_inicio']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['data_fim']): ?>
								<tr>
									<td>Data de Término da fase:</td>
									<td><?php echo $this->_tpl_vars['data_fim']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['data']): ?>
								<tr>
									<td>Data ocorrida:</td>
									<td><?php echo $this->_tpl_vars['data']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['data_agendada']): ?>
								<tr>
									<td>Data agendada:</td>
									<td><?php echo $this->_tpl_vars['data_agendada']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['nota']): ?>
								<tr>
									<td>Nota:</td>
									<td><?php echo $this->_tpl_vars['nota']; ?>
</td>
								</tr>
								<?php endif; ?>
								<?php if ($this->_tpl_vars['status']): ?>
								<tr>
									<td>Status:</td>
									<td><?php echo $this->_tpl_vars['status']; ?>
</td>
								</tr>
								<?php endif; ?>
							</tbody>
						</table>
					</div>