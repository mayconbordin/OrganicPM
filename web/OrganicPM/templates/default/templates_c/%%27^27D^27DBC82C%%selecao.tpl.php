<?php /* Smarty version 2.6.26, created on 2010-06-08 03:06:05
         compiled from content%5Cselecao.tpl */ ?>
					<div id="cand_form">
						<h2>Sele��o</h2>
						<?php if ($this->_tpl_vars['selecao_erro']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'error','msgText' => "C�digo inv�lido.",'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php else: ?>
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Descri��o:</td>
									<td><?php echo $this->_tpl_vars['descricao']; ?>
</td>
								</tr>
								<tr>
									<td>Data de In�cio:</td>
									<td><?php echo $this->_tpl_vars['data_inicio']; ?>
</td>
								</tr>
								<tr>
									<td>Data de T�rmino:</td>
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
					</div>