<?php /* Smarty version 2.6.26, created on 2010-06-11 14:04:58
         compiled from forms%5Ccurriculo_candidato%5CjsContatos.tpl */ ?>
				<?php echo '
				
				$(\'#ddd\').numeric();
				$(\'#numero_tel\').numeric();
				
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
					
					var tipo_tel = $(\'#tipo_tel option:selected\').val();
					var ddd = $(\'#ddd\').val();
					var numero_tel = $(\'#numero_tel\').val();
					
					if(checkValue(tipo_tel, \'#li_12\') == true)
						error = true;
					if(checkValue(ddd, \'#li_9\') == true)
						error = true;
					if(checkValue(numero_tel, \'#li_10\') == true)
						error = true;
						
					if (error == true)
						return false;
				});
				
				'; ?>