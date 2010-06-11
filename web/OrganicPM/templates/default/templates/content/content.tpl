				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					{if $logado && ($page == "content" || $page == "teste" || $page == "vagas" || $page == "selecao" || $page == "fases" || $page == "curriculo"  || $page == "cadastro" || $page == "dados_pessoais" || $page == "endereco" || $page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias")}
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Menu</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2><a href="{#root#}candidato/index.php" title="Início">Início</a></h2></li>
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Currículo</h2></a>
								<ul>
									<li><a href="{#root#}candidato/curriculo.php" title="">EDITAR CURRÍCULO</a></li>
									
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
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Login</h2></a>
								<ul>
									<li><a href="" title="">EDITAR</a></li>
									<li><a href="" title="">REMOVER</a></li>
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
						
						{if $page == "curriculo" && $status == "sucesso"}
							{include file="message.tpl" msgType="sucess" msgText="Currículo salvo com sucesso." msgVis="show"}
						{/if}
						
						{if $page == "curriculo" && $status == "erro"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do currículo." msgVis="show"}
						{/if}
						
						{if $page == "teste" && $status == "sucesso"}
							{include file="message.tpl" msgType="sucess" msgText="Teste concluído." msgVis="show"}
						{/if}
						
						{if $page == "teste" && $status == "erro"}
							{include file="message.tpl" msgType="error" msgText="Existem erros no seu teste." msgVis="show"}
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
				