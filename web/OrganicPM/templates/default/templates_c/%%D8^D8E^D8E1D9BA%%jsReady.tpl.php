<?php /* Smarty version 2.6.26, created on 2010-05-31 01:22:46
         compiled from admin%5CjsReady.tpl */ ?>
		<?php echo '
		//Background
		var bgHeight = $(\'#background img\').css(\'height\').substr(0, 3);
		var height = bgHeight - 130;
		$(\'#background img\').css({\'height\' : height+\'px\'});
		
		//Reajuste de largura
		var width = $(window).width() - 460;
		$(\'#content #content-wrapper #right\').css({\'width\' : width+\'px\'});
		
		
		//Tabs
		$("#tabs").tabs();
		
		$(\'#descricao\').limit(\'300\',\'#li_1 .left\');
		
		$("#data_inicio, #data_fim, #fase_data_inicio, #fase_data_fim").datepicker({ dateFormat: \'dd/mm/yy\' });
		
		////////////////////////////////////////
		// #tabs-1
		////////////////////////////////////////
		$(\'#tabs-1 .next\').click(function() {
			
			var procsel_erro = false;
			
			var descricao = $(\'#descricao\').val();
			var data_inicio = $(\'#data_inicio\').val();
			var data_fim = $(\'#data_fim\').val();
			var vagas = $(\'#vagas\').val();
			var cargo = $(\'#cargo option:selected\').val();
			
			if (!descricao)
				{
					$(\'#tabs-1 #li_1 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-1 #li_1 .error\').show();
					procsel_erro = true;
				}
			else
				$(\'#tabs-1 #li_1 .error\').hide();
				
			if (!data_inicio)
				{
					$(\'#tabs-1 #li_2 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-1 #li_2 .error\').show();
					procsel_erro = true;
				}
			else
				$(\'#tabs-1 #li_2 .error\').hide();
			
			if (!data_fim)
				{
					$(\'#tabs-1 #li_3 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-1 #li_3 .error\').show();
					procsel_erro = true;
				}
			else
				$(\'#tabs-1 #li_3 .error\').hide();
			
			if (!vagas)
				{
					$(\'#tabs-1 #li_4 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-1 #li_4 .error\').show();
					procsel_erro = true;
				}
			else
				$(\'#tabs-1 #li_4 .error\').hide();
			
			if (!cargo)
				{
					$(\'#tabs-1 #li_5 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-1 #li_5 .error\').show();
					procsel_erro = true;
				}
			else
				$(\'#tabs-1 #li_5 .error\').hide();
			
			if (procsel_erro == false)
				{
					var $tabs = $(\'#tabs\').tabs();
					$tabs.tabs(\'select\', 1);
				}
		});
		
		////////////////////////////////////////
		// #tabs-2
		////////////////////////////////////////
		var edit = false;
		
		var clearFase = function() {
			$(\'#fase_tipo\').val("");
			$(\'#fase_data_inicio\').val("");
			$(\'#fase_data_fim\').val("");
			$(\'#teste\').val("");
			$(\'#tabs-2 #li_4\').hide();
		}

		$(\'#fase_tipo\').change(function(){
			var fase_tipo = $(\'#fase_tipo option:selected\').html();
						
			if (fase_tipo.search("Teste") != -1)
				{
					$(\'#teste\').load("list_testes.php");
					$(\'#tabs-2 #li_4\').fadeIn("slow");
				}
			else
				$(\'#tabs-2 #li_4\').fadeOut("slow");
		});
		
		$(\'.delete\').click(function(){
			$(this).parent().remove();
		});
					
		$(\'.edit\').click(function(){
		
			edit = $(this).parent();
			
			var id = \'#\'+$(this).parent().attr("id")+\' \';
			
			var fase_nome = $(id+\'.fase_nome\').html();
			var fase_tipo = $(id+\'.fase_0\').val();
			var fase_data_inicio = $(id+\'.fase_1\').val();
			var fase_data_fim = $(id+\'.fase_2\').val();
									
			if (fase_nome == "Teste")
				{
					var teste = fase_tipo.substr(2, 3);
					var fase_tipo = fase_tipo.substr(0, 1);
					
					$(\'#teste\').val(teste);
				}
			
			$(\'#fase_tipo\').val(fase_tipo);
			$(\'#fase_data_inicio\').val(fase_data_inicio);
			$(\'#fase_data_fim\').val(fase_data_fim);
			
			
			$(\'#fase-form\').fadeIn("slow");
			if (fase_nome == "Teste")
				$(\'#tabs-2 #li_4\').fadeIn("slow");
		});
		
		$(\'#tabs-2 .save\').click(function() {
		
			var fase_erro = false;
			
			var fase_tipo = $(\'#fase_tipo option:selected\').val();
			var fase_data_inicio = $(\'#fase_data_inicio\').val();
			var fase_data_fim = $(\'#fase_data_fim\').val();
			var teste = $(\'#teste option:selected\').val();
			var fase = $(\'#fase_tipo option:selected\').html();
			
			if (!fase_tipo)
				{
					$(\'#tabs-2 #li_1 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-2 #li_1 .error\').show();
					fase_erro = true;
				}
			else
				$(\'#tabs-2 #li_1 .error\').hide();
				
			if (!fase_data_inicio)
				{
					$(\'#tabs-2 #li_2 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-2 #li_2 .error\').show();
					fase_erro = true;
				}
			else
				$(\'#tabs-2 #li_2 .error\').hide();
				
			if (!fase_data_fim)
				{
					$(\'#tabs-2 #li_3 .error\').html("Preenchimento obrigatório");
					$(\'#tabs-2 #li_3 .error\').show();
					fase_erro = true;
				}
			else
				$(\'#tabs-2 #li_3 .error\').hide();

			if (fase == "Teste")
				{
					if (!teste)
						{
							$(\'#tabs-2 #li_4 .error\').html("Preenchimento obrigatório");
							$(\'#tabs-2 #li_4 .error\').show();
							fase_erro = true;
						}
					else
						$(\'#tabs-2 #li_4 .error\').hide();
				}
			else
				$(\'#tabs-2 #li_4 .error\').hide();
				
			if (fase_erro == false)
				{
					var num = $(\'#fases-list li\').size() + 1;
					
					if (fase == "Teste")
						fase_tipo = fase_tipo + \'-\' + teste;
					
					var html = \'<li id="listItem_\'+num+\'">\'
					+\'<img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/arrow.png" alt="Mover" width="16" height="16" class="handle" />\'
					+\'<a href="#" title="Editar" class="edit"><img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/edit.png" alt="Editar" width="16" height="16" /></a>\'
					+\'<a href="#" title="Deletar" class="delete"><img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>\'
					
					+\'<strong class="fase_nome">\'+fase+\'</strong> (\'+fase_data_inicio+\' - \'+fase_data_fim+\')\'
					+\'<input class="fase_0" name="fase_tipo[]" type="hidden" value="\'+fase_tipo+\'"/>\'
					+\'<input class="fase_1" name="fase_data_inicio[]" type="hidden" value="\'+fase_data_inicio+\'"/>\'
					+\'<input class="fase_2" name="fase_data_fim[]" type="hidden" value="\'+fase_data_fim+\'"/>\'
					+\'</li>\';
					
					if (edit != false)
						{
							var html = 
							\'<img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/arrow.png" alt="Mover" width="16" height="16" class="handle" />\'
							+\'<a href="#" title="Editar" class="edit"><img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/edit.png" alt="Editar" width="16" height="16" /></a>\'
							+\'<a href="#" title="Deletar" class="delete"><img src="'; ?>
<?php echo $this->_config[0]['vars']['templateDir']; ?>
<?php echo 'resources/images/delete.png" alt="Deletar" width="16" height="16" /></a>\'
							
							+\'<strong class="fase_nome">\'+fase+\'</strong> (\'+fase_data_inicio+\' - \'+fase_data_fim+\')\'
							+\'<input class="fase_0" name="fase_tipo[]" type="hidden" value="\'+fase_tipo+\'"/>\'
							+\'<input class="fase_1" name="fase_data_inicio[]" type="hidden" value="\'+fase_data_inicio+\'"/>\'
							+\'<input class="fase_2" name="fase_data_fim[]" type="hidden" value="\'+fase_data_fim+\'"/>\';
							edit.html(html);
							edit = false;
						}
					else
						$(\'#fases-list\').append(html);
					
					clearFase();
					
					$(\'#fase-form\').fadeOut("slow");
					clearFase();
					
					$(\'.delete\').click(function(){
						$(this).parent().remove();
					});
					
					$(\'.edit\').click(function(){
					
						edit = $(this).parent();
						
						var id = \'#\'+$(this).parent().attr("id")+\' \';
						
						var fase_nome = $(id+\'.fase_nome\').html();
						var fase_tipo = $(id+\'.fase_0\').val();
						var fase_data_inicio = $(id+\'.fase_1\').val();
						var fase_data_fim = $(id+\'.fase_2\').val();
												
						if (fase_nome == "Teste")
							{
								var teste = fase_tipo.substr(2, 3);
								var fase_tipo = fase_tipo.substr(0, 1);
								
								$(\'#teste\').val(teste);
							}
						
						$(\'#fase_tipo\').val(fase_tipo);
						$(\'#fase_data_inicio\').val(fase_data_inicio);
						$(\'#fase_data_fim\').val(fase_data_fim);
						
						
						$(\'#fase-form\').fadeIn("slow");
						if (fase_nome == "Teste")
							$(\'#tabs-2 #li_4\').fadeIn("slow");
					});
					
				}
		});
		
		$(\'#tabs-2 .add\').click(function() {
			$(\'#fase-form\').fadeIn("slow");
		});
		
		$(\'#tabs-2 .clear\').click(function() {
			clearFase();
		});
		
		$(\'#tabs-2 .cancel\').click(function() {
			$(\'#fase-form\').fadeOut("slow");
			clearFase();
			$(\'.error\').each(function() {
    			$(this).hide();
  			});
		});
		
		$("#fases-list").sortable({
		  handle : \'.handle\',
		  update : function () {
			  var order = $(\'#fases-list\').sortable(\'serialize\');
			  //$("#ordem_fases").val(order);
		  }
		});
		'; ?>