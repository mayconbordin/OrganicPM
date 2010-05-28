<?php /* Smarty version 2.6.26, created on 2010-05-26 10:36:36
         compiled from message.tpl */ ?>
			<?php if ($this->_tpl_vars['msgType'] == 'error'): ?>
			<div class="clear-msg"></div>
			<div class="error-message message-<?php echo $this->_tpl_vars['msgVis']; ?>
">
				<p><?php echo $this->_tpl_vars['msgText']; ?>
</p>
			</div>
			<div class="clear-msg"></div>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['msgType'] == 'sucess'): ?>
			<div class="clear-msg"></div>
			<div class="sucess-message message-<?php echo $this->_tpl_vars['msgVis']; ?>
">
				<p><?php echo $this->_tpl_vars['msgText']; ?>
</p>
			</div>
			<div class="clear-msg"></div>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['msgType'] == 'warning'): ?>
			<div class="clear-msg"></div>
			<div class="warning-message message-<?php echo $this->_tpl_vars['msgVis']; ?>
">
				<p><?php echo $this->_tpl_vars['msgText']; ?>
</p>
			</div>
			<div class="clear-msg"></div>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['msgType'] == 'info'): ?>
			<div class="clear-msg"></div>
			<div class="info-message message-<?php echo $this->_tpl_vars['msgVis']; ?>
">
				<p><?php echo $this->_tpl_vars['msgText']; ?>
</p>
			</div>
			<div class="clear-msg"></div>
			<?php endif; ?>