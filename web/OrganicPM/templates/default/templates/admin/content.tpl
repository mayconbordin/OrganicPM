				
				<!-- Begin Content Wrapper -->
				<div id="content-wrapper">
				
					<!-- Begin Left Block -->
					<div id="left">
						<h1>Administração</h1>
						
						<!-- Begin Submenu -->
						<ul id="submenu">
							<li class="item"><h2>Candidatos</h2>
								<ul>
									<li><a href="{#root#}candidato/curriculo.php" title="">BUSCAR CURRÍCULOS</a></li>
								</ul>
							</li>
							
							<li class="item"><h2>Processo Seletivos</h2>
								<ul>
									<li><a href="{#root#}admin/procseletivo.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="{#root#}admin/procseletivo.php?action=listar" title="">EM ANDAMENTO</a></li>
									<li><a href="{#root#}admin/procseletivo.php?action=pesquisar" title="">PESQUISAR</a></li>
								</ul>
							</li>
							
							<li class="item"><h2>Testes</h2>
								<ul>
									<li><a href="{#root#}admin/testes.php?action=novo" title="">CADASTRAR NOVO</a><li>
									<li><a href="{#root#}admin/testes.php?action=listar" title="">LISTAR</a></li>
								</ul>
							</li>
							
							<li class="item"><h2>Meu Login</h2>
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
					
					<!-- Begin Right Block -->
					<div id="right">
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

						{if $page == "adminProcSel" && $action == "novo"}
							{include file="admin\cadastroProcSel.tpl"}
						{/if}
						
						{if $page == "adminTestes" && $action == "novo"}
							{include file="admin\cadastro_teste.tpl"}
						{/if}
						
						{if $page == "adminTestes" && $action == "listar"}
							{include file="admin\\table.tpl"}
						{/if}
						
						{if $page == "adminProcSel" && $action == "listar"}
							{include file="admin\\table.tpl"}
						{/if}
						
					</div>
					<!-- End Right Block -->
				</div>
				<!-- End Content Wrapper -->
				
				<div class="clear-div"></div>
				