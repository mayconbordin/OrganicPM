				{literal}
				
				$("#acad_data_inicio, #acad_data_fim").datepicker({dateFormat: 'dd/mm/yy'});
					
				function checkValue(val, id)
					{
						if (!val)
							{
								$(id+' .error').html("Preenchimento obrigatório");
								$(id+' .error').show();
								return true;
							}
						else
							{
								$(id+' .error').hide();
							}
					}
				
				$('#submit').click(function(){
					var error = false;
					
					var fa_curso = $('#curso option:selected').val();
					var fa_outro_curso = $('#outro_curso').val();
					var fa_nivel = $('#nivel option:selected').val();
					var fa_data_inicio = $('#acad_data_inicio').val();
					var fa_data_fim = $('#acad_data_fim').val();
					var fa_instituicao = $('#instituicao option:selected').val();
					var fa_outra_instituicao = $('#outra_instituicao').val();
					var fa_andamento = $('#andamento option:selected').val();
					
					if(checkValue(fa_curso, '#li_5') == true)
						error = true;
					if(checkValue(fa_nivel, '#li_6') == true)
						error = true;
					if(checkValue(fa_data_inicio, '#li_2') == true)
						error = true;
					if(checkValue(fa_data_fim, '#li_3') == true)
						error = true;
					if(checkValue(fa_instituicao, '#li_7') == true)
						error = true;
					if(checkValue(fa_andamento, '#li_8') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				
				//Outro curso
				$('#li_5 #other').click(function(){
					$('#li_1').fadeIn("slow");
				});
				
				$('#li_1 #add_2').click(function(){				
					$('#curso').append('<option value="'+$('#li_1 #outro_curso').val()+'" selected="selected">'+$('#li_1 #outro_curso').val()+'</option>');
					$('#li_1').fadeOut("slow");
				});
				
				//Outra instituição
				$('#li_7 #other').click(function(){
					$('#li_4').fadeIn("slow");
				});
				
				$('#li_4 #add_2').click(function(){				
					$('#instituicao').append('<option value="'+$('#li_4 #outra_instituicao').val()+'" selected="selected">'+$('#li_4 #outra_instituicao').val()+'</option>');
					$('#li_4').fadeOut("slow");
				});
				{/literal}