<?php /* Smarty version 2.6.26, created on 2010-06-07 18:45:33
         compiled from content%5Cvagas.tpl */ ?>
					<div id="cand_form">
						<h2>Vagas</h2>
						<?php if ($this->_tpl_vars['pro_sel_sucesso']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'sucess','msgText' => $this->_tpl_vars['pro_sel_sucesso'],'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						<?php if ($this->_tpl_vars['pro_sel_aviso']): ?>
							<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "message.tpl", 'smarty_include_vars' => array('msgType' => 'warning','msgText' => $this->_tpl_vars['pro_sel_aviso'],'msgVis' => 'show')));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
						<?php endif; ?>
						
						<?php if ($this->_tpl_vars['pro_sel_erro']): ?>
							<p>Processo seletivo não encontrado ou finalizado.</p>
						<?php else: ?>
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Descrição:</td>
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
								<tr>
									<td>Vagas:</td>
									<td><?php echo $this->_tpl_vars['vagas']; ?>
</td>
								</tr>
								<tr>
									<td>Cargo:</td>
									<td><?php echo $this->_tpl_vars['cargo']; ?>
</td>
								</tr>
							</tbody>
						</table>
						<a class="inscrever" href="vaga.php?id=<?php echo $this->_tpl_vars['cod']; ?>
&action=inscricao" title="Inscrever-se">Increver-se &#187;</a>
						<?php endif; ?>
					</div>