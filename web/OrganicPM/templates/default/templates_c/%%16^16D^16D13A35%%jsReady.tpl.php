<?php /* Smarty version 2.6.26, created on 2010-05-26 09:13:04
         compiled from content%5CjsReady.tpl */ ?>
<?php echo '
				//Background
				var bgHeight = $(\'#background img\').css(\'height\').substr(0, 3);
				var height = bgHeight - 130;
				$(\'#background img\').css({\'height\' : height+\'px\'});
				
				//Reajuste de largura
				var width = $(window).width() - 460;
				$(\'#content #content-wrapper #right\').css({\'width\' : width+\'px\'});
'; ?>