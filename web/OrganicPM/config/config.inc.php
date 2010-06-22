<?php
/**
 * Config.inc.php
 *
 */
 
/**
 * Database Constants - these constants are required
 * in order for there to be a successful connection
 * to the MySQL database. Make sure the information is
 * correct.
 */
define('DB_USERNAME', 'maycon');
define('DB_PASSWORD', 'servidor');
define('DB_CONNECTION_STRING', '127.0.0.1/XE');

/**
 * Paths
 */
define('ROOT', 'C:\Arquivos de programas\XAMPP\xampp\htdocs\OrganicPM\\');

/**
 * Database Table Constants - these constants
 * hold the names of all the database tables used
 * in the script.
 */
 
define("TBL_BROWSERS", "rs_browsers");
define("TBL_BROWSER_VERSIONS", "rs_versoes_browser");
define("TBL_OPERATIONAL_SYSTEMS", "rs_sistema_operacional");
define("TBL_LOGIN_ATTEMPTS", "rs_tentativas_login");
define("TBL_USERS", "rs_usuarios");
define("TBL_PESSOAS",  "ge_pessoas");

define("TBL_VISITS", "rs_visitas");
define("TBL_PAGEVIEWS", "rs_pageviews");
define("TBL_VISITED_PAGES", "rs_paginas_visitadas");


/**
 * Tabelas
 */
