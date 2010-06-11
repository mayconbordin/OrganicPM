		{literal}
		//Background
		var bgHeight = $('#background img').css('height').substr(0, 3);
		var height = bgHeight - 130;
		$('#background img').css({'height' : height+'px'});
		
		//Reajuste de largura
		var width = $(window).width() - 460;
		$('#content #content-wrapper #right').css({'width' : width+'px'});
		
		$('.item .item_title').click(function(){					
			if ($(this).parent().children('ul').css('display') == "none")
				$(this).parent().children('ul').fadeIn("slow");
			else
				$(this).parent().children('ul').fadeOut("slow");
			return false;
		});
		
		//Tabs
		$("#tabs").tabs();
		
		$('#teste_descricao').limit('300','#li_1 .left');
		$('#questao_descricao').limit('2000','#li_3 .left');
		
		function replaceAll(string, token, newtoken) {
			while (string.indexOf(token) != -1) {
		 		string = string.replace(token, newtoken);
			}
			return string;
		}
		
		////////////////////////////////////////
		// #tabs-1
		////////////////////////////////////////
		$('#tabs-1 .next').click(function() {
			
			var teste_erro = false;
			
			var teste_descricao = $('#teste_descricao').val();
			var teste_tipo = $('#teste_tipo option:selected').val();
			
			if (!teste_descricao)
				{
					$('#tabs-1 #li_1 .error').html("Preenchimento obrigatório");
					$('#tabs-1 #li_1 .error').show();
					teste_erro = true;
				}
			else
				$('#tabs-1 #li_1 .error').hide();
				
			if (!teste_tipo)
				{
					$('#tabs-1 #li_4 .error').html("Preenchimento obrigatório");
					$('#tabs-1 #li_4 .error').show();
					teste_erro = true;
				}
			else
				$('#tabs-1 #li_4 .error').hide();

			if (teste_erro == false)
				{
					var $tabs = $('#tabs').tabs();
					$tabs.tabs('select', 1);
				}
		});
		
		$('#tabs-1 .new').click(function() {
			$('#tabs-1 #li_2').fadeIn("slow");
		});
		
		$('#tabs-1 #li_2 .save').click(function() {
			var novo_tipo = $('#teste_novo_tipo').val();
			$('#teste_tipo').append('<option value="'+novo_tipo+'" >'+novo_tipo+'</option>');
			$('#teste_tipo').val(novo_tipo);
			
			$('#teste_novo_tipo').val("");
			$('#tabs-1 #li_2').fadeOut("slow");
		});
		
		$('#tabs-1 #li_2 .cancel').click(function() {
			$('#tabs-1 #li_2').fadeOut("slow");
		});
		
		////////////////////////////////////////
		// #tabs-2
		////////////////////////////////////////
		var valResposta = function() {
			$('[class*=questao_resposta]').each(function(index) {
				var cod = $('#questao_tipo option:selected').val();
			
				$(this).load("list_resp_vals.php?cod="+cod);
			});
		}
		
		var countAlt = function(){
			var count = 0;
			$('[class*=questao_resposta]').each(function(index) {
				count++;
			});
			return count;
		}
		
		$('[class*=questao_resposta]').click(function(index) {
			var cod = $('#questao_tipo option:selected').val();
		
			$(this).load("list_resp_vals.php?cod="+cod);
		});
		
		$('#questao_tipo').change(function(){
			valResposta();
		});
		
		var edit = false;
		
		var clearQuestao = function() {
			$('#questao_descricao').val("");
			$('#questao_tipo').val("");
			$('#questao-form .tablesorter tbody').html('<tr>'
			+'<td><input class="questao_alternativa" name="q_alt" type="text" value="" /></td>'
			+'<td><select class="questao_resposta element select medium" id="queAlt_0" name="tes_res"><option value="" selected="selected"></option><option value="1" >First option</option><option value="2" >Second option</option><option value="3" >Third option</option></select></td>'
			+'</tr>');
		}
		
		$('#questao-form .tablesorter .remove').click(function() {
			$(this).parent().parent().remove();
		});
		
		$('.delete').click(function(){
			$(this).parent().remove();
		});
		
		$('.edit').click(function(){
		
			edit = $(this).parent();
			
			var id = '#'+$(this).parent().attr("id")+' ';
			
			var questao_descricao = $(id+'.quest_0').val();
			var questao_tipo = $(id+'.quest_1').val();
			var questao_alternativas = $(id+'.quest_2').val();
			var questao_respostas = $(id+'.quest_3').val();
			
			
			//Split
			questao_alternativas = questao_alternativas.split('|');
			questao_respostas = questao_respostas.split('|');
			
			var alternativa = '';
									
			for (var i = 0; i < questao_alternativas.length; i++)
				{
					alternativa = alternativa + 
					'<tr>'
					+'<td><input class="questao_alternativa" name="q_alt" type="text" value="'+questao_alternativas[i]+'" /></td>'
					+'<td><select class="questao_resposta element select medium" id="queAlt_'+i+'" name="tes_res"></select></td>'
					+'<td><input class="remove" type="button" value="-" /></td>'
					+'</tr>';
				}
				
			$('#questao-form .tablesorter tbody').html(alternativa);
			
			$.ajax({
				url: "list_resp_vals.php?cod="+questao_tipo,
				success: function(data) {
					$('[class*=questao_resposta]').each(function(index) {
						$(this).html(data);
						var id = $(this).attr("id");
						$('#'+id+' option').each(function() {
							if ($(this).val() == questao_respostas[index])
								$(this).attr("selected", "selected");											
						});
					});
				}
			});
			
			$('#questao-form .tablesorter .remove').click(function() {
				$(this).parent().parent().remove();
			});

			
			$('#questao_descricao').val(questao_descricao);
			$('#questao_tipo').val(questao_tipo);
			
			
			$('#questao-form').fadeIn("slow");
		});
		
		$('#questao-form .add').click(function() {
			var count = countAlt() + 1;
		
			var alternativa = 
			'<tr>'
			+'<td><input class="questao_alternativa" name="q_alt" type="text" value="" /></td>'
			+'<td><select class="questao_resposta element select medium" id="queAlt_'+count+'" name="tes_res"></select></td>'
			+'<td><input class="remove" type="button" value="-" /></td>'
			+'</tr>';
			
			$('#questao-form .tablesorter tbody').append(alternativa);
			
			var cod = $('#questao_tipo option:selected').val();
		
			$('#queAlt_'+count).load("list_resp_vals.php?cod="+cod);
			
			$('#questao-form .tablesorter .remove').click(function() {
				$(this).parent().parent().remove();
			});
		});
		
		$('#tabs-2 .save').click(function() {
		
			var questao_erro = false;
			
			var questao_descricao = $('#questao_descricao').val();
			var questao_tipo = $('#questao_tipo option:selected').val();
			
			if (!questao_descricao)
				{
					$('#tabs-2 #li_3 .error').html("Preenchimento obrigatório");
					$('#tabs-2 #li_3 .error').show();
					questao_erro = true;
				}
			else
				$('#tabs-2 #li_3 .error').hide();
				
			if (!questao_tipo)
				{
					$('#tabs-2 #li_5 .error').html("Preenchimento obrigatório");
					$('#tabs-2 #li_5 .error').show();
					questao_erro = true;
				}
			else
				$('#tabs-2 #li_5 .error').hide();
			
			if (questao_erro == false)
				{
					var tipo = $('#questao_tipo option:selected').html();
					
					var num = $('#questao-list li').size() + 1;
					
					
					var questao_alternativas = '';
					var questao_respostas = '';
					
					$('.questao_alternativa').each(function(index) {
						if (index == 0)
							questao_alternativas = $(this).val();
						else
							questao_alternativas = questao_alternativas + '|' + $(this).val();
					});

					$('[class*=questao_resposta]').each(function(index) {
						if (index==0)
							questao_respostas = $(this).val();
						else
							questao_respostas = questao_respostas + '|' + $(this).val();
					});
					
					questao_descricao = replaceAll(questao_descricao,'"',"'");
					questao_alternativas = replaceAll(questao_alternativas,'"',"'");
					
					var html = '<li id="listItem_'+num+'">'
					+'<img src="{/literal}{#templateDir#}{literal}resources/images/arrow.png" alt="move" width="16" height="16" class="handle" />'
					+'<a href="#" title="Editar" class="edit"><img src="{/literal}{#templateDir#}{literal}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>'
					+'<a href="#" title="Deletar" class="delete"><img src="{/literal}{#templateDir#}{literal}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>'
					
					
					+'<strong>Questão '+num+' ('+questao_descricao.substr(0, 20)+')</strong>'
					+'<input class="quest_0" name="questao_descricao[]" type="hidden" value="'+questao_descricao+'"/>'
					+'<input class="quest_1" name="questao_tipo[]" type="hidden" value="'+questao_tipo+'"/>'
					+'<input class="quest_2" name="questao_alternativas[]" type="hidden" value="'+questao_alternativas+'"/>'
					+'<input class="quest_3" name="questao_respostas[]" type="hidden" value="'+questao_respostas+'"/>'
					+'</li>';
					
					if (edit != false)
						{
							var html = 
							'<img src="{/literal}{#templateDir#}{literal}resources/images/arrow.png" alt="move" width="16" height="16" class="handle" />'
							+'<a href="#" title="Editar" class="edit"><img src="{/literal}{#templateDir#}{literal}resources/images/edit.png" alt="Editar" width="16" height="16" /></a>'
							+'<a href="#" title="Deletar" class="delete"><img src="{/literal}{#templateDir#}{literal}resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>'
							
							
							+'<strong>Questão '+num+' ('+questao_descricao.substr(0, 20)+')</strong>'
							+'<input class="quest_0" name="questao_descricao[]" type="hidden" value="'+questao_descricao+'"/>'
							+'<input class="quest_1" name="questao_tipo[]" type="hidden" value="'+questao_tipo+'"/>'
							+'<input class="quest_2" name="questao_alternativas[]" type="hidden" value="'+questao_alternativas+'"/>'
							+'<input class="quest_3" name="questao_respostas[]" type="hidden" value="'+questao_respostas+'"/>';
							edit.html(html);
							edit = false;
						}
					else
						$('#questao-list').append(html);
					
					//$('#questao-list').append(html);
					
					clearQuestao();
					
					$('#questao-form').fadeOut("slow");
					
					
					$('.delete').click(function(){
						$(this).parent().remove();
					});
					
					$('.edit').click(function(){
					
						edit = $(this).parent();
						
						var id = '#'+$(this).parent().attr("id")+' ';
						
						var questao_descricao = $(id+'.quest_0').val();
						var questao_tipo = $(id+'.quest_1').val();
						var questao_alternativas = $(id+'.quest_2').val();
						var questao_respostas = $(id+'.quest_3').val();
						
						
						//Split
						questao_alternativas = questao_alternativas.split('|');
						questao_respostas = questao_respostas.split('|');
						
						var alternativa = '';
												
						for (var i = 0; i < questao_alternativas.length; i++)
							{
								alternativa = alternativa + 
								'<tr>'
								+'<td><input class="questao_alternativa" name="q_alt" type="text" value="'+questao_alternativas[i]+'" /></td>'
								+'<td><select class="questao_resposta element select medium" id="queAlt_'+i+'" name="tes_res"></select></td>'
								+'<td><input class="remove" type="button" value="-" /></td>'
								+'</tr>';
							}
							
						$('#questao-form .tablesorter tbody').html(alternativa);
						
						$.ajax({
							url: "list_resp_vals.php?cod="+questao_tipo,
							success: function(data) {
								$('[class*=questao_resposta]').each(function(index) {
									$(this).html(data);
									var id = $(this).attr("id");
									$('#'+id+' option').each(function() {
										if ($(this).val() == questao_respostas[index])
											$(this).attr("selected", "selected");											
									});
								});
							}
						});
						
						$('#questao-form .tablesorter .remove').click(function() {
							$(this).parent().parent().remove();
						});

						
						$('#questao_descricao').val(questao_descricao);
						$('#questao_tipo').val(questao_tipo);
						
						
						$('#questao-form').fadeIn("slow");
					});
				}
		});
		
		$('#tabs-2 .add').click(function() {
			$('#questao-form').fadeIn("slow");
		});
		
		$('#tabs-2 .clear').click(function() {
			clearQuestao();
		});
		
		$('#tabs-2 .cancel').click(function() {
			$('#questao-form').fadeOut("slow");
			clearQuestao();
		});
		
		
	
		$("#questao-list").sortable({
		  handle : '.handle',
		  update : function () {
			  var order = $('#fases-list').sortable('serialize');
			  //$("#info").html(order);
		  }
		});
		{/literal}