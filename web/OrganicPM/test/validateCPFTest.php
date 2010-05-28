<?php

include_once '../plugins/validateCPF.function.php';


if (!isset($_POST['cpf']))
	{
		echo '
		<form method="post" action="validateCPFTest.php">
			<label>CPF:</label>
			<input type="text" name="cpf" maxlength="11" />
			<input type="submit" value="Validar" />
		</form>';
	}
else
	{
		$cpf = $_POST['cpf'];
		
		if (validateCPF($cpf))
			echo "CPF Válido";
		else
			echo "CPF Inválido";
	}