define("TBL_CANDIDATOS", "RS_CANDIDATOS");                                                                                                                                                                                                                                       
define("TBL_REFERENCIAS", "RS_REFERENCIAS");                                                                                                                                                                                                                                     
define("TBL_INSTITUICOES_ENSINO", "RS_INSTITUICOES_ENSINO");                                                                                                                                                                                                                     
define("TBL_FORMACOES_ACADEMICAS", "RS_FORMACOES_ACADEMICAS");                                                                                                                                                                                                                   
define("TBL_PROCESSOS_SELETIVOS", "RS_PROCESSOS_SELETIVOS");                                                                                                                                                                                                                     
define("TBL_NIVEIS_FORMACOES", "RS_NIVEIS_FORMACOES");                                                                                                                                                                                                                           
define("TBL_EXPERIENCIAS", "RS_EXPERIENCIAS");                                                                                                                                                                                                                                   
define("TBL_ESTADOS_CIVIS", "GE_ESTADOS_CIVIS");                                                                                                                                                                                                                                 
define("TBL_EXPERIENCIAS_SETOR", "RS_EXPERIENCIAS_SETOR");                                                                                                                                                                                                                       
define("TBL_IDIOMAS", "RS_IDIOMAS");                                                                                                                                                                                                                                             
define("TBL_IDIOMAS_CANDIDATOS", "RS_IDIOMAS_CANDIDATOS");                                                                                                                                                                                                                       
define("TBL_UNIDADES_FEDERATIVAS", "GE_UNIDADES_FEDERATIVAS");                                                                                                                                                                                                                   
define("TBL_TELEFONES", "GE_TELEFONES");                                                                                                                                                                                                                                         
define("TBL_TIPO_TELEFONE", "GE_TIPO_TELEFONE");                                                                                                                                                                                                                                 
define("TBL_TIPOS_TESTES", "RS_TIPOS_TESTES");                                                                                                                                                                                                                                   
define("TBL_QUESTOES", "RS_QUESTOES");                                                                                                                                                                                                                                           
define("TBL_ALTERNATIVAS_QUESTOES", "RS_ALTERNATIVAS_QUESTOES");                                                                                                                                                                                                                 
define("TBL_RESPOSTAS_CANDIDATOS", "RS_RESPOSTAS_CANDIDATOS");                                                                                                                                                                                                                   
define("TBL_TIPOS_GABARITOS", "RS_TIPOS_GABARITOS");                                                                                                                                                                                                                             
define("TBL_VALORES_GABARITO", "RS_VALORES_GABARITO");                                                                                                                                                                                                                           
define("TBL_TIPOS_QUESTOES", "RS_TIPOS_QUESTOES");                                                                                                                                                                                                                               
define("TBL_TESTES", "RS_TESTES");                                                                                                                                                                                                                                               
define("TBL_CURSOS_FORMACOES", "RS_CURSOS_FORMACOES");                                                                                                                                                                                                                           
define("TBL_CONHECIMENTOS", "RS_CONHECIMENTOS");                                                                                                                                                                                                                                 
define("TBL_FORMACOES_ADICIONAIS", "RS_FORMACOES_ADICIONAIS");                                                                                                                                                                                                                   
define("TBL_CANDIDATOS_PROCESSOS_SELETI", "RS_CANDIDATOS_PROCESSOS_SELETI");                                                                                                                                                                                                     
define("TBL_USUARIOS", "RS_USUARIOS");                                                                                                                                                                                                                                           
define("TBL_ANDAMENTO_CURSO", "RS_ANDAMENTO_CURSO");                                                                                                                                                                                                                             
define("TBL_TESTES_CANDIDATOS", "RS_TESTES_CANDIDATOS");                                                                                                                                                                                                                         
define("TBL_RESULTADOS", "TD_RESULTADOS");                                                                                                                                                                                                                                       
define("TBL_RECURSOS", "TD_RECURSOS");                                                                                                                                                                                                                                           
define("TBL_AMBIENTES", "TD_AMBIENTES");                                                                                                                                                                                                                                         
define("TBL_TECNICAS", "TD_TECNICAS");                                                                                                                                                                                                                                           
define("TBL_TREINAMENTOS", "TD_TREINAMENTOS");                                                                                                                                                                                                                                   
define("TBL_INSTRUTORES", "TD_INSTRUTORES");                                                                                                                                                                                                                                     
define("TBL_METODOS", "TD_METODOS");                                                                                                                                                                                                                                             
define("TBL_OBJETIVOS", "TD_OBJETIVOS");                                                                                                                                                                                                                                         
define("TBL_TURMAS", "TD_TURMAS");                                                                                                                                                                                                                                               
define("TBL_AVALIACOES", "ADP_AVALIACOES");                                                                                                                                                                                                                                     
define("TBL_INDICADORES", "ADP_INDICADORES");                                                                                                                                                                                                                                   
define("TBL_INDICADORES_CARGOS", "ADP_INDICADORES_CARGOS");                                                                                                                                                                                                                     
define("TBL_COLABORADORES_CARGO", "GE_COLABORADORES_CARGO");                                                                                                                                                                                                                     
define("TBL_COLABORADOR_AFASTAMENTOS", "FP_COLABORADOR_AFASTAMENTOS");                                                                                                                                                                                                           
define("TBL_ATRIBUTOS_COLABORADORES", "FP_ATRIBUTOS_COLABORADORES");                                                                                                                                                                                                             
define("TBL_ATRIBUTOS_CO", "FP_ATRIBUTOS_CO");                                                                                                                                                                                                                                   
define("TBL_COLABORADOR_BENEFICIOS", "FP_COLABORADOR_BENEFICIOS");                                                                                                                                                                                                               
define("TBL_COLABORADOR_DEPENDENTES", "FP_COLABORADOR_DEPENDENTES");                                                                                                                                                                                                             
define("TBL_COLABORADOR_SALARIOS", "FP_COLABORADOR_SALARIOS");                                                                                                                                                                                                                   
define("TBL_PESSOAS", "GE_PESSOAS");                                                                                                                                                                                                                                             
define("TBL_COLABORADORES", "GE_COLABORADORES");                                                                                                                                                                                                                                 
define("TBL_TIPOS_CARGO", "FP_TIPOS_CARGO");                                                                                                                                                                                                                                     
define("TBL_DEPARTAMENTOS", "FP_DEPARTAMENTOS");                                                                                                                                                                                                                                 
define("TBL_ATRIBUTOS_CARGOS", "FP_ATRIBUTOS_CARGOS");                                                                                                                                                                                                                           
define("TBL_ATRIBUTOS", "FP_ATRIBUTOS");                                                                                                                                                                                                                                         
define("TBL_CARGOS", "FP_CARGOS");                                                                                                                                                                                                                                               
define("TBL_TREINAMENTO_COLABORADORES", "TD_TREINAMENTO_COLABORADORES");                                                                                                                                                                                                         
define("TBL_FORNECEDORES", "GE_FORNECEDORES");                                                                                                                                                                                                                                   
define("TBL_CLIENTES", "GE_CLIENTES");                                                                                                                                                                                                                                           
define("TBL_EVENTOS_FOLHA", "SB_EVENTOS_FOLHA");                                                                                                                                                                                                                                 
define("TBL_CADASTRO_FERIAS", "SB_CADASTRO_FERIAS");                                                                                                                                                                                                                             
define("TBL_TIPO_FOLHA", "SB_TIPO_FOLHA");                                                                                                                                                                                                                                       
define("TBL_EVENTOS", "SB_EVENTOS");                                                                                                                                                                                                                                             
define("TBL_FOLHA_PAGAMENTO", "SB_FOLHA_PAGAMENTO");                                                                                                                                                                                                                             
define("TBL_VISITAS", "RS_VISITAS");                                                                                                                                                                                                                                             
define("TBL_VERSOES_BROWSER", "RS_VERSOES_BROWSER");                                                                                                                                                                                                                             
define("TBL_BROWSERS", "RS_BROWSERS");                                                                                                                                                                                                                                           
define("TBL_SISTEMA_OPERACIONAL", "RS_SISTEMA_OPERACIONAL");                                                                                                                                                                                                                     
define("TBL_PAGEVIEWS", "RS_PAGEVIEWS");                                                                                                                                                                                                                                         
define("TBL_PAGINAS_VISITADAS", "RS_PAGINAS_VISITADAS");                                                                                                                                                                                                                         
define("TBL_TENTATIVAS_LOGIN", "RS_TENTATIVAS_LOGIN");                                                                                                                                                                                                                           
define("TBL_SALDO_FERIAS", "SB_SALDO_FERIAS");                                                                                                                                                                                                                                   
define("TBL_FASES", "RS_FASES");                                                                                                                                                                                                                                                 
define("TBL_ENTREVISTAS_CANDIDATOS", "RS_ENTREVISTAS_CANDIDATOS");                                                                                                                                                                                                               
define("TBL_TRIAGENS_CANDIDATOS", "RS_TRIAGENS_CANDIDATOS");                                                                                                                                                                                                                     
define("TBL_TIPOS_FASES", "RS_TIPOS_FASES");                                                                                                                                                                                                                                     
define("TBL_FASE_ENTREVISTAS", "RS_FASE_ENTREVISTAS");                                                                                                                                                                                                                           
define("TBL_FASE_TRIAGENS", "RS_FASE_TRIAGENS");                                                                                                                                                                                                                                 
define("TBL_FASE_TESTES", "RS_FASE_TESTES");                                                                                                                                                                                                                                     
define("TBL_NIVEIS_USUARIO", "RS_NIVEIS_USUARIO");
define("TBL_NOTAS", "RS_NOTAS");
define("TBL_LOGS", "GE_LOGS");  


