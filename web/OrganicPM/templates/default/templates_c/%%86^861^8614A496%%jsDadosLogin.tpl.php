<?php /* Smarty version 2.6.26, created on 2010-06-11 15:37:09
         compiled from forms%5Ccurriculo_candidato%5CjsDadosLogin.tpl */ ?>
				<?php echo '
				$(\'#usuario,#data_registro\').attr(\'disabled\', \'disabled\');
				
				'; ?>

					<?php if ($this->_tpl_vars['isAdmin'] === false): ?>
						<?php echo '
						$(\'#nivel_acesso\').attr(\'disabled\', \'disabled\');
						'; ?>

					<?php endif; ?>
				<?php echo '
				
				'; ?>