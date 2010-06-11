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
						
					var grupo_conhecimento = $('#grupo_conhecimento').val();
					var conhecimento = $('#conhecimento').val();
					var proficiencia = $('#proficiencia').val();
					
					if(checkValue(grupo_conhecimento, '#li_1') == true)
						error = true;
					if(checkValue(conhecimento, '#li_2') == true)
						error = true;
					if(checkValue(proficiencia, '#li_3') == true)
						error = true;
			
					if (error == true)
						return false;
				});
				{/literal}