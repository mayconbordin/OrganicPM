						<!-- Begin Panel -->
						<div id="panel">
						
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Vagas Abertas</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Cargo</th>
											<th>Vagas</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$vagas item=vaga}
									
										<tr>
											<td>{$vaga[5]}</td>
											<td>{$vaga[6]}</td>
											<td><a href="vaga.php?id={$vaga[0]}" title="Detalhes">Detalhes</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="vaga.php?action=listar" title="">Todas vagas &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Fases Pendentes</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Fase</th>
											<th>Cargo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$fases item=fase}
									
										<tr>
											<td>{$fase[6]} ({$fase[2]} - {$fase[3]})</td>
											<td>{$fase[5]}</td>
											<td><a href="fase.php?id={$fase[0]}" title="Detalhes">Detalhes</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="fase.php?action=listar" title="">Todas fases &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Status das Seleções</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Processo Seletivo</th>
											<th>Status</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$processos item=proc}
									
										<tr>
											<td>{$proc[1]}</td>
											<td>{$proc[2]}</td>
											<td><a href="selecao.php?id={$proc[0]}" title="Detalhes">Detalhes</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="selecao.php?action=listar" title="">Todas seleções &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
						</div>
						<!-- End Panel -->