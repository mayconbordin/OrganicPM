{config_load file=config.conf}
{include file="header.tpl"}

{if $page == "index"}
{include file="index\content.tpl"}
{/if}

{if $page == "login"}
{include file="login\content.tpl"}
{/if}

{if $page == "content" || $page == "curriculo"  || $page == "cadastro" || $page == "admin"}
{include file="content\content.tpl"}
{/if}

{include file="footer.tpl"}