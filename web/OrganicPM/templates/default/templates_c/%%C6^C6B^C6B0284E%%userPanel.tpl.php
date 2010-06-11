<?php /* Smarty version 2.6.26, created on 2010-06-10 15:48:15
         compiled from content%5CuserPanel.tpl */ ?>
						<!-- Begin Panel -->
						<div id="panel">
						
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Vagas Abertas</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Cargo</th>
											<th>Vagas</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['vagas']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['vaga']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['vaga'][5]; ?>
</td>
											<td><?php echo $this->_tpl_vars['vaga'][6]; ?>
</td>
											<td><a href="vaga.php?id=<?php echo $this->_tpl_vars['vaga'][0]; ?>
" title="Detalhes">Detalhes</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="vaga.php?action=listar" title="">Todas vagas &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Fases Pendentes</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Fase</th>
											<th>Cargo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['fases']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['fase']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['fase'][6]; ?>
 (<?php echo $this->_tpl_vars['fase'][2]; ?>
 - <?php echo $this->_tpl_vars['fase'][3]; ?>
)</td>
											<td><?php echo $this->_tpl_vars['fase'][5]; ?>
</td>
											<td><a href="fase.php?id=<?php echo $this->_tpl_vars['fase'][0]; ?>
" title="Detalhes">Detalhes</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="fase.php?action=listar" title="">Todas fases &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Status das Seleções</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Processo Seletivo</th>
											<th>Status</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['processos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['proc']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['proc'][1]; ?>
</td>
											<td><?php echo $this->_tpl_vars['proc'][2]; ?>
</td>
											<td><a href="selecao.php?id=<?php echo $this->_tpl_vars['proc'][0]; ?>
" title="Detalhes">Detalhes</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="selecao.php?action=listar" title="">Todas seleções &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
						</div>
						<!-- End Panel -->