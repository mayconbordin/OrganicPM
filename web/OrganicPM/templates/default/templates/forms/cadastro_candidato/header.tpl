		<link type="text/css" href="{#cssLibDir#}themes/base/jquery.ui.all.css" rel="stylesheet" />
		<link rel="stylesheet" href="{#templateDir#}resources/css/cadastro_candidato.css" type="text/css" id="" media="print, projection, screen" />
		<script type="text/javascript" src="{#jsLibDir#}jquery.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.validate.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.core.js"></script> 
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.widget.js"></script> 
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.datepicker.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.ui.tabs.js"></script>
		<script type="text/javascript" src="{#jsLibDir#}jquery.alphanumeric.js"></script>
		
		{literal}
		<script type="text/javascript">
			$(document).ready(function()
				{
					//Tab principal
					$("#tabs").tabs();
					
					//==================
					// Inputs validation
					//==================
					$('#cpf').numeric();
					$('#numero').numeric();
					$('#cep').numeric();
					$('#ddd').numeric();
					$('#numero_tel').numeric();
					$('#carga_horaria').numeric();
					$('#ref_telefone').numeric();
					
					//====================================================================
					// #tabs-1 (Dados Pessoais)
					//====================================================================
					$("#tabs-1 #data_nascimento").datepicker({ dateFormat: 'dd/mm/yy' });
					 
					$('#tabs-1 #next').click(function(){
						var error = false;
						
						var nome = $('#nome').val();
						var email = $('#email').val();
						var cpf = $('#cpf').val();
						var data_nascimento = $('#data_nascimento').val();
						var naturalidade = $('#naturalidade').val();
						var sexo = $('input[name=sexo]:checked').val();
						var estado_civil = $('#estado_civil option:selected').val();
						
						//falta checkbox sexo
						
						if (!nome)
							{
								$('#tabs-1 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_1 .error').show();
							}
						else
							$('#tabs-1 #li_1 .error').hide();
							
							
						if (!email)
							{
								$('#tabs-1 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_2 .error').show();
							}
						else
							$('#tabs-1 #li_2 .error').hide();
							
						if (!cpf)
							{
								$('#tabs-1 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_3 .error').show();
							}
						else
							$('#tabs-1 #li_3 .error').hide();
							
						if (!data_nascimento)
							{
								$('#tabs-1 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_4 .error').show();
							}
						else
							$('#tabs-1 #li_4 .error').hide();

						if (!estado_civil)
							{
								$('#tabs-1 #li_8 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_8 .error').show();
							}
						else
							$('#tabs-1 #li_8 .error').hide();
							
						if (!naturalidade)
							{
								$('#tabs-1 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_5 .error').show();
							}
						else
							$('#tabs-1 #li_5 .error').hide();
							
						if (!sexo)
							{
								$('#tabs-1 #li_6 .error').html("Preenchimento obrigatório");
								$('#tabs-1 #li_6 .error').show();
							}
						else
							$('#tabs-1 #li_6 .error').hide();
						
						if (!nome || !email || !cpf || !data_nascimento || !naturalidade)
							error = true;
						
						if (error == false)
							{														
								var $tabs = $('#tabs').tabs();
								$tabs.tabs('select', 1);
							}
						/*else
							alert("Preencha todos os campos");*/
							
						return false;
					});
					
					//====================================================================
					// #tabs-2 (Endereço)
					//====================================================================
					$('#tabs-2 #add').click(function(){
						$('#contatos').fadeIn("slow");
					});
					
					var clearContatos = function() {
						$('#tipo_tel').val("");
						$('#ddd').val("");
						$('#numero_tel').val("");
					}
					
					$('#tabs-2 #cancel').click(function(){
						$('#contatos').fadeOut("slow");
						$('#tabs-2 #li_12 .error').hide();
						$('#tabs-2 #li_9 .error').hide();
						$('#tabs-2 #li_10 .error').hide();
						clearContatos();
					});
					
					$('#tabs-2 #clear').click(function(){
						clearContatos();
					});
					
					$('#tabs-2 #save').click(function(){
						var error = false;
						var tipo_tel = $('#tipo_tel option:selected').val();
						var ddd = $('#ddd').val();
						var numero_tel = $('#numero_tel').val();
						
						if (!tipo_tel)
							{
								$('#tabs-2 #li_12 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_12 .error').show();
							}
						else
							$('#tabs-2 #li_12 .error').hide();
							
						if (!ddd)
							{
								$('#tabs-2 #li_9 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_9 .error').show();
							}
						else
							$('#tabs-2 #li_9 .error').hide();
							
						if (!numero_tel)
							{
								$('#tabs-2 #li_10 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_10 .error').show();
							}
						else
							$('#tabs-2 #li_10 .error').hide();
											
						if (!tipo_tel || !ddd || !numero_tel)
							error = true;
							
						if (error == false)
							{							
								var tipo_tel_tipo = $('#tipo_tel option:selected').html();

								var html = '<tr><td>'
								+tipo_tel_tipo+'<input name="tipo_tel[]" type="hidden" value="'+tipo_tel_tipo+'" /></td><td>'
								+ddd+'<input name="ddd[]" type="hidden" value="'+ddd+'" /></td><td>'
								+numero_tel+'<input name="numero_tel[]" type="hidden" value="'+numero_tel+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-2 .tablesorter tbody').append(html);
								
								$('#tabs-2 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#contatos').fadeOut("slow");
								
								//limpa os campos
								clearContatos();
							}
							
						return false;
					});
					
					$('#tabs-2 #next').click(function(){
						var error = false;
											
						var endereco = $('#endereco').val();
						var numero = $('#numero').val();
						var complemento = $('#complemento').val();
						var cep = $('#cep').val();
						var bairro = $('#bairro').val();
						var cidade = $('#cidade').val();
						var uf = $('#uf option:selected').val();
						var pais = $('#pais').val();
						
						if (!endereco)
							{
								$('#tabs-2 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_1 .error').show();
							}
						else
							$('#tabs-2 #li_1 .error').hide();
							
						if (!numero)
							{
								$('#tabs-2 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_2 .error').show();
							}
						else
							$('#tabs-2 #li_2 .error').hide();
							
						if (!cep)
							{
								$('#tabs-2 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_4 .error').show();
							}
						else
							$('#tabs-2 #li_4 .error').hide();
							
						if (!bairro)
							{
								$('#tabs-2 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_5 .error').show();
							}
						else
							$('#tabs-2 #li_5 .error').hide();
							
						if (!cidade)
							{
								$('#tabs-2 #li_6 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_6 .error').show();
							}
						else
							$('#tabs-2 #li_6 .error').hide();
							
						if (!pais)
							{
								$('#tabs-2 #li_7 .error').html("Preenchimento obrigatório");
								$('#tabs-2 #li_7 .error').show();
							}
						else
							$('#tabs-2 #li_7 .error').hide();
						
						if (!endereco || !numero || !cep || !bairro || !cidade || !pais)
							error = true;
						
						if (error == false)
							{														
								var $tabs = $('#tabs').tabs();
								$tabs.tabs('select', 2);
							}

						return false;
							
					});
					
					//====================================================================
					// #tabs-3 (Formações Acadêmicas)
					//====================================================================
					$('#tabs-3 #add').click(function(){
						$('#form_acad').fadeIn("slow");
					});
					
					$("#tabs-3 #acad_data_inicio, #tabs-3 #acad_data_fim").datepicker({dateFormat: 'dd/mm/yy'});
					
					var clearFormacaoAcademica = function() {
						$('#curso').val("");
						$('#outro_curso').val("");
						$('#nivel').val("");
						$('#acad_data_inicio').val("");
						$('#acad_data_fim').val("");
						$('#instituicao').val("");
						$('#outra_instituicao').val("");
						$('#andamento').val("");
					}
					
					$('#tabs-3 #cancel').click(function(){
						$('#form_acad').fadeOut("slow");
						$('#tabs-3 #li_5 .error').hide();
							
						$('#tabs-3 #li_6 .error').hide();
							
						$('#tabs-3 #li_2 .error').hide();
							
						$('#tabs-3 #li_3 .error').hide();
							
						$('#tabs-3 #li_7 .error').hide();
							
						$('#tabs-3 #li_8 .error').hide();
						clearFormacaoAcademica();
					});
					
					$('#tabs-3 #clear').click(function(){
						clearFormacaoAcademica();
					});
					
					$('#tabs-3 #save').click(function(){
						var error = false;
						var curso = $('#curso option:selected').val();
						var outro_curso = $('#outro_curso').val();
						var nivel = $('#nivel option:selected').val();
						var data_inicio = $('#acad_data_inicio').val();
						var data_fim = $('#acad_data_fim').val();
						var instituicao = $('#instituicao option:selected').val();
						var outra_instituicao = $('#outra_instituicao').val();
						var andamento = $('#andamento option:selected').val();
						
						if (!curso)
							{
								$('#tabs-3 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_5 .error').show();
							}
						else
							$('#tabs-3 #li_5 .error').hide();
							
						if (!nivel)
							{
								$('#tabs-3 #li_6 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_6 .error').show();
							}
						else
							$('#tabs-3 #li_6 .error').hide();
							
						if (!data_inicio)
							{
								$('#tabs-3 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_2 .error').show();
							}
						else
							$('#tabs-3 #li_2 .error').hide();
							
						if (!data_fim)
							{
								$('#tabs-3 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_3 .error').show();
							}
						else
							$('#tabs-3 #li_3 .error').hide();
							
						if (!instituicao)
							{
								$('#tabs-3 #li_7 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_7 .error').show();
							}
						else
							$('#tabs-3 #li_7 .error').hide();
							
						if (!andamento)
							{
								$('#tabs-3 #li_8 .error').html("Preenchimento obrigatório");
								$('#tabs-3 #li_8 .error').show();
							}
						else
							$('#tabs-3 #li_8 .error').hide();
											
						if (!curso)
							if (!outro_curso)
								error = true;
						
						if (!nivel)
							error = true;
							
						if (!data_inicio)
							error = true;
							
						if (!data_fim)
							error = true;
							
						if (!andamento)
							error = true;
							
						if (!instituicao)
							if (!outra_instituicao)
								error = true;
						
						if (error == false)
							{							
								var nivel_nome = $('#nivel option:selected').html();
								var curso_nome = $('#curso option:selected').html();
								var instituicao_nome = $('#instituicao option:selected').html();
								
								var html = '<tr><td>'
								+nivel_nome+'<input name="nivel[]" type="hidden" value="'+nivel+'" /></td><td>'
								+curso_nome+'<input name="curso[]" type="hidden" value="'+curso+'" /></td><td>'
								+data_inicio+'<input name="acad_data_inicio[]" type="hidden" value="'+data_inicio+'" /></td><td>'
								+data_fim+'<input name="acad_data_fim[]" type="hidden" value="'+data_fim+'" /></td><td>'
								+instituicao_nome+'<input name="instituicao[]" type="hidden" value="'+instituicao+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-3 .tablesorter tbody').append(html);
								
								$('#tabs-3 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#form_acad').fadeOut("slow");
								
								//limpa os campos
								clearFormacaoAcademica();
							}
							
						return false;
					});
					
					//Outro curso
					$('#tabs-3 #li_5 #other').click(function(){
						$('#tabs-3 #li_1').fadeIn("slow");
					});
					
					$('#tabs-3 #li_1 #add_2').click(function(){				
						$('#curso').append('<option value="'+$('#tabs-3 #li_1 #outro_curso').val()+'" selected="selected">'+$('#tabs-3 #li_1 #outro_curso').val()+'</option>');
						$('#tabs-3 #li_1').fadeOut("slow");
					});
					
					//Outra instituição
					$('#tabs-3 #li_7 #other').click(function(){
						$('#tabs-3 #li_4').fadeIn("slow");
					});
					
					$('#tabs-3 #li_4 #add_2').click(function(){				
						$('#instituicao').append('<option value="'+$('#tabs-3 #li_4 #outra_instituicao').val()+'" selected="selected">'+$('#tabs-3 #li_4 #outra_instituicao').val()+'</option>');
						$('#tabs-3 #li_4').fadeOut("slow");
					});
					
					$('#tabs-3 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 3);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-4 (Experiências Profissionais)
					//====================================================================
					$('#tabs-4 #add').click(function(){
						$('#exp_prof').fadeIn("slow");
					});
					
					$("#tabs-4 #exp_data_inicio, #tabs-4 #exp_data_fim").datepicker({dateFormat: 'dd/mm/yy'});
					
					var clearExperiencia = function() {
						$('#empresa').val("");
						$('#funcao').val("");
						$('#atribuicoes').val("");
						$('#exp_data_inicio').val("");
						$('#exp_data_fim').val("");
						$('#setor').val("");
					}
					
					$('#tabs-4 #cancel').click(function(){
						$('#exp_prof').fadeOut("slow");
						$('#tabs-4 #li_1 .error').hide();
							
						$('#tabs-4 #li_2 .error').hide();
							
						$('#tabs-4 #li_4 .error').hide();
							
						$('#tabs-4 #li_5 .error').hide();
							
						$('#tabs-4 #li_3 .error').hide();
							
						$('#tabs-4 #li_6 .error').hide();
						clearExperiencia();
					});
					
					$('#tabs-4 #clear').click(function(){
						clearExperiencia();
					});
					
					$('#tabs-4 #save').click(function(){
						var error = false;
						var empresa = $('#empresa').val();
						var funcao = $('#funcao').val();
						var atribuicoes = $('#atribuicoes').val();
						var data_inicio = $('#exp_data_inicio').val();
						var data_fim = $('#exp_data_fim').val();
						var setor = $('#setor option:selected').val();
						
						if (!empresa)
							{
								$('#tabs-4 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_1 .error').show();
							}
						else
							$('#tabs-4 #li_1 .error').hide();
							
						if (!funcao)
							{
								$('#tabs-4 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_2 .error').show();
							}
						else
							$('#tabs-4 #li_2 .error').hide();
							
						if (!data_inicio)
							{
								$('#tabs-4 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_4 .error').show();
							}
						else
							$('#tabs-4 #li_4 .error').hide();
							
						if (!data_fim)
							{
								$('#tabs-4 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_5 .error').show();
							}
						else
							$('#tabs-4 #li_5 .error').hide();
							
						if (!atribuicoes)
							{
								$('#tabs-4 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_3 .error').show();
							}
						else
							$('#tabs-4 #li_3 .error').hide();
							
						if (!setor)
							{
								$('#tabs-4 #li_6 .error').html("Preenchimento obrigatório");
								$('#tabs-4 #li_6 .error').show();
							}
						else
							$('#tabs-4 #li_6 .error').hide();
											
						if (!empresa)
							error = true;
						
						if (!funcao)
							error = true;
							
						if (!data_inicio)
							error = true;
							
						if (!data_fim)
							error = true;
							
						if (!atribuicoes)
							error = true;
							
						if (!setor)
							error = true;
						
						if (error == false)
							{							
								var setor_nome = $('#setor option:selected').html();
								
								var html = '<tr><td>'
								+empresa+'<input name="empresa[]" type="hidden" value="'+empresa+'" /></td><td>'
								+funcao+'<input name="funcao[]" type="hidden" value="'+funcao+'" /></td><td>'
								+atribuicoes+'<input name="atribuicoes[]" type="hidden" value="'+atribuicoes+'" /></td><td>'
								+data_inicio+'<input name="exp_data_inicio[]" type="hidden" value="'+data_inicio+'" /></td><td>'
								+data_fim+'<input name="exp_data_fim[]" type="hidden" value="'+data_fim+'" /></td><td>'
								+setor_nome+'<input name="setor[]" type="hidden" value="'+setor+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-4 .tablesorter tbody').append(html);
								
								$('#tabs-4 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#exp_prof').fadeOut("slow");
								
								//limpa os campos
								clearExperiencia();
							}
							
						return false;
					});
					
					$('#tabs-4 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 4);
						return false;
					});
					
					
					//====================================================================
					// #tabs-5 (Formações Adicionais)
					//====================================================================
					$('#tabs-5 #add').click(function(){
						$('#form_adic').fadeIn("slow");
					});
					
					$("#tabs-5 #adic_data_inicio, #tabs-5 #adic_data_fim").datepicker({dateFormat: 'dd/mm/yy'});
					
					var clearFormacaoAdicional = function() {
						$('#tipo').val("");
						$('#adic_curso').val("");
						$('#adic_data_inicio').val("");
						$('#adic_data_fim').val("");
						$('#carga_horaria').val("");
						$('#adic_instituicao').val("");
						$('#adic_outra_instituicao').val("");
					}
					
					$('#tabs-5 #cancel').click(function(){
						$('#form_adic').fadeOut("slow");
						$('#tabs-5 #li_1 .error').hide();
						
						$('#tabs-5 #li_2 .error').hide();
							
						$('#tabs-5 #li_3 .error').hide();
							
						$('#tabs-5 #li_4 .error').hide();
							
						$('#tabs-5 #li_5 .error').hide();
							
						$('#tabs-5 #li_6 .error').hide();
							
						$('#tabs-5 #li_7 .error').hide();
						clearFormacaoAdicional();
					});
					
					$('#tabs-5 #clear').click(function(){
						clearFormacaoAdicional();
					});
					
					$('#tabs-5 #save').click(function(){
						var error = false;
						
						var tipo = $('#tipo').val();
						var curso = $('#adic_curso').val();
						var data_inicio = $('#adic_data_inicio').val();
						var data_fim = $('#adic_data_fim').val();
						var carga_horaria = $('#carga_horaria').val();
						var instituicao = $('#adic_instituicao option:selected').val();
						var outra_instituicao = $('#adic_outra_instituicao').val();
						
						if (!tipo)
							{
								$('#tabs-5 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_1 .error').show();
							}
						else
							$('#tabs-5 #li_1 .error').hide();
						
						if (!curso)
							{
								$('#tabs-5 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_2 .error').show();
							}
						else
							$('#tabs-5 #li_2 .error').hide();
							
						if (!data_inicio)
							{
								$('#tabs-5 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_3 .error').show();
							}
						else
							$('#tabs-5 #li_3 .error').hide();
							
						if (!data_fim)
							{
								$('#tabs-5 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_4 .error').show();
							}
						else
							$('#tabs-5 #li_4 .error').hide();
							
						if (!carga_horaria)
							{
								$('#tabs-5 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_5 .error').show();
							}
						else
							$('#tabs-5 #li_5 .error').hide();
							
						if (!instituicao)
							{
								$('#tabs-5 #li_6 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_6 .error').show();
							}
						else
							$('#tabs-5 #li_6 .error').hide();
							
						if (!outra_instituicao)
							{
								$('#tabs-5 #li_7 .error').html("Preenchimento obrigatório");
								$('#tabs-5 #li_7 .error').show();
							}
						else
							$('#tabs-5 #li_7 .error').hide();
											
						if (!tipo)
							error = true;
						
						if (!curso)
							error = true;
							
						if (!data_inicio)
							error = true;
							
						if (!data_fim)
							error = true;
							
						if (!carga_horaria)
							error = true;
							
						if (!instituicao)
							if (!outra_instituicao)
								error = true;
						
						if (error == false)
							{							
								var instituicao_nome = $('#adic_instituicao option:selected').html();
								
								var html = '<tr><td>'
								+tipo+'<input name="tipo[]" type="hidden" value="'+nivel+'" /></td><td>'
								+curso+'<input name="adic_curso[]" type="hidden" value="'+curso+'" /></td><td>'
								+data_inicio+'<input name="adic_data_inicio[]" type="hidden" value="'+data_inicio+'" /></td><td>'
								+data_fim+'<input name="adic_data_fim[]" type="hidden" value="'+data_fim+'" /></td><td>'
								+carga_horaria+'<input name="carga_horaria[]" type="hidden" value="'+carga_horaria+'" /></td><td>'
								+instituicao_nome+'<input name="adic_instituicao[]" type="hidden" value="'+instituicao+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-5 .tablesorter tbody').append(html);
								
								$('#tabs-5 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#form_adic').fadeOut("slow");
								
								//limpa os campos
								clearFormacaoAdicional();
							}
							
						return false;
					});
					
					//Outra instituição
					$('#tabs-5 #li_6 #other').click(function(){
						$('#tabs-5 #li_7').fadeIn("slow");
					});
					
					$('#tabs-5 #li_7 #add_2').click(function(){				
						$('#adic_instituicao').append('<option value="'+$('#tabs-5 #li_7 #adic_outra_instituicao').val()+'" selected="selected">'+$('#tabs-5 #li_7 #adic_outra_instituicao').val()+'</option>');
						$('#tabs-5 #li_7').fadeOut("slow");
					});
					
					$('#tabs-5 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 5);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-6 (Conhecimentos)
					//====================================================================
					$('#tabs-6 #add').click(function(){
						$('#conhec').fadeIn("slow");
					});
										
					var clearConhecimento = function() {
						$('#grupo_conhecimento').val("");
						$('#conhecimento').val("");
						$('#proficiencia').val("");
					}
					
					$('#tabs-6 #cancel').click(function(){
						$('#conhec').fadeOut("slow");
						$('#tabs-6 #li_1 .error').hide();
						
						$('#tabs-6 #li_2 .error').hide();
							
						$('#tabs-6 #li_3 .error').hide();
						clearConhecimento();
					});
					
					$('#tabs-6 #clear').click(function(){
						clearConhecimento();
					});
					
					$('#tabs-6 #save').click(function(){
						var error = false;
						
						var grupo_conhecimento = $('#grupo_conhecimento').val();
						var conhecimento = $('#conhecimento').val();
						var proficiencia = $('#proficiencia').val();
						
						if (!grupo_conhecimento)
							{
								$('#tabs-6 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-6 #li_1 .error').show();
							}
						else
							$('#tabs-6 #li_1 .error').hide();
						
						if (!conhecimento)
							{
								$('#tabs-6 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-6 #li_2 .error').show();
							}
						else
							$('#tabs-6 #li_2 .error').hide();
							
						if (!proficiencia)
							{
								$('#tabs-6 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-6 #li_3 .error').show();
							}
						else
							$('#tabs-6 #li_3 .error').hide();
										
						if (!grupo_conhecimento)
							error = true;
						
						if (!proficiencia)
							error = true;
							
						if (!conhecimento)
							error = true;
							
						if (error == false)
							{															
								var html = '<tr><td>'
								+grupo_conhecimento+'<input name="grupo_conhecimento[]" type="hidden" value="'+grupo_conhecimento+'" /></td><td>'
								+conhecimento+'<input name="conhecimento[]" type="hidden" value="'+conhecimento+'" /></td><td>'
								+proficiencia+'<input name="proficiencia[]" type="hidden" value="'+proficiencia+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-6 .tablesorter tbody').append(html);
								
								$('#tabs-6 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#conhec').fadeOut("slow");
								
								//limpa os campos
								clearConhecimento();
							}
							
						return false;
					});
					
					$('#tabs-6 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 6);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-7 (Idiomas)
					//====================================================================
					$('#tabs-7 #add').click(function(){
						$('#idioma_tab').fadeIn("slow");
					});
										
					var clearIdiomas = function() {
						$('#idioma').val("");
						$('#leitura').val("");
						$('#conversacao').val("");
						$('#escrita').val("");
					}
					
					$('#tabs-7 #cancel').click(function(){
						$('#idioma_tab').fadeOut("slow");
						$('#tabs-7 #li_1 .error').hide();
						
						$('#tabs-7 #li_2 .error').hide();
							
						$('#tabs-7 #li_3 .error').hide();
							
						$('#tabs-7 #li_4 .error').hide();
						clearIdiomas();
					});
					
					$('#tabs-7 #clear').click(function(){
						clearIdiomas();
					});
					
					$('#tabs-7 #save').click(function(){
						var error = false;
						
						var idioma = $('#idioma option:selected').val();
						var leitura = $('#leitura option:selected').val();
						var conversacao = $('#conversacao option:selected').val();
						var escrita = $('#escrita option:selected').val();
						
						if (!idioma)
							{
								$('#tabs-7 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-7 #li_1 .error').show();
							}
						else
							$('#tabs-7 #li_1 .error').hide();
						
						if (!leitura)
							{
								$('#tabs-7 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-7 #li_2 .error').show();
							}
						else
							$('#tabs-7 #li_2 .error').hide();
							
						if (!conversacao)
							{
								$('#tabs-7 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-7 #li_3 .error').show();
							}
						else
							$('#tabs-7 #li_3 .error').hide();
							
						if (!escrita)
							{
								$('#tabs-7 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-7 #li_4 .error').show();
							}
						else
							$('#tabs-7 #li_4 .error').hide();
										
						if (!idioma)
							error = true;
						
						if (!leitura)
							error = true;
							
						if (!conversacao)
							error = true;
							
						if (!escrita)
							error = true;
							
						if (error == false)
							{															
								var idioma_nome = $('#idioma option:selected').html();
								var leitura_nome = $('#leitura option:selected').html();
								var conversacao_nome = $('#conversacao option:selected').html();
								var escrita_nome = $('#escrita option:selected').html();
								
								var html = '<tr><td>'
								+idioma_nome+'<input name="idioma[]" type="hidden" value="'+idioma+'" /></td><td>'
								+leitura_nome+'<input name="leitura[]" type="hidden" value="'+leitura+'" /></td><td>'
								+conversacao_nome+'<input name="conversacao[]" type="hidden" value="'+conversacao+'" /></td><td>'
								+escrita_nome+'<input name="escrita[]" type="hidden" value="'+escrita+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-7 .tablesorter tbody').append(html);
								
								$('#tabs-7 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#idioma_tab').fadeOut("slow");
								
								//limpa os campos
								clearIdiomas();
							}
							
						return false;
					});
					
					$('#tabs-7 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 7);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-8 (Referências)
					//====================================================================
					$('#tabs-8 #add').click(function(){
						$('#referencia').fadeIn("slow");
					});
										
					var clearReferencia = function() {
						$('#ref_nome').val("");
						$('#ref_empresa').val("");
						$('#ref_vinculo').val("");
						$('#ref_telefone').val("");
						$('#ref_email').val("");
					}
					
					$('#tabs-8 #cancel').click(function(){
						$('#referencia').fadeOut("slow");
						$('#tabs-8 #li_1 .error').hide();
						
						$('#tabs-8 #li_2 .error').hide();
							
						$('#tabs-8 #li_3 .error').hide();
							
						$('#tabs-8 #li_4 .error').hide();
							
						$('#tabs-8 #li_5 .error').hide();
						clearReferencia();
					});
					
					$('#tabs-8 #clear').click(function(){
						clearReferencia();
					});
					
					$('#tabs-8 #save').click(function(){
						var error = false;
						
						var nome = $('#ref_nome').val();
						var empresa = $('#ref_empresa').val();
						var vinculo = $('#ref_vinculo').val();
						var telefone = $('#ref_telefone').val();
						var email = $('#ref_email').val();
						
						if (!nome)
							{
								$('#tabs-8 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-8 #li_1 .error').show();
							}
						else
							$('#tabs-8 #li_1 .error').hide();
						
						if (!empresa)
							{
								$('#tabs-8 #li_2 .error').html("Preenchimento obrigatório");
								$('#tabs-8 #li_2 .error').show();
							}
						else
							$('#tabs-8 #li_2 .error').hide();
							
						if (!vinculo)
							{
								$('#tabs-8 #li_3 .error').html("Preenchimento obrigatório");
								$('#tabs-8 #li_3 .error').show();
							}
						else
							$('#tabs-8 #li_3 .error').hide();
							
						if (!telefone)
							{
								$('#tabs-8 #li_4 .error').html("Preenchimento obrigatório");
								$('#tabs-8 #li_4 .error').show();
							}
						else
							$('#tabs-8 #li_4 .error').hide();
							
						if (!email)
							{
								$('#tabs-8 #li_5 .error').html("Preenchimento obrigatório");
								$('#tabs-8 #li_5 .error').show();
							}
						else
							$('#tabs-8 #li_5 .error').hide();
										
						if (!nome)
							error = true;
						
						if (!empresa)
							error = true;
							
						if (!vinculo)
							error = true;
							
						if (!telefone)
							error = true;
							
						if (!email)
							error = true;
							
						if (error == false)
							{															
								var html = '<tr><td>'
								+nome+'<input name="ref_nome[]" type="hidden" value="'+nome+'" /></td><td>'
								+empresa+'<input name="ref_empresa[]" type="hidden" value="'+empresa+'" /></td><td>'
								+vinculo+'<input name="ref_vinculo[]" type="hidden" value="'+vinculo+'" /></td><td>'
								+telefone+'<input name="ref_telefone[]" type="hidden" value="'+telefone+'" /></td><td>'
								+email+'<input name="ref_email[]" type="hidden" value="'+email+'" /></td><td>'
								+'<input class="delete" type="button" value="Remover" /></td></tr>';
												
								$('#tabs-8 .tablesorter tbody').append(html);
								
								$('#tabs-8 .delete').click(function(){
									$(this).parent().parent().remove();
								});
								
								$('#referencia').fadeOut("slow");
								
								//limpa os campos
								clearReferencia();
							}
						else
							alert("erro");
							
						return false;
					});
					
					$('#tabs-8 #next').click(function(){
						var $tabs = $('#tabs').tabs();
						$tabs.tabs('select', 8);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-9 (Acesso)
					//====================================================================

					$('#tabs-9 #submit').click(function(){
						var error = false;
						
						var usuario = $('#usuario').val();
						var senha = $('#senha').val();
						var senha_conf = $('#senha_conf').val();
						
						if (!usuario)
							{
								$('#tabs-9 #li_1 .error').html("Preenchimento obrigatório");
								$('#tabs-9 #li_1 .error').show();
								error = true;
							}
						else
							$('#tabs-9 #li_1 .error').hide();
							
						if (!senha || senha.lenght < 5)
							{
								if (!senha)
									$('#tabs-9 #li_2 .error').html("Preenchimento obrigatório");
								else if (senha.lenght < 5)
									$('#tabs-9 #li_2 .error').html("A senha precisa ter no mínimo 5 caracteres");
									
								$('#tabs-9 #li_2 .error').show();
								error = true;
							}
						else
							$('#tabs-9 #li_2 .error').hide();
							
						if (!senha_conf || senha_conf != senha)
							{
								if (!senha_conf)
									$('#tabs-9 #li_3 .error').html("Preenchimento obrigatório");
								else if (senha_conf != senha)
									$('#tabs-9 #li_3 .error').html("A senha não é igual");
									
								$('#tabs-9 #li_3 .error').show();
								error = true;
							}
						else
							$('#tabs-9 #li_3 .error').hide();
							
						if (error == true)
							return false;
					});

				});
		</script>
		{/literal}