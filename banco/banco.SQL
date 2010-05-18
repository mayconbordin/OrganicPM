-- Create sequences section -------------------------------------------------

CREATE SEQUENCE experiencia_setor_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE experiencia_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE nivel_formacao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE curso_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE andamento_curso_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE referencia_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE idioma_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE formacao_academica_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE instituicao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE formacao_adicional_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE triagem_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE teste_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE entrevista_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE processo_seletivo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tipo_teste_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE questao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tipo_questao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE alternativa_questao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tipo_gabarito_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE valor_gabarito_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE pessoa_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE unidade_federativa_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE estado_civil_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE telefone_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE colaborador_salario_cod
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE colaborador_dependente_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE colaborador_beneficio_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE colaborador_afast_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE resultado_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE treinamento_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE instrutor_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE turma_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE ambiente_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE recurso_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE objetivo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE metodo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tecnica_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE pagamento_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE evento_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tipo_cargo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE atributo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE cargo_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE departamento_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE indicador_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE browser_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE versao_browser_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE sistema_operacional_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE visita_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE pagina_visitada_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE pageview_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

-- Create tables section -------------------------------------------------

-- Table rs_candidatos

CREATE TABLE rs_candidatos(
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_candidatos

ALTER TABLE rs_candidatos ADD CONSTRAINT pk_rs_candidato PRIMARY KEY (pessoa_cod)
/

-- Table rs_referencias

CREATE TABLE rs_referencias(
  referencia_cod Integer NOT NULL,
  referencia_nome Varchar2(30 ) NOT NULL,
  referencia_empresa Varchar2(30 ),
  referencia_vinculo Varchar2(30 ),
  referencia_fone Varchar2(30 ) NOT NULL,
  referencia_email Varchar2(30 ),
  pessoa_cod Integer
)
/

-- Add keys for table rs_referencias

ALTER TABLE rs_referencias ADD CONSTRAINT pk_rs_referencias PRIMARY KEY (referencia_cod)
/

-- Table rs_entrevistas

CREATE TABLE rs_entrevistas(
  entrevista_cod Integer NOT NULL,
  proc_sel_cod Integer NOT NULL,
  ordem Integer NOT NULL
)
/

-- Add keys for table rs_entrevistas

ALTER TABLE rs_entrevistas ADD CONSTRAINT pk_rs_entrevista PRIMARY KEY (entrevista_cod)
/

-- Table rs_instituicoes_ensino

CREATE TABLE rs_instituicoes_ensino(
  ins_ens_cod Integer NOT NULL,
  nome Varchar2(30 ) NOT NULL
)
/

-- Add keys for table rs_instituicoes_ensino

ALTER TABLE rs_instituicoes_ensino ADD CONSTRAINT pk_rs_ins_ens PRIMARY KEY (ins_ens_cod)
/

-- Table rs_formacoes_academicas

CREATE TABLE rs_formacoes_academicas(
  for_aca_cod Integer NOT NULL,
  cur_for_cod Integer NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  ins_ens_cod Integer NOT NULL,
  niv_for_cod Integer NOT NULL,
  and_cur_cod Integer NOT NULL,
  pessoa_cod Integer
)
/

-- Add keys for table rs_formacoes_academicas

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT pk_rs_for_aca PRIMARY KEY (for_aca_cod)
/

-- Table rs_processos_seletivos

CREATE TABLE rs_processos_seletivos(
  pro_sel_cod Integer NOT NULL,
  descricao Varchar2(300 ) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  vagas Integer NOT NULL,
  cargo_cod Integer
)
/

-- Add keys for table rs_processos_seletivos

ALTER TABLE rs_processos_seletivos ADD CONSTRAINT pk_rs_pro_sel PRIMARY KEY (pro_sel_cod)
/

-- Table rs_niveis_formacoes

CREATE TABLE rs_niveis_formacoes(
  niv_for_cod Integer NOT NULL,
  nivel Varchar2(80 ) NOT NULL
)
/

-- Add keys for table rs_niveis_formacoes

ALTER TABLE rs_niveis_formacoes ADD CONSTRAINT pk_rs_niv_for PRIMARY KEY (niv_for_cod)
/

-- Table rs_experiencias

CREATE TABLE rs_experiencias(
  experiencia_cod Integer NOT NULL,
  empresa Varchar2(30 ) NOT NULL,
  funcao Varchar2(30 ) NOT NULL,
  atribuicoes Varchar2(300 ) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  exp_set_cod Integer NOT NULL,
  pessoa_cod Integer
)
/

-- Add keys for table rs_experiencias

ALTER TABLE rs_experiencias ADD CONSTRAINT pk_rs_experiencia PRIMARY KEY (experiencia_cod)
/

-- Table ge_estados_civis

CREATE TABLE ge_estados_civis(
  est_civ_cod Integer NOT NULL,
  descricao Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ge_estados_civis

ALTER TABLE ge_estados_civis ADD CONSTRAINT pk_ge_est_civ PRIMARY KEY (est_civ_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_estados_civis IS 'Tabela comum entre outros módulos do sistema
'
/

-- Table rs_experiencias_setor

CREATE TABLE rs_experiencias_setor(
  exp_set_cod Integer NOT NULL,
  setor Varchar2(30 ) NOT NULL
)
/

-- Add keys for table rs_experiencias_setor

ALTER TABLE rs_experiencias_setor ADD CONSTRAINT pk_rs_exp_set PRIMARY KEY (exp_set_cod)
/

-- Table rs_idiomas

CREATE TABLE rs_idiomas(
  idioma_cod Integer NOT NULL,
  idioma Varchar2(30 ) NOT NULL
)
/

-- Add keys for table rs_idiomas

ALTER TABLE rs_idiomas ADD CONSTRAINT pk_rs_idioma PRIMARY KEY (idioma_cod)
/

-- Table rs_idiomas_candidatos

CREATE TABLE rs_idiomas_candidatos(
  idioma_cod Integer NOT NULL,
  leitura Integer NOT NULL,
  conversacao Integer NOT NULL,
  escrita Integer NOT NULL,
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_idiomas_candidatos

ALTER TABLE rs_idiomas_candidatos ADD CONSTRAINT pk_rs_idi_can PRIMARY KEY (idioma_cod,pessoa_cod)
/

-- Table ge_unidades_federativas

CREATE TABLE ge_unidades_federativas(
  uni_fed_cod Integer NOT NULL,
  nome Varchar2(60 ) NOT NULL
)
/

-- Add keys for table ge_unidades_federativas

ALTER TABLE ge_unidades_federativas ADD CONSTRAINT pk_ge_uni_fed PRIMARY KEY (uni_fed_cod)
/

-- Table ge_telefones

CREATE TABLE ge_telefones(
  telefone_cod Integer NOT NULL,
  numero Varchar2(30 ) NOT NULL,
  area Varchar2(30 ) NOT NULL,
  tip_tel_tipo Varchar2(30 ) NOT NULL,
  pessoa_cod Integer
)
/

-- Add keys for table ge_telefones

ALTER TABLE ge_telefones ADD CONSTRAINT pk_ge_telefone PRIMARY KEY (telefone_cod)
/

-- Table ge_tipo_telefone

CREATE TABLE ge_tipo_telefone(
  tip_tel_tipo Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ge_tipo_telefone

ALTER TABLE ge_tipo_telefone ADD CONSTRAINT pk_ge_tip_tel PRIMARY KEY (tip_tel_tipo)
/

-- Table rs_tipos_testes

CREATE TABLE rs_tipos_testes(
  tip_tes_cod Integer NOT NULL,
  tipo Varchar2(60 )
)
/

-- Add keys for table rs_tipos_testes

ALTER TABLE rs_tipos_testes ADD CONSTRAINT pk_rs_tip_tes PRIMARY KEY (tip_tes_cod)
/

-- Table rs_questoes

CREATE TABLE rs_questoes(
  questao_cod Integer NOT NULL,
  descricao Varchar2(2000 ),
  teste_cod Integer NOT NULL,
  tip_que_cod Integer NOT NULL
)
/

-- Add keys for table rs_questoes

ALTER TABLE rs_questoes ADD CONSTRAINT pk_rs_questao PRIMARY KEY (questao_cod)
/

-- Table rs_alternativas_questoes

CREATE TABLE rs_alternativas_questoes(
  alt_que_cod Integer NOT NULL,
  descricao Varchar2(1000 ),
  questao_cod Integer NOT NULL
)
/

-- Add keys for table rs_alternativas_questoes

ALTER TABLE rs_alternativas_questoes ADD CONSTRAINT pk_rs_alt_que PRIMARY KEY (alt_que_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_alternativas_questoes IS 'Cada questão possui um conjunto de alternativas.
'
/

-- Table rs_respostas_candidatos

CREATE TABLE rs_respostas_candidatos(
  alt_que_cod Integer NOT NULL,
  resposta Varchar2(60 ),
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_respostas_candidatos

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT pk_rs_res_can PRIMARY KEY (alt_que_cod,pessoa_cod)
/

-- Table rs_tipos_gabaritos

CREATE TABLE rs_tipos_gabaritos(
  tip_gab_cod Integer NOT NULL,
  descricao Varchar2(120 )
)
/

-- Add keys for table rs_tipos_gabaritos

ALTER TABLE rs_tipos_gabaritos ADD CONSTRAINT pk_rs_tip_gab PRIMARY KEY (tip_gab_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_tipos_gabaritos IS 'Atrelado a cada tipo de questão está um tipo de gabarito. Tipos diferentes de questões podem vir a usar o mesmo modelo de gabarito. Esse tipo de gabarito define as respostas que podem ser dadas para uma questão. Em questões de verdadeiro ou falso, por exemplo, seriam os valores verdadeiro ou falso. Em questões de uma única escolha ou múltipla escolha seriam atribuidas notas para cada questão.
'
/

-- Table rs_valores_gabarito

CREATE TABLE rs_valores_gabarito(
  val_gab_cod Integer NOT NULL,
  valor Varchar2(100 ) NOT NULL,
  tip_gab_cod Integer NOT NULL
)
/

-- Add keys for table rs_valores_gabarito

ALTER TABLE rs_valores_gabarito ADD CONSTRAINT pk_rs_val_gab PRIMARY KEY (val_gab_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_valores_gabarito IS 'São os valores que um tipo de gabarito permite que sejam atribuidos as respostas das alternativas.
'
/

-- Table rs_gabaritos_alternativas

CREATE TABLE rs_gabaritos_alternativas(
  alt_que_cod Integer NOT NULL,
  val_gab_cod Integer NOT NULL
)
/

-- Add keys for table rs_gabaritos_alternativas

ALTER TABLE rs_gabaritos_alternativas ADD CONSTRAINT pk_rs_gab_alt PRIMARY KEY (alt_que_cod,val_gab_cod)
/

-- Table rs_tipos_questoes

CREATE TABLE rs_tipos_questoes(
  tip_que_cod Integer NOT NULL,
  tipo Varchar2(60 ),
  tip_gab_cod Integer NOT NULL
)
/

-- Add keys for table rs_tipos_questoes

ALTER TABLE rs_tipos_questoes ADD CONSTRAINT pk_rs_tip_que PRIMARY KEY (tip_que_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_tipos_questoes IS 'As questões podem ser de vários tipos, escolha única, múltipla escolha, verdadeiro ou falso. Essa tabela é responsável por classificar as questões.
'
/

-- Table rs_testes

CREATE TABLE rs_testes(
  teste_cod Integer NOT NULL,
  tip_tes_cod Integer NOT NULL,
  descricao Varchar2(300 ) NOT NULL,
  ordem Integer NOT NULL,
  pro_sel_cod Integer NOT NULL
)
/

-- Add keys for table rs_testes

ALTER TABLE rs_testes ADD CONSTRAINT pk_rs_teste PRIMARY KEY (teste_cod)
/

-- Table rs_cursos_formacoes

CREATE TABLE rs_cursos_formacoes(
  cur_for_cod Integer NOT NULL,
  nome Varchar2(60 ) NOT NULL
)
/

-- Add keys for table rs_cursos_formacoes

ALTER TABLE rs_cursos_formacoes ADD CONSTRAINT pk_rs_cur_for PRIMARY KEY (cur_for_cod)
/

-- Table rs_conhecimentos

CREATE TABLE rs_conhecimentos(
  conhecimento_cod Integer NOT NULL,
  grupo Varchar2(30 ) NOT NULL,
  descricao Varchar2(100 ) NOT NULL,
  proficiencia Varchar2(30 ) NOT NULL
)
/

-- Add keys for table rs_conhecimentos

ALTER TABLE rs_conhecimentos ADD CONSTRAINT pk_rs_conhecimento PRIMARY KEY (conhecimento_cod)
/

-- Table rs_formacoes_adicionais

CREATE TABLE rs_formacoes_adicionais(
  for_adi_cod Integer NOT NULL,
  ins_ens_cod Integer NOT NULL,
  tipo Varchar2(30 BYTE) NOT NULL,
  nome Varchar2(30 BYTE) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  carga_horaria Integer NOT NULL,
  pessoa_cod Integer
)
/

-- Add keys for table rs_formacoes_adicionais

ALTER TABLE rs_formacoes_adicionais ADD CONSTRAINT pk_rs_for_ad PRIMARY KEY (for_adi_cod)
/

-- Table rs_conhecimentos_candidatos

CREATE TABLE rs_conhecimentos_candidatos(
  conhechecimento_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_conhecimentos_candidatos

ALTER TABLE rs_conhecimentos_candidatos ADD CONSTRAINT pk_rs_con_can PRIMARY KEY (conhechecimento_cod,pessoa_cod)
/

-- Table rs_candidatos_processos_seleti

CREATE TABLE rs_candidatos_processos_seleti(
  pro_sel_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_candidatos_processos_seleti

ALTER TABLE rs_candidatos_processos_seleti ADD CONSTRAINT pk_rs_can_pro_sel PRIMARY KEY (pro_sel_cod,pessoa_cod)
/

-- Table rs_usuarios

CREATE TABLE rs_usuarios(
  pessoa_cod Integer NOT NULL,
  nome Varchar2(60 ) NOT NULL,
  senha Char(40 ) NOT NULL,
  nivel Integer NOT NULL,
  chave Char(32 ) NOT NULL,
  status Varchar2(10 ) NOT NULL,
  data_registro Integer NOT NULL,
  ultimo_acesso Integer NOT NULL
)
/

-- Add keys for table rs_usuarios

ALTER TABLE rs_usuarios ADD CONSTRAINT pk_rs_usuario PRIMARY KEY (pessoa_cod)
/

-- Table rs_andamento_curso

CREATE TABLE rs_andamento_curso(
  and_cur_cod Integer NOT NULL,
  status Varchar2(30 ) NOT NULL
)
/

-- Add keys for table rs_andamento_curso

ALTER TABLE rs_andamento_curso ADD CONSTRAINT pk_rs_and_cur PRIMARY KEY (and_cur_cod)
/

-- Table rs_triagens

CREATE TABLE rs_triagens(
  triagem_cod Integer NOT NULL,
  ordem Integer,
  proc_sel_cod Integer
)
/

-- Add keys for table rs_triagens

ALTER TABLE rs_triagens ADD CONSTRAINT pk_rs_triagem PRIMARY KEY (triagem_cod)
/

-- Table rs_testes_candidatos

CREATE TABLE rs_testes_candidatos(
  teste_cod Integer NOT NULL,
  status Varchar2(30 ),
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_testes_candidatos

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT pk_rs_tes_cand PRIMARY KEY (teste_cod,pessoa_cod)
/

-- Table rs_entrevistas_candidatos

CREATE TABLE rs_entrevistas_candidatos(
  entrevista_cod Integer NOT NULL,
  data Date,
  comentario Varchar2(4000 ),
  entrevistador Varchar2(80 ),
  status Varchar2(30 ),
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_entrevistas_candidatos

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT pk_rs_ent_cand PRIMARY KEY (entrevista_cod,pessoa_cod)
/

-- Table rs_triagens_candidatos

CREATE TABLE rs_triagens_candidatos(
  triagem_cod Integer NOT NULL,
  status Varchar2(30 ),
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table rs_triagens_candidatos

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT pk_rs_tri_can PRIMARY KEY (triagem_cod,pessoa_cod)
/

-- Table td_resultados

CREATE TABLE td_resultados(
  resultado_cod Integer NOT NULL,
  descricao Varchar2(100 ),
  observacoes Varchar2(500 )
)
/

-- Add keys for table td_resultados

ALTER TABLE td_resultados ADD CONSTRAINT pk_td_resultado PRIMARY KEY (resultado_cod)
/

-- Table td_recursos

CREATE TABLE td_recursos(
  recurso_cod Integer NOT NULL,
  descricao Varchar2(100 ) NOT NULL
)
/

-- Add keys for table td_recursos

ALTER TABLE td_recursos ADD CONSTRAINT pk_td_recurso PRIMARY KEY (recurso_cod)
/

-- Table td_ambientes

CREATE TABLE td_ambientes(
  ambiente_cod Integer NOT NULL,
  recurso_cod Integer NOT NULL,
  descricao Varchar2(300 ),
  endereco Varchar2(100 ),
  bairro Varchar2(100 ),
  locais_referencia Varchar2(200 ),
  logradouro Integer,
  observacoes Varchar2(500 )
)
/

-- Add keys for table td_ambientes

ALTER TABLE td_ambientes ADD CONSTRAINT pk_td_ambiente PRIMARY KEY (ambiente_cod)
/

-- Table td_tecnicas

CREATE TABLE td_tecnicas(
  tecnica_cod Integer NOT NULL,
  nome Varchar2(60 )
)
/

-- Add keys for table td_tecnicas

ALTER TABLE td_tecnicas ADD CONSTRAINT pk_td_tecnica PRIMARY KEY (tecnica_cod)
/

-- Table td_treinamentos

CREATE TABLE td_treinamentos(
  treinamento_cod Integer NOT NULL,
  descricao Varchar2(100 ),
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  turma_cod Integer NOT NULL,
  objetivo_cod Integer NOT NULL,
  metodo_cod Integer NOT NULL,
  instrutor_cod Integer NOT NULL
)
/

-- Add keys for table td_treinamentos

ALTER TABLE td_treinamentos ADD CONSTRAINT pk_td_treinamento PRIMARY KEY (treinamento_cod)
/

-- Table td_instrutores

CREATE TABLE td_instrutores(
  instrutor_cod Integer NOT NULL,
  nome Varchar2(50 ) NOT NULL,
  cpf Varchar2(11 ) NOT NULL,
  email Varchar2(80 ) NOT NULL,
  endereco Varchar2(80 ),
  bairro Varchar2(80 ),
  local_referencia Varchar2(100 ),
  logradouro Varchar2(8 ),
  experiencias Varchar2(500 ) NOT NULL
)
/

-- Add keys for table td_instrutores

ALTER TABLE td_instrutores ADD CONSTRAINT pk_td_instrutor PRIMARY KEY (instrutor_cod)
/

-- Table td_metodos

CREATE TABLE td_metodos(
  metodo_cod Integer NOT NULL,
  tecnica_cod Integer NOT NULL,
  nome Varchar2(40 ),
  observacoes Varchar2(500 ) NOT NULL
)
/

-- Add keys for table td_metodos

ALTER TABLE td_metodos ADD CONSTRAINT pk_td_metodo PRIMARY KEY (metodo_cod)
/

-- Table td_objetivos

CREATE TABLE td_objetivos(
  objetivo_cod Integer NOT NULL,
  descricao Varchar2(100 ),
  finalidade Varchar2(300 ) NOT NULL
)
/

-- Add keys for table td_objetivos

ALTER TABLE td_objetivos ADD CONSTRAINT pk_td_objetivo PRIMARY KEY (objetivo_cod)
/

-- Table td_turmas

CREATE TABLE td_turmas(
  turma_cod Integer NOT NULL,
  ambiente_cod Integer NOT NULL,
  nome Varchar2(40 ) NOT NULL
)
/

-- Add keys for table td_turmas

ALTER TABLE td_turmas ADD CONSTRAINT pk_td_turma PRIMARY KEY (turma_cod)
/

-- Table adp_avaliacoes

CREATE TABLE adp_avaliacoes(
  avaliacao_data Date NOT NULL,
  indicador_cod Integer NOT NULL,
  avaliacao_avaliador Varchar2(100 ) NOT NULL,
  nota Integer,
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table adp_avaliacoes

ALTER TABLE adp_avaliacoes ADD CONSTRAINT pk_adp_avaliacao PRIMARY KEY (avaliacao_data,indicador_cod,avaliacao_avaliador,pessoa_cod)
/

-- Table adp_indicadores

CREATE TABLE adp_indicadores(
  indicador_cod Integer NOT NULL,
  descricao Varchar2(500 )
)
/

-- Add keys for table adp_indicadores

ALTER TABLE adp_indicadores ADD CONSTRAINT pk_adp_indicador PRIMARY KEY (indicador_cod)
/

-- Table adp_indicadores_cargos

CREATE TABLE adp_indicadores_cargos(
  indicador_cod Integer NOT NULL,
  cargo_cod Integer NOT NULL
)
/

-- Add keys for table adp_indicadores_cargos

ALTER TABLE adp_indicadores_cargos ADD CONSTRAINT pk_adp_ind_car PRIMARY KEY (indicador_cod,cargo_cod)
/

-- Table ge_colaboradores_cargo

CREATE TABLE ge_colaboradores_cargo(
  col_car_matricula Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  horas_semanais Number,
  data_inicial Date,
  data_final Date,
  status Char(1 ),
  cargo_cod Integer
)
/

-- Add keys for table ge_colaboradores_cargo

ALTER TABLE ge_colaboradores_cargo ADD CONSTRAINT pk_ge_col_car PRIMARY KEY (col_car_matricula,pessoa_cod)
/

-- Table fp_colaborador_afastamentos

CREATE TABLE fp_colaborador_afastamentos(
  col_afa_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  motivo Varchar2(500 ),
  data_inicial Date,
  data_final Date,
  atestado_medico Char(1 )
)
/

-- Add keys for table fp_colaborador_afastamentos

ALTER TABLE fp_colaborador_afastamentos ADD CONSTRAINT pk_fp_col_afa PRIMARY KEY (col_afa_cod)
/

-- Table fp_atributos_colaboradores

CREATE TABLE fp_atributos_colaboradores(
  pessoa_cod Integer NOT NULL,
  atr_co_cod Varchar2(30 ) NOT NULL,
  status Char(1 )
)
/

-- Add keys for table fp_atributos_colaboradores

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT pk_fp_atr_col PRIMARY KEY (pessoa_cod,atr_co_cod)
/

-- Table fp_atributos_co

CREATE TABLE fp_atributos_co(
  atr_co_cod Varchar2(30 ) NOT NULL,
  descricao Varchar2(500 ),
  tipo Char(1 )
)
/

-- Add keys for table fp_atributos_co

ALTER TABLE fp_atributos_co ADD CONSTRAINT pk_fp_atr_co PRIMARY KEY (atr_co_cod)
/

-- Table fp_colaborador_beneficios

CREATE TABLE fp_colaborador_beneficios(
  col_ben_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  descricao Varchar2(300 ),
  valor Number(10,2),
  data_final Date,
  data_inicial Date
)
/

-- Add keys for table fp_colaborador_beneficios

ALTER TABLE fp_colaborador_beneficios ADD CONSTRAINT pk_fp_col_ben PRIMARY KEY (col_ben_cod)
/

-- Table fp_colaborador_dependentes

CREATE TABLE fp_colaborador_dependentes(
  col_dep_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  nome Varchar2(200 ),
  cpf Varchar2(50 ),
  rg Varchar2(50 ),
  estudante Char(1 )
)
/

-- Add keys for table fp_colaborador_dependentes

ALTER TABLE fp_colaborador_dependentes ADD CONSTRAINT pk_fp_col_dep PRIMARY KEY (col_dep_cod)
/

-- Table fp_colaborador_salarios

CREATE TABLE fp_colaborador_salarios(
  col_sal_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  salario_valor Number(10,2),
  salario_data_alteracao Date,
  salario_status Char(1 )
)
/

-- Add keys for table fp_colaborador_salarios

ALTER TABLE fp_colaborador_salarios ADD CONSTRAINT pk_fp_col_sal PRIMARY KEY (col_sal_cod)
/

-- Table ge_pessoas

CREATE TABLE ge_pessoas(
  pessoa_cod Integer NOT NULL,
  nome Varchar2(200 ) NOT NULL,
  data_nasc Date NOT NULL,
  cpf Char(11 ) NOT NULL,
  endereco Varchar2(500 ) NOT NULL,
  bairro Varchar2(100 ) NOT NULL,
  email_1 Varchar2(100 ) NOT NULL,
  email_2 Varchar2(100 ),
  naturalidade Varchar2(50 ) NOT NULL,
  cidade Varchar2(200 ) NOT NULL,
  cep Char(7 ) NOT NULL,
  pais Varchar2(100 ) NOT NULL,
  uni_fed_cod Integer,
  numero Integer,
  complemento Varchar2(100 ),
  est_civ_cod Integer
)
/

-- Add keys for table ge_pessoas

ALTER TABLE ge_pessoas ADD CONSTRAINT pk_ge_pessoa PRIMARY KEY (pessoa_cod)
/

-- Table ge_colaboradores

CREATE TABLE ge_colaboradores(
  pessoa_cod Integer NOT NULL,
  cnh Varchar2(20 ),
  grupo_sanguineo Varchar2(10 ),
  observacao Varchar2(500 ),
  data_admissao Date,
  data_demissao Date,
  status Char(1 ),
  banco Varchar2(100 ),
  agencia Varchar2(80 ),
  conta_corrente Varchar2(80 )
)
/

-- Add keys for table ge_colaboradores

ALTER TABLE ge_colaboradores ADD CONSTRAINT pk_ge_colaborador PRIMARY KEY (pessoa_cod)
/

-- Table fp_tipos_cargo

CREATE TABLE fp_tipos_cargo(
  tip_car_cod Integer NOT NULL,
  descricao Varchar2(100 )
)
/

-- Add keys for table fp_tipos_cargo

ALTER TABLE fp_tipos_cargo ADD CONSTRAINT pk_fp_tip_car PRIMARY KEY (tip_car_cod)
/

-- Table fp_departamentos

CREATE TABLE fp_departamentos(
  departamento_cod Integer NOT NULL,
  descricao Varchar2(100 )
)
/

-- Add keys for table fp_departamentos

ALTER TABLE fp_departamentos ADD CONSTRAINT pk_fp_departamento PRIMARY KEY (departamento_cod)
/

-- Table fp_atributos_cargos

CREATE TABLE fp_atributos_cargos(
  cargo_cod Integer NOT NULL,
  atributo_cod Integer NOT NULL,
  status Char(1 )
)
/

-- Add keys for table fp_atributos_cargos

ALTER TABLE fp_atributos_cargos ADD CONSTRAINT pk_fp_atr_car PRIMARY KEY (cargo_cod,atributo_cod)
/

-- Table fp_atributos

CREATE TABLE fp_atributos(
  atributo_cod Integer NOT NULL,
  descricao Varchar2(500 ),
  tipo Char(1 )
)
/

-- Add keys for table fp_atributos

ALTER TABLE fp_atributos ADD CONSTRAINT pk_fp_atributo PRIMARY KEY (atributo_cod)
/

-- Table fp_cargos

CREATE TABLE fp_cargos(
  cargo_cod Integer NOT NULL,
  descricao Varchar2(200 ),
  salario_minimo Number(10,2),
  salario_maximo Number(10,2),
  salario_medio Number(10,2),
  departamento_cod Integer NOT NULL,
  tip_car_cod Integer NOT NULL,
  horas_totais Number NOT NULL
)
/

-- Add keys for table fp_cargos

ALTER TABLE fp_cargos ADD CONSTRAINT pk_fp_cargo PRIMARY KEY (cargo_cod)
/

-- Table td_treinamento_colaboradores

CREATE TABLE td_treinamento_colaboradores(
  pessoa_cod Integer NOT NULL,
  trienamento_cod Integer NOT NULL,
  resultado_cod Integer
)
/

-- Add keys for table td_treinamento_colaboradores

ALTER TABLE td_treinamento_colaboradores ADD CONSTRAINT pk_td_tre_col PRIMARY KEY (pessoa_cod,trienamento_cod)
/

-- Table ge_fornecedores

CREATE TABLE ge_fornecedores(
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table ge_fornecedores

ALTER TABLE ge_fornecedores ADD CONSTRAINT pk_ge_fornecedor PRIMARY KEY (pessoa_cod)
/

-- Table ge_clientes

CREATE TABLE ge_clientes(
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table ge_clientes

ALTER TABLE ge_clientes ADD CONSTRAINT pk_ge_cliente PRIMARY KEY (pessoa_cod)
/

-- Table sb_eventos_folha

CREATE TABLE sb_eventos_folha(
  fol_pag_cod Integer NOT NULL,
  evento_cod Integer NOT NULL,
  valor Number(10,2) NOT NULL
)
/

-- Add keys for table sb_eventos_folha

ALTER TABLE sb_eventos_folha ADD CONSTRAINT pk_sb_eve_fol PRIMARY KEY (fol_pag_cod,evento_cod)
/

-- Table sb_cadastro_ferias

CREATE TABLE sb_cadastro_ferias(
  cad_fer_data_inicio Date NOT NULL,
  cad_fer_data_fim Date NOT NULL,
  pessoa_cod Integer
)
/

-- Add keys for table sb_cadastro_ferias

ALTER TABLE sb_cadastro_ferias ADD CONSTRAINT pk_sb_cad_fer PRIMARY KEY (cad_fer_data_inicio,cad_fer_data_fim)
/

-- Table sb_tipo_folha

CREATE TABLE sb_tipo_folha(
  tip_fol_cod Varchar2(1 ) NOT NULL,
  descricao Varchar2(200 ) NOT NULL
)
/

-- Add keys for table sb_tipo_folha

ALTER TABLE sb_tipo_folha ADD CONSTRAINT pk_sb_tip_fol PRIMARY KEY (tip_fol_cod)
/

-- Table sb_eventos

CREATE TABLE sb_eventos(
  evento_cod Integer NOT NULL,
  tipo Char(1 ) NOT NULL,
  descricao Varchar2(200 ) NOT NULL,
  formula Varchar2(500 ) NOT NULL
)
/

-- Add keys for table sb_eventos

ALTER TABLE sb_eventos ADD CONSTRAINT pk_sb_evento PRIMARY KEY (evento_cod)
/

-- Table sb_folha_pagamento

CREATE TABLE sb_folha_pagamento(
  fol_pag_cod Integer NOT NULL,
  tip_fol_cod Varchar2(1 ) NOT NULL,
  total_proventos Number(10,2) NOT NULL,
  total_descontos Number(10,2) NOT NULL,
  total_remuneracao Number(10,2) NOT NULL,
  pessoa_cod Integer,
  cargo_cod Integer
)
/

-- Add keys for table sb_folha_pagamento

ALTER TABLE sb_folha_pagamento ADD CONSTRAINT pk_sb_fol_pag PRIMARY KEY (fol_pag_cod)
/

-- Table rs_visitas

CREATE TABLE rs_visitas(
  visita_cod Integer NOT NULL,
  ip Varchar2(15 ) NOT NULL,
  data Integer NOT NULL,
  logado Integer NOT NULL,
  contador Integer NOT NULL,
  ver_bro_cod Integer,
  sis_ope_cod Integer
)
/

-- Add keys for table rs_visitas

ALTER TABLE rs_visitas ADD CONSTRAINT pk_rs_visita PRIMARY KEY (visita_cod)
/

-- Table rs_versoes_browser

CREATE TABLE rs_versoes_browser(
  ver_bro_cod Integer NOT NULL,
  versao Varchar2(3 ) NOT NULL,
  contador Integer NOT NULL,
  browser_cod Integer
)
/

-- Add keys for table rs_versoes_browser

ALTER TABLE rs_versoes_browser ADD CONSTRAINT pk_rs_ver_bro PRIMARY KEY (ver_bro_cod)
/

-- Table rs_browsers

CREATE TABLE rs_browsers(
  browser_cod Integer NOT NULL,
  nome Varchar2(50 ) NOT NULL,
  contador Integer NOT NULL
)
/

-- Add keys for table rs_browsers

ALTER TABLE rs_browsers ADD CONSTRAINT pk_rs_browser PRIMARY KEY (browser_cod)
/

-- Table rs_sistema_operacional

CREATE TABLE rs_sistema_operacional(
  sis_ope_cod Integer NOT NULL,
  nome Varchar2(45 ) NOT NULL,
  contador Integer NOT NULL
)
/

-- Add keys for table rs_sistema_operacional

ALTER TABLE rs_sistema_operacional ADD CONSTRAINT pk_rs_sis_ope PRIMARY KEY (sis_ope_cod)
/

-- Table rs_pageviews

CREATE TABLE rs_pageviews(
  pageview_cod Integer NOT NULL,
  data Integer NOT NULL,
  pag_vis_cod Integer,
  visita_cod Integer
)
/

-- Add keys for table rs_pageviews

ALTER TABLE rs_pageviews ADD CONSTRAINT pk_rs_pageview PRIMARY KEY (pageview_cod)
/

-- Table rs_paginas_visitadas

CREATE TABLE rs_paginas_visitadas(
  pag_vis_cod Integer NOT NULL,
  url Varchar2(300 ) NOT NULL,
  contador Integer NOT NULL
)
/

-- Add keys for table rs_paginas_visitadas

ALTER TABLE rs_paginas_visitadas ADD CONSTRAINT pk_rs_pag_vis PRIMARY KEY (pag_vis_cod)
/

-- Table rs_tentativas_login

CREATE TABLE rs_tentativas_login(
  ten_log_ip Varchar2(15 ) NOT NULL,
  ten_log_data Integer NOT NULL,
  nome_usuario Varchar2(60 ) NOT NULL,
  status Varchar2(8 ) NOT NULL
)
/

-- Add keys for table rs_tentativas_login

ALTER TABLE rs_tentativas_login ADD CONSTRAINT pk_rs_ten_log PRIMARY KEY (ten_log_ip,ten_log_data)
/

-- Table sb_saldo_ferias

CREATE TABLE sb_saldo_ferias(
  pessoa_cod Integer NOT NULL,
  fol_pag_cod Integer NOT NULL,
  meses_trabalhados Number(10,3)
)
/

-- Add keys for table sb_saldo_ferias

ALTER TABLE sb_saldo_ferias ADD CONSTRAINT pk_sb_sal_fer PRIMARY KEY (pessoa_cod,fol_pag_cod)
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE rs_referencias ADD CONSTRAINT rel_cand_refer FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)

/

ALTER TABLE rs_idiomas_candidatos ADD CONSTRAINT rel_cand_idioma FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT rel_cand_resp FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_conhecimentos_candidatos ADD CONSTRAINT rel_cand_conhec FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_candidatos_processos_seleti ADD CONSTRAINT rel_cand_procs FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_experiencias ADD CONSTRAINT rel_cand_exper FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_cand_form FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_formacoes_adicionais ADD CONSTRAINT rel_cand_formad FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_instit FOREIGN KEY (ins_ens_cod) REFERENCES rs_instituicoes_ensino (ins_ens_cod)
/

ALTER TABLE rs_formacoes_adicionais ADD CONSTRAINT rel_instit_formad FOREIGN KEY (ins_ens_cod) REFERENCES rs_instituicoes_ensino (ins_ens_cod)
/

ALTER TABLE rs_entrevistas ADD CONSTRAINT rel_procs_entrev FOREIGN KEY (proc_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_candidatos_processos_seleti ADD CONSTRAINT rel_procs_cand FOREIGN KEY (pro_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_testes ADD CONSTRAINT rel_test_procs FOREIGN KEY (pro_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_niveis FOREIGN KEY (niv_for_cod) REFERENCES rs_niveis_formacoes (niv_for_cod)
/

ALTER TABLE rs_experiencias ADD CONSTRAINT rel_exper_setor FOREIGN KEY (exp_set_cod) REFERENCES rs_experiencias_setor (exp_set_cod)
/

ALTER TABLE rs_idiomas_candidatos ADD CONSTRAINT rel_idioma_cand FOREIGN KEY (idioma_cod) REFERENCES rs_idiomas (idioma_cod)
/

ALTER TABLE ge_telefones ADD CONSTRAINT rel_telef_tipo FOREIGN KEY (tip_tel_tipo) REFERENCES ge_tipo_telefone (tip_tel_tipo)
/

ALTER TABLE rs_testes ADD CONSTRAINT rel_test_tipo FOREIGN KEY (tip_tes_cod) REFERENCES rs_tipos_testes (tip_tes_cod)
/

ALTER TABLE rs_alternativas_questoes ADD CONSTRAINT rel_quest_alter FOREIGN KEY (questao_cod) REFERENCES rs_questoes (questao_cod)
/

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT rel_resp_cand FOREIGN KEY (alt_que_cod) REFERENCES rs_alternativas_questoes (alt_que_cod)
/

ALTER TABLE rs_gabaritos_alternativas ADD CONSTRAINT rel_alterque_valgab FOREIGN KEY (alt_que_cod) REFERENCES rs_alternativas_questoes (alt_que_cod)
/

ALTER TABLE rs_tipos_questoes ADD CONSTRAINT rel_tquest_tgab FOREIGN KEY (tip_gab_cod) REFERENCES rs_tipos_gabaritos (tip_gab_cod)
/

ALTER TABLE rs_valores_gabarito ADD CONSTRAINT rel_tgab_vgab FOREIGN KEY (tip_gab_cod) REFERENCES rs_tipos_gabaritos (tip_gab_cod)
/

ALTER TABLE rs_gabaritos_alternativas ADD CONSTRAINT rel_valgab_alterque FOREIGN KEY (val_gab_cod) REFERENCES rs_valores_gabarito (val_gab_cod)
/

ALTER TABLE rs_questoes ADD CONSTRAINT rel_quest_tipo FOREIGN KEY (tip_que_cod) REFERENCES rs_tipos_questoes (tip_que_cod)
/

ALTER TABLE rs_questoes ADD CONSTRAINT rel_test_quest FOREIGN KEY (teste_cod) REFERENCES rs_testes (teste_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_curso FOREIGN KEY (cur_for_cod) REFERENCES rs_cursos_formacoes (cur_for_cod)
/

ALTER TABLE rs_conhecimentos_candidatos ADD CONSTRAINT rel_conhec_cand FOREIGN KEY (conhechecimento_cod) REFERENCES rs_conhecimentos (conhecimento_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_andamcurs FOREIGN KEY (and_cur_cod) REFERENCES rs_andamento_curso (and_cur_cod)
/

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT rel_cand_test FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT rel_test_cand FOREIGN KEY (teste_cod) REFERENCES rs_testes (teste_cod)
/

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT rel_cand_entrev FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT rel_entrev_cand FOREIGN KEY (entrevista_cod) REFERENCES rs_entrevistas (entrevista_cod)
/

ALTER TABLE rs_triagens ADD CONSTRAINT rel_triag_procs FOREIGN KEY (proc_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT rel_cand_triag FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT rel_triag_cand FOREIGN KEY (triagem_cod) REFERENCES rs_triagens (triagem_cod)
/

ALTER TABLE td_ambientes ADD CONSTRAINT rel_amb_recur FOREIGN KEY (recurso_cod) REFERENCES td_recursos (recurso_cod)
/

ALTER TABLE td_treinamentos ADD CONSTRAINT rel_trein_instrut FOREIGN KEY (instrutor_cod) REFERENCES td_instrutores (instrutor_cod)
/

ALTER TABLE td_metodos ADD CONSTRAINT rel_metodo_tecnica FOREIGN KEY (tecnica_cod) REFERENCES td_tecnicas (tecnica_cod)
/

ALTER TABLE td_treinamentos ADD CONSTRAINT rel_trein_metodo FOREIGN KEY (metodo_cod) REFERENCES td_metodos (metodo_cod)
/

ALTER TABLE td_treinamentos ADD CONSTRAINT rel_trein_obj FOREIGN KEY (objetivo_cod) REFERENCES td_objetivos (objetivo_cod)
/

ALTER TABLE td_turmas ADD CONSTRAINT rel_turma_amb FOREIGN KEY (ambiente_cod) REFERENCES td_ambientes (ambiente_cod)
/

ALTER TABLE td_treinamentos ADD CONSTRAINT rel_trein_turma FOREIGN KEY (turma_cod) REFERENCES td_turmas (turma_cod)
/

ALTER TABLE adp_avaliacoes ADD CONSTRAINT rel_indic_aval FOREIGN KEY (indicador_cod) REFERENCES adp_indicadores (indicador_cod)
/

ALTER TABLE adp_indicadores_cargos ADD CONSTRAINT rel_indic_cargo FOREIGN KEY (indicador_cod) REFERENCES adp_indicadores (indicador_cod)
/

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT rel_atrib_colab FOREIGN KEY (atr_co_cod) REFERENCES fp_atributos_co (atr_co_cod)
/

ALTER TABLE ge_colaboradores ADD CONSTRAINT rel_pessoa_colab FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE fp_colaborador_salarios ADD CONSTRAINT rel_colab_sal FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_colaborador_dependentes ADD CONSTRAINT rel_colab_depend FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_colaborador_beneficios ADD CONSTRAINT rel_colab_benef FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT rel_colab_atrib FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE ge_colaboradores_cargo ADD CONSTRAINT rel_colab_cargo FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_colaborador_afastamentos ADD CONSTRAINT rel_colab_afast FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_atributos_cargos ADD CONSTRAINT rel_atrib_cargo FOREIGN KEY (atributo_cod) REFERENCES fp_atributos (atributo_cod)
/

ALTER TABLE fp_cargos ADD CONSTRAINT rel_tipo_cargo FOREIGN KEY (tip_car_cod) REFERENCES fp_tipos_cargo (tip_car_cod)
/

ALTER TABLE fp_atributos_cargos ADD CONSTRAINT rel_cargo_atrib FOREIGN KEY (cargo_cod) REFERENCES fp_cargos (cargo_cod)
/

ALTER TABLE fp_cargos ADD CONSTRAINT rel_dpto_cargo FOREIGN KEY (departamento_cod) REFERENCES fp_departamentos (departamento_cod)
/

ALTER TABLE td_treinamento_colaboradores ADD CONSTRAINT rel_colab_trein FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE td_treinamento_colaboradores ADD CONSTRAINT rel_trein_colab FOREIGN KEY (trienamento_cod) REFERENCES td_treinamentos (treinamento_cod)
/

ALTER TABLE td_treinamento_colaboradores ADD CONSTRAINT rel_treincolab_result FOREIGN KEY (resultado_cod) REFERENCES td_resultados (resultado_cod)
/

ALTER TABLE adp_indicadores_cargos ADD CONSTRAINT rel_cargo_indic FOREIGN KEY (cargo_cod) REFERENCES fp_cargos (cargo_cod)
/

ALTER TABLE ge_colaboradores_cargo ADD CONSTRAINT rel_cargo_colab FOREIGN KEY (cargo_cod) REFERENCES fp_cargos (cargo_cod)
/

ALTER TABLE adp_avaliacoes ADD CONSTRAINT rel_colab_aval FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE ge_fornecedores ADD CONSTRAINT rel_pessoa_fornec FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE ge_clientes ADD CONSTRAINT rel_pessoa_cli FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE ge_telefones ADD CONSTRAINT rel_pessoa_tel FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE ge_pessoas ADD CONSTRAINT rel_pessoa_uf FOREIGN KEY (uni_fed_cod) REFERENCES ge_unidades_federativas (uni_fed_cod)
/

ALTER TABLE ge_pessoas ADD CONSTRAINT rel_pessoa_estciv FOREIGN KEY (est_civ_cod) REFERENCES ge_estados_civis (est_civ_cod)
/

ALTER TABLE rs_candidatos ADD CONSTRAINT rel_pessoa_cand FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE rs_processos_seletivos ADD CONSTRAINT rel_cargo_procs FOREIGN KEY (cargo_cod) REFERENCES fp_cargos (cargo_cod)
/

ALTER TABLE sb_eventos_folha ADD CONSTRAINT rel_evento_folha FOREIGN KEY (evento_cod) REFERENCES sb_eventos (evento_cod)
/

ALTER TABLE sb_eventos_folha ADD CONSTRAINT rel_folha_evento FOREIGN KEY (fol_pag_cod) REFERENCES sb_folha_pagamento (fol_pag_cod)
/

ALTER TABLE sb_folha_pagamento ADD CONSTRAINT rel_folha_tipo FOREIGN KEY (tip_fol_cod) REFERENCES sb_tipo_folha (tip_fol_cod)
/

ALTER TABLE sb_folha_pagamento ADD CONSTRAINT rel_colab_folha FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE sb_cadastro_ferias ADD CONSTRAINT rel_colab_ferias FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE sb_folha_pagamento ADD CONSTRAINT rel_cargo_folha FOREIGN KEY (cargo_cod) REFERENCES fp_cargos (cargo_cod)
/

ALTER TABLE rs_usuarios ADD CONSTRAINT rel_pessoa_usu FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE rs_versoes_browser ADD CONSTRAINT rel_browser_versao FOREIGN KEY (browser_cod) REFERENCES rs_browsers (browser_cod)
/

ALTER TABLE rs_visitas ADD CONSTRAINT rel_vbrowser_visita FOREIGN KEY (ver_bro_cod) REFERENCES rs_versoes_browser (ver_bro_cod)
/

ALTER TABLE rs_visitas ADD CONSTRAINT rel_so_visita FOREIGN KEY (sis_ope_cod) REFERENCES rs_sistema_operacional (sis_ope_cod)
/

ALTER TABLE rs_pageviews ADD CONSTRAINT rel_pag_pagv FOREIGN KEY (pag_vis_cod) REFERENCES rs_paginas_visitadas (pag_vis_cod)
/

ALTER TABLE rs_pageviews ADD CONSTRAINT rel_visita_pagv FOREIGN KEY (visita_cod) REFERENCES rs_visitas (visita_cod)
/

ALTER TABLE sb_saldo_ferias ADD CONSTRAINT rel_colab_sferias FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE sb_saldo_ferias ADD CONSTRAINT rel_folha_sferias FOREIGN KEY (fol_pag_cod) REFERENCES sb_folha_pagamento (fol_pag_cod)
/


-- Trigger for sequence referencia_cod_seq for column referencia_cod in table rs_referencias ---------

CREATE OR REPLACE TRIGGER ts_rs_referencias_referencia_0 BEFORE INSERT
ON rs_referencias FOR EACH ROW
BEGIN
	SELECT referencia_cod_seq.nextval INTO :new.referencia_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_referencias_referenci_0 AFTER UPDATE OF referencia_cod
ON rs_referencias FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column referencia_cod in table rs_referencias as it uses sequence.');
END;
/

-- Trigger for sequence entrevista_cod_seq for column entrevista_cod in table rs_entrevistas ---------

CREATE OR REPLACE TRIGGER ts_rs_entrevistas_entrevista_0 BEFORE INSERT
ON rs_entrevistas FOR EACH ROW
BEGIN
	SELECT entrevista_cod_seq.nextval INTO :new.entrevista_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_entrevistas_entrevist_0 AFTER UPDATE OF entrevista_cod
ON rs_entrevistas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column entrevista_cod in table rs_entrevistas as it uses sequence.');
END;
/

-- Trigger for sequence instituicao_cod_seq for column ins_ens_cod in table rs_instituicoes_ensino ---------

CREATE OR REPLACE TRIGGER ts_rs_instituicoes_ensino_in_0 BEFORE INSERT
ON rs_instituicoes_ensino FOR EACH ROW
BEGIN
	SELECT instituicao_cod_seq.nextval INTO :new.ins_ens_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_instituicoes_ensino_i_0 AFTER UPDATE OF ins_ens_cod
ON rs_instituicoes_ensino FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column ins_ens_cod in table rs_instituicoes_ensino as it uses sequence.');
END;
/

-- Trigger for sequence formacao_academica_cod_seq for column for_aca_cod in table rs_formacoes_academicas ---------

CREATE OR REPLACE TRIGGER ts_rs_formacoes_academicas_f_0 BEFORE INSERT
ON rs_formacoes_academicas FOR EACH ROW
BEGIN
	SELECT formacao_academica_cod_seq.nextval INTO :new.for_aca_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_formacoes_academicas__0 AFTER UPDATE OF for_aca_cod
ON rs_formacoes_academicas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column for_aca_cod in table rs_formacoes_academicas as it uses sequence.');
END;
/

-- Trigger for sequence processo_seletivo_cod_seq for column pro_sel_cod in table rs_processos_seletivos ---------

CREATE OR REPLACE TRIGGER ts_rs_processos_seletivos_pr_0 BEFORE INSERT
ON rs_processos_seletivos FOR EACH ROW
BEGIN
	SELECT processo_seletivo_cod_seq.nextval INTO :new.pro_sel_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_processos_seletivos_p_0 AFTER UPDATE OF pro_sel_cod
ON rs_processos_seletivos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column pro_sel_cod in table rs_processos_seletivos as it uses sequence.');
END;
/

-- Trigger for sequence nivel_formacao_cod_seq for column niv_for_cod in table rs_niveis_formacoes ---------

CREATE OR REPLACE TRIGGER ts_rs_niveis_formacoes_nivel_0 BEFORE INSERT
ON rs_niveis_formacoes FOR EACH ROW
BEGIN
	SELECT nivel_formacao_cod_seq.nextval INTO :new.niv_for_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_niveis_formacoes_nive_0 AFTER UPDATE OF niv_for_cod
ON rs_niveis_formacoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column niv_for_cod in table rs_niveis_formacoes as it uses sequence.');
END;
/

-- Trigger for sequence experiencia_cod_seq for column experiencia_cod in table rs_experiencias ---------

CREATE OR REPLACE TRIGGER ts_rs_experiencias_experienc_0 BEFORE INSERT
ON rs_experiencias FOR EACH ROW
BEGIN
	SELECT experiencia_cod_seq.nextval INTO :new.experiencia_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_experiencias_experien_0 AFTER UPDATE OF experiencia_cod
ON rs_experiencias FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column experiencia_cod in table rs_experiencias as it uses sequence.');
END;
/

-- Trigger for sequence estado_civil_cod_seq for column est_civ_cod in table ge_estados_civis ---------

CREATE OR REPLACE TRIGGER ts_ge_estados_civis_estado_c_0 BEFORE INSERT
ON ge_estados_civis FOR EACH ROW
BEGIN
	SELECT estado_civil_cod_seq.nextval INTO :new.est_civ_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_estados_civis_estado__0 AFTER UPDATE OF est_civ_cod
ON ge_estados_civis FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column est_civ_cod in table ge_estados_civis as it uses sequence.');
END;
/

-- Trigger for sequence experiencia_setor_cod_seq for column exp_set_cod in table rs_experiencias_setor ---------

CREATE OR REPLACE TRIGGER ts_rs_experiencias_setor_exp_0 BEFORE INSERT
ON rs_experiencias_setor FOR EACH ROW
BEGIN
	SELECT experiencia_setor_cod_seq.nextval INTO :new.exp_set_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_experiencias_setor_ex_0 AFTER UPDATE OF exp_set_cod
ON rs_experiencias_setor FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column exp_set_cod in table rs_experiencias_setor as it uses sequence.');
END;
/

-- Trigger for sequence unidade_federativa_cod_seq for column uni_fed_cod in table ge_unidades_federativas ---------

CREATE OR REPLACE TRIGGER ts_ge_unidades_federativas_u_0 BEFORE INSERT
ON ge_unidades_federativas FOR EACH ROW
BEGIN
	SELECT unidade_federativa_cod_seq.nextval INTO :new.uni_fed_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_unidades_federativas__0 AFTER UPDATE OF uni_fed_cod
ON ge_unidades_federativas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column uni_fed_cod in table ge_unidades_federativas as it uses sequence.');
END;
/

-- Trigger for sequence telefone_cod_seq for column telefone_cod in table ge_telefones ---------

CREATE OR REPLACE TRIGGER ts_ge_telefones_telefone_cod_0 BEFORE INSERT
ON ge_telefones FOR EACH ROW
BEGIN
	SELECT telefone_cod_seq.nextval INTO :new.telefone_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_telefones_telefone_co_0 AFTER UPDATE OF telefone_cod
ON ge_telefones FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column telefone_cod in table ge_telefones as it uses sequence.');
END;
/

-- Trigger for sequence tipo_teste_cod_seq for column tip_tes_cod in table rs_tipos_testes ---------

CREATE OR REPLACE TRIGGER ts_rs_tipos_testes_tipo_test_0 BEFORE INSERT
ON rs_tipos_testes FOR EACH ROW
BEGIN
	SELECT tipo_teste_cod_seq.nextval INTO :new.tip_tes_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_tipos_testes_tipo_tes_0 AFTER UPDATE OF tip_tes_cod
ON rs_tipos_testes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tip_tes_cod in table rs_tipos_testes as it uses sequence.');
END;
/

-- Trigger for sequence questao_cod_seq for column questao_cod in table rs_questoes ---------

CREATE OR REPLACE TRIGGER ts_rs_questoes_questao_cod_seq BEFORE INSERT
ON rs_questoes FOR EACH ROW
BEGIN
	SELECT questao_cod_seq.nextval INTO :new.questao_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_questoes_questao_cod__0 AFTER UPDATE OF questao_cod
ON rs_questoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column questao_cod in table rs_questoes as it uses sequence.');
END;
/

-- Trigger for sequence alternativa_questao_cod_seq for column alt_que_cod in table rs_alternativas_questoes ---------

CREATE OR REPLACE TRIGGER ts_rs_alternativas_questoes__0 BEFORE INSERT
ON rs_alternativas_questoes FOR EACH ROW
BEGIN
	SELECT alternativa_questao_cod_seq.nextval INTO :new.alt_que_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_alternativas_questoes_0 AFTER UPDATE OF alt_que_cod
ON rs_alternativas_questoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column alt_que_cod in table rs_alternativas_questoes as it uses sequence.');
END;
/

-- Trigger for sequence tipo_gabarito_cod_seq for column tip_gab_cod in table rs_tipos_gabaritos ---------

CREATE OR REPLACE TRIGGER ts_rs_tipos_gabaritos_tipo_g_0 BEFORE INSERT
ON rs_tipos_gabaritos FOR EACH ROW
BEGIN
	SELECT tipo_gabarito_cod_seq.nextval INTO :new.tip_gab_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_tipos_gabaritos_tipo__0 AFTER UPDATE OF tip_gab_cod
ON rs_tipos_gabaritos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tip_gab_cod in table rs_tipos_gabaritos as it uses sequence.');
END;
/

-- Trigger for sequence valor_gabarito_cod_seq for column val_gab_cod in table rs_valores_gabarito ---------

CREATE OR REPLACE TRIGGER ts_rs_valores_gabarito_valor_0 BEFORE INSERT
ON rs_valores_gabarito FOR EACH ROW
BEGIN
	SELECT valor_gabarito_cod_seq.nextval INTO :new.val_gab_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_valores_gabarito_valo_0 AFTER UPDATE OF val_gab_cod
ON rs_valores_gabarito FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column val_gab_cod in table rs_valores_gabarito as it uses sequence.');
END;
/

-- Trigger for sequence tipo_questao_cod_seq for column tip_que_cod in table rs_tipos_questoes ---------

CREATE OR REPLACE TRIGGER ts_rs_tipos_questoes_tipo_qu_0 BEFORE INSERT
ON rs_tipos_questoes FOR EACH ROW
BEGIN
	SELECT tipo_questao_cod_seq.nextval INTO :new.tip_que_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_tipos_questoes_tipo_q_0 AFTER UPDATE OF tip_que_cod
ON rs_tipos_questoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tip_que_cod in table rs_tipos_questoes as it uses sequence.');
END;
/

-- Trigger for sequence teste_cod_seq for column teste_cod in table rs_testes ---------

CREATE OR REPLACE TRIGGER ts_rs_testes_teste_cod_seq BEFORE INSERT
ON rs_testes FOR EACH ROW
BEGIN
	SELECT teste_cod_seq.nextval INTO :new.teste_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_testes_teste_cod_seq AFTER UPDATE OF teste_cod
ON rs_testes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column teste_cod in table rs_testes as it uses sequence.');
END;
/

-- Trigger for sequence curso_cod_seq for column cur_for_cod in table rs_cursos_formacoes ---------

CREATE OR REPLACE TRIGGER ts_rs_cursos_formacoes_curso_0 BEFORE INSERT
ON rs_cursos_formacoes FOR EACH ROW
BEGIN
	SELECT curso_cod_seq.nextval INTO :new.cur_for_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_cursos_formacoes_curs_0 AFTER UPDATE OF cur_for_cod
ON rs_cursos_formacoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column cur_for_cod in table rs_cursos_formacoes as it uses sequence.');
END;
/

-- Trigger for sequence formacao_adicional_cod_seq for column for_adi_cod in table rs_formacoes_adicionais ---------

CREATE OR REPLACE TRIGGER ts_rs_formacoes_adicionais_f_0 BEFORE INSERT
ON rs_formacoes_adicionais FOR EACH ROW
BEGIN
	SELECT formacao_adicional_cod_seq.nextval INTO :new.for_adi_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_formacoes_adicionais__0 AFTER UPDATE OF for_adi_cod
ON rs_formacoes_adicionais FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column for_adi_cod in table rs_formacoes_adicionais as it uses sequence.');
END;
/

-- Trigger for sequence andamento_curso_cod_seq for column and_cur_cod in table rs_andamento_curso ---------

CREATE OR REPLACE TRIGGER ts_rs_andamento_curso_andame_0 BEFORE INSERT
ON rs_andamento_curso FOR EACH ROW
BEGIN
	SELECT andamento_curso_cod_seq.nextval INTO :new.and_cur_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_andamento_curso_andam_0 AFTER UPDATE OF and_cur_cod
ON rs_andamento_curso FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column and_cur_cod in table rs_andamento_curso as it uses sequence.');
END;
/

-- Trigger for sequence triagem_cod_seq for column triagem_cod in table rs_triagens ---------

CREATE OR REPLACE TRIGGER ts_rs_triagens_triagem_cod_seq BEFORE INSERT
ON rs_triagens FOR EACH ROW
BEGIN
	SELECT triagem_cod_seq.nextval INTO :new.triagem_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_triagens_triagem_cod__0 AFTER UPDATE OF triagem_cod
ON rs_triagens FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column triagem_cod in table rs_triagens as it uses sequence.');
END;
/

-- Trigger for sequence resultado_cod_seq for column resultado_cod in table td_resultados ---------

CREATE OR REPLACE TRIGGER ts_td_resultados_resultado_c_0 BEFORE INSERT
ON td_resultados FOR EACH ROW
BEGIN
	SELECT resultado_cod_seq.nextval INTO :new.resultado_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_resultados_resultado__0 AFTER UPDATE OF resultado_cod
ON td_resultados FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column resultado_cod in table td_resultados as it uses sequence.');
END;
/

-- Trigger for sequence recurso_cod_seq for column recurso_cod in table td_recursos ---------

CREATE OR REPLACE TRIGGER ts_td_recursos_recurso_cod_seq BEFORE INSERT
ON td_recursos FOR EACH ROW
BEGIN
	SELECT recurso_cod_seq.nextval INTO :new.recurso_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_recursos_recurso_cod__0 AFTER UPDATE OF recurso_cod
ON td_recursos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column recurso_cod in table td_recursos as it uses sequence.');
END;
/

-- Trigger for sequence ambiente_cod_seq for column ambiente_cod in table td_ambientes ---------

CREATE OR REPLACE TRIGGER ts_td_ambientes_ambiente_cod_0 BEFORE INSERT
ON td_ambientes FOR EACH ROW
BEGIN
	SELECT ambiente_cod_seq.nextval INTO :new.ambiente_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_ambientes_ambiente_co_0 AFTER UPDATE OF ambiente_cod
ON td_ambientes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column ambiente_cod in table td_ambientes as it uses sequence.');
END;
/

-- Trigger for sequence tecnica_cod_seq for column tecnica_cod in table td_tecnicas ---------

CREATE OR REPLACE TRIGGER ts_td_tecnicas_tecnica_cod_seq BEFORE INSERT
ON td_tecnicas FOR EACH ROW
BEGIN
	SELECT tecnica_cod_seq.nextval INTO :new.tecnica_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_tecnicas_tecnica_cod__0 AFTER UPDATE OF tecnica_cod
ON td_tecnicas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tecnica_cod in table td_tecnicas as it uses sequence.');
END;
/

-- Trigger for sequence treinamento_cod_seq for column treinamento_cod in table td_treinamentos ---------

CREATE OR REPLACE TRIGGER ts_td_treinamentos_treinamen_0 BEFORE INSERT
ON td_treinamentos FOR EACH ROW
BEGIN
	SELECT treinamento_cod_seq.nextval INTO :new.treinamento_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_treinamentos_treiname_0 AFTER UPDATE OF treinamento_cod
ON td_treinamentos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column treinamento_cod in table td_treinamentos as it uses sequence.');
END;
/

-- Trigger for sequence instrutor_cod_seq for column instrutor_cod in table td_instrutores ---------

CREATE OR REPLACE TRIGGER ts_td_instrutores_instrutor__0 BEFORE INSERT
ON td_instrutores FOR EACH ROW
BEGIN
	SELECT instrutor_cod_seq.nextval INTO :new.instrutor_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_instrutores_instrutor_0 AFTER UPDATE OF instrutor_cod
ON td_instrutores FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column instrutor_cod in table td_instrutores as it uses sequence.');
END;
/

-- Trigger for sequence metodo_cod_seq for column metodo_cod in table td_metodos ---------

CREATE OR REPLACE TRIGGER ts_td_metodos_metodo_cod_seq BEFORE INSERT
ON td_metodos FOR EACH ROW
BEGIN
	SELECT metodo_cod_seq.nextval INTO :new.metodo_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_metodos_metodo_cod_seq AFTER UPDATE OF metodo_cod
ON td_metodos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column metodo_cod in table td_metodos as it uses sequence.');
END;
/

-- Trigger for sequence objetivo_cod_seq for column objetivo_cod in table td_objetivos ---------

CREATE OR REPLACE TRIGGER ts_td_objetivos_objetivo_cod_0 BEFORE INSERT
ON td_objetivos FOR EACH ROW
BEGIN
	SELECT objetivo_cod_seq.nextval INTO :new.objetivo_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_objetivos_objetivo_co_0 AFTER UPDATE OF objetivo_cod
ON td_objetivos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column objetivo_cod in table td_objetivos as it uses sequence.');
END;
/

-- Trigger for sequence turma_cod_seq for column turma_cod in table td_turmas ---------

CREATE OR REPLACE TRIGGER ts_td_turmas_turma_cod_seq BEFORE INSERT
ON td_turmas FOR EACH ROW
BEGIN
	SELECT turma_cod_seq.nextval INTO :new.turma_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_turmas_turma_cod_seq AFTER UPDATE OF turma_cod
ON td_turmas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column turma_cod in table td_turmas as it uses sequence.');
END;
/

-- Trigger for sequence indicador_cod_seq for column indicador_cod in table adp_indicadores ---------

CREATE OR REPLACE TRIGGER ts_adp_indicadores_indicador_0 BEFORE INSERT
ON adp_indicadores FOR EACH ROW
BEGIN
	SELECT indicador_cod_seq.nextval INTO :new.indicador_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_adp_indicadores_indicado_0 AFTER UPDATE OF indicador_cod
ON adp_indicadores FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column indicador_cod in table adp_indicadores as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_afast_cod_seq for column col_afa_cod in table fp_colaborador_afastamentos ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_afastament_0 BEFORE INSERT
ON fp_colaborador_afastamentos FOR EACH ROW
BEGIN
	SELECT colaborador_afast_cod_seq.nextval INTO :new.col_afa_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_afastamen_0 AFTER UPDATE OF col_afa_cod
ON fp_colaborador_afastamentos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_afa_cod in table fp_colaborador_afastamentos as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_beneficio_cod_seq for column col_ben_cod in table fp_colaborador_beneficios ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_beneficios_0 BEFORE INSERT
ON fp_colaborador_beneficios FOR EACH ROW
BEGIN
	SELECT colaborador_beneficio_cod_seq.nextval INTO :new.col_ben_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_beneficio_0 AFTER UPDATE OF col_ben_cod
ON fp_colaborador_beneficios FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_ben_cod in table fp_colaborador_beneficios as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_dependente_cod_seq for column col_dep_cod in table fp_colaborador_dependentes ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_dependente_0 BEFORE INSERT
ON fp_colaborador_dependentes FOR EACH ROW
BEGIN
	SELECT colaborador_dependente_cod_seq.nextval INTO :new.col_dep_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_dependent_0 AFTER UPDATE OF col_dep_cod
ON fp_colaborador_dependentes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_dep_cod in table fp_colaborador_dependentes as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_salario_cod for column col_sal_cod in table fp_colaborador_salarios ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_salarios_c_0 BEFORE INSERT
ON fp_colaborador_salarios FOR EACH ROW
BEGIN
	SELECT colaborador_salario_cod.nextval INTO :new.col_sal_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_salarios__0 AFTER UPDATE OF col_sal_cod
ON fp_colaborador_salarios FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_sal_cod in table fp_colaborador_salarios as it uses sequence.');
END;
/

-- Trigger for sequence pessoa_cod_seq for column pessoa_cod in table ge_pessoas ---------

CREATE OR REPLACE TRIGGER ts_ge_pessoas_pessoa_cod_seq BEFORE INSERT
ON ge_pessoas FOR EACH ROW
BEGIN
	SELECT pessoa_cod_seq.nextval INTO :new.pessoa_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_pessoas_pessoa_cod_seq AFTER UPDATE OF pessoa_cod
ON ge_pessoas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column pessoa_cod in table ge_pessoas as it uses sequence.');
END;
/

-- Trigger for sequence tipo_cargo_cod_seq for column tip_car_cod in table fp_tipos_cargo ---------

CREATE OR REPLACE TRIGGER ts_fp_tipos_cargo_tipo_cargo_0 BEFORE INSERT
ON fp_tipos_cargo FOR EACH ROW
BEGIN
	SELECT tipo_cargo_cod_seq.nextval INTO :new.tip_car_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_tipos_cargo_tipo_carg_0 AFTER UPDATE OF tip_car_cod
ON fp_tipos_cargo FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tip_car_cod in table fp_tipos_cargo as it uses sequence.');
END;
/

-- Trigger for sequence departamento_cod_seq for column departamento_cod in table fp_departamentos ---------

CREATE OR REPLACE TRIGGER ts_fp_departamentos_departam_0 BEFORE INSERT
ON fp_departamentos FOR EACH ROW
BEGIN
	SELECT departamento_cod_seq.nextval INTO :new.departamento_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_departamentos_departa_0 AFTER UPDATE OF departamento_cod
ON fp_departamentos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column departamento_cod in table fp_departamentos as it uses sequence.');
END;
/

-- Trigger for sequence atributo_cod_seq for column atributo_cod in table fp_atributos ---------

CREATE OR REPLACE TRIGGER ts_fp_atributos_atributo_cod_0 BEFORE INSERT
ON fp_atributos FOR EACH ROW
BEGIN
	SELECT atributo_cod_seq.nextval INTO :new.atributo_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_atributos_atributo_co_0 AFTER UPDATE OF atributo_cod
ON fp_atributos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column atributo_cod in table fp_atributos as it uses sequence.');
END;
/

-- Trigger for sequence cargo_cod_seq for column cargo_cod in table fp_cargos ---------

CREATE OR REPLACE TRIGGER ts_fp_cargos_cargo_cod_seq BEFORE INSERT
ON fp_cargos FOR EACH ROW
BEGIN
	SELECT cargo_cod_seq.nextval INTO :new.cargo_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_cargos_cargo_cod_seq AFTER UPDATE OF cargo_cod
ON fp_cargos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column cargo_cod in table fp_cargos as it uses sequence.');
END;
/

-- Trigger for sequence evento_cod_seq for column evento_cod in table sb_eventos ---------

CREATE OR REPLACE TRIGGER ts_sb_eventos_evento_cod_seq BEFORE INSERT
ON sb_eventos FOR EACH ROW
BEGIN
	SELECT evento_cod_seq.nextval INTO :new.evento_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_sb_eventos_evento_cod_seq AFTER UPDATE OF evento_cod
ON sb_eventos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column evento_cod in table sb_eventos as it uses sequence.');
END;
/

-- Trigger for sequence pagamento_cod_seq for column fol_pag_cod in table sb_folha_pagamento ---------

CREATE OR REPLACE TRIGGER ts_sb_folha_pagamento_pagame_0 BEFORE INSERT
ON sb_folha_pagamento FOR EACH ROW
BEGIN
	SELECT pagamento_cod_seq.nextval INTO :new.fol_pag_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_sb_folha_pagamento_pagam_0 AFTER UPDATE OF fol_pag_cod
ON sb_folha_pagamento FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column fol_pag_cod in table sb_folha_pagamento as it uses sequence.');
END;
/

-- Trigger for sequence visita_cod_seq for column visita_cod in table rs_visitas ---------

CREATE OR REPLACE TRIGGER ts_rs_visitas_visita_cod_seq BEFORE INSERT
ON rs_visitas FOR EACH ROW
BEGIN
	SELECT visita_cod_seq.nextval INTO :new.visita_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_visitas_visita_cod_seq AFTER UPDATE OF visita_cod
ON rs_visitas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column visita_cod in table rs_visitas as it uses sequence.');
END;
/

-- Trigger for sequence versao_browser_cod_seq for column ver_bro_cod in table rs_versoes_browser ---------

CREATE OR REPLACE TRIGGER ts_rs_versoes_browser_versao_0 BEFORE INSERT
ON rs_versoes_browser FOR EACH ROW
BEGIN
	SELECT versao_browser_cod_seq.nextval INTO :new.ver_bro_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_versoes_browser_versa_0 AFTER UPDATE OF ver_bro_cod
ON rs_versoes_browser FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column ver_bro_cod in table rs_versoes_browser as it uses sequence.');
END;
/

-- Trigger for sequence browser_cod_seq for column browser_cod in table rs_browsers ---------

CREATE OR REPLACE TRIGGER ts_rs_browsers_browser_cod_seq BEFORE INSERT
ON rs_browsers FOR EACH ROW
BEGIN
	SELECT browser_cod_seq.nextval INTO :new.browser_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_browsers_browser_cod__0 AFTER UPDATE OF browser_cod
ON rs_browsers FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column browser_cod in table rs_browsers as it uses sequence.');
END;
/

-- Trigger for sequence sistema_operacional_cod_seq for column sis_ope_cod in table rs_sistema_operacional ---------

CREATE OR REPLACE TRIGGER ts_rs_sistema_operacional_si_0 BEFORE INSERT
ON rs_sistema_operacional FOR EACH ROW
BEGIN
	SELECT sistema_operacional_cod_seq.nextval INTO :new.sis_ope_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_sistema_operacional_s_0 AFTER UPDATE OF sis_ope_cod
ON rs_sistema_operacional FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column sis_ope_cod in table rs_sistema_operacional as it uses sequence.');
END;
/

-- Trigger for sequence pageview_cod_seq for column pageview_cod in table rs_pageviews ---------

CREATE OR REPLACE TRIGGER ts_rs_pageviews_pageview_cod_0 BEFORE INSERT
ON rs_pageviews FOR EACH ROW
BEGIN
	SELECT pageview_cod_seq.nextval INTO :new.pageview_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_pageviews_pageview_co_0 AFTER UPDATE OF pageview_cod
ON rs_pageviews FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column pageview_cod in table rs_pageviews as it uses sequence.');
END;
/

-- Trigger for sequence pagina_visitada_cod_seq for column pag_vis_cod in table rs_paginas_visitadas ---------

CREATE OR REPLACE TRIGGER ts_rs_paginas_visitadas_pagi_0 BEFORE INSERT
ON rs_paginas_visitadas FOR EACH ROW
BEGIN
	SELECT pagina_visitada_cod_seq.nextval INTO :new.pag_vis_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_paginas_visitadas_pag_0 AFTER UPDATE OF pag_vis_cod
ON rs_paginas_visitadas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column pag_vis_cod in table rs_paginas_visitadas as it uses sequence.');
END;
/



