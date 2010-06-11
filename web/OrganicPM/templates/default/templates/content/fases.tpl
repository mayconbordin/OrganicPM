					<div id="cand_form">
						<h2>Fase</h2>
						{if $fase_erro}
							{include file="message.tpl" msgType="error" msgText="Fase não encontrada ou finalizada." msgVis="show"}
						{else}
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Tipo:</td>
									<td>{$fase}</td>
								</tr>
								<tr>
									<td>Data de Início:</td>
									<td>{$data_inicio}</td>
								</tr>
								<tr>
									<td>Data de Término:</td>
									<td>{$data_fim}</td>
								</tr>
								<tr>
									<td>Status:</td>
									<td>{$status}</td>
								</tr>
							</tbody>
						</table>
						{/if}
						
						{if $teste}
						<a class="inscrever" href="teste.php?id={$cod}" title="">Realizar teste</a>
						{/if}
					</div>