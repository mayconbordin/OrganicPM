				{literal}
				$('#numero').numeric();
				$('#cep').numeric();
				
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
										
					var endereco = $('#endereco').val();
					var numero = $('#numero').val();
					var complemento = $('#complemento').val();
					var cep = $('#cep').val();
					var bairro = $('#bairro').val();
					var cidade = $('#cidade').val();
					var uf = $('#uf option:selected').val();
					var pais = $('#pais').val();
					
					if(checkValue(endereco, '#li_1') == true)
						error = true;
						
					if(checkValue(numero, '#li_2') == true)
						error = true;
					
					if(checkValue(cep, '#li_4') == true)
						error = true;
						
					if(checkValue(bairro, '#li_5') == true)
						error = true;
						
					if(checkValue(cidade, '#li_6') == true)
						error = true;
						
					if(checkValue(pais, '#li_7') == true)
						error = true;
					
					if (error == true)
						return false;
				});
				{/literal}