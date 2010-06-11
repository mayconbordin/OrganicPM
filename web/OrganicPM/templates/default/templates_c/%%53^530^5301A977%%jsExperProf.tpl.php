<?php /* Smarty version 2.6.26, created on 2010-06-11 14:15:58
         compiled from forms%5Ccurriculo_candidato%5CjsExperProf.tpl */ ?>
				<?php echo '
				$("#exp_data_inicio, #exp_data_fim").datepicker({dateFormat: \'dd/mm/yy\'});
				
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
					
					var ep_empresa = $(\'#empresa\').val();
					var ep_funcao = $(\'#funcao\').val();
					var ep_atribuicoes = $(\'#atribuicoes\').val();
					var ep_data_inicio = $(\'#exp_data_inicio\').val();
					var ep_data_fim = $(\'#exp_data_fim\').val();
					var ep_setor = $(\'#setor option:selected\').val();
					
					if(checkValue(ep_empresa, \'#li_1\') == true)
						error = true;
					if(checkValue(ep_funcao, \'#li_2\') == true)
						error = true;
					if(checkValue(ep_atribuicoes, \'#li_3\') == true)
						error = true;
					if(checkValue(ep_data_inicio, \'#li_4\') == true)
						error = true;
					if(checkValue(ep_data_fim, \'#li_5\') == true)
						error = true;
					if(checkValue(ep_setor, \'#li_6\') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				'; ?>