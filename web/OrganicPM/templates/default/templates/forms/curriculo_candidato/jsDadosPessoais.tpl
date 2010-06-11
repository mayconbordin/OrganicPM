				{literal}
				$("#data_nascimento").datepicker({ dateFormat: 'dd/mm/yy' });
				$('#cpf').attr('disabled', 'disabled');
				
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
						
						var nome = $('#nome').val();
						var email = $('#email').val();
						var cpf = $('#cpf').val();
						var data_nascimento = $('#data_nascimento').val();
						var naturalidade = $('#naturalidade').val();
						var sexo = $('input[name=sexo]:checked').val();
						var estado_civil = $('#estado_civil option:selected').val();
						
						if(checkValue(nome, '#li_1') == true)
							error = true;
						if(checkValue(email, '#li_2') == true)
							error = true;
						if(checkValue(cpf, '#li_3') == true)
							error = true;
						if(checkValue(data_nascimento, '#li_4') == true)
							error = true;
						if(checkValue(estado_civil, '#li_8') == true)
							error = true;
						if(checkValue(naturalidade, '#li_5') == true)
							error = true;
						if(checkValue(sexo, '#li_6') == true)
							error = true;
						
						if (error == true)
							return false;
					});
				{/literal}