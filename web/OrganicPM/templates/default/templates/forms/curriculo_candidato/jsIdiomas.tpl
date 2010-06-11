				{literal}
				
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
						
					var idioma = $('#idioma option:selected').val();
					var leitura = $('#leitura option:selected').val();
					var conversacao = $('#conversacao option:selected').val();
					var escrita = $('#escrita option:selected').val();
					
					if(checkValue(idioma, '#li_1') == true)
						error = true;
					if(checkValue(leitura, '#li_2') == true)
						error = true;
					if(checkValue(conversacao, '#li_3') == true)
						error = true;
					if(checkValue(escrita, '#li_4') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				{/literal}