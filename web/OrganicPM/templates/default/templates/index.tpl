{config_load file=config.conf}
{include file="header.tpl"}

{if $page == "index"}
{include file="index\content.tpl"}
{/if}

{if $page == "login"}
{include file="login\content.tpl"}
{/if}

{if $page == "content" || $page == "vagas" || $page == "selecao" || $page == "fases" || $page == "curriculo"  || $page == "cadastro" || $page == "admin" || $page == "dados_pessoais" || $page == "endereco" || $page == "contatos" || $page == "conhecimentos" || $page == "experiencia_profissional" || $page == "formacao_academica" || $page == "formacao_adicional" || $page == "idiomas" || $page == "referencias"}
{include file="content\content.tpl"}
{/if}

{include file="footer.tpl"}