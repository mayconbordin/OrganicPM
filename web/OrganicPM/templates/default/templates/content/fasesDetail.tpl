					<div id="cand_form">
						<h2>Fase</h2>
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								{if $fase}
								<tr>
									<td>Tipo de fase:</td>
									<td>{$fase}</td>
								</tr>
								{/if}
								{if $data_inicio}
								<tr>
									<td>Data de Início da fase:</td>
									<td>{$data_inicio}</td>
								</tr>
								{/if}
								{if $data_fim}
								<tr>
									<td>Data de Término da fase:</td>
									<td>{$data_fim}</td>
								</tr>
								{/if}
								{if $data}
								<tr>
									<td>Data ocorrida:</td>
									<td>{$data}</td>
								</tr>
								{/if}
								{if $data_agendada}
								<tr>
									<td>Data agendada:</td>
									<td>{$data_agendada}</td>
								</tr>
								{/if}
								{if $nota}
								<tr>
									<td>Nota:</td>
									<td>{$nota}</td>
								</tr>
								{/if}
								{if $status}
								<tr>
									<td>Status:</td>
									<td>{$status}</td>
								</tr>
								{/if}
							</tbody>
						</table>
					</div>