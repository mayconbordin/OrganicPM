<?php /* Smarty version 2.6.26, created on 2010-06-08 09:03:40
         compiled from content%5Cfases.tpl */ ?>
					<div id="cand_form">
						<h2>Fase</h2>
						<?php if ($this->_tpl_vars['fase_erro']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "Fase não encontrada ou finalizada.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php else: ?>
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Tipo:</td>
									<td><?php echo $this->_tpl_vars['fase']; ?>
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
								<tr>
									<td>Status:</td>
									<td><?php echo $this->_tpl_vars['status']; ?>
</td>
								</tr>
							</tbody>
						</table>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['teste']): ?>
						<a class="inscrever" href="teste.php?id=<?php echo $this->_tpl_vars['cod']; ?>
" title="">Realizar teste</a>
						<?php endif; ?>
					</div>