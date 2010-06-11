				{literal}
				
				$('#ddd').numeric();
				$('#numero_tel').numeric();
				
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
					
					var tipo_tel = $('#tipo_tel option:selected').val();
					var ddd = $('#ddd').val();
					var numero_tel = $('#numero_tel').val();
					
					if(checkValue(tipo_tel, '#li_12') == true)
						error = true;
					if(checkValue(ddd, '#li_9') == true)
						error = true;
					if(checkValue(numero_tel, '#li_10') == true)
						error = true;
						
					if (error == true)
						return false;
				});
				
				{/literal}