<?php /* Smarty version 2.6.26, created on 2010-06-26 04:03:35
         compiled from admin%5CuserPanel.tpl */ ?>
						<!-- Begin Panel -->
						<div id="panel">
						
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Processos Seletivos</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Cargo</th>
											<th>Inscritos</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['procSel']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ps']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['ps'][2]; ?>
</td>
											<td><?php echo $this->_tpl_vars['ps'][1]; ?>
</td>
											<td><a href="procseletivo.php?action=editar&id=<?php echo $this->_tpl_vars['ps'][0]; ?>
" title="Detalhes">Detalhes</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="procseletivo.php?action=listar" title="">Todos Processos Seletivos &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Entrevistas para Agendar</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Candidato</th>
											<th>Processo Seletivo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['entrevAgendar']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ag']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['ag'][0]; ?>
</td>
											<td><?php echo $this->_tpl_vars['ag'][1]; ?>
</td>
											<td><a href="entrevistas.php?action=agendar&pid=<?php echo $this->_tpl_vars['ag'][4]; ?>
&psid=<?php echo $this->_tpl_vars['ag'][5]; ?>
&fid=<?php echo $this->_tpl_vars['ag'][6]; ?>
" title="Agendar">Agendar</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="entrevistas.php?action=agendar" title="Todas entrevistas para agendar">Todas entrevistas p/ agendar &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Entrevistas para Registrar</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Candidato</th>
											<th>Processo Seletivo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										<?php $_from = $this->_tpl_vars['entrevRegistrar']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['rg']):
?>
									
										<tr>
											<td><?php echo $this->_tpl_vars['rg'][0]; ?>
</td>
											<td><?php echo $this->_tpl_vars['rg'][1]; ?>
</td>
											<td><a href="entrevistas.php?action=registrar&pid=<?php echo $this->_tpl_vars['rg'][3]; ?>
&psid=<?php echo $this->_tpl_vars['rg'][4]; ?>
&fid=<?php echo $this->_tpl_vars['rg'][5]; ?>
" title="Registrar">Registrar</a></td>
										</tr>
										
										<?php endforeach; endif; unset($_from); ?>
									</tbody>
								</table>
								<p><a href="entrevistas.php?action=registrar" title="Todas entrevistas para registrar">Todas entrevistas p/ registrar &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
						</div>
						<!-- End Panel -->