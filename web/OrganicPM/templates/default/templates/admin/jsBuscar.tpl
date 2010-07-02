					{literal}
					
						$('.addNome').click(function(){
							$('#nome').append('<td><label>Nome:</label></td><td><select name="nomeTipo[]"><option>igual</option><option>diferente</option><option>parecido</option><option>inicia com</option><option>termina com</option></select></td><td><input name="nome[]" type="text" value="" /></td><td><input class="addNome" type="button" value="+" /></td><td><select name="nomeCont[]"><option>e</option><option>ou</option></select><td>');
						});
					
					{/literal}