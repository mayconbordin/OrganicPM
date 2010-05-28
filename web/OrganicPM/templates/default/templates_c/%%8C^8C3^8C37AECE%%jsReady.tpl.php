<?php /* Smarty version 2.6.26, created on 2010-05-28 15:27:55
         compiled from forms%5Ccurriculo_candidato%5CjsReady.tpl */ ?>
		<?php echo '
					//Tab principal
					$("#tabs").tabs();

					$(\'.delete\').click(function(){
						$(this).parent().parent().remove();
					});
					
					//==================
					// Inputs validation
					//==================
					$(\'#cpf\').numeric();
					$(\'#numero\').numeric();
					$(\'#cep\').numeric();
					$(\'#ddd\').numeric();
					$(\'#numero_tel\').numeric();
					$(\'#carga_horaria\').numeric();
					$(\'#ref_telefone\').numeric();
					
					//====================================================================
					// #tabs-1 (Dados Pessoais)
					//====================================================================
					$("#tabs-1 #data_nascimento").datepicker({ dateFormat: \'dd/mm/yy\' });
					 
					$(\'#tabs-1 #next\').click(function(){
						var error = false;
						
						var nome = $(\'#nome\').val();
						var email = $(\'#email\').val();
						var cpf = $(\'#cpf\').val();
						var data_nascimento = $(\'#data_nascimento\').val();
						var naturalidade = $(\'#naturalidade\').val();
						var sexo = $(\'input[name=sexo]:checked\').val();
						var estado_civil = $(\'#estado_civil option:selected\').val();
						
						//falta checkbox sexo
						
						if (!nome)
							{
								$(\'#tabs-1 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_1 .error\').show();
							}
						else
							$(\'#tabs-1 #li_1 .error\').hide();
							
							
						if (!email)
							{
								$(\'#tabs-1 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_2 .error\').show();
							}
						else
							$(\'#tabs-1 #li_2 .error\').hide();
							
						if (!cpf)
							{
								$(\'#tabs-1 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_3 .error\').show();
							}
						else
							$(\'#tabs-1 #li_3 .error\').hide();
							
						if (!data_nascimento)
							{
								$(\'#tabs-1 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_4 .error\').show();
							}
						else
							$(\'#tabs-1 #li_4 .error\').hide();

						if (!estado_civil)
							{
								$(\'#tabs-1 #li_8 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_8 .error\').show();
							}
						else
							$(\'#tabs-1 #li_8 .error\').hide();
							
						if (!naturalidade)
							{
								$(\'#tabs-1 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_5 .error\').show();
							}
						else
							$(\'#tabs-1 #li_5 .error\').hide();
							
						if (!sexo)
							{
								$(\'#tabs-1 #li_6 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-1 #li_6 .error\').show();
							}
						else
							$(\'#tabs-1 #li_6 .error\').hide();
						
						if (!nome || !email || !cpf || !data_nascimento || !naturalidade)
							error = true;
						
						if (error == false)
							{														
								var $tabs = $(\'#tabs\').tabs();
								$tabs.tabs(\'select\', 1);
							}
						/*else
							alert("Preencha todos os campos");*/
							
						return false;
					});
					
					//====================================================================
					// #tabs-2 (Endereço)
					//====================================================================
					var contatos = false;
					
					$(\'#tabs-2 #add\').click(function(){
						$(\'#contatos\').fadeIn("slow");
					});
					
					var clearContatos = function() {
						$(\'#tipo_tel\').val("");
						$(\'#ddd\').val("");
						$(\'#numero_tel\').val("");
					}
					
					$(\'#tabs-2 #cancel\').click(function(){
						$(\'#contatos\').fadeOut("slow");
						$(\'#tabs-2 #li_12 .error\').hide();
						$(\'#tabs-2 #li_9 .error\').hide();
						$(\'#tabs-2 #li_10 .error\').hide();
						clearContatos();
					});
					
					$(\'#tabs-2 #clear\').click(function(){
						clearContatos();
					});
					
					$(\'#tabs-2 .edit\').click(function(){
						contatos = $(this).parent().parent();
						var id = \'#\'+contatos.attr("id")+\' \';
											
						var tipo_tel = $(id+\'.contatos_0\').val();
						var ddd = $(id+\'.contatos_1\').val();
						var numero_tel = $(id+\'.contatos_2\').val();
						
						$(\'#tipo_tel\').val(tipo_tel);
						$(\'#ddd\').val(ddd);
						$(\'#numero_tel\').val(numero_tel);
						
						$(\'#contatos\').fadeIn("slow");
					
					});
					
					$(\'#tabs-2 #save\').click(function(){
						var error = false;
						var tipo_tel = $(\'#tipo_tel option:selected\').val();
						var ddd = $(\'#ddd\').val();
						var numero_tel = $(\'#numero_tel\').val();
						
						if (!tipo_tel)
							{
								$(\'#tabs-2 #li_12 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_12 .error\').show();
							}
						else
							$(\'#tabs-2 #li_12 .error\').hide();
							
						if (!ddd)
							{
								$(\'#tabs-2 #li_9 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_9 .error\').show();
							}
						else
							$(\'#tabs-2 #li_9 .error\').hide();
							
						if (!numero_tel)
							{
								$(\'#tabs-2 #li_10 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_10 .error\').show();
							}
						else
							$(\'#tabs-2 #li_10 .error\').hide();
											
						if (!tipo_tel || !ddd || !numero_tel)
							error = true;
							
						if (error == false)
							{							
								var tipo_tel_tipo = $(\'#tipo_tel option:selected\').html();

								var html = \'<tr><td>\'
								+tipo_tel_tipo+\'<input name="tipo_tel[]" type="hidden" value="\'+tipo_tel_tipo+\'" /></td><td>\'
								+ddd+\'<input name="ddd[]" type="hidden" value="\'+ddd+\'" /></td><td>\'
								+numero_tel+\'<input name="numero_tel[]" type="hidden" value="\'+numero_tel+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								if (contatos != false)
									{
										contatos.remove();
										contatos = false;
									}
									
								$(\'#tabs-2 .tablesorter tbody\').append(html);
										
								
								$(\'#tabs-2 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#contatos\').fadeOut("slow");
								
								//limpa os campos
								clearContatos();
							}
							
						return false;
					});
					
					$(\'#tabs-2 #next\').click(function(){
						var error = false;
											
						var endereco = $(\'#endereco\').val();
						var numero = $(\'#numero\').val();
						var complemento = $(\'#complemento\').val();
						var cep = $(\'#cep\').val();
						var bairro = $(\'#bairro\').val();
						var cidade = $(\'#cidade\').val();
						var uf = $(\'#uf option:selected\').val();
						var pais = $(\'#pais\').val();
						
						if (!endereco)
							{
								$(\'#tabs-2 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_1 .error\').show();
							}
						else
							$(\'#tabs-2 #li_1 .error\').hide();
							
						if (!numero)
							{
								$(\'#tabs-2 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_2 .error\').show();
							}
						else
							$(\'#tabs-2 #li_2 .error\').hide();
							
						if (!cep)
							{
								$(\'#tabs-2 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_4 .error\').show();
							}
						else
							$(\'#tabs-2 #li_4 .error\').hide();
							
						if (!bairro)
							{
								$(\'#tabs-2 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_5 .error\').show();
							}
						else
							$(\'#tabs-2 #li_5 .error\').hide();
							
						if (!cidade)
							{
								$(\'#tabs-2 #li_6 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_6 .error\').show();
							}
						else
							$(\'#tabs-2 #li_6 .error\').hide();
							
						if (!pais)
							{
								$(\'#tabs-2 #li_7 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-2 #li_7 .error\').show();
							}
						else
							$(\'#tabs-2 #li_7 .error\').hide();
						
						if (!endereco || !numero || !cep || !bairro || !cidade || !pais)
							error = true;
						
						if (error == false)
							{														
								var $tabs = $(\'#tabs\').tabs();
								$tabs.tabs(\'select\', 2);
							}

						return false;
							
					});
					
					//====================================================================
					// #tabs-3 (Formações Acadêmicas)
					//====================================================================
					var formAcad = false;
					
					$(\'#tabs-3 #add\').click(function(){
						$(\'#form_acad\').fadeIn("slow");
					});
					
					$("#tabs-3 #acad_data_inicio, #tabs-3 #acad_data_fim").datepicker({dateFormat: \'dd/mm/yy\'});
					
					var clearFormacaoAcademica = function() {
						$(\'#curso\').val("");
						$(\'#outro_curso\').val("");
						$(\'#nivel\').val("");
						$(\'#acad_data_inicio\').val("");
						$(\'#acad_data_fim\').val("");
						$(\'#instituicao\').val("");
						$(\'#outra_instituicao\').val("");
						$(\'#andamento\').val("");
					}
					
					$(\'#tabs-3 #cancel\').click(function(){
						$(\'#form_acad\').fadeOut("slow");
						$(\'#tabs-3 #li_5 .error\').hide();
							
						$(\'#tabs-3 #li_6 .error\').hide();
							
						$(\'#tabs-3 #li_2 .error\').hide();
							
						$(\'#tabs-3 #li_3 .error\').hide();
							
						$(\'#tabs-3 #li_7 .error\').hide();
							
						$(\'#tabs-3 #li_8 .error\').hide();
						clearFormacaoAcademica();
					});
					
					$(\'#tabs-3 #clear\').click(function(){
						clearFormacaoAcademica();
					});
					
					$(\'#tabs-3 .edit\').click(function(){
						formAcad = $(this).parent().parent();
						var id = \'#\'+formAcad.attr("id")+\' \';
						
						var fa_curso = $(id+\'.formAcad_1\').val();
						var fa_nivel = $(id+\'.formAcad_0\').val();
						var fa_data_inicio = $(id+\'.formAcad_2\').val();
						var fa_data_fim = $(id+\'.formAcad_3\').val();
						var fa_instituicao = $(id+\'.formAcad_4\').val();
						var fa_andamento = $(id+\'.formAcad_5\').val();
						
						$(\'#curso\').val(fa_curso);
						$(\'#nivel\').val(fa_nivel);
						$(\'#acad_data_inicio\').val(fa_data_inicio);
						$(\'#acad_data_fim\').val(fa_data_fim);
						$(\'#instituicao\').val(fa_instituicao);
						$(\'#andamento\').val(fa_andamento);
						
						$(\'#form_acad\').fadeIn("slow");					
					});
					
					$(\'#tabs-3 #save\').click(function(){
						var error = false;
						var fa_curso = $(\'#curso option:selected\').val();
						var fa_outro_curso = $(\'#outro_curso\').val();
						var fa_nivel = $(\'#nivel option:selected\').val();
						var fa_data_inicio = $(\'#acad_data_inicio\').val();
						var fa_data_fim = $(\'#acad_data_fim\').val();
						var fa_instituicao = $(\'#instituicao option:selected\').val();
						var fa_outra_instituicao = $(\'#outra_instituicao\').val();
						var fa_andamento = $(\'#andamento option:selected\').val();
						
						if (!fa_curso)
							{
								$(\'#tabs-3 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_5 .error\').show();
							}
						else
							$(\'#tabs-3 #li_5 .error\').hide();
							
						if (!fa_nivel)
							{
								$(\'#tabs-3 #li_6 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_6 .error\').show();
							}
						else
							$(\'#tabs-3 #li_6 .error\').hide();
							
						if (!fa_data_inicio)
							{
								$(\'#tabs-3 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_2 .error\').show();
							}
						else
							$(\'#tabs-3 #li_2 .error\').hide();
							
						if (!fa_data_fim)
							{
								$(\'#tabs-3 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_3 .error\').show();
							}
						else
							$(\'#tabs-3 #li_3 .error\').hide();
							
						if (!fa_instituicao)
							{
								$(\'#tabs-3 #li_7 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_7 .error\').show();
							}
						else
							$(\'#tabs-3 #li_7 .error\').hide();
							
						if (!fa_andamento)
							{
								$(\'#tabs-3 #li_8 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-3 #li_8 .error\').show();
							}
						else
							$(\'#tabs-3 #li_8 .error\').hide();
											
						if (!fa_curso)
							error = true;
						
						if (!fa_nivel)
							error = true;
							
						if (!fa_data_inicio)
							error = true;
							
						if (!fa_data_fim)
							error = true;
							
						if (!fa_andamento)
							error = true;
							
						if (!fa_instituicao)
							error = true;
						
						if (error == false)
							{							
								var fa_nivel_nome = $(\'#nivel option:selected\').html();
								var fa_curso_nome = $(\'#curso option:selected\').html();
								var fa_instituicao_nome = $(\'#instituicao option:selected\').html();
								var fa_andamento_nome = $(\'#andamento option:selected\').html();
								
								var html = \'<tr><td>\'
								+fa_nivel_nome+\'<input name="nivel[]" type="hidden" value="\'+fa_nivel+\'" /></td><td>\'
								+fa_curso_nome+\'<input name="curso[]" type="hidden" value="\'+fa_curso+\'" /></td><td>\'
								+fa_data_inicio+\'<input name="acad_data_inicio[]" type="hidden" value="\'+fa_data_inicio+\'" /></td><td>\'
								+fa_data_fim+\'<input name="acad_data_fim[]" type="hidden" value="\'+fa_data_fim+\'" /></td><td>\'
								+fa_instituicao_nome+\'<input name="instituicao[]" type="hidden" value="\'+fa_instituicao+\'" /></td><td>\'
								+fa_andamento_nome+\'<input name="andamento[]" type="hidden" value="\'+fa_andamento+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
									
								if (formAcad != false)
									{
										formAcad.remove();
										formAcad = false;
									}
								
								$(\'#tabs-3 .tablesorter tbody\').append(html);
								
								$(\'#tabs-3 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#form_acad\').fadeOut("slow");
								
								//limpa os campos
								clearFormacaoAcademica();
							}
							
						return false;
					});
					
					//Outro curso
					$(\'#tabs-3 #li_5 #other\').click(function(){
						$(\'#tabs-3 #li_1\').fadeIn("slow");
					});
					
					$(\'#tabs-3 #li_1 #add_2\').click(function(){				
						$(\'#curso\').append(\'<option value="\'+$(\'#tabs-3 #li_1 #outro_curso\').val()+\'" selected="selected">\'+$(\'#tabs-3 #li_1 #outro_curso\').val()+\'</option>\');
						$(\'#tabs-3 #li_1\').fadeOut("slow");
					});
					
					//Outra instituição
					$(\'#tabs-3 #li_7 #other\').click(function(){
						$(\'#tabs-3 #li_4\').fadeIn("slow");
					});
					
					$(\'#tabs-3 #li_4 #add_2\').click(function(){				
						$(\'#instituicao\').append(\'<option value="\'+$(\'#tabs-3 #li_4 #outra_instituicao\').val()+\'" selected="selected">\'+$(\'#tabs-3 #li_4 #outra_instituicao\').val()+\'</option>\');
						$(\'#tabs-3 #li_4\').fadeOut("slow");
					});
					
					$(\'#tabs-3 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 3);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-4 (Experiências Profissionais)
					//====================================================================
					var experiencia = false;
					
					$(\'#tabs-4 #add\').click(function(){
						$(\'#exp_prof\').fadeIn("slow");
					});
					
					$("#tabs-4 #exp_data_inicio, #tabs-4 #exp_data_fim").datepicker({dateFormat: \'dd/mm/yy\'});
					
					var clearExperiencia = function() {
						$(\'#empresa\').val("");
						$(\'#funcao\').val("");
						$(\'#atribuicoes\').val("");
						$(\'#exp_data_inicio\').val("");
						$(\'#exp_data_fim\').val("");
						$(\'#setor\').val("");
					}
					
					$(\'#tabs-4 #cancel\').click(function(){
						$(\'#exp_prof\').fadeOut("slow");
						$(\'#tabs-4 #li_1 .error\').hide();
							
						$(\'#tabs-4 #li_2 .error\').hide();
							
						$(\'#tabs-4 #li_4 .error\').hide();
							
						$(\'#tabs-4 #li_5 .error\').hide();
							
						$(\'#tabs-4 #li_3 .error\').hide();
							
						$(\'#tabs-4 #li_6 .error\').hide();
						clearExperiencia();
					});
					
					$(\'#tabs-4 .edit\').click(function(){
						experiencia = $(this).parent().parent();
						var id = \'#\'+experiencia.attr("id")+\' \';
						
						var ep_empresa = $(id+\'.exp_0\').val();
						var ep_funcao = $(id+\'.exp_1\').val();
						var ep_atribuicoes = $(id+\'.exp_2\').val();
						var ep_data_inicio = $(id+\'.exp_3\').val();
						var ep_data_fim = $(id+\'.exp_4\').val();
						var ep_setor = $(id+\'.exp_5\').val();
						
						$(\'#empresa\').val(ep_empresa);
						$(\'#funcao\').val(ep_funcao);
						$(\'#atribuicoes\').val(ep_atribuicoes);
						$(\'#exp_data_inicio\').val(ep_data_inicio);
						$(\'#exp_data_fim\').val(ep_data_fim);
						$(\'#setor\').val(ep_setor);
						
						$(\'#exp_prof\').fadeIn("slow");					
					});
					
					$(\'#tabs-4 #clear\').click(function(){
						clearExperiencia();
					});
					
					$(\'#tabs-4 #save\').click(function(){
						var error = false;
						var ep_empresa = $(\'#empresa\').val();
						var ep_funcao = $(\'#funcao\').val();
						var ep_atribuicoes = $(\'#atribuicoes\').val();
						var ep_data_inicio = $(\'#exp_data_inicio\').val();
						var ep_data_fim = $(\'#exp_data_fim\').val();
						var ep_setor = $(\'#setor option:selected\').val();
						
						if (!ep_empresa)
							{
								$(\'#tabs-4 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_1 .error\').show();
							}
						else
							$(\'#tabs-4 #li_1 .error\').hide();
							
						if (!ep_funcao)
							{
								$(\'#tabs-4 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_2 .error\').show();
							}
						else
							$(\'#tabs-4 #li_2 .error\').hide();
							
						if (!ep_data_inicio)
							{
								$(\'#tabs-4 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_4 .error\').show();
							}
						else
							$(\'#tabs-4 #li_4 .error\').hide();
							
						if (!ep_data_fim)
							{
								$(\'#tabs-4 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_5 .error\').show();
							}
						else
							$(\'#tabs-4 #li_5 .error\').hide();
							
						if (!ep_atribuicoes)
							{
								$(\'#tabs-4 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_3 .error\').show();
							}
						else
							$(\'#tabs-4 #li_3 .error\').hide();
							
						if (!ep_setor)
							{
								$(\'#tabs-4 #li_6 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-4 #li_6 .error\').show();
							}
						else
							$(\'#tabs-4 #li_6 .error\').hide();
											
						if (!ep_empresa)
							error = true;
						
						if (!ep_funcao)
							error = true;
							
						if (!ep_data_inicio)
							error = true;
							
						if (!ep_data_fim)
							error = true;
							
						if (!ep_atribuicoes)
							error = true;
							
						if (!ep_setor)
							error = true;
						
						if (error == false)
							{							
								var ep_setor_nome = $(\'#setor option:selected\').html();
								
								var html = \'<tr><td>\'
								+ep_empresa+\'<input name="empresa[]" type="hidden" value="\'+ep_empresa+\'" /></td><td>\'
								+ep_funcao+\'<input name="funcao[]" type="hidden" value="\'+ep_funcao+\'" /></td><td>\'
								+ep_atribuicoes+\'<input name="atribuicoes[]" type="hidden" value="\'+ep_atribuicoes+\'" /></td><td>\'
								+ep_data_inicio+\'<input name="exp_data_inicio[]" type="hidden" value="\'+ep_data_inicio+\'" /></td><td>\'
								+ep_data_fim+\'<input name="exp_data_fim[]" type="hidden" value="\'+ep_data_fim+\'" /></td><td>\'
								+ep_setor_nome+\'<input name="setor[]" type="hidden" value="\'+ep_setor+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								if (experiencia != false)
									{
										experiencia.remove();
										experiencia = false;
									}
								
								$(\'#tabs-4 .tablesorter tbody\').append(html);
								
								$(\'#tabs-4 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#exp_prof\').fadeOut("slow");
								
								//limpa os campos
								clearExperiencia();
							}
							
						return false;
					});
					
					$(\'#tabs-4 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 4);
						return false;
					});
					
					
					//====================================================================
					// #tabs-5 (Formações Adicionais)
					//====================================================================
					var formAdic = false;
					
					$(\'#tabs-5 #add\').click(function(){
						$(\'#form_adic\').fadeIn("slow");
					});
					
					$("#tabs-5 #adic_data_inicio, #tabs-5 #adic_data_fim").datepicker({dateFormat: \'dd/mm/yy\'});
					
					var clearFormacaoAdicional = function() {
						$(\'#tipo\').val("");
						$(\'#adic_curso\').val("");
						$(\'#adic_data_inicio\').val("");
						$(\'#adic_data_fim\').val("");
						$(\'#carga_horaria\').val("");
						$(\'#adic_instituicao\').val("");
						$(\'#adic_outra_instituicao\').val("");
					}
					
					$(\'#tabs-5 #cancel\').click(function(){
						$(\'#form_adic\').fadeOut("slow");
						$(\'#tabs-5 #li_1 .error\').hide();
						
						$(\'#tabs-5 #li_2 .error\').hide();
							
						$(\'#tabs-5 #li_3 .error\').hide();
							
						$(\'#tabs-5 #li_4 .error\').hide();
							
						$(\'#tabs-5 #li_5 .error\').hide();
							
						$(\'#tabs-5 #li_6 .error\').hide();
							
						$(\'#tabs-5 #li_7 .error\').hide();
						clearFormacaoAdicional();
					});
					
					$(\'#tabs-5 .edit\').click(function(){
						formAdic = $(this).parent().parent();
						var id = \'#\'+formAdic.attr("id")+\' \';
						
						var fad_tipo = $(id+\'.form_adic_0\').val();
						var fad_curso = $(id+\'.form_adic_1\').val();
						var fad_data_inicio = $(id+\'.form_adic_2\').val();
						var fad_data_fim = $(id+\'.form_adic_3\').val();
						var fad_carga_horaria = $(id+\'.form_adic_4\').val();
						var fad_instituicao = $(id+\'.form_adic_5\').val();
						
						$(\'#tipo\').val(fad_tipo);
						$(\'#adic_curso\').val(fad_curso);
						$(\'#adic_data_inicio\').val(fad_data_inicio);
						$(\'#adic_data_fim\').val(fad_data_fim);
						$(\'#carga_horaria\').val(fad_carga_horaria);
						$(\'#adic_instituicao\').val(fad_instituicao);
						
						$(\'#form_adic\').fadeIn("slow");					
					});
					
					$(\'#tabs-5 #clear\').click(function(){
						clearFormacaoAdicional();
					});
					
					$(\'#tabs-5 #save\').click(function(){
						var error = false;
						
						var fad_tipo = $(\'#tipo\').val();
						var fad_curso = $(\'#adic_curso\').val();
						var fad_data_inicio = $(\'#adic_data_inicio\').val();
						var fad_data_fim = $(\'#adic_data_fim\').val();
						var fad_carga_horaria = $(\'#carga_horaria\').val();
						var fad_instituicao = $(\'#adic_instituicao option:selected\').val();
						var fad_outra_instituicao = $(\'#adic_outra_instituicao\').val();
						
						if (!fad_tipo)
							{
								$(\'#tabs-5 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_1 .error\').show();
							}
						else
							$(\'#tabs-5 #li_1 .error\').hide();
						
						if (!fad_curso)
							{
								$(\'#tabs-5 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_2 .error\').show();
							}
						else
							$(\'#tabs-5 #li_2 .error\').hide();
							
						if (!fad_data_inicio)
							{
								$(\'#tabs-5 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_3 .error\').show();
							}
						else
							$(\'#tabs-5 #li_3 .error\').hide();
							
						if (!fad_data_fim)
							{
								$(\'#tabs-5 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_4 .error\').show();
							}
						else
							$(\'#tabs-5 #li_4 .error\').hide();
							
						if (!fad_carga_horaria)
							{
								$(\'#tabs-5 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_5 .error\').show();
							}
						else
							$(\'#tabs-5 #li_5 .error\').hide();
							
						if (!fad_instituicao)
							{
								$(\'#tabs-5 #li_6 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-5 #li_6 .error\').show();
							}
						else
							$(\'#tabs-5 #li_6 .error\').hide();
											
						if (!fad_tipo)
							error = true;
						
						if (!fad_curso)
							error = true;
							
						if (!fad_data_inicio)
							error = true;
							
						if (!fad_data_fim)
							error = true;
							
						if (!fad_carga_horaria)
							error = true;
							
						if (!fad_instituicao)
							error = true;
						
						if (error == false)
							{							
								var fad_instituicao_nome = $(\'#adic_instituicao option:selected\').html();
								
								var html = \'<tr><td>\'
								+fad_tipo+\'<input name="tipo[]" type="hidden" value="\'+fad_tipo+\'" /></td><td>\'
								+fad_curso+\'<input name="adic_curso[]" type="hidden" value="\'+fad_curso+\'" /></td><td>\'
								+fad_data_inicio+\'<input name="adic_data_inicio[]" type="hidden" value="\'+fad_data_inicio+\'" /></td><td>\'
								+fad_data_fim+\'<input name="adic_data_fim[]" type="hidden" value="\'+fad_data_fim+\'" /></td><td>\'
								+fad_carga_horaria+\'<input name="carga_horaria[]" type="hidden" value="\'+fad_carga_horaria+\'" /></td><td>\'
								+fad_instituicao_nome+\'<input name="adic_instituicao[]" type="hidden" value="\'+fad_instituicao+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								$(\'#tabs-5 .tablesorter tbody\').append(html);
								
								$(\'#tabs-5 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#form_adic\').fadeOut("slow");
								
								//limpa os campos
								clearFormacaoAdicional();
							}
							
						return false;
					});
					
					//Outra instituição
					$(\'#tabs-5 #li_6 #other\').click(function(){
						$(\'#tabs-5 #li_7\').fadeIn("slow");
					});
					
					$(\'#tabs-5 #li_7 #add_2\').click(function(){				
						$(\'#adic_instituicao\').append(\'<option value="\'+$(\'#tabs-5 #li_7 #adic_outra_instituicao\').val()+\'" selected="selected">\'+$(\'#tabs-5 #li_7 #adic_outra_instituicao\').val()+\'</option>\');
						$(\'#tabs-5 #li_7\').fadeOut("slow");
					});
					
					$(\'#tabs-5 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 5);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-6 (Conhecimentos)
					//====================================================================
					var conhec = false;
					
					$(\'#tabs-6 #add\').click(function(){
						$(\'#conhec\').fadeIn("slow");
					});
										
					var clearConhecimento = function() {
						$(\'#grupo_conhecimento\').val("");
						$(\'#conhecimento\').val("");
						$(\'#proficiencia\').val("");
					}
					
					$(\'#tabs-6 #cancel\').click(function(){
						$(\'#conhec\').fadeOut("slow");
						$(\'#tabs-6 #li_1 .error\').hide();
						
						$(\'#tabs-6 #li_2 .error\').hide();
							
						$(\'#tabs-6 #li_3 .error\').hide();
						clearConhecimento();
					});
					
					$(\'#tabs-6 .edit\').click(function(){
						conhec = $(this).parent().parent();
						var id = \'#\'+conhec.attr("id")+\' \';
						
						var grupo_conhecimento = $(id+\'.conhec_0\').val();
						var conhecimento = $(id+\'.conhec_1\').val();
						var proficiencia = $(id+\'.conhec_2\').val();
						
						$(\'#grupo_conhecimento\').val(grupo_conhecimento);
						$(\'#conhecimento\').val(conhecimento);
						$(\'#proficiencia\').val(proficiencia);
						
						$(\'#conhec\').fadeIn("slow");					
					});
					
					$(\'#tabs-6 #clear\').click(function(){
						clearConhecimento();
					});
					
					$(\'#tabs-6 #save\').click(function(){
						var error = false;
						
						var grupo_conhecimento = $(\'#grupo_conhecimento\').val();
						var conhecimento = $(\'#conhecimento\').val();
						var proficiencia = $(\'#proficiencia\').val();
						
						if (!grupo_conhecimento)
							{
								$(\'#tabs-6 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-6 #li_1 .error\').show();
							}
						else
							$(\'#tabs-6 #li_1 .error\').hide();
						
						if (!conhecimento)
							{
								$(\'#tabs-6 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-6 #li_2 .error\').show();
							}
						else
							$(\'#tabs-6 #li_2 .error\').hide();
							
						if (!proficiencia)
							{
								$(\'#tabs-6 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-6 #li_3 .error\').show();
							}
						else
							$(\'#tabs-6 #li_3 .error\').hide();
										
						if (!grupo_conhecimento)
							error = true;
						
						if (!proficiencia)
							error = true;
							
						if (!conhecimento)
							error = true;
							
						if (error == false)
							{															
								var html = \'<tr><td>\'
								+grupo_conhecimento+\'<input name="grupo_conhecimento[]" type="hidden" value="\'+grupo_conhecimento+\'" /></td><td>\'
								+conhecimento+\'<input name="conhecimento[]" type="hidden" value="\'+conhecimento+\'" /></td><td>\'
								+proficiencia+\'<input name="proficiencia[]" type="hidden" value="\'+proficiencia+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								if (conhec != false)
									{
										conhec.remove();
										conhec = false;
									}
								
								$(\'#tabs-6 .tablesorter tbody\').append(html);
								
								$(\'#tabs-6 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#conhec\').fadeOut("slow");
								
								//limpa os campos
								clearConhecimento();
							}
							
						return false;
					});
					
					$(\'#tabs-6 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 6);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-7 (Idiomas)
					//====================================================================
					var idiom = false;
					
					$(\'#tabs-7 #add\').click(function(){
						$(\'#idioma\').removeAttr(\'disabled\');
						$(\'#idioma_tab\').fadeIn("slow");
					});
										
					var clearIdiomas = function() {
						$(\'#idioma\').val("");
						$(\'#leitura\').val("");
						$(\'#conversacao\').val("");
						$(\'#escrita\').val("");
					}
					
					$(\'#tabs-7 #cancel\').click(function(){
						$(\'#idioma_tab\').fadeOut("slow");
						$(\'#tabs-7 #li_1 .error\').hide();
						
						$(\'#tabs-7 #li_2 .error\').hide();
							
						$(\'#tabs-7 #li_3 .error\').hide();
							
						$(\'#tabs-7 #li_4 .error\').hide();
						clearIdiomas();
					});
					
					$(\'#tabs-7 .edit\').click(function(){
						idiom = $(this).parent().parent();
						var id = \'#\'+idiom.attr("id")+\' \';
						
						var idioma = $(id+\'.idio_0\').val();
						var leitura = $(id+\'.idio_1\').val();
						var conversacao = $(id+\'.idio_2\').val();
						var escrita = $(id+\'.idio_3\').val();
						
						$(\'#idioma\').val(idioma);
						$(\'#leitura\').val(leitura);
						$(\'#conversacao\').val(conversacao);
						$(\'#escrita\').val(escrita);
						
						$(\'#idioma\').attr(\'disabled\', \'disabled\');
						
						$(\'#idioma_tab\').fadeIn("slow");					
					});
					
					$(\'#tabs-7 #clear\').click(function(){
						clearIdiomas();
					});
					
					$(\'#tabs-7 #save\').click(function(){
						var error = false;
						
						var idioma = $(\'#idioma option:selected\').val();
						var leitura = $(\'#leitura option:selected\').val();
						var conversacao = $(\'#conversacao option:selected\').val();
						var escrita = $(\'#escrita option:selected\').val();
						
						if (!idioma)
							{
								$(\'#tabs-7 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-7 #li_1 .error\').show();
							}
						else
							$(\'#tabs-7 #li_1 .error\').hide();
						
						if (!leitura)
							{
								$(\'#tabs-7 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-7 #li_2 .error\').show();
							}
						else
							$(\'#tabs-7 #li_2 .error\').hide();
							
						if (!conversacao)
							{
								$(\'#tabs-7 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-7 #li_3 .error\').show();
							}
						else
							$(\'#tabs-7 #li_3 .error\').hide();
							
						if (!escrita)
							{
								$(\'#tabs-7 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-7 #li_4 .error\').show();
							}
						else
							$(\'#tabs-7 #li_4 .error\').hide();
										
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
								var idioma_nome = $(\'#idioma option:selected\').html();
								var leitura_nome = $(\'#leitura option:selected\').html();
								var conversacao_nome = $(\'#conversacao option:selected\').html();
								var escrita_nome = $(\'#escrita option:selected\').html();
								
								var html = \'<tr><td>\'
								+idioma_nome+\'<input name="idioma[]" type="hidden" value="\'+idioma+\'" /></td><td>\'
								+leitura_nome+\'<input name="leitura[]" type="hidden" value="\'+leitura+\'" /></td><td>\'
								+conversacao_nome+\'<input name="conversacao[]" type="hidden" value="\'+conversacao+\'" /></td><td>\'
								+escrita_nome+\'<input name="escrita[]" type="hidden" value="\'+escrita+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								if (idiom != false)
									{
										idiom.remove();
										idiom = false;
									}
								
								$(\'#tabs-7 .tablesorter tbody\').append(html);
								
								$(\'#tabs-7 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#idioma_tab\').fadeOut("slow");
								
								//limpa os campos
								clearIdiomas();
							}
							
						return false;
					});
					
					$(\'#tabs-7 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 7);
							
						return false;
					});
					
					
					//====================================================================
					// #tabs-8 (Referências)
					//====================================================================
					var refer = false;
					
					$(\'#tabs-8 #add\').click(function(){
						$(\'#referencia\').fadeIn("slow");
					});
										
					var clearReferencia = function() {
						$(\'#ref_nome\').val("");
						$(\'#ref_empresa\').val("");
						$(\'#ref_vinculo\').val("");
						$(\'#ref_telefone\').val("");
						$(\'#ref_email\').val("");
					}
					
					$(\'#tabs-8 #cancel\').click(function(){
						$(\'#referencia\').fadeOut("slow");
						$(\'#tabs-8 #li_1 .error\').hide();
						
						$(\'#tabs-8 #li_2 .error\').hide();
							
						$(\'#tabs-8 #li_3 .error\').hide();
							
						$(\'#tabs-8 #li_4 .error\').hide();
							
						$(\'#tabs-8 #li_5 .error\').hide();
						clearReferencia();
					});
					
					$(\'#tabs-8 #clear\').click(function(){
						clearReferencia();
					});
					
					$(\'#tabs-8 .edit\').click(function(){
						refer = $(this).parent().parent();
						var id = \'#\'+refer.attr("id")+\' \';
						
						var ref_nome = $(id+\'.ref_0\').val();
						var ref_empresa = $(id+\'.ref_1\').val();
						var ref_vinculo = $(id+\'.ref_2\').val();
						var ref_telefone = $(id+\'.ref_3\').val();
						var ref_email = $(id+\'.ref_4\').val();
												
						$(\'#ref_nome\').val(ref_nome);
						$(\'#ref_empresa\').val(ref_empresa);
						$(\'#ref_vinculo\').val(ref_vinculo);
						$(\'#ref_telefone\').val(ref_telefone);
						$(\'#ref_email\').val(ref_email);
						
						$(\'#referencia\').fadeIn("slow");					
					});
					
					$(\'#tabs-8 #save\').click(function(){
						var error = false;
						
						var ref_nome = $(\'#ref_nome\').val();
						var ref_empresa = $(\'#ref_empresa\').val();
						var ref_vinculo = $(\'#ref_vinculo\').val();
						var ref_telefone = $(\'#ref_telefone\').val();
						var ref_email = $(\'#ref_email\').val();
						
						if (!ref_nome)
							{
								$(\'#tabs-8 #li_1 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-8 #li_1 .error\').show();
							}
						else
							$(\'#tabs-8 #li_1 .error\').hide();
						
						if (!ref_empresa)
							{
								$(\'#tabs-8 #li_2 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-8 #li_2 .error\').show();
							}
						else
							$(\'#tabs-8 #li_2 .error\').hide();
							
						if (!ref_vinculo)
							{
								$(\'#tabs-8 #li_3 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-8 #li_3 .error\').show();
							}
						else
							$(\'#tabs-8 #li_3 .error\').hide();
							
						if (!ref_telefone)
							{
								$(\'#tabs-8 #li_4 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-8 #li_4 .error\').show();
							}
						else
							$(\'#tabs-8 #li_4 .error\').hide();
							
						if (!ref_email)
							{
								$(\'#tabs-8 #li_5 .error\').html("Preenchimento obrigatório");
								$(\'#tabs-8 #li_5 .error\').show();
							}
						else
							$(\'#tabs-8 #li_5 .error\').hide();
										
						if (!ref_nome)
							error = true;
						
						if (!ref_empresa)
							error = true;
							
						if (!ref_vinculo)
							error = true;
							
						if (!ref_telefone)
							error = true;
							
						if (!ref_email)
							error = true;
							
						if (error == false)
							{															
								var html = \'<tr><td>\'
								+ref_nome+\'<input name="ref_nome[]" type="hidden" value="\'+ref_nome+\'" /></td><td>\'
								+ref_empresa+\'<input name="ref_empresa[]" type="hidden" value="\'+ref_empresa+\'" /></td><td>\'
								+ref_vinculo+\'<input name="ref_vinculo[]" type="hidden" value="\'+ref_vinculo+\'" /></td><td>\'
								+ref_telefone+\'<input name="ref_telefone[]" type="hidden" value="\'+ref_telefone+\'" /></td><td>\'
								+ref_email+\'<input name="ref_email[]" type="hidden" value="\'+ref_email+\'" /></td><td>\'
								+\'<input class="edit" type="button" value="Editar" /><input class="delete" type="button" value="Remover" /></td></tr>\';
												
								if (refer != false)
									{
										refer.remove();
										refer = false;
									}
								
								$(\'#tabs-8 .tablesorter tbody\').append(html);
								
								$(\'#tabs-8 .delete\').click(function(){
									$(this).parent().parent().remove();
								});
								
								$(\'#referencia\').fadeOut("slow");
								
								//limpa os campos
								clearReferencia();
							}
							
						return false;
					});
					
					$(\'#tabs-8 #next\').click(function(){
						var $tabs = $(\'#tabs\').tabs();
						$tabs.tabs(\'select\', 8);
							
						return false;
					});
					
					
					'; ?>