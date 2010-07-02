						<!-- Begin Panel -->
						<div id="panel">
						
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Processos Seletivos</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Cargo</th>
											<th>Inscritos</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$procSel item=ps}
									
										<tr>
											<td>{$ps[2]}</td>
											<td>{$ps[1]}</td>
											<td><a href="procseletivo.php?action=editar&id={$ps[0]}" title="Detalhes">Detalhes</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="procseletivo.php?action=listar" title="">Todos Processos Seletivos &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Entrevistas para Agendar</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Candidato</th>
											<th>Processo Seletivo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$entrevAgendar item=ag}
									
										<tr>
											<td>{$ag[0]}</td>
											<td>{$ag[1]}</td>
											<td><a href="entrevistas.php?action=agendar&pid={$ag[4]}&psid={$ag[5]}&fid={$ag[6]}" title="Agendar">Agendar</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="entrevistas.php?action=agendar" title="Todas entrevistas para agendar">Todas entrevistas p/ agendar &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
							<!-- Begin Panel Item -->
							<div class="panel-item">
								<h2>Entrevistas para Registrar</h2>
								<table cellspacing="1" class="tablesorter"> 
									<thead> 
										<tr>
											<th>Candidato</th>
											<th>Processo Seletivo</th>
											<th>Ações</th>
										</tr> 
									</thead> 
									<tbody>
										{foreach from=$entrevRegistrar item=rg}
									
										<tr>
											<td>{$rg[0]}</td>
											<td>{$rg[1]}</td>
											<td><a href="entrevistas.php?action=registrar&pid={$rg[3]}&psid={$rg[4]}&fid={$rg[5]}" title="Registrar">Registrar</a></td>
										</tr>
										
										{/foreach}
									</tbody>
								</table>
								<p><a href="entrevistas.php?action=registrar" title="Todas entrevistas para registrar">Todas entrevistas p/ registrar &#187;</a></p>
							</div>
							<!-- End Panel Item -->
							
						</div>
						<!-- End Panel -->