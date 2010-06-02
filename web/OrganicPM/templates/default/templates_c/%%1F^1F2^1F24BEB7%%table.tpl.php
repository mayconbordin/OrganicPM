<?php /* Smarty version 2.6.26, created on 2010-06-02 11:39:37
         compiled from admin%5Ctable.tpl */ ?>
						<h1><?php echo $this->_tpl_vars['tableTitle']; ?>
</h1>
						
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
									<td>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=<?php echo $this->_tpl_vars['action']; ?>
&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=<?php echo $this->_tpl_vars['action']; ?>
&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
									<?php else: ?>
									<?php $_from = $this->_tpl_vars['dt']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
									<td class="row"><?php echo $this->_tpl_vars['row']; ?>
</td>
									<?php endforeach; endif; unset($_from); ?>
									<td class="row">
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=<?php echo $this->_tpl_vars['action']; ?>
&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="<?php echo $this->_tpl_vars['url']; ?>
?action=<?php echo $this->_tpl_vars['action']; ?>
&amp;id=<?php echo $this->_tpl_vars['dt'][0]; ?>
" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>									
									<?php endif; ?>
									
								</tr>
								<?php endforeach; endif; unset($_from); ?>
							
							<!-- 	<tr>
									<td>Celular</td>
									<td>055</td>
									<td>99321456</td>
									<td>
										<a href="#" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="#" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
								</tr>
								<tr>
									<td class="row">Celular</td>
									<td class="row">055</td>
									<td class="row">99321456</td>
									<td class="row">
										<a href="#" title="Editar" class="edit"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/edit.png" alt="Editar" width="16" height="16" /></a>
										<a href="#" title="Deletar" class="delete"><img src="<?php echo $this->_config[0]['vars']['templateDir']; ?>
resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>
									</td>
								</tr>
								-->
								
							</tbody> 
						</table>