<?php /* Smarty version 2.6.26, created on 2010-06-18 18:30:45
         compiled from admin%5Ctable3.tpl */ ?>
						<h1><?php echo $this->_tpl_vars['tableTitle']; ?>
</h1>
						
						<table cellspacing="1" class="tablesorter2"> 
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
?action=<?php echo $this->_tpl_vars['tableAction']; ?>
<?php echo $this->_tpl_vars['params'][$this->_tpl_vars['i']]; ?>
" title="<?php echo $this->_tpl_vars['titleAction']; ?>
"><?php echo $this->_tpl_vars['titleAction']; ?>
</a>
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
?action=<?php echo $this->_tpl_vars['tableAction']; ?>
<?php echo $this->_tpl_vars['params'][$this->_tpl_vars['i']]; ?>
" title="<?php echo $this->_tpl_vars['titleAction']; ?>
"><?php echo $this->_tpl_vars['titleAction']; ?>
</a>
									</td>									
									<?php endif; ?>
									
								</tr>
								<?php endforeach; endif; unset($_from); ?>
							</tbody> 
						</table>
						<?php echo $this->_tpl_vars['pagination']; ?>