{config_load file=config.conf}
{include file="header.tpl"}

{if $isAdmin === true}
{include file="admin\content.tpl"}
{else}
{include file="admin\\naoLogado.tpl"}
{/if}

{include file="footer.tpl"}