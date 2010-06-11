<?php /* Smarty version 2.6.26, created on 2010-06-07 15:45:55
         compiled from content%5Ctable.tpl */ ?>
						<h1 class="table_title"><?php echo $this->_tpl_vars['tableTitle']; ?>
</h1>
						<?php if ($this->_tpl_vars['novo']): ?>
						<a class="novo_link" href="<?php echo $this->_tpl_vars['novo_link']; ?>
" title="Novo Registro">Novo Registro</a>
						<?php endif; ?>
						<table cellspacing="1" class="tablesorter"> 
							<thead> 
								<tr>
									<?php $_from = $this->_tpl_vars['columns']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['col']):
?>
									<th><?php echo $this->_tpl_vars['col']; ?>
</th>
									<?php endforeach; endif; unset($_from); ?>
									<th>Ações</th>
									
								</tr> 
							</thead> 
							<tbody>
								<?php $_from = $this->_tpl_vars['data']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['i'] => $this->_tpl_vars['dt']):
?>
								<tr>
									<?php if ($this->_tpl_vars['i']%2 == 0): ?>
									
									<?php $_from = $this->_tpl_vars['dt']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
									<td><?php echo $this->_tpl_vars['row']; ?>
</td>
									<?php endforeach; endif; unset($_from); ?>
									
									<?php if ($this->_tpl_vars['detalhes']): ?>
									<td>
										<a href="<?php echo $this->_tpl_vars['detalhes']; ?>
.php?id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Detalhes">Detalhes</a>
									</td>
									<?php else: ?>
									<td>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=editar&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=deletar&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									<?php endif; ?>
									
									<?php else: ?>
									<?php $_from = $this->_tpl_vars['dt']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
									<td class="row"><?php echo $this->_tpl_vars['row']; ?>
</td>
									<?php endforeach; endif; unset($_from); ?>
									<?php if ($this->_tpl_vars['detalhes']): ?>
									<td class="row">
										<a href="<?php echo $this->_tpl_vars['detalhes']; ?>
.php?id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Detalhes">Detalhes</a>
									</td>
									<?php else: ?>
									<td class="row">
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=editar&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=deletar&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									<?php endif; ?>								
									<?php endif; ?>
									
								</tr>
								<?php endforeach; endif; unset($_from); ?>
							</tbody> 
						</table>
						
						<?php echo $this->_tpl_vars['pagination']; ?>