<?php /* Smarty version 2.6.26, created on 2010-06-11 14:07:45
         compiled from forms%5Ccurriculo_candidato%5CjsConhecimentos.tpl */ ?>
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
						
					var grupo_conhecimento = $(\'#grupo_conhecimento\').val();
					var conhecimento = $(\'#conhecimento\').val();
					var proficiencia = $(\'#proficiencia\').val();
					
					if(checkValue(grupo_conhecimento, \'#li_1\') == true)
						error = true;
					if(checkValue(conhecimento, \'#li_2\') == true)
						error = true;
					if(checkValue(proficiencia, \'#li_3\') == true)
						error = true;
			
					if (error == true)
						return false;
				});
				'; ?>