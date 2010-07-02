				<div id="busca">
					<form method="post" action=""></form>
					<table cellspacing="1" class="tablesorter"> 
						<tbody> 
						
							<!-- Nome -->
							<tr id="nome">
								<td><label>Nome:</label></td>
								<td>
									<select name="nomeTipo[]"> 
										<option>igual</option>
										<option>diferente</option>
										<option>parecido</option>
										<option>inicia com</option>
										<option>termina com</option>
									</select>
								</td>
								<td><input name="nome[]" type="text" value="" /></td>
								<td><input class="addNome" type="button" value="+" /></td>
								<td>
									<select name="nomeCont[]"> 
										<option>e</option>
										<option>ou</option>
									</select>
								<td>
							</tr>
							
							<!-- Curso -->
							<tr id="curso">
								<td><label>Curso:</label></td>
								<td>
									<select name="cursoTipo[]"> 
										<option>igual</option>
										<option>diferente</option>
										<option>parecido</option>
										<option>inicia com</option>
										<option>termina com</option>
									</select>
								</td>
								<td><input name="curso[]" type="text" value="" /></td>
								<td><input class="addCurso" type="button" value="+" /></td>
								<td>
									<select name="cursoCont[]"> 
										<option>e</option>
										<option>ou</option>
									</select>
								<td>
							</tr>
							
							<!-- Conhecimentos -->
							<tr id="conhecimento">
								<td><label>Conhecimentos:</label></td>
								<td>
									<select name="conhecimentoTipo[]"> 
										<option>igual</option>
										<option>diferente</option>
										<option>parecido</option>
										<option>inicia com</option>
										<option>termina com</option>
									</select>
								</td>
								<td><input name="conhecimento[]" type="text" value="" /></td>
								<td><input class="addConhecimento"  type="button" value="+" /></td>
								<td>
									<select name="conhecimentoCont[]"> 
										<option>e</option>
										<option>ou</option>
									</select>
								<td>
							</tr>
							
							<!-- Idiomas -->
							<tr id="idioma">
								<td><label>Idiomas:</label></td>
								<td>
									<select name="idiomaTipo[]"> 
										<option>igual</option>
										<option>diferente</option>
										<option>parecido</option>
										<option>inicia com</option>
										<option>termina com</option>
									</select>
								</td>
								<td><input name="idioma[]" type="text" value="" /></td>
								<td><input class="addIdioma" type="button" value="+" /></td>
								<td>
									<select name="idiomaCont[]"> 
										<option>e</option>
										<option>ou</option>
									</select>
								<td>
							</tr>
							
							<!-- Experiências -->
							<tr id="experiencia">
								<td><label>Qdte. Experiências:</label></td>
								<td></td>
								<td><input name="qtde" type="text" value="" /></td>
								<td></td>
								<td><td>
							</tr>
							
						</tbody> 
					</table>
					<input type="submit" value="Buscar" />
					</form>
				</div>