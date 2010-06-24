				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Administração</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><a class="item_title" href="" title=""><h2>Candidatos</h2></a>
								<ul>
									<li><a href="{#root#}candidato/curriculo.php" title="">BUSCAR CURRÍCULOS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Processo Seletivos</h2></a>
								<ul>
									<li><a href="{#root#}admin/procseletivo.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="{#root#}admin/procseletivo.php?action=listar" title="">LISTAR</a></li>
									<li><a href="{#root#}admin/procseletivo.php?action=inscritos" title="">CANDIDATOS INSCRITOS</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Testes</h2></a>
								<ul>
									<li><a href="{#root#}admin/testes.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="{#root#}admin/testes.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Entrevistas</h2></a>
								<ul>
									<li><a href="{#root#}admin/entrevistas.php?action=agendar" title="">AGENDAMENTO</a><li>
									<li><a href="{#root#}admin/entrevistas.php?action=registrar" title="">REGISTRAR ENTREVISTA</a></li>
									<li><a href="{#root#}admin/entrevistas.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Relatório</h2></a>
								<ul>
									<li><a href="{#root#}admin/relatorio.php?type=full" title="">GRÁFICO COMPARATIVO</a><li>
									<li><a href="{#root#}admin/relatorio.php?type=procsel" title="">PROCESSO SELETIVO</a><li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Usuários</h2></a>
								<ul>
									<li><a href="{#root#}admin/usuarios.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="{#root#}admin/usuarios.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><a class="item_title" href="" title=""><h2>Meu Cadastro</h2></a>
								<ul>
									<li><a href="{#root#}admin/dados_login.php?action=editar" title="Editar Login">EDITAR LOGIN</a></li>
									<li><a href="" title="">REMOVER</a></li>
								</ul>
							</li>
							
							<li class="item"><h2><a href="{#root#}process.php" title="Sair">Sair</a></h2></li>
							
						</ul>
						<!-- End Submenu -->
						
					</div>
					<!-- End Left Block -->
					
					<!-- Begin Right Block -->
					<div id="right">
						{if $page == "dados_login"}
							{include file="admin\dados_login.tpl"}
						{/if}
						
						{if $page == "reports" && $type == "full"}
							{include file="report\\full.tpl"}
						{/if}
						{if $page == "reports" && $type == "procsel"}
							{include file="report\\procsel.tpl"}
						{/if}
					
						{if $page == "adminProcSel"}
							{if $status == "sucesso"}
								{include file="message.tpl" msgType="sucess" msgText="Processo seletivo salvo com sucesso." msgVis="show"}
							{/if}
							
							{if $status == "erro"}
								{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do processo seletivo." msgVis="show"}
							{/if}
						{/if}
						
						{if $page == "adminTestes"}
							{if $status == "sucesso"}
								{include file="message.tpl" msgType="sucess" msgText="Teste salvo com sucesso." msgVis="show"}
							{/if}
							
							{if $status == "erro"}
								{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro do teste." msgVis="show"}
							{/if}
						{/if}
						
						{if $page == "fases"}
							{if $status == "sucesso"}
								{include file="message.tpl" msgType="sucess" msgText="Fase salva com sucesso." msgVis="show"}
							{/if}
							
							{if $status == "erro"}
								{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro da fase." msgVis="show"}
							{/if}
						{/if}
						
						{if $page == "entrevistas"}
							{if $status == "sucesso"}
								{include file="message.tpl" msgType="sucess" msgText="Entrevista salva com sucesso." msgVis="show"}
							{/if}
							
							{if $status == "erro"}
								{include file="message.tpl" msgType="error" msgText="Existem erros no cadastro da entrevista." msgVis="show"}
							{/if}
						{/if}

						{if $page == "adminProcSel" && $action == "novo"}
							{include file="admin\cadastroProcSel.tpl"}
						{/if}
						{if $page == "adminProcSel" && $action == "editar"}
							{include file="admin\edicaoProcSel.tpl"}
						{/if}
						
						{if $page == "fases" && $action == "editar"}
							{include file="admin\\fase.tpl"}
						{/if}
						
						{if $page == "usuarios" && $action == "listar"}
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						{/if}
						{if $page == "usuarios" && $action == "editar"}
							{include file="admin\editarLogin.tpl"}
						{/if}
						
						{if $page == "adminTestes" && $action == "novo"}
							{include file="admin\cadastro_teste.tpl"}
						{/if}
						
						{if $page == "adminTestes" && $action == "listar"}
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						{/if}
						
						{if $page == "adminTestes" && $action == "editar"}
							{include file="admin\edicaoTeste.tpl"}
						{/if}
						
						{if $page == "questoes" && $action == "editar"}
							{include file="admin\edicaoQuestao.tpl"}
						{/if}
						
						{if $page == "alternativas" && $action == "editar"}
							{include file="admin\edicaoAlternativa.tpl"}
						{/if}
						
						{if $page == "entrevistas" && $listar}
							{include file="admin\\table3.tpl"}
						{/if}
						
						{if $page == "entrevistas" && !$listar && $action == "agendar"}
							{include file="admin\\agendarEntrevista.tpl"}
						{/if}
						
						{if $page == "entrevistas" && !$listar && $action == "registrar"}
							{include file="admin\\registrarEntrevista.tpl"}
						{/if}
						{if $page == "entrevistas" && $action == "editar"}
							{include file="admin\\editarEntrevista.tpl"}
						{/if}
						{if $page == "entrevistas" && $action == "listar" && $flexigrid}
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						{/if}
						
						
						{if $page == "adminProcSel" && $action == "inscritos" && $flexigrid}
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						{/if}
						{if $page == "adminProcSel" && $action == "inscritos" && !$flexigrid}
							{include file="admin\\table3.tpl"}
						{/if}
						
						
						{if $page == "adminProcSel" && $action == "listar"}
							<div id="grid">
								<table id="flex1" style="display:none"></table>
							</div>
						{/if}
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				