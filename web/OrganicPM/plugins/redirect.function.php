<?php

// Redirecionamento forçado
function redirect($url, $delay)
	{
		echo "<meta http-equiv='Refresh' content='".$delay."; URL=".$url."'>";
	}