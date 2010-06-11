					<div id="cand_form">
						<h2>Seleção</h2>
						{if $selecao_erro}
							{include file="message.tpl" msgType="error" msgText="Código inválido." msgVis="show"}
						{else}
						<table cellspacing="1" class="tablesorter vagas"> 
							<tbody>
								<tr>
									<td>Descrição:</td>
									<td>{$descricao}</td>
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
					</div>