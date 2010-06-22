<?php /* Smarty version 2.6.26, created on 2010-06-17 11:18:27
         compiled from admin%5CjsFases.tpl */ ?>
		<?php echo '
		$("#fase_data_inicio, #fase_data_fim").datepicker({ dateFormat: \'dd/mm/yy\' });
		
		function checkValue(val, id)
			{
				if (!val)
					{
						$(id+\' .error\').html("Preenchimento obrigatório");
						$(id+\' .error\').show();
						return true;
					}
				else
					{
						$(id+\' .error\').hide();
					}
			}
		
		$(\'#submit\').click(function() {
		
			var fase_erro = false;
			
			var fase_tipo = $(\'#fase_tipo option:selected\').val();
			var fase_data_inicio = $(\'#fase_data_inicio\').val();
			var fase_data_fim = $(\'#fase_data_fim\').val();
			var teste = $(\'#teste option:selected\').val();
			var nota = $(\'#nota option:selected\').val();
			var fase = $(\'#fase_tipo option:selected\').html();
			
			if(checkValue(fase_tipo, \'#li_1\') == true)
				error = true;
			if(checkValue(fase_data_inicio, \'#li_2\') == true)
				error = true;
			if(checkValue(fase_data_fim, \'#li_3\') == true)
				error = true;
			
			if (fase.search("Teste") != -1)
				{
					if(checkValue(teste, \'#li_4\') == true)
						error = true;
					if(checkValue(nota, \'#li_5\') == true)
						error = true;
				}
			else
				$(\'#tabs-2 #li_5 .error,#tabs-2 #li_4 .error\').hide();
				
			if (error == true)
				return false;
		});
		'; ?>