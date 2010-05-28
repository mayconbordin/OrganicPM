<?php /* Smarty version 2.6.26, created on 2010-05-27 10:11:21
         compiled from login%5CjsReady.tpl */ ?>
<?php echo '
				//Background
				var bgHeight = $(\'#background img\').css(\'height\').substr(0, 3);
				var height = bgHeight - 130;
				$(\'#background img\').css({\'height\' : height+\'px\'});
				
				//Login
				$(\'#signin\').click(function()
						{
							// Clean errors
							$(\'.error-message, .sucess-message, .warning-message, .info-message\').addClass(\'message-hide\');
							
							// No errors until now
							var warning = "";
							
							if($(\'#user\').val() == \'\' && $(\'#pass\').val() == \'\')
								warning = "Usuário e Senha precisam ser preenchidos.";
							else if($(\'#user\').val() == \'\')
								warning = "Usuário precisa ser preenchido.";
							else if($(\'#pass\').val() == \'\')
								warning = "Senha precisa ser preenchida.";

							if(warning != "")
								{
									$(\'.warning-message p\').html(warning);
									$(\'.warning-message\').fadeIn("slow");
									return false;
								}
							else
								$(\'.warning-message\').fadeOut("slow");

							// Merge the challenge string with the password
							var challenge = hex_sha1( hex_sha1($(\'#pass\').val()) + \''; ?>
<?php echo $this->_tpl_vars['challengeVar']; ?>
<?php echo '\');

							// Put the value inside the challenge field
							$(\'#challenge\').val(challenge);

							// Clean the pass field
							$(\'#pass\').val(\'\');
						});
						
					$("#username-input input, #password-input input").focusin(function() {
  						$(this).css({\'color\':\'#000000\'});
					});
					$("#username-input input, #password-input input").focusout(function() {
  						$(this).css(\'color\',\'#adadad\');
					});
'; ?>