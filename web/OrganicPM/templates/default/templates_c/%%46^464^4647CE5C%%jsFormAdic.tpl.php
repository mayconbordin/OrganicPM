<?php /* Smarty version 2.6.26, created on 2010-06-11 14:34:53
         compiled from forms%5Ccurriculo_candidato%5CjsFormAdic.tpl */ ?>
				<?php echo '
				
				$("#adic_data_inicio, #adic_data_fim").datepicker({dateFormat: \'dd/mm/yy\'});

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
						
					var fad_tipo = $(\'#tipo\').val();
					var fad_curso = $(\'#adic_curso\').val();
					var fad_data_inicio = $(\'#adic_data_inicio\').val();
					var fad_data_fim = $(\'#adic_data_fim\').val();
					var fad_carga_horaria = $(\'#carga_horaria\').val();
					var fad_instituicao = $(\'#adic_instituicao option:selected\').val();
					var fad_outra_instituicao = $(\'#adic_outra_instituicao\').val();
					
					if(checkValue(fad_tipo, \'#li_1\') == true)
						error = true;
					if(checkValue(fad_curso, \'#li_2\') == true)
						error = true;
					if(checkValue(fad_data_inicio, \'#li_3\') == true)
						error = true;
					if(checkValue(fad_data_fim, \'#li_4\') == true)
						error = true;
					if(checkValue(fad_carga_horaria, \'#li_5\') == true)
						error = true;
					if(checkValue(fad_instituicao, \'#li_6\') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				
				//Outra instituição
				$(\'#li_6 #other\').click(function(){
					$(\'#li_7\').fadeIn("slow");
				});
				
				$(\'#li_7 #add_2\').click(function(){				
					$(\'#adic_instituicao\').append(\'<option value="\'+$(\'#li_7 #adic_outra_instituicao\').val()+\'" selected="selected">\'+$(\'#li_7 #adic_outra_instituicao\').val()+\'</option>\');
					$(\'#li_7\').fadeOut("slow");
				});
				'; ?>