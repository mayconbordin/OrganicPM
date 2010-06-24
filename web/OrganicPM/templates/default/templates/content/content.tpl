				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					{if $logado && ($page == "content" || $page == "dados_login" || $page == "teste" || $page == "vagas" || $page == "selecao" || $page == "fases" || $page == "curriculo"  || $page == "cadastro" || $page == "dados_pessoais" || $page == "endereco" || $page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias")}
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Menu</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2><a href="{#root#}candidato/index.php" title="Início">Início</a></h2></li>
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Currículo</h2></a>
								<ul>									
									<li><a href="{#root#}candidato/dados_pessoais.php" title="">DADOS PESSOAiS</a></li>
									<li><a href="{#root#}candidato/endereco.php" title="">ENDEREÇO</a></li>
									<li><a href="{#root#}candidato/contatos.php" title="">CONTATOS</a></li>
									<li><a href="{#root#}candidato/form_acad.php" title="">FORMAÇÃO ACADÊMICA</a></li>
									<li><a href="{#root#}candidato/exper_prof.php" title="">EXPERIÊNCIA PROFISSIONAL</a></li>
									<li><a href="{#root#}candidato/form_adic.php" title="">FORMAÇÃO ADICIONAL</a></li>
									<li><a href="{#root#}candidato/conhecimentos.php" title="">CONHECIMENTOS</a></li>
									<li><a href="{#root#}candidato/idiomas.php" title="">IDIOMAS</a></li>
									<li><a href="{#root#}candidato/referencias.php" title="">REFERÊNCIAS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Seleções</h2></a>
								<ul>
									<li><a href="" title="">ANDAMENTO</a><li>
									<li><a href="" title="">TESTES</a></li>
									<li><a href="" title="">ENTREVISTAS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Cadastro</h2></a>
								<ul>
									<li><a href="{#root#}candidato/dados_login.php?action=editar" title="Editar Login">EDITAR LOGIN</a></li>
									<li><a href="{#root#}candidato/dados_login.php?action=remover" title="Remover">REMOVER</a></li>
								</ul>
							</li>
							
							<li class="item"><h2><a href="{#root#}process.php" title="Sair">Sair</a></h2></li>
							
						</ul>
						<!-- End Submenu -->
						
					</div>
					<!-- End Left Block -->
					{/if}
					
					<!-- Begin Right Block -->
					<div id="right">
					
					
						{if $action == "listar" && $status == "sucesso"}
							{include file="message.tpl" msgType="sucess" msgText="Registro removido com sucesso." msgVis="show"}
						{/if}
						
						{if $action == "listar" && $status == "erro"}
							{include file="message.tpl" msgType="error" msgText="Não foi possível remover o registro." msgVis="show"}
						{/if}
						
						
						{if $page == "cadastro" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Currículo salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "cadastro" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do currículo." msgVis="show"}
						{/if}
						
						{if $page == "curriculo" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Currículo salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "curriculo" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do currículo." msgVis="show"}
						{/if}
						
						{if $page == "teste" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Teste concluído." msgVis="show"}
						{/if}
						
						{if $page == "teste" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no seu teste." msgVis="show"}
						{/if}
						
						{if $page == "endereco" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Endereço salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "endereco" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no seu endereço." msgVis="show"}
						{/if}
						
						{if $page == "dados_pessoais" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Dados pessoais salvos com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "dados_pessoais" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos seus dados pessoais." msgVis="show"}
						{/if}
						
						{if $page == "contatos" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Contato salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "contatos" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados de contato." msgVis="show"}
						{/if}
						
						{if $page == "formacao_academica" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Formação acadêmica salva com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "formacao_academica" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados da formação acadêmica." msgVis="show"}
						{/if}
						
						{if $page == "experiencia_profissional" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Experiência profissional salva com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "experiencia_profissional" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados da experiência profissional." msgVis="show"}
						{/if}
						
						{if $page == "formacao_adicional" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Formação adicional salva com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "formacao_adicional" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados da formação adicional." msgVis="show"}
						{/if}
						
						{if $page == "conhecimentos" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Conhecimento salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "conhecimentos" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados do conhecimento." msgVis="show"}
						{/if}
						
						{if $page == "idiomas" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Idioma salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "idiomas" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados do idioma." msgVis="show"}
						{/if}
						
						{if $page == "referencias" && $status == "sucesso" && $action != "listar"}
							{include file="message.tpl" msgType="sucess" msgText="Referência salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "referencias" && $status == "erro" && $action != "listar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados da referência." msgVis="show"}
						{/if}
						
						{if $page == "dados_login" && $status == "sucesso" && $action == "editar"}
							{include file="message.tpl" msgType="sucess" msgText="Dados de login salvos com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "dados_login" && $status == "erro" && $action == "editar"}
							{include file="message.tpl" msgType="error" msgText="Existem erros nos dados do login." msgVis="show"}
						{/if}
						
						{if $page == "dados_login" && $status == "sucesso" && $action == "remover"}
							{include file="message.tpl" msgType="sucess" msgText="Conta removida com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "dados_login" && $status == "erro" && $action == "remover"}
							{include file="message.tpl" msgType="error" msgText="Houve um erro ao remover sua conta." msgVis="show"}
						{/if}
						
						{if $logado}
							{if $page == "curriculo"}
								{include file="forms\curriculo_candidato\index.tpl"}
							{/if}
							{if $page == "content"}
								{include file="content\userPanel.tpl"}
							{/if}
							{if $page == "dados_pessoais"}
								{include file="forms\curriculo_candidato\dados_pessoais.tpl"}
							{/if}
							{if $page == "endereco"}
								{include file="forms\curriculo_candidato\endereco.tpl"}
							{/if}
							{if ($page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias") && $action == "listar"}
								{include file="content\\table.tpl"}
							{/if}

							{if $page == "vagas" && $action == "listar"}
								{include file="content\\table.tpl"}
							{/if}
							{if $page == "vagas" && $action != "listar"}
								{include file="content\\vagas.tpl"}
							{/if}
							{if $page == "fases" && $action == "listar"}
								{include file="content\\table.tpl"}
							{/if}
							{if $page == "fases" && $action != "listar"}
								{include file="content\\fases.tpl"}
							{/if}
							{if $page == "selecao" && $action == "listar"}
								{include file="content\\table.tpl"}
							{/if}
							{if $page == "selecao" && $action != "listar"}
								{include file="content\\selecao.tpl"}
							{/if}
							
							{if $page == "teste" && $status != "sucesso"}
								{include file="teste\\form.tpl"}
							{/if}
							
							{if $page == "contatos" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\contatos.tpl"}
							{/if}
							{if $page == "formacao_academica" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\form_acad.tpl"}
							{/if}
							{if $page == "experiencia_profissional" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\exper_prof.tpl"}
							{/if}
							{if $page == "formacao_adicional" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\form_adic.tpl"}
							{/if}
							{if $page == "conhecimentos" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\conhecimentos.tpl"}
							{/if}
							{if $page == "idiomas" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\idiomas.tpl"}
							{/if}
							{if $page == "referencias" && ($action == "editar" || $action == "novo")}
								{include file="forms\curriculo_candidato\\referencias.tpl"}
							{/if}
							{if $page == "dados_login" && $action == "editar"}
								{include file="forms\curriculo_candidato\\dados_login.tpl"}
							{/if}
							{if $page == "dados_login" && $action == "remover"}
								{include file="forms\curriculo_candidato\\remover.tpl"}
							{/if}
						{else}
							{if $page == "cadastro"}
								{include file="forms\cadastro_candidato\index.tpl"}
							{else}
								{include file="content/naoLogado.tpl"}
							{/if}
						{/if}
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				