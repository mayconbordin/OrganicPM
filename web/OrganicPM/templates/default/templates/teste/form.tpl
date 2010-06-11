					{if $status_teste}
						<div id="teste">
						<form action="gravarTeste.php" method="post">
						
						{foreach from=$questoes item=que}
						<div class="question">
							<table width="75%" align="center" border="0">
								<tbody>
									<tr>
										<td align="center">
											<table width="100%" cellspacing="0">
												<tbody>
														<tr>
															<td class="questiontext">
																{$que.DESCRICAO}
															</td>
														</tr>
													<tr>
														<td class="answer">
															<ul>
																{if $que.TIP_QUE_COD == 3}
																{foreach from=$que.ALTERNATIVAS item=alt}
																<li>
																	<input class="radio" type="radio" value="1" name="alt{$alt.ALT_QUE_COD}" />
																	<label for="" class="answertext">{$alt.DESCRICAO}</label>
																</li>
																{/foreach}
																{/if}
																
																{if $que.TIP_QUE_COD == 1}
																{foreach from=$que.ALTERNATIVAS item=alt}
																<li>
																	<select name="alt{$alt.ALT_QUE_COD}">
																		<option value=""></option>
																		<option value="1">Verdadeiro</option>
																		<option value="2">Falso</option>
																	</select>
																	<label for="" class="answertext">{$alt.DESCRICAO}</label>
																</li>
																{/foreach}
																{/if}
																
																{if $que.TIP_QUE_COD == 2}
																{foreach from=$que.ALTERNATIVAS item=alt}
																<li>
																	<input class="checkbox" type="checkbox" value="1" name="alt{$alt.ALT_QUE_COD}" />
																	<label for="" class="answertext">{$alt.DESCRICAO}</label>
																</li>
																{/foreach}
																{/if}
																
																<input type="hidden" value="{$que.QUESTAO_COD}" name="questao_cod[]" />
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						{/foreach}
						
						<!-- Dados adicionais -->
						<input type="hidden" value="{$pessoa_cod}" name="pessoa_cod" />
						<input type="hidden" value="{$fase_cod}" name="fase_cod" />
						<input type="hidden" value="{$teste_cod}" name="teste_cod" />
						
						<input type="submit" value="Enviar" />
						
						</form>
						</div>
					{else}
					<h2>Teste já foi realizado</h2>
					{/if}