<?php /* Smarty version 2.6.26, created on 2010-06-26 00:52:58
         compiled from content%5Ctable2.tpl */ ?>
						<h1 class="table_title"><?php echo $this->_tpl_vars['tableTitle']; ?>
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
									
									<?php else: ?>
									<?php $_from = $this->_tpl_vars['dt']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row']):
?>
									<td class="row"><?php echo $this->_tpl_vars['row']; ?>
</td>
									<?php endforeach; endif; unset($_from); ?>
																	
									<?php endif; ?>
									
								</tr>
								<?php endforeach; endif; unset($_from); ?>
							</tbody> 
						</table>
						
						<?php if (! $this->_tpl_vars['logado']): ?>
						<a class="btn" href="<?php echo $this->_config[0]['vars']['root']; ?>
candidato/cadastrar.php">Cadastre-se</a>
						<a class="btn" href="<?php echo $this->_config[0]['vars']['root']; ?>
login.php">Logar</a>
						<?php endif; ?>
						
						<?php echo $this->_tpl_vars['pagination']; ?>