/**
 * Blocked IP Config
 */
define("BLOCK_TIME", 30 * 60); //30 minutos
define("ATTEMPT_INTERVAL", 10 * 60);
define("MAX_IP_ATTEMPTS", 3);
define("MAX_USERNAME_ATTEMPTS", 3);


/**
 * Special Names and Level Constants - the admin
 * page will only be accessible to the user with
 * the admin name and also to those users at the
 * admin user level. Feel free to change the names
 * and level constants as you see fit, you may
 * also add additional level specifications.
 * Levels must be digits between 0-9.
 */
define("ADMIN_NAME", "admin");
define("GUEST_NAME", "Guest");
define("ADMIN_LEVEL", 9);
define("RH_LEVEL",  5);
define("FUNC_LEVEL",  2);
define("USER_LEVEL",  1);
define("GUEST_LEVEL", 0);

/**
 * This boolean constant controls whether or
 * not the script keeps track of active users
 * and active guests who are visiting the site.
 */
define("TRACK_VISITORS", true);

/**
 * Timeout Constants - these constants refer to
 * the maximum amount of time (in seconds) after
 * their last page fresh that a user and guest
 * are still considered active visitors.
 */

//User timeout is also used to logout inactive users
define("USER_TIMEOUT", 10 * 60);
define("GUEST_TIMEOUT", 5 * 60);

//Time to be cosidered a new visit
define("USER_VISIT_INTERVAL", 30 * 60);

/**
 * Cookie Constants - these are the parameters
 * to the setcookie function call, change them
 * if necessary to fit your website. If you need
 * help, visit www.php.net for more info.
 * <http://www.php.net/manual/en/function.setcookie.php>
 */
define("COOKIE_REMEMBER_NAME", "LOG_KEY");
define("COOKIE_EXPIRE", 60*60*24);  //1 days by default
define("COOKIE_PATH", "/");  //Avaible in whole domain

/**
 * Email Constants - these specify what goes in
 * the from field in the emails that the script
 * sends to users, and whether to send a
 * welcome email to newly registered users.
 */
define("EMAIL_FROM_NAME", "Metal4Share");
define("EMAIL_FROM_ADDR", "metal4share@gmail.com");
define("EMAIL_WELCOME", false);

/**
 * This constant forces all users to have
 * lowercase usernames, capital letters are
 * converted automatically.
 */
define("ALL_LOWERCASE", false);


/**
 * Templates
 */
define("ADMIN_PANEL", "adminPanel");
define("DEFAULT_TEMPLATE", "default");


/**
 * Checa status
 */
include_once ROOT.'cronjobs/checkStatus.php';
$checkStatus = new checkStatus();