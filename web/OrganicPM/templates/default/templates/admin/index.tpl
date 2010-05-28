{config_load file=config.conf}
{include file="header.tpl"}

{if $isAdmin === false}
{include file="admin\content.tpl"}
{/if}

{include file="footer.tpl"}