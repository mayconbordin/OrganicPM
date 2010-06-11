<?php /* Smarty version 2.6.26, created on 2010-06-11 14:38:02
         compiled from forms%5Ccurriculo_candidato%5CjsIdiomas.tpl */ ?>
				<?php echo '
				
				function checkValue(val, id)
					{
						if (!val)
							{
								$(id+\' .error\').html("Preenchimento obrigatório");
								$(id+\' .error\').show();
								return true;
							}
						else
							{
								$(id+\' .error\').hide();
							}
					}
				
				$(\'#submit\').click(function(){
					var error = false;
						
					var idioma = $(\'#idioma option:selected\').val();
					var leitura = $(\'#leitura option:selected\').val();
					var conversacao = $(\'#conversacao option:selected\').val();
					var escrita = $(\'#escrita option:selected\').val();
					
					if(checkValue(idioma, \'#li_1\') == true)
						error = true;
					if(checkValue(leitura, \'#li_2\') == true)
						error = true;
					if(checkValue(conversacao, \'#li_3\') == true)
						error = true;
					if(checkValue(escrita, \'#li_4\') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				'; ?>