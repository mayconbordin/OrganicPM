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

CREATE SEQUENCE teste_cod_seq
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

CREATE SEQUENCE fase_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE tip_fas_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE conhecimento_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE inscricao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE avaliacao_cod_seq
 NOMAXVALUE
 NOMINVALUE
 NOCACHE
/

CREATE SEQUENCE log_cod_seq
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_candidatos IS 'Especialização da tabela de pessoas, replica o código da pessoa.'
/
COMMENT ON COLUMN rs_candidatos.pessoa_cod IS 'Código da pessoa.'
/

-- Table rs_referencias

CREATE TABLE rs_referencias(
  pessoa_cod Integer NOT NULL,
  referencia_cod Integer NOT NULL,
  nome Varchar2(30 ) NOT NULL,
  empresa Varchar2(30 ),
  vinculo Varchar2(30 ),
  fone Varchar2(30 ) NOT NULL,
  email Varchar2(30 )
)
/

-- Add keys for table rs_referencias

ALTER TABLE rs_referencias ADD CONSTRAINT pk_rs_referencias PRIMARY KEY (pessoa_cod,referencia_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_referencias IS 'Referências dos candidatos.'
/
COMMENT ON COLUMN rs_referencias.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_referencias.referencia_cod IS 'Código sequencial das referências.'
/
COMMENT ON COLUMN rs_referencias.nome IS 'Nome da pessoa.'
/
COMMENT ON COLUMN rs_referencias.empresa IS 'Empresa onde a pessoa trabalha.'
/
COMMENT ON COLUMN rs_referencias.vinculo IS 'Vínculo da pessoa com o candidato.'
/
COMMENT ON COLUMN rs_referencias.fone IS 'Telefone da pessoa.'
/
COMMENT ON COLUMN rs_referencias.email IS 'Email da pessoa.'
/

-- Table rs_instituicoes_ensino

CREATE TABLE rs_instituicoes_ensino(
  ins_ens_cod Integer NOT NULL,
  nome Varchar2(200 ) NOT NULL
)
/

-- Add keys for table rs_instituicoes_ensino

ALTER TABLE rs_instituicoes_ensino ADD CONSTRAINT pk_rs_ins_ens PRIMARY KEY (ins_ens_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_instituicoes_ensino IS 'Armazena todas as instituições de ensino que serão usados pelas tabelas de formações acadêmicas e formações adicionais.'
/
COMMENT ON COLUMN rs_instituicoes_ensino.ins_ens_cod IS 'Código sequencial da instituição de ensino.'
/
COMMENT ON COLUMN rs_instituicoes_ensino.nome IS 'Nome da instituição de ensino.'
/

-- Table rs_formacoes_academicas

CREATE TABLE rs_formacoes_academicas(
  pessoa_cod Integer NOT NULL,
  for_aca_cod Integer NOT NULL,
  cur_for_cod Integer NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  ins_ens_cod Integer NOT NULL,
  niv_for_cod Integer NOT NULL,
  and_cur_cod Integer NOT NULL
)
/

-- Add keys for table rs_formacoes_academicas

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT pk_rs_for_aca PRIMARY KEY (pessoa_cod,for_aca_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_formacoes_academicas IS 'Contém os dados das formações acadêmicas dos candidatos.'
/
COMMENT ON COLUMN rs_formacoes_academicas.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_formacoes_academicas.for_aca_cod IS 'Código sequencial da formação acadêmica.'
/
COMMENT ON COLUMN rs_formacoes_academicas.cur_for_cod IS 'Código do curso ao qual pertence a formação acadêmica.'
/
COMMENT ON COLUMN rs_formacoes_academicas.data_inicio IS 'Data em que a formação acadêmica iniciou.'
/
COMMENT ON COLUMN rs_formacoes_academicas.data_fim IS 'Data em que a formação acadêmica terminou ou irá terminar.'
/
COMMENT ON COLUMN rs_formacoes_academicas.ins_ens_cod IS 'Instituição em que o curso foi realizado.'
/
COMMENT ON COLUMN rs_formacoes_academicas.niv_for_cod IS 'O nível de ensino da formação acadêmica. Ex.: médio, técnico, graduação, mestrado, doutorado.'
/
COMMENT ON COLUMN rs_formacoes_academicas.and_cur_cod IS 'Adamento da formação acadêmica. Ex.: em andamento, finalizado, pendente.'
/

-- Table rs_processos_seletivos

CREATE TABLE rs_processos_seletivos(
  pro_sel_cod Integer NOT NULL,
  descricao Varchar2(300 ) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  vagas Integer NOT NULL,
  cargo_cod Integer NOT NULL,
  status Varchar2(30 ),
  niv_for_cod Integer,
  area_formacao Varchar2(100 ),
  inscricoes_ate Date
)
/

-- Add keys for table rs_processos_seletivos

ALTER TABLE rs_processos_seletivos ADD CONSTRAINT pk_rs_pro_sel PRIMARY KEY (pro_sel_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_processos_seletivos IS 'Armazena as informações dos processos seletivos.'
/
COMMENT ON COLUMN rs_processos_seletivos.pro_sel_cod IS 'Código sequencial do processo seletivo.'
/
COMMENT ON COLUMN rs_processos_seletivos.descricao IS 'Descrição do processo seletivo.'
/
COMMENT ON COLUMN rs_processos_seletivos.data_inicio IS 'Data em que se inicia o processo seletivo.'
/
COMMENT ON COLUMN rs_processos_seletivos.data_fim IS 'Data em que termina o processo seletivo.'
/
COMMENT ON COLUMN rs_processos_seletivos.vagas IS 'Quantidade de vagas que estão sendo buscadas pelo processo seletivo.'
/
COMMENT ON COLUMN rs_processos_seletivos.cargo_cod IS 'Código do cargo que precisa ser preenchido.'
/
COMMENT ON COLUMN rs_processos_seletivos.status IS 'Status do processo seletivo. Ex.: ativo, finalizado.'
/
COMMENT ON COLUMN rs_processos_seletivos.niv_for_cod IS 'Nível de formação exigido para o cargo.'
/
COMMENT ON COLUMN rs_processos_seletivos.area_formacao IS 'Área de formação exigida pelo cargo.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_niveis_formacoes IS 'Nível de ensino das formações acadêmicas que é utilizado pelas formações acadêmicas e pelos processos seletivos. Neste último o nível serve para indicar os requisitos mínimos para preencher um cargo, caso seja configurado uma triagem.'
/
COMMENT ON COLUMN rs_niveis_formacoes.niv_for_cod IS 'Código sequencial para o nível de formação.'
/

-- Table rs_experiencias

CREATE TABLE rs_experiencias(
  pessoa_cod Integer NOT NULL,
  experiencia_cod Integer NOT NULL,
  empresa Varchar2(30 ) NOT NULL,
  funcao Varchar2(200 ) NOT NULL,
  atribuicoes Varchar2(300 ) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  exp_set_cod Integer NOT NULL
)
/

-- Add keys for table rs_experiencias

ALTER TABLE rs_experiencias ADD CONSTRAINT pk_rs_experiencia PRIMARY KEY (pessoa_cod,experiencia_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_experiencias IS 'Contém informações sobre as experiências profissionais dos candidatos.'
/
COMMENT ON COLUMN rs_experiencias.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_experiencias.experiencia_cod IS 'Código sequencial da experiência profissional.'
/
COMMENT ON COLUMN rs_experiencias.empresa IS 'Nome da empresa onde a experiência se deu.'
/
COMMENT ON COLUMN rs_experiencias.funcao IS 'Função desempenhada.'
/
COMMENT ON COLUMN rs_experiencias.atribuicoes IS 'Atribuições desempenhadas.'
/
COMMENT ON COLUMN rs_experiencias.data_inicio IS 'Data em que iniciou a experiência profissional.'
/
COMMENT ON COLUMN rs_experiencias.data_fim IS 'Data em que a experiência profissional foi finalizada.'
/
COMMENT ON COLUMN rs_experiencias.exp_set_cod IS 'Setor onde a experiência profissional ocorreu.'
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
  
COMMENT ON TABLE ge_estados_civis IS 'Armazena os estados civis que uma pessoa pode ter.'
/
COMMENT ON COLUMN ge_estados_civis.est_civ_cod IS 'Código sequencial do estado civil.'
/
COMMENT ON COLUMN ge_estados_civis.descricao IS 'Descrição do estado civil.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_experiencias_setor IS 'Tabela com os setores onde as experiências dos candidatos se deram.'
/
COMMENT ON COLUMN rs_experiencias_setor.exp_set_cod IS 'Código sequencial do setor da experiência.'
/
COMMENT ON COLUMN rs_experiencias_setor.setor IS 'Nome do setor da experiência.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_idiomas IS 'Lista de idiomas.'
/
COMMENT ON COLUMN rs_idiomas.idioma_cod IS 'Código sequencial do idioma.'
/
COMMENT ON COLUMN rs_idiomas.idioma IS 'Nome do idioma.'
/

-- Table rs_idiomas_candidatos

CREATE TABLE rs_idiomas_candidatos(
  pessoa_cod Integer NOT NULL,
  idioma_cod Integer NOT NULL,
  leitura Varchar2(4 ) NOT NULL,
  conversacao Varchar2(4 ) NOT NULL,
  escrita Varchar2(4 ) NOT NULL
)
/

-- Add keys for table rs_idiomas_candidatos

ALTER TABLE rs_idiomas_candidatos ADD CONSTRAINT pk_rs_idi_can PRIMARY KEY (pessoa_cod,idioma_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_idiomas_candidatos IS 'Idiomas dos candidatos.'
/
COMMENT ON COLUMN rs_idiomas_candidatos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_idiomas_candidatos.idioma_cod IS 'Código do idioma.'
/
COMMENT ON COLUMN rs_idiomas_candidatos.leitura IS 'Capacidade de leitura.'
/
COMMENT ON COLUMN rs_idiomas_candidatos.conversacao IS 'Capacidade de conversação.'
/
COMMENT ON COLUMN rs_idiomas_candidatos.escrita IS 'Capacidade de escrita.'
/

-- Table ge_unidades_federativas

CREATE TABLE ge_unidades_federativas(
  uni_fed_cod Integer NOT NULL,
  nome Varchar2(2 ) NOT NULL
)
/

-- Add keys for table ge_unidades_federativas

ALTER TABLE ge_unidades_federativas ADD CONSTRAINT pk_ge_uni_fed PRIMARY KEY (uni_fed_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_unidades_federativas IS 'Armazena as unidades federativas brasileiras.'
/
COMMENT ON COLUMN ge_unidades_federativas.uni_fed_cod IS 'Código sequencial da unidade federativa.'
/
COMMENT ON COLUMN ge_unidades_federativas.nome IS 'Sigla da unidade federativa.'
/

-- Table ge_telefones

CREATE TABLE ge_telefones(
  pessoa_cod Integer NOT NULL,
  telefone_cod Integer NOT NULL,
  numero Varchar2(30 ) NOT NULL,
  area Varchar2(30 ) NOT NULL,
  tip_tel_tipo Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ge_telefones

ALTER TABLE ge_telefones ADD CONSTRAINT pk_ge_telefone PRIMARY KEY (pessoa_cod,telefone_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_telefones IS 'Telefones de contato das pessoas.'
/
COMMENT ON COLUMN ge_telefones.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN ge_telefones.telefone_cod IS 'Código sequencial do telefone de contato.'
/
COMMENT ON COLUMN ge_telefones.numero IS 'Número do telefone.'
/
COMMENT ON COLUMN ge_telefones.area IS 'Área do telefone de contato.'
/
COMMENT ON COLUMN ge_telefones.tip_tel_tipo IS 'Tipo de telefone.'
/

-- Table ge_tipo_telefone

CREATE TABLE ge_tipo_telefone(
  tip_tel_tipo Varchar2(30 ) NOT NULL
)
/

-- Add keys for table ge_tipo_telefone

ALTER TABLE ge_tipo_telefone ADD CONSTRAINT pk_ge_tip_tel PRIMARY KEY (tip_tel_tipo)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_tipo_telefone IS 'Tipos de telefone.'
/
COMMENT ON COLUMN ge_tipo_telefone.tip_tel_tipo IS 'Tipo de telefone. Ex.: residencial, celular.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_tipos_testes IS 'Armazena os tipos de teste.'
/
COMMENT ON COLUMN rs_tipos_testes.tip_tes_cod IS 'Código do tipo de teste.'
/
COMMENT ON COLUMN rs_tipos_testes.tipo IS 'Nome do tipo de teste.'
/

-- Table rs_questoes

CREATE TABLE rs_questoes(
  teste_cod Integer NOT NULL,
  questao_cod Integer NOT NULL,
  descricao Varchar2(2000 ),
  tip_que_cod Integer NOT NULL
)
/

-- Add keys for table rs_questoes

ALTER TABLE rs_questoes ADD CONSTRAINT pk_rs_questao PRIMARY KEY (teste_cod,questao_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_questoes IS 'Armazena as questões que irão compor um teste.'
/
COMMENT ON COLUMN rs_questoes.teste_cod IS 'Código do teste.'
/
COMMENT ON COLUMN rs_questoes.questao_cod IS 'Código sequencial da questão.'
/
COMMENT ON COLUMN rs_questoes.descricao IS 'Descrição da questão.'
/
COMMENT ON COLUMN rs_questoes.tip_que_cod IS 'Tipo de questão.'
/

-- Table rs_alternativas_questoes

CREATE TABLE rs_alternativas_questoes(
  teste_cod Integer NOT NULL,
  questao_cod Integer NOT NULL,
  alt_que_cod Integer NOT NULL,
  descricao Varchar2(1000 ),
  val_gab_cod Integer
)
/

-- Add keys for table rs_alternativas_questoes

ALTER TABLE rs_alternativas_questoes ADD CONSTRAINT pk_rs_alt_que PRIMARY KEY (teste_cod,questao_cod,alt_que_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_alternativas_questoes IS 'Cada questão possui um conjunto de alternativas.'
/
COMMENT ON COLUMN rs_alternativas_questoes.teste_cod IS 'Código de teste.'
/
COMMENT ON COLUMN rs_alternativas_questoes.questao_cod IS 'Código da questão.'
/
COMMENT ON COLUMN rs_alternativas_questoes.alt_que_cod IS 'Código sequencial da alternativa de questão.'
/
COMMENT ON COLUMN rs_alternativas_questoes.descricao IS 'Descrição da alternativa.'
/
COMMENT ON COLUMN rs_alternativas_questoes.val_gab_cod IS 'Valor atribuido para a alternativa.'
/

-- Table rs_respostas_candidatos

CREATE TABLE rs_respostas_candidatos(
  pessoa_cod Integer NOT NULL,
  pro_sel_cod Integer NOT NULL,
  teste_cod Integer NOT NULL,
  questao_cod Integer NOT NULL,
  alt_que_cod Integer NOT NULL,
  resposta Varchar2(60 )
)
/

-- Add keys for table rs_respostas_candidatos

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT pk_rs_res_can PRIMARY KEY (pessoa_cod,pro_sel_cod,teste_cod,questao_cod,alt_que_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_respostas_candidatos IS 'Respostas dos candidatos para cada uma das alternativas de cada uma das questões de um teste.'
/
COMMENT ON COLUMN rs_respostas_candidatos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_respostas_candidatos.pro_sel_cod IS 'Código do processo seletivo.'
/
COMMENT ON COLUMN rs_respostas_candidatos.teste_cod IS 'Código do teste.'
/
COMMENT ON COLUMN rs_respostas_candidatos.questao_cod IS 'Código da questão.'
/
COMMENT ON COLUMN rs_respostas_candidatos.alt_que_cod IS 'Código da alternativa da questão.'
/
COMMENT ON COLUMN rs_respostas_candidatos.resposta IS 'Resposta do candidato.'
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
  
COMMENT ON TABLE rs_tipos_gabaritos IS 'Atrelado a cada tipo de questão está um tipo de gabarito. Tipos diferentes de questões podem vir a usar o mesmo modelo de gabarito. Esse tipo de gabarito define as respostas que podem ser dadas para uma questão. Em questões de verdadeiro ou falso, por exemplo, seriam os valores verdadeiro ou falso. Em questões de uma única escolha ou múltipla escolha seriam atribuidas notas para cada questão.'
/
COMMENT ON COLUMN rs_tipos_gabaritos.tip_gab_cod IS 'Código sequencial do tipo de gabarito.'
/
COMMENT ON COLUMN rs_tipos_gabaritos.descricao IS 'Descrição do tipo de gabarito.'
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
  
COMMENT ON TABLE rs_valores_gabarito IS 'São os valores que um tipo de gabarito permite que sejam atribuidos as respostas das alternativas.'
/
COMMENT ON COLUMN rs_valores_gabarito.val_gab_cod IS 'Código sequencial dos valores do gabarito.'
/
COMMENT ON COLUMN rs_valores_gabarito.valor IS 'Valor do gabarito.'
/
COMMENT ON COLUMN rs_valores_gabarito.tip_gab_cod IS 'Tipo de gabarito.'
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
  
COMMENT ON TABLE rs_tipos_questoes IS 'As questões podem ser de vários tipos. Ex.: escolha única, múltipla escolha, verdadeiro ou falso. Essa tabela é responsável por classificar as questões.'
/
COMMENT ON COLUMN rs_tipos_questoes.tip_que_cod IS 'Código sequencial do tipo de questão.'
/
COMMENT ON COLUMN rs_tipos_questoes.tipo IS 'Nome do tipo de qurestão.'
/
COMMENT ON COLUMN rs_tipos_questoes.tip_gab_cod IS 'Tipo de gabarito.'
/

-- Table rs_testes

CREATE TABLE rs_testes(
  teste_cod Integer NOT NULL,
  descricao Varchar2(300 ) NOT NULL,
  tip_tes_cod Integer NOT NULL
)
/

-- Add keys for table rs_testes

ALTER TABLE rs_testes ADD CONSTRAINT pk_rs_teste PRIMARY KEY (teste_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_testes IS 'Armazena os testes.'
/
COMMENT ON COLUMN rs_testes.teste_cod IS 'Código sequencial do teste.'
/
COMMENT ON COLUMN rs_testes.descricao IS 'Descrição do teste.'
/
COMMENT ON COLUMN rs_testes.tip_tes_cod IS 'Tipo de teste.'
/

-- Table rs_cursos_formacoes

CREATE TABLE rs_cursos_formacoes(
  cur_for_cod Integer NOT NULL,
  nome Varchar2(200 ) NOT NULL
)
/

-- Add keys for table rs_cursos_formacoes

ALTER TABLE rs_cursos_formacoes ADD CONSTRAINT pk_rs_cur_for PRIMARY KEY (cur_for_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_cursos_formacoes IS 'Lista dos cursos que serão utilizados na tabela de formações acadêmicas.'
/
COMMENT ON COLUMN rs_cursos_formacoes.cur_for_cod IS 'Código sequencial do curso.'
/
COMMENT ON COLUMN rs_cursos_formacoes.nome IS 'Nome do curso.'
/

-- Table rs_conhecimentos

CREATE TABLE rs_conhecimentos(
  pessoa_cod Integer NOT NULL,
  conhecimento_cod Integer NOT NULL,
  grupo Varchar2(100 ) NOT NULL,
  descricao Varchar2(100 ) NOT NULL,
  proficiencia Varchar2(100 ) NOT NULL
)
/

-- Add keys for table rs_conhecimentos

ALTER TABLE rs_conhecimentos ADD CONSTRAINT pk_rs_conhecimento PRIMARY KEY (pessoa_cod,conhecimento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_conhecimentos IS 'Conhecimentos dos candidatos.'
/
COMMENT ON COLUMN rs_conhecimentos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_conhecimentos.conhecimento_cod IS 'Código sequencial do conhecimento.'
/
COMMENT ON COLUMN rs_conhecimentos.grupo IS 'Grupo de conhecimento.'
/
COMMENT ON COLUMN rs_conhecimentos.descricao IS 'Descrição do conhecimento.'
/
COMMENT ON COLUMN rs_conhecimentos.proficiencia IS 'Aptidão, competência.'
/

-- Table rs_formacoes_adicionais

CREATE TABLE rs_formacoes_adicionais(
  pessoa_cod Integer NOT NULL,
  for_adi_cod Integer NOT NULL,
  ins_ens_cod Integer NOT NULL,
  tipo Varchar2(30 BYTE) NOT NULL,
  nome Varchar2(30 BYTE) NOT NULL,
  data_inicio Date NOT NULL,
  data_fim Date NOT NULL,
  carga_horaria Integer NOT NULL
)
/

-- Add keys for table rs_formacoes_adicionais

ALTER TABLE rs_formacoes_adicionais ADD CONSTRAINT pk_rs_for_ad PRIMARY KEY (pessoa_cod,for_adi_cod)
/

-- Table and Columns comments section
  
COMMENT ON COLUMN rs_formacoes_adicionais.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.for_adi_cod IS 'Código sequencial da formação adicional.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.ins_ens_cod IS 'Instituição de ensino onde o curso foi realizado.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.tipo IS 'O tipo de formação adicional realizado. Ex.: palestra, minicurso, fórum.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.nome IS 'Nome da formação adicional realizada.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.data_inicio IS 'Data em que a formação adicional foi iniciada.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.data_fim IS 'Data em que a formação adicional foi finalizada.'
/
COMMENT ON COLUMN rs_formacoes_adicionais.carga_horaria IS 'A quantidade de horas da formação acadêmica.'
/

-- Table rs_candidatos_processos_seleti

CREATE TABLE rs_candidatos_processos_seleti(
  pessoa_cod Integer NOT NULL,
  pro_sel_cod Integer NOT NULL,
  status Varchar2(30 ) NOT NULL,
  data_cadastro Date NOT NULL
)
/

-- Add keys for table rs_candidatos_processos_seleti

ALTER TABLE rs_candidatos_processos_seleti ADD CONSTRAINT pk_rs_can_pro_sel PRIMARY KEY (pessoa_cod,pro_sel_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_candidatos_processos_seleti IS 'Candidatos cadastrados nos processos seletivos.'
/
COMMENT ON COLUMN rs_candidatos_processos_seleti.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_candidatos_processos_seleti.pro_sel_cod IS 'Código do processo seletivo.'
/
COMMENT ON COLUMN rs_candidatos_processos_seleti.status IS 'Status do candidato dentro do processo seletivo. Ex.: ativo, classificado, desclassificado.'
/
COMMENT ON COLUMN rs_candidatos_processos_seleti.data_cadastro IS 'Data em que o candidato se inscreveu no processo seletivo.'
/

-- Table rs_usuarios

CREATE TABLE rs_usuarios(
  pessoa_cod Integer NOT NULL,
  nome Varchar2(60 ) NOT NULL,
  senha Char(40 ) NOT NULL,
  chave Char(32 ) NOT NULL,
  status Varchar2(10 ) NOT NULL,
  data_registro Integer NOT NULL,
  ultimo_acesso Integer NOT NULL,
  nivel Number(2,0)
)
/

-- Add keys for table rs_usuarios

ALTER TABLE rs_usuarios ADD CONSTRAINT pk_rs_usuario PRIMARY KEY (pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_usuarios IS 'Armazena os dados de acesso ao sistema.'
/
COMMENT ON COLUMN rs_usuarios.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_usuarios.nome IS 'Nome de usuário utilizado para efetuar login no sistema.'
/
COMMENT ON COLUMN rs_usuarios.senha IS 'Senha do usuário, armazenada em hash SHA-1.'
/
COMMENT ON COLUMN rs_usuarios.chave IS 'Chave aleatória em hash md5 utilizada para autenticação de login através de CHAP.'
/
COMMENT ON COLUMN rs_usuarios.status IS 'Status do usuário no sistema. Ex.: ativo, inativo, bloqueado.'
/
COMMENT ON COLUMN rs_usuarios.data_registro IS 'Data em que o usuário se registrou no sistema.'
/
COMMENT ON COLUMN rs_usuarios.ultimo_acesso IS 'Data do último acesso do usuário no sistema.'
/
COMMENT ON COLUMN rs_usuarios.nivel IS 'Nível de acesso do usuário.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_andamento_curso IS 'Andamento do curso que é utilizado pela tabela de formações acadêmicas.'
/
COMMENT ON COLUMN rs_andamento_curso.and_cur_cod IS 'Código sequencial do andamento do curso.'
/
COMMENT ON COLUMN rs_andamento_curso.status IS 'Armazena a string com o status que será utilizado nas formações acadêmicas.'
/

-- Table rs_testes_candidatos

CREATE TABLE rs_testes_candidatos(
  pessoa_cod Integer NOT NULL,
  pro_sel_cod Integer NOT NULL,
  fase_cod Integer NOT NULL,
  status Varchar2(30 ),
  nota Number(3,1),
  data Date NOT NULL
)
/

-- Add keys for table rs_testes_candidatos

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT pk_rs_tes_cand PRIMARY KEY (pessoa_cod,pro_sel_cod,fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_testes_candidatos IS 'Contém informações sobre os testes realizados pelos candidatos.'
/
COMMENT ON COLUMN rs_testes_candidatos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_testes_candidatos.pro_sel_cod IS 'Código do processo seletivo.'
/
COMMENT ON COLUMN rs_testes_candidatos.fase_cod IS 'Código da fase.'
/
COMMENT ON COLUMN rs_testes_candidatos.status IS 'Status do teste. Ex.: classificado, desclassificado.'
/
COMMENT ON COLUMN rs_testes_candidatos.nota IS 'Nota do candidato no teste.'
/
COMMENT ON COLUMN rs_testes_candidatos.data IS 'Data em que o teste foi feito pelo candidato.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE td_resultados IS 'Armazena os resultados dos candidatos nos treinamentos.'
/
COMMENT ON COLUMN td_resultados.resultado_cod IS 'Código sequencial do resultado.'
/
COMMENT ON COLUMN td_resultados.descricao IS 'Descrição do resultado.'
/
COMMENT ON COLUMN td_resultados.observacoes IS 'Observações sobre o resultado.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE td_recursos IS 'Recursos que serão utilizados.'
/
COMMENT ON COLUMN td_recursos.recurso_cod IS 'Código sequencial dos recursos.'
/
COMMENT ON COLUMN td_recursos.descricao IS 'Descrição dos recursos.'
/

-- Table td_ambientes

CREATE TABLE td_ambientes(
  ambiente_cod Integer NOT NULL,
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

-- Table and Columns comments section
  
COMMENT ON TABLE td_ambientes IS 'Ambiente utilizados pelas turmas.'
/
COMMENT ON COLUMN td_ambientes.ambiente_cod IS 'Código sequencial do ambiente.'
/
COMMENT ON COLUMN td_ambientes.descricao IS 'Descrição do ambiente.'
/
COMMENT ON COLUMN td_ambientes.endereco IS 'Endereço do ambiente.'
/
COMMENT ON COLUMN td_ambientes.bairro IS 'Bairro onde se localiza o ambiente.'
/
COMMENT ON COLUMN td_ambientes.locais_referencia IS 'Local de referência do ambiente.'
/
COMMENT ON COLUMN td_ambientes.logradouro IS 'Logradouro do ambiente.'
/
COMMENT ON COLUMN td_ambientes.observacoes IS 'Observações sobre o ambiente.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE td_tecnicas IS 'Técnicas que irão compor um método.'
/
COMMENT ON COLUMN td_tecnicas.tecnica_cod IS 'Código sequencial da técnica.'
/
COMMENT ON COLUMN td_tecnicas.nome IS 'Nome da técnica.'
/

-- Table td_treinamentos

CREATE TABLE td_treinamentos(
  treinamento_cod Integer NOT NULL,
  descricao Varchar2(100 ),
  ementa Varchar2(1000 ),
  observacoes Varchar2(1000 )
)
/

-- Add keys for table td_treinamentos

ALTER TABLE td_treinamentos ADD CONSTRAINT pk_td_treinamento PRIMARY KEY (treinamento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_treinamentos IS 'Armazena os treinamentos.'
/
COMMENT ON COLUMN td_treinamentos.treinamento_cod IS 'Código sequencial do treinamento.'
/
COMMENT ON COLUMN td_treinamentos.descricao IS 'Descrição do treinamento.'
/
COMMENT ON COLUMN td_treinamentos.ementa IS 'Ementa sobre o treinamento.'
/
COMMENT ON COLUMN td_treinamentos.observacoes IS 'Observações sobre o treinamento.'
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
  nome Varchar2(40 ),
  observacoes Varchar2(500 ) NOT NULL
)
/

-- Add keys for table td_metodos

ALTER TABLE td_metodos ADD CONSTRAINT pk_td_metodo PRIMARY KEY (metodo_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_metodos IS 'Métodos utilizados em um treinamento.'
/
COMMENT ON COLUMN td_metodos.metodo_cod IS 'Código sequencial do método.'
/
COMMENT ON COLUMN td_metodos.nome IS 'Nome do método.'
/
COMMENT ON COLUMN td_metodos.observacoes IS 'Observações sobre o método.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE td_objetivos IS 'Objetivos.'
/
COMMENT ON COLUMN td_objetivos.objetivo_cod IS 'Código sequencial do objetivo.'
/
COMMENT ON COLUMN td_objetivos.descricao IS 'Descrição do objetivo.'
/
COMMENT ON COLUMN td_objetivos.finalidade IS 'Finalidade do objetivo.'
/

-- Table td_turmas

CREATE TABLE td_turmas(
  turma_cod Integer NOT NULL,
  ambiente_cod Integer NOT NULL,
  nome Varchar2(40 ) NOT NULL,
  data_inicial Date NOT NULL,
  data_final Date NOT NULL,
  turno Char(1 ) NOT NULL,
  instrutor_cod Integer
)
/

-- Add keys for table td_turmas

ALTER TABLE td_turmas ADD CONSTRAINT pk_td_turma PRIMARY KEY (turma_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_turmas IS 'Turmas formadas.'
/
COMMENT ON COLUMN td_turmas.turma_cod IS 'Código sequencial da turma.'
/
COMMENT ON COLUMN td_turmas.ambiente_cod IS 'Ambiente da turma.'
/
COMMENT ON COLUMN td_turmas.nome IS 'Nome da turma.'
/
COMMENT ON COLUMN td_turmas.data_inicial IS 'Data de início da turma.'
/
COMMENT ON COLUMN td_turmas.data_final IS 'Data final da turma.'
/
COMMENT ON COLUMN td_turmas.turno IS 'Turno da turma.'
/

-- Table adp_avaliacoes

CREATE TABLE adp_avaliacoes(
  avaliacao_cod Integer NOT NULL,
  avaliacao_data Date NOT NULL,
  indicador_cod Integer NOT NULL,
  avaliador_nome Varchar2(100 ) NOT NULL,
  nota Integer,
  pessoa_cod Integer NOT NULL,
  tipo Integer NOT NULL
)
/

-- Add keys for table adp_avaliacoes

ALTER TABLE adp_avaliacoes ADD CONSTRAINT pk_adp_avaliacao PRIMARY KEY (pessoa_cod,avaliacao_cod,avaliacao_data,indicador_cod,tipo)
/

-- Table and Columns comments section
  
COMMENT ON TABLE adp_avaliacoes IS 'Avaliações das pessoas.'
/
COMMENT ON COLUMN adp_avaliacoes.avaliacao_data IS 'Data da avaliação.'
/
COMMENT ON COLUMN adp_avaliacoes.indicador_cod IS 'Código do indicador.'
/
COMMENT ON COLUMN adp_avaliacoes.avaliador_nome IS 'Nome do avaliador.'
/
COMMENT ON COLUMN adp_avaliacoes.nota IS 'Nota atribuída na avaliação.'
/
COMMENT ON COLUMN adp_avaliacoes.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN adp_avaliacoes.tipo IS 'Tipo de avaliação.'
/

-- Table adp_indicadores

CREATE TABLE adp_indicadores(
  indicador_cod Integer NOT NULL,
  descricao Varchar2(500 ),
  atributo_cod Integer NOT NULL
)
/

-- Add keys for table adp_indicadores

ALTER TABLE adp_indicadores ADD CONSTRAINT pk_adp_indicador PRIMARY KEY (indicador_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE adp_indicadores IS 'Indicadores.'
/
COMMENT ON COLUMN adp_indicadores.indicador_cod IS 'Código sequencial do indicador.'
/
COMMENT ON COLUMN adp_indicadores.descricao IS 'Descrição do indicador.'
/
COMMENT ON COLUMN adp_indicadores.atributo_cod IS 'Atributo do indicador.'
/

-- Table ge_colaboradores_cargo

CREATE TABLE ge_colaboradores_cargo(
  pessoa_cod Integer NOT NULL,
  col_car_matricula Integer NOT NULL,
  horas_semanais Number,
  data_inicial Date,
  data_final Date,
  status Char(1 ),
  cargo_cod Integer
)
/

-- Add keys for table ge_colaboradores_cargo

ALTER TABLE ge_colaboradores_cargo ADD CONSTRAINT pk_ge_col_car PRIMARY KEY (pessoa_cod,col_car_matricula)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_colaboradores_cargo IS 'Cargos dos colaboradores.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.col_car_matricula IS 'Matricula dos cargos dos colaboradores.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.horas_semanais IS 'Horas de trabalho semanais.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.data_inicial IS 'Data inicial do exercício do cargo.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.data_final IS 'Data do fim do exercício do cargo.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.status IS 'Status do cargo do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores_cargo.cargo_cod IS 'Cargo do colaborador.'
/

-- Table fp_colaborador_afastamentos

CREATE TABLE fp_colaborador_afastamentos(
  pessoa_cod Integer NOT NULL,
  col_afa_cod Integer NOT NULL,
  motivo Varchar2(500 ),
  data_inicial Date,
  data_final Date,
  atestado_medico Char(1 )
)
/

-- Add keys for table fp_colaborador_afastamentos

ALTER TABLE fp_colaborador_afastamentos ADD CONSTRAINT pk_fp_col_afa PRIMARY KEY (pessoa_cod,col_afa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE fp_colaborador_afastamentos IS 'Armazena os afastamentos dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.col_afa_cod IS 'Código sequencial dos afastamentos dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.motivo IS 'Motivo do afastamento.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.data_inicial IS 'Data inicial do afastamento.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.data_final IS 'Data final do afastamento.'
/
COMMENT ON COLUMN fp_colaborador_afastamentos.atestado_medico IS 'Indica se um atestado médico foi fornecido.'
/

-- Table fp_colaborador_beneficios

CREATE TABLE fp_colaborador_beneficios(
  pessoa_cod Integer NOT NULL,
  col_ben_cod Integer NOT NULL,
  descricao Varchar2(300 ),
  valor Number(10,2),
  data_final Date,
  data_inicial Date
)
/

-- Add keys for table fp_colaborador_beneficios

ALTER TABLE fp_colaborador_beneficios ADD CONSTRAINT pk_fp_col_ben PRIMARY KEY (pessoa_cod,col_ben_cod)
/

-- Table fp_colaborador_dependentes

CREATE TABLE fp_colaborador_dependentes(
  pessoa_cod Integer NOT NULL,
  col_dep_cod Integer NOT NULL,
  nome Varchar2(200 ),
  cpf Varchar2(50 ),
  rg Varchar2(50 ),
  estudante Char(1 )
)
/

-- Add keys for table fp_colaborador_dependentes

ALTER TABLE fp_colaborador_dependentes ADD CONSTRAINT pk_fp_col_dep PRIMARY KEY (pessoa_cod,col_dep_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE fp_colaborador_dependentes IS 'Dados dos dependentes dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.col_dep_cod IS 'Código sequencial dos dependentes dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.nome IS 'Nome dos dependentes dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.cpf IS 'CPF dos dependentes dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.rg IS 'RG dos dependentes dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_dependentes.estudante IS 'Indica se o dependente do colaborador é estudante ou não.'
/

-- Table fp_colaborador_salarios

CREATE TABLE fp_colaborador_salarios(
  pessoa_cod Integer NOT NULL,
  col_sal_cod Integer NOT NULL,
  salario_valor Number(10,2),
  salario_data_alteracao Date,
  salario_status Char(1 )
)
/

-- Add keys for table fp_colaborador_salarios

ALTER TABLE fp_colaborador_salarios ADD CONSTRAINT pk_fp_col_sal PRIMARY KEY (pessoa_cod,col_sal_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE fp_colaborador_salarios IS 'Salários dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_salarios.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN fp_colaborador_salarios.col_sal_cod IS 'Código sequencial dos salários dos colaboradores.'
/
COMMENT ON COLUMN fp_colaborador_salarios.salario_valor IS 'Valor do salário do colaboador.'
/
COMMENT ON COLUMN fp_colaborador_salarios.salario_data_alteracao IS 'Data de alteração do salário do colaborador.'
/
COMMENT ON COLUMN fp_colaborador_salarios.salario_status IS 'Status do salário dos colaboradores.'
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
  cep Char(8 ) NOT NULL,
  pais Varchar2(100 ) NOT NULL,
  uni_fed_cod Integer,
  numero Integer NOT NULL,
  complemento Varchar2(100 ),
  est_civ_cod Integer NOT NULL,
  sexo Varchar2(10 ) NOT NULL
)
/

-- Add keys for table ge_pessoas

ALTER TABLE ge_pessoas ADD CONSTRAINT pk_ge_pessoa PRIMARY KEY (pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_pessoas IS 'Armazena as principais informações das pessoas.'
/
COMMENT ON COLUMN ge_pessoas.pessoa_cod IS 'Código sequencial da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.nome IS 'Nome da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.data_nasc IS 'Data de nascimento da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.cpf IS 'CPF da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.endereco IS 'Endereço da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.bairro IS 'Bairro onde a pessoa reside.'
/
COMMENT ON COLUMN ge_pessoas.email_1 IS 'Email primário da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.email_2 IS 'Email secundário da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.naturalidade IS 'Naturalidade da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.cidade IS 'Cidade onde reside a pessoa.'
/
COMMENT ON COLUMN ge_pessoas.cep IS 'CEP do logradouro onde reside a pessoa.'
/
COMMENT ON COLUMN ge_pessoas.pais IS 'Pais onde reside a pessoa.'
/
COMMENT ON COLUMN ge_pessoas.uni_fed_cod IS 'Estado onde a pessoa reside.'
/
COMMENT ON COLUMN ge_pessoas.numero IS 'Número da residência da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.complemento IS 'Complemento do endereço da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.est_civ_cod IS 'Estado civil da pessoa.'
/
COMMENT ON COLUMN ge_pessoas.sexo IS 'Sexo da pessoa. Ex.: masculino, feminino.'
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
  conta_corrente Varchar2(80 ),
  foto Varchar2(500 )
)
/

-- Add keys for table ge_colaboradores

ALTER TABLE ge_colaboradores ADD CONSTRAINT pk_ge_colaborador PRIMARY KEY (pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_colaboradores IS 'Especialização da tabela de pessoas em colaboradores. Armazena os dados das pessoas que foram efetivadas.'
/
COMMENT ON COLUMN ge_colaboradores.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN ge_colaboradores.cnh IS 'CNH do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.grupo_sanguineo IS 'Grupo sanguineo do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.observacao IS 'Observação sobre o colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.data_admissao IS 'Data de admissão do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.data_demissao IS 'Data de demissão do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.status IS 'Status do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.banco IS 'Banco do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.agencia IS 'Agência bancária do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.conta_corrente IS 'Conta corrente do colaborador.'
/
COMMENT ON COLUMN ge_colaboradores.foto IS 'Caminho da foto do colaborador.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE fp_tipos_cargo IS 'Tipo de cargo.'
/
COMMENT ON COLUMN fp_tipos_cargo.tip_car_cod IS 'Código sequencial do tipo de cargo.'
/
COMMENT ON COLUMN fp_tipos_cargo.descricao IS 'Descrição do tipo de cargo.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE fp_departamentos IS 'Departamentos da empresa.'
/
COMMENT ON COLUMN fp_departamentos.departamento_cod IS 'Código sequencial do departamento.'
/
COMMENT ON COLUMN fp_departamentos.descricao IS 'Descrição do departamento.'
/

-- Table fp_atributos_cargos

CREATE TABLE fp_atributos_cargos(
  cargo_cod Integer NOT NULL,
  atributo_cod Integer NOT NULL,
  status Char(1 ),
  nota_cargo Number(5,2)
)
/

-- Add keys for table fp_atributos_cargos

ALTER TABLE fp_atributos_cargos ADD CONSTRAINT pk_fp_atr_car PRIMARY KEY (cargo_cod,atributo_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE fp_atributos_cargos IS 'Atributos dos cargos.'
/
COMMENT ON COLUMN fp_atributos_cargos.cargo_cod IS 'Código do cargo.'
/
COMMENT ON COLUMN fp_atributos_cargos.atributo_cod IS 'Código do atributo.'
/
COMMENT ON COLUMN fp_atributos_cargos.status IS 'Status do atributo do cargo.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE fp_atributos IS 'Atributos.'
/
COMMENT ON COLUMN fp_atributos.atributo_cod IS 'Código sequencial do atributo.'
/
COMMENT ON COLUMN fp_atributos.descricao IS 'Descrição do atributo.'
/
COMMENT ON COLUMN fp_atributos.tipo IS 'Tipo de atributo.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE fp_cargos IS 'Tabela de Cargos.'
/
COMMENT ON COLUMN fp_cargos.cargo_cod IS 'Código sequencial do cargo.'
/
COMMENT ON COLUMN fp_cargos.descricao IS 'Descrição do cargo.'
/
COMMENT ON COLUMN fp_cargos.salario_minimo IS 'Salário mínimo do cargo.'
/
COMMENT ON COLUMN fp_cargos.salario_maximo IS 'Salário máximo do cargo.'
/
COMMENT ON COLUMN fp_cargos.salario_medio IS 'Salário médio do cargo.'
/
COMMENT ON COLUMN fp_cargos.departamento_cod IS 'Departamento ao qual pertence o cargo.'
/
COMMENT ON COLUMN fp_cargos.tip_car_cod IS 'Tipo de cargo.'
/
COMMENT ON COLUMN fp_cargos.horas_totais IS 'Total de horas de trabalho.'
/

-- Table ge_fornecedores

CREATE TABLE ge_fornecedores(
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table ge_fornecedores

ALTER TABLE ge_fornecedores ADD CONSTRAINT pk_ge_fornecedor PRIMARY KEY (pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_fornecedores IS 'Especialização da tabela pessoas para fornecedores.'
/
COMMENT ON COLUMN ge_fornecedores.pessoa_cod IS 'Código da pessoa.'
/

-- Table ge_clientes

CREATE TABLE ge_clientes(
  pessoa_cod Integer NOT NULL
)
/

-- Add keys for table ge_clientes

ALTER TABLE ge_clientes ADD CONSTRAINT pk_ge_cliente PRIMARY KEY (pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE ge_clientes IS 'Especialização da tabela de pessoas em clientes.'
/
COMMENT ON COLUMN ge_clientes.pessoa_cod IS 'Código da pessoa.'
/

-- Table sb_eventos_folha

CREATE TABLE sb_eventos_folha(
  pessoa_cod Integer NOT NULL,
  fol_pag_cod Integer NOT NULL,
  evento_cod Integer NOT NULL,
  valor Number(10,2) NOT NULL
)
/

-- Add keys for table sb_eventos_folha

ALTER TABLE sb_eventos_folha ADD CONSTRAINT pk_sb_eve_fol PRIMARY KEY (pessoa_cod,fol_pag_cod,evento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE sb_eventos_folha IS 'Eventos relacionados com a folha de pagamento.'
/
COMMENT ON COLUMN sb_eventos_folha.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN sb_eventos_folha.fol_pag_cod IS 'Código da folha de pagamento.'
/
COMMENT ON COLUMN sb_eventos_folha.evento_cod IS 'Código do evento.'
/
COMMENT ON COLUMN sb_eventos_folha.valor IS 'Valor.'
/

-- Table sb_cadastro_ferias

CREATE TABLE sb_cadastro_ferias(
  pessoa_cod Integer NOT NULL,
  cad_fer_data_inicio Date NOT NULL,
  cad_fer_data_fim Date NOT NULL
)
/

-- Add keys for table sb_cadastro_ferias

ALTER TABLE sb_cadastro_ferias ADD CONSTRAINT pk_sb_cad_fer PRIMARY KEY (pessoa_cod,cad_fer_data_inicio,cad_fer_data_fim)
/

-- Table and Columns comments section
  
COMMENT ON TABLE sb_cadastro_ferias IS 'Cadastro de férias dos colaboradores.'
/
COMMENT ON COLUMN sb_cadastro_ferias.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN sb_cadastro_ferias.cad_fer_data_inicio IS 'Data de início das férias.'
/
COMMENT ON COLUMN sb_cadastro_ferias.cad_fer_data_fim IS 'Data de fim das férias.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE sb_tipo_folha IS 'Tipo de folha de pagamento.'
/
COMMENT ON COLUMN sb_tipo_folha.tip_fol_cod IS 'Código sequencial do tipo de folha de pagamento.'
/
COMMENT ON COLUMN sb_tipo_folha.descricao IS 'Descrição do tipo de folha de pagamento.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE sb_eventos IS 'Neste cadastro serão armazenados todos os fatos envolvidos na folha de pagamento, podendo especificar as de naturezas de operação pertencentes na folha. Envolvendo impostos legais como contribuições sindicais, horas extras, adiantamentos, INSS, plano de saúde, férias entre outros.'
/
COMMENT ON COLUMN sb_eventos.evento_cod IS 'Código sequencial do evento.'
/
COMMENT ON COLUMN sb_eventos.tipo IS 'Tipo de evento.'
/
COMMENT ON COLUMN sb_eventos.descricao IS 'Descrição do evento.'
/
COMMENT ON COLUMN sb_eventos.formula IS 'Fórmula utilizada.'
/

-- Table sb_folha_pagamento

CREATE TABLE sb_folha_pagamento(
  pessoa_cod Integer NOT NULL,
  fol_pag_cod Integer NOT NULL,
  tip_fol_cod Varchar2(1 ) NOT NULL,
  total_proventos Number(10,2) NOT NULL,
  total_descontos Number(10,2) NOT NULL,
  total_remuneracao Number(10,2) NOT NULL,
  cargo_cod Integer,
  data_inicial Date NOT NULL,
  data_final Date NOT NULL
)
/

-- Add keys for table sb_folha_pagamento

ALTER TABLE sb_folha_pagamento ADD CONSTRAINT pk_sb_fol_pag PRIMARY KEY (pessoa_cod,fol_pag_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE sb_folha_pagamento IS 'Folhas de pagamento dos colaboradores.'
/
COMMENT ON COLUMN sb_folha_pagamento.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN sb_folha_pagamento.fol_pag_cod IS 'Código sequencial da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.tip_fol_cod IS 'Tipo de folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.total_proventos IS 'Total de proventos da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.total_descontos IS 'Total de descontos da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.total_remuneracao IS 'Total de remuneração da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.cargo_cod IS 'Cargo da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.data_inicial IS 'Data inicial da folha de pagamento.'
/
COMMENT ON COLUMN sb_folha_pagamento.data_final IS 'Data final da folha de pagamento.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_visitas IS 'Armazena todas as visitas no sistema.'
/
COMMENT ON COLUMN rs_visitas.visita_cod IS 'Código sequencial da visita.'
/
COMMENT ON COLUMN rs_visitas.ip IS 'IP do visitante.'
/
COMMENT ON COLUMN rs_visitas.data IS 'Data em que a visita ocorreu.'
/
COMMENT ON COLUMN rs_visitas.logado IS 'Informa se o visitante estava logado ou não no sistema.'
/
COMMENT ON COLUMN rs_visitas.contador IS 'Contabiliza a quantidade de pageviews do visitante.'
/
COMMENT ON COLUMN rs_visitas.ver_bro_cod IS 'Versão do browser utilizado pelo visitante.'
/
COMMENT ON COLUMN rs_visitas.sis_ope_cod IS 'Sistema operacional do visitante.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_versoes_browser IS 'Armazenas as versões de browsers do usuário.'
/
COMMENT ON COLUMN rs_versoes_browser.ver_bro_cod IS 'Código sequencial da versão do browser.'
/
COMMENT ON COLUMN rs_versoes_browser.versao IS 'Versão do browser.'
/
COMMENT ON COLUMN rs_versoes_browser.contador IS 'Contador de visitantes com essa versão de browser.'
/
COMMENT ON COLUMN rs_versoes_browser.browser_cod IS 'Browser a qual a versão pertence.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_browsers IS 'Armazena os browsers utilizados pelos usuários.'
/
COMMENT ON COLUMN rs_browsers.browser_cod IS 'Código sequencial do browser.'
/
COMMENT ON COLUMN rs_browsers.nome IS 'Nome do browser.'
/
COMMENT ON COLUMN rs_browsers.contador IS 'Contador de usuários que visitaram o sistema com esse navegador.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_sistema_operacional IS 'Armazena os sistemas operacionais utilizados pelos usuários.'
/
COMMENT ON COLUMN rs_sistema_operacional.sis_ope_cod IS 'Código sequencial do sistema operacional.'
/
COMMENT ON COLUMN rs_sistema_operacional.nome IS 'Nome do sistema operacional.'
/
COMMENT ON COLUMN rs_sistema_operacional.contador IS 'Contador do número de visitantes que utilizaram esse sistema.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_pageviews IS 'Armazena informações das visualizações de páginas feitas por um visitante.'
/
COMMENT ON COLUMN rs_pageviews.pageview_cod IS 'Código sequencial do pageview.'
/
COMMENT ON COLUMN rs_pageviews.data IS 'Data da visualização de página'
/
COMMENT ON COLUMN rs_pageviews.pag_vis_cod IS 'Página visualizada.'
/
COMMENT ON COLUMN rs_pageviews.visita_cod IS 'Código da visita.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE rs_tentativas_login IS 'Armazena as tentativas feitas para se logar no sistema.'
/
COMMENT ON COLUMN rs_tentativas_login.ten_log_ip IS 'IP de quem tentou fazer login no sistema.'
/
COMMENT ON COLUMN rs_tentativas_login.ten_log_data IS 'Data em que a tentativa foi feita.'
/
COMMENT ON COLUMN rs_tentativas_login.nome_usuario IS 'Nome do usuário utilizado para efetuar o login.'
/
COMMENT ON COLUMN rs_tentativas_login.status IS 'Status da tentativa. Ex.: sucesso, falha.'
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

-- Table and Columns comments section
  
COMMENT ON TABLE sb_saldo_ferias IS 'Saldo de férias na folha de pagamento do colaborador.'
/
COMMENT ON COLUMN sb_saldo_ferias.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN sb_saldo_ferias.fol_pag_cod IS 'Código da folha de pagamento.'
/
COMMENT ON COLUMN sb_saldo_ferias.meses_trabalhados IS 'Quantidade de meses trabalhados.'
/

-- Table rs_fases

CREATE TABLE rs_fases(
  fase_cod Integer NOT NULL,
  ordem Number(2,0),
  data_inicio Date,
  data_fim Date,
  status Varchar2(30 ),
  pro_sel_cod Integer,
  tip_fas_cod Integer
)
/

-- Add keys for table rs_fases

ALTER TABLE rs_fases ADD CONSTRAINT pk_rs_fases PRIMARY KEY (fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_fases IS 'Fases que irão compor um processo seletivo.'
/
COMMENT ON COLUMN rs_fases.fase_cod IS 'Código sequencial da fasel.'
/
COMMENT ON COLUMN rs_fases.ordem IS 'Ordem da fase.'
/
COMMENT ON COLUMN rs_fases.data_inicio IS 'Data em que incia a fase do processo seletivo.'
/
COMMENT ON COLUMN rs_fases.data_fim IS 'Data em que finaliza a fase do processo seletivo.'
/
COMMENT ON COLUMN rs_fases.status IS 'Status da fase do processo seletivo. Ex.: inativo, ativo, finalizado.'
/
COMMENT ON COLUMN rs_fases.pro_sel_cod IS 'Processo seletivo ao qual pertence a fase.'
/
COMMENT ON COLUMN rs_fases.tip_fas_cod IS 'Tipo de fase.'
/

-- Table rs_entrevistas_candidatos

CREATE TABLE rs_entrevistas_candidatos(
  pessoa_cod Integer NOT NULL,
  pro_sel_cod Integer NOT NULL,
  fase_cod Integer NOT NULL,
  data_efetiva Date,
  data_agendada Date,
  comentario Varchar2(4000 ),
  entrevistador Varchar2(80 ),
  status Varchar2(30 )
)
/

-- Add keys for table rs_entrevistas_candidatos

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT pk_rs_ent_can PRIMARY KEY (pessoa_cod,pro_sel_cod,fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_entrevistas_candidatos IS 'Armazena os dados das entrevistas feitas com os candidatos em um processo seletivo.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.pro_sel_cod IS 'Código do processo seletivo.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.fase_cod IS 'Código da fase.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.data_efetiva IS 'Data em que a entrevista de fato ocorreu.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.data_agendada IS 'Data agendada com o candidato para realizar a entrevista, deve estar limitada entre as datas de início e fim da fase.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.comentario IS 'Comentários que o entrevistador tem a fazer a respeito do candidato.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.entrevistador IS 'Nome da pessoa que realizou a entrevista com o candidato.'
/
COMMENT ON COLUMN rs_entrevistas_candidatos.status IS 'Status da entrevista, é atribuido pelo entrevistado. Ex.: aprovado, reprovado.'
/

-- Table rs_triagens_candidatos

CREATE TABLE rs_triagens_candidatos(
  pessoa_cod Integer NOT NULL,
  pro_sel_cod Integer NOT NULL,
  fase_cod Integer NOT NULL,
  status Varchar2(30 ) NOT NULL,
  data Date NOT NULL
)
/

-- Add keys for table rs_triagens_candidatos

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT pk_rs_tri_can PRIMARY KEY (pessoa_cod,pro_sel_cod,fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_triagens_candidatos IS 'Triagens executadas para os candidatos. É um processo automatizado que se utiliza dos dados de nível de formação, área de formação e palavras chave para selecionar os candidatos que possuem conhecimentos básicos para continuar no processo seletivo.'
/
COMMENT ON COLUMN rs_triagens_candidatos.pessoa_cod IS 'Códido da pessoa.'
/
COMMENT ON COLUMN rs_triagens_candidatos.pro_sel_cod IS 'Códido do processo seletivo.'
/
COMMENT ON COLUMN rs_triagens_candidatos.fase_cod IS 'Código da fase.'
/
COMMENT ON COLUMN rs_triagens_candidatos.status IS 'Status da triagem. Ex.: aprovado, reprovado.'
/
COMMENT ON COLUMN rs_triagens_candidatos.data IS 'Data em que o processo foi executado, serve apenas para o propósito de gerar relatórios.'
/

-- Table rs_tipos_fases

CREATE TABLE rs_tipos_fases(
  tip_fas_cod Integer NOT NULL,
  fase Char(20 )
)
/

-- Add keys for table rs_tipos_fases

ALTER TABLE rs_tipos_fases ADD CONSTRAINT Key4 PRIMARY KEY (tip_fas_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_tipos_fases IS 'Tipos de fases que podem compor um processo seletivo.'
/
COMMENT ON COLUMN rs_tipos_fases.tip_fas_cod IS 'Código sequencial do processo seletivo.'
/
COMMENT ON COLUMN rs_tipos_fases.fase IS 'Nome do tipo de fase.'
/

-- Table rs_fase_entrevistas

CREATE TABLE rs_fase_entrevistas(
  fase_cod Integer NOT NULL
)
/

-- Add keys for table rs_fase_entrevistas

ALTER TABLE rs_fase_entrevistas ADD CONSTRAINT pk_rs_fas_ent PRIMARY KEY (fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_fase_entrevistas IS 'Especialização da fase para entrevista.'
/
COMMENT ON COLUMN rs_fase_entrevistas.fase_cod IS 'Código da fase.'
/

-- Table rs_fase_triagens

CREATE TABLE rs_fase_triagens(
  fase_cod Integer NOT NULL
)
/

-- Add keys for table rs_fase_triagens

ALTER TABLE rs_fase_triagens ADD CONSTRAINT pk_rs_fas_tri PRIMARY KEY (fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_fase_triagens IS 'Especialização da fase para triagem.'
/

-- Table rs_fase_testes

CREATE TABLE rs_fase_testes(
  fase_cod Integer NOT NULL,
  teste_cod Integer,
  nota Number(3,1)
)
/

-- Add keys for table rs_fase_testes

ALTER TABLE rs_fase_testes ADD CONSTRAINT pk_rs_fas_tes PRIMARY KEY (fase_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_fase_testes IS 'Especialização da fase para teste.'
/
COMMENT ON COLUMN rs_fase_testes.fase_cod IS 'Código da fase.'
/
COMMENT ON COLUMN rs_fase_testes.teste_cod IS 'Código do teste.'
/
COMMENT ON COLUMN rs_fase_testes.nota IS 'Nota mínima necessária para ser aprovado no teste.'
/

-- Table rs_niveis_usuario

CREATE TABLE rs_niveis_usuario(
  nivel Number(2,0) NOT NULL,
  alias Varchar2(50 )
)
/

-- Add keys for table rs_niveis_usuario

ALTER TABLE rs_niveis_usuario ADD CONSTRAINT pk_rs_niv_usu PRIMARY KEY (nivel)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_niveis_usuario IS 'Níveis de usuário do sistema.'
/
COMMENT ON COLUMN rs_niveis_usuario.nivel IS 'Código do nível de usuários.'
/
COMMENT ON COLUMN rs_niveis_usuario.alias IS 'Identificação do nível de usuários.'
/

-- Table fp_atributos_colaboradores

CREATE TABLE fp_atributos_colaboradores(
  pessoa_cod Integer NOT NULL,
  atributo_cod Integer NOT NULL,
  status Char(1 ) NOT NULL
)
/

-- Add keys for table fp_atributos_colaboradores

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT pk_fp_atr_col PRIMARY KEY (pessoa_cod,atributo_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE fp_atributos_colaboradores IS 'Atributos dos colaboradores.'
/
COMMENT ON COLUMN fp_atributos_colaboradores.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN fp_atributos_colaboradores.atributo_cod IS 'Código do atributo.'
/
COMMENT ON COLUMN fp_atributos_colaboradores.status IS 'Status do atributo.'
/

-- Table rs_notas

CREATE TABLE rs_notas(
  nota Number(3,1) NOT NULL
)
/

-- Add keys for table rs_notas

ALTER TABLE rs_notas ADD CONSTRAINT pk_rs_nota PRIMARY KEY (nota)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_notas IS 'Notas que podem ser atribuídas aos testes.'
/
COMMENT ON COLUMN rs_notas.nota IS 'Nota.'
/

-- Table td_recursos_ambientes

CREATE TABLE td_recursos_ambientes(
  recurso_cod Integer NOT NULL,
  ambiente_cod Integer NOT NULL
)
/

-- Add keys for table td_recursos_ambientes

ALTER TABLE td_recursos_ambientes ADD CONSTRAINT pk_td_recurso_ambiente PRIMARY KEY (recurso_cod,ambiente_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_recursos_ambientes IS 'Recursos alocados para o ambiente.'
/
COMMENT ON COLUMN td_recursos_ambientes.recurso_cod IS 'Código do recurso.'
/
COMMENT ON COLUMN td_recursos_ambientes.ambiente_cod IS 'Código do ambiente.'
/

-- Table td_turmas_treinamentos

CREATE TABLE td_turmas_treinamentos(
  turma_cod Integer NOT NULL,
  treinamento_cod Integer NOT NULL
)
/

-- Add keys for table td_turmas_treinamentos

ALTER TABLE td_turmas_treinamentos ADD CONSTRAINT pk_td_turma_treinam PRIMARY KEY (turma_cod,treinamento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_turmas_treinamentos IS 'Turmas dos treinamentos.'
/
COMMENT ON COLUMN td_turmas_treinamentos.turma_cod IS 'Código da turma.'
/
COMMENT ON COLUMN td_turmas_treinamentos.treinamento_cod IS 'Código do treinamento.'
/

-- Table td_treinandos

CREATE TABLE td_treinandos(
  turma_cod Integer NOT NULL,
  pessoa_cod Integer NOT NULL,
  resultado_cod Integer,
  objetivo_cod Integer,
  treinamento_cod Integer
)
/

-- Add keys for table td_treinandos

ALTER TABLE td_treinandos ADD CONSTRAINT pk_treinandos PRIMARY KEY (turma_cod,pessoa_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_treinandos IS 'Colaboradores cadastrados em treinamentos.'
/
COMMENT ON COLUMN td_treinandos.turma_cod IS 'Código da turma.'
/
COMMENT ON COLUMN td_treinandos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN td_treinandos.resultado_cod IS 'Resultado do treinamento.'
/
COMMENT ON COLUMN td_treinandos.objetivo_cod IS 'Objetivo do treinamento.'
/
COMMENT ON COLUMN td_treinandos.treinamento_cod IS 'Treinamento realizado.'
/

-- Table td_tecnicas_metodos

CREATE TABLE td_tecnicas_metodos(
  metodo_cod Integer NOT NULL,
  tecnica_cod Integer NOT NULL
)
/

-- Add keys for table td_tecnicas_metodos

ALTER TABLE td_tecnicas_metodos ADD CONSTRAINT pk_td_tecnica_metodo PRIMARY KEY (metodo_cod,tecnica_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_tecnicas_metodos IS 'Técnicas utilizadas por um método.'
/
COMMENT ON COLUMN td_tecnicas_metodos.metodo_cod IS 'Código do método.'
/
COMMENT ON COLUMN td_tecnicas_metodos.tecnica_cod IS 'Código da técnica.'
/

-- Table td_treinamento_metodos

CREATE TABLE td_treinamento_metodos(
  metodo_cod Integer NOT NULL,
  treinamento_cod Integer NOT NULL
)
/

-- Add keys for table td_treinamento_metodos

ALTER TABLE td_treinamento_metodos ADD CONSTRAINT pk_td_treinam_metodo PRIMARY KEY (metodo_cod,treinamento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_treinamento_metodos IS 'Metodos utilizados pelo treinamento.'
/
COMMENT ON COLUMN td_treinamento_metodos.metodo_cod IS 'Código do método.'
/
COMMENT ON COLUMN td_treinamento_metodos.treinamento_cod IS 'Código do treinamento.'
/

-- Table td_objetivos_treinamento

CREATE TABLE td_objetivos_treinamento(
  objetivo_cod Integer NOT NULL,
  treinamento_cod Integer NOT NULL
)
/

-- Add keys for table td_objetivos_treinamento

ALTER TABLE td_objetivos_treinamento ADD CONSTRAINT pk_td_objetivo_treinam PRIMARY KEY (objetivo_cod,treinamento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_objetivos_treinamento IS 'Objetivos dos treinamentos.'
/
COMMENT ON COLUMN td_objetivos_treinamento.objetivo_cod IS 'Código do objetivo.'
/
COMMENT ON COLUMN td_objetivos_treinamento.treinamento_cod IS 'Código do treinamento.'
/

-- Table td_inscricao_web

CREATE TABLE td_inscricao_web(
  inscricao_cod Integer NOT NULL,
  liberado Char(1 ),
  treinamento_cod Integer
)
/

-- Add keys for table td_inscricao_web

ALTER TABLE td_inscricao_web ADD CONSTRAINT pk_td_insc_web PRIMARY KEY (inscricao_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_inscricao_web IS 'Armazenas as incrições feitas através da web.'
/
COMMENT ON COLUMN td_inscricao_web.inscricao_cod IS 'Código sequencial das inscrições web.'
/
COMMENT ON COLUMN td_inscricao_web.liberado IS 'Informa se a inscrição pela web foi liberada.'
/
COMMENT ON COLUMN td_inscricao_web.treinamento_cod IS 'Código do treinamento.'
/

-- Table td_inscricao_colaborador

CREATE TABLE td_inscricao_colaborador(
  pessoa_cod Integer NOT NULL,
  tipo Char(1 ) NOT NULL,
  inscricao_cod Integer NOT NULL
)
/

-- Add keys for table td_inscricao_colaborador

ALTER TABLE td_inscricao_colaborador ADD CONSTRAINT pk_td_ins_col PRIMARY KEY (pessoa_cod,inscricao_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE td_inscricao_colaborador IS 'Colaboradores ligados as inscrições web. Pode ser tanto o colaborador se inscrevendo quanto o que irá aprovar ou não o colaborador.'
/
COMMENT ON COLUMN td_inscricao_colaborador.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN td_inscricao_colaborador.tipo IS 'Informa se o colaborador está se inscrevendo em um treinamento ou se irá avaliar a necessidade de o colaborador fazer o treinamento.'
/
COMMENT ON COLUMN td_inscricao_colaborador.inscricao_cod IS 'Código da inscrição.'
/

-- Table adp_avaliacao_tipo

CREATE TABLE adp_avaliacao_tipo(
  tipo Integer NOT NULL,
  descricao Varchar2(50 )
)
/

-- Add keys for table adp_avaliacao_tipo

ALTER TABLE adp_avaliacao_tipo ADD CONSTRAINT pk_adp_avaliacao_tipo PRIMARY KEY (tipo)
/

-- Table and Columns comments section
  
COMMENT ON TABLE adp_avaliacao_tipo IS 'Tipo de avaliação.'
/
COMMENT ON COLUMN adp_avaliacao_tipo.tipo IS 'Tipo de avaliação.'
/
COMMENT ON COLUMN adp_avaliacao_tipo.descricao IS 'Descrição do tipo de avaliação.'
/

-- Table sb_colaborador_eventos

CREATE TABLE sb_colaborador_eventos(
  pessoa_cod Integer NOT NULL,
  evento_cod Integer NOT NULL
)
/

-- Add keys for table sb_colaborador_eventos

ALTER TABLE sb_colaborador_eventos ADD CONSTRAINT pk_sb_colab_event PRIMARY KEY (pessoa_cod,evento_cod)
/

-- Table and Columns comments section
  
COMMENT ON TABLE sb_colaborador_eventos IS 'Colaboradores relacionados com eventos.'
/
COMMENT ON COLUMN sb_colaborador_eventos.pessoa_cod IS 'Código da pessoa.'
/
COMMENT ON COLUMN sb_colaborador_eventos.evento_cod IS 'Código do evento.'
/

-- Table rs_palavras_chave

CREATE TABLE rs_palavras_chave(
  palavra_chave Varchar2(80 ) NOT NULL
)
/

-- Add keys for table rs_palavras_chave

ALTER TABLE rs_palavras_chave ADD CONSTRAINT Key5 PRIMARY KEY (palavra_chave)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_palavras_chave IS 'Lista de palavras chave que podem ser usadas para verificar em um currículo por conhecimentos necessários.'
/
COMMENT ON COLUMN rs_palavras_chave.palavra_chave IS 'Palavra-chave.'
/

-- Table rs_proc_sele_pala_chav

CREATE TABLE rs_proc_sele_pala_chav(
  pro_sel_cod Integer NOT NULL,
  palavra_chave Varchar2(80 ) NOT NULL
)
/

-- Add keys for table rs_proc_sele_pala_chav

ALTER TABLE rs_proc_sele_pala_chav ADD CONSTRAINT pk_rs_pro_sel_pal_cha PRIMARY KEY (pro_sel_cod,palavra_chave)
/

-- Table and Columns comments section
  
COMMENT ON TABLE rs_proc_sele_pala_chav IS 'Palavras-chave usadas para verifcar os conhecimentos do candidato.'
/
COMMENT ON COLUMN rs_proc_sele_pala_chav.pro_sel_cod IS 'Código do processo seletivo.'
/
COMMENT ON COLUMN rs_proc_sele_pala_chav.palavra_chave IS 'Palavra-chave que verificará os conhecimentos do candidato.'
/

-- Table ge_logs

CREATE TABLE ge_logs(
  log_cod Integer NOT NULL,
  usuario Varchar2(60 ) NOT NULL,
  data Date NOT NULL,
  ip Varchar2(15 ) NOT NULL,
  acao Varchar2(500 ) NOT NULL
)
/

-- Add keys for table ge_logs

ALTER TABLE ge_logs ADD CONSTRAINT pk_ge_log PRIMARY KEY (log_cod)
/

-- Create relationships section ------------------------------------------------- 

ALTER TABLE rs_referencias ADD CONSTRAINT rel_cand_refer FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_idiomas_candidatos ADD CONSTRAINT rel_cand_idioma FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
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

ALTER TABLE rs_candidatos_processos_seleti ADD CONSTRAINT rel_procs_cand FOREIGN KEY (pro_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
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

ALTER TABLE rs_alternativas_questoes ADD CONSTRAINT rel_quest_alter FOREIGN KEY (teste_cod, questao_cod) REFERENCES rs_questoes (teste_cod, questao_cod)
/

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT rel_respc_alterq FOREIGN KEY (teste_cod, questao_cod, alt_que_cod) REFERENCES rs_alternativas_questoes (teste_cod, questao_cod, alt_que_cod)
/

ALTER TABLE rs_tipos_questoes ADD CONSTRAINT rel_tquest_tgab FOREIGN KEY (tip_gab_cod) REFERENCES rs_tipos_gabaritos (tip_gab_cod)
/

ALTER TABLE rs_valores_gabarito ADD CONSTRAINT rel_tgab_vgab FOREIGN KEY (tip_gab_cod) REFERENCES rs_tipos_gabaritos (tip_gab_cod)
/

ALTER TABLE rs_questoes ADD CONSTRAINT rel_quest_tipo FOREIGN KEY (tip_que_cod) REFERENCES rs_tipos_questoes (tip_que_cod)
/

ALTER TABLE rs_questoes ADD CONSTRAINT rel_test_quest FOREIGN KEY (teste_cod) REFERENCES rs_testes (teste_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_curso FOREIGN KEY (cur_for_cod) REFERENCES rs_cursos_formacoes (cur_for_cod)
/

ALTER TABLE rs_formacoes_academicas ADD CONSTRAINT rel_form_andamcurs FOREIGN KEY (and_cur_cod) REFERENCES rs_andamento_curso (and_cur_cod)
/

ALTER TABLE td_turmas ADD CONSTRAINT rel_turma_amb FOREIGN KEY (ambiente_cod) REFERENCES td_ambientes (ambiente_cod)
/

ALTER TABLE adp_avaliacoes ADD CONSTRAINT rel_indic_aval FOREIGN KEY (indicador_cod) REFERENCES adp_indicadores (indicador_cod)
/

ALTER TABLE ge_colaboradores ADD CONSTRAINT rel_pessoa_colab FOREIGN KEY (pessoa_cod) REFERENCES ge_pessoas (pessoa_cod)
/

ALTER TABLE fp_colaborador_salarios ADD CONSTRAINT rel_colab_sal FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_colaborador_dependentes ADD CONSTRAINT rel_colab_depend FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_colaborador_beneficios ADD CONSTRAINT rel_colab_benef FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
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

ALTER TABLE sb_eventos_folha ADD CONSTRAINT rel_folha_evento FOREIGN KEY (pessoa_cod, fol_pag_cod) REFERENCES sb_folha_pagamento (pessoa_cod, fol_pag_cod)
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

ALTER TABLE sb_saldo_ferias ADD CONSTRAINT rel_folha_sferias FOREIGN KEY (pessoa_cod, fol_pag_cod) REFERENCES sb_folha_pagamento (pessoa_cod, fol_pag_cod)
/

ALTER TABLE rs_fases ADD CONSTRAINT rel_procs_fases FOREIGN KEY (pro_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT rel_cand_entrev FOREIGN KEY (pessoa_cod, pro_sel_cod) REFERENCES rs_candidatos_processos_seleti (pessoa_cod, pro_sel_cod)
/

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT rel_cand_triag FOREIGN KEY (pessoa_cod, pro_sel_cod) REFERENCES rs_candidatos_processos_seleti (pessoa_cod, pro_sel_cod)
/

ALTER TABLE rs_fases ADD CONSTRAINT rel_fases_tipo FOREIGN KEY (tip_fas_cod) REFERENCES rs_tipos_fases (tip_fas_cod)
/

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT rel_cand_teste FOREIGN KEY (pessoa_cod, pro_sel_cod) REFERENCES rs_candidatos_processos_seleti (pessoa_cod, pro_sel_cod)
/

ALTER TABLE rs_conhecimentos ADD CONSTRAINT rel_cand_conhec FOREIGN KEY (pessoa_cod) REFERENCES rs_candidatos (pessoa_cod)
/

ALTER TABLE rs_fase_entrevistas ADD CONSTRAINT rel_fase_entrev FOREIGN KEY (fase_cod) REFERENCES rs_fases (fase_cod)
/

ALTER TABLE rs_fase_triagens ADD CONSTRAINT rel_fase_triag FOREIGN KEY (fase_cod) REFERENCES rs_fases (fase_cod)
/

ALTER TABLE rs_entrevistas_candidatos ADD CONSTRAINT rel_entrev_fases FOREIGN KEY (fase_cod) REFERENCES rs_fase_entrevistas (fase_cod)
/

ALTER TABLE rs_triagens_candidatos ADD CONSTRAINT rel_triag_fases FOREIGN KEY (fase_cod) REFERENCES rs_fase_triagens (fase_cod)
/

ALTER TABLE rs_fase_testes ADD CONSTRAINT reL_fase_teste FOREIGN KEY (fase_cod) REFERENCES rs_fases (fase_cod)
/

ALTER TABLE rs_fase_testes ADD CONSTRAINT rel_teste_testcand FOREIGN KEY (teste_cod) REFERENCES rs_testes (teste_cod)
/

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT rel_teste_fases FOREIGN KEY (fase_cod) REFERENCES rs_fase_testes (fase_cod)
/

ALTER TABLE rs_respostas_candidatos ADD CONSTRAINT rel_candprocs_respcand FOREIGN KEY (pessoa_cod, pro_sel_cod) REFERENCES rs_candidatos_processos_seleti (pessoa_cod, pro_sel_cod)
/

ALTER TABLE rs_alternativas_questoes ADD CONSTRAINT rel_valgab_altque FOREIGN KEY (val_gab_cod) REFERENCES rs_valores_gabarito (val_gab_cod)
/

ALTER TABLE rs_usuarios ADD CONSTRAINT rel_nivu_usuarios FOREIGN KEY (nivel) REFERENCES rs_niveis_usuario (nivel)
/

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT rsl_colaborador_atribcol FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE fp_atributos_colaboradores ADD CONSTRAINT rel_atrib_atribcol FOREIGN KEY (atributo_cod) REFERENCES fp_atributos (atributo_cod)
/

ALTER TABLE rs_testes_candidatos ADD CONSTRAINT rel_notas_testecand FOREIGN KEY (nota) REFERENCES rs_notas (nota)
/

ALTER TABLE rs_fase_testes ADD CONSTRAINT rel_notas_faseteste FOREIGN KEY (nota) REFERENCES rs_notas (nota)
/

ALTER TABLE adp_indicadores ADD CONSTRAINT rel_atrib_indicador FOREIGN KEY (atributo_cod) REFERENCES fp_atributos (atributo_cod)
/

ALTER TABLE td_recursos_ambientes ADD CONSTRAINT rel_recamb_recursos FOREIGN KEY (recurso_cod) REFERENCES td_recursos (recurso_cod)
/

ALTER TABLE td_recursos_ambientes ADD CONSTRAINT rel_recamb_ambientes FOREIGN KEY (ambiente_cod) REFERENCES td_ambientes (ambiente_cod)
/

ALTER TABLE td_turmas_treinamentos ADD CONSTRAINT rel_turmtrein_turma FOREIGN KEY (turma_cod) REFERENCES td_turmas (turma_cod)
/

ALTER TABLE td_turmas_treinamentos ADD CONSTRAINT rel_turmtre_treinam FOREIGN KEY (treinamento_cod) REFERENCES td_treinamentos (treinamento_cod)
/

ALTER TABLE td_treinandos ADD CONSTRAINT rel_trein_turma FOREIGN KEY (turma_cod) REFERENCES td_turmas (turma_cod)
/

ALTER TABLE td_treinandos ADD CONSTRAINT rel_colab_trein FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE td_treinandos ADD CONSTRAINT rel_trein_result FOREIGN KEY (resultado_cod) REFERENCES td_resultados (resultado_cod)
/

ALTER TABLE td_tecnicas_metodos ADD CONSTRAINT rel_metodo_tecnmet FOREIGN KEY (metodo_cod) REFERENCES td_metodos (metodo_cod)
/

ALTER TABLE td_tecnicas_metodos ADD CONSTRAINT rel_tecnmet_tecnica FOREIGN KEY (tecnica_cod) REFERENCES td_tecnicas (tecnica_cod)
/

ALTER TABLE td_treinamento_metodos ADD CONSTRAINT rel_treinmetod_metodo FOREIGN KEY (metodo_cod) REFERENCES td_metodos (metodo_cod)
/

ALTER TABLE td_treinamento_metodos ADD CONSTRAINT rel_trein_treinmetod FOREIGN KEY (treinamento_cod) REFERENCES td_treinamentos (treinamento_cod)
/

ALTER TABLE td_objetivos_treinamento ADD CONSTRAINT rel_objtrein_objetivo FOREIGN KEY (objetivo_cod) REFERENCES td_objetivos (objetivo_cod)
/

ALTER TABLE td_objetivos_treinamento ADD CONSTRAINT rel_objtrein_treinament FOREIGN KEY (treinamento_cod) REFERENCES td_treinamentos (treinamento_cod)
/

ALTER TABLE td_inscricao_colaborador ADD CONSTRAINT rel_colab_insccol FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE td_inscricao_colaborador ADD CONSTRAINT td_inscweb_insccolab FOREIGN KEY (inscricao_cod) REFERENCES td_inscricao_web (inscricao_cod)
/

ALTER TABLE td_inscricao_web ADD CONSTRAINT rel_treinam_inscweb FOREIGN KEY (treinamento_cod) REFERENCES td_treinamentos (treinamento_cod)
/

ALTER TABLE adp_avaliacoes ADD CONSTRAINT rel_avaliacao_avaltip FOREIGN KEY (tipo) REFERENCES adp_avaliacao_tipo (tipo)
/

ALTER TABLE sb_colaborador_eventos ADD CONSTRAINT rel_colab_coleve FOREIGN KEY (pessoa_cod) REFERENCES ge_colaboradores (pessoa_cod)
/

ALTER TABLE sb_colaborador_eventos ADD CONSTRAINT rel_coleve_evento FOREIGN KEY (evento_cod) REFERENCES sb_eventos (evento_cod)
/

ALTER TABLE td_treinandos ADD CONSTRAINT rel_objtre_treinand FOREIGN KEY (objetivo_cod, treinamento_cod) REFERENCES td_objetivos_treinamento (objetivo_cod, treinamento_cod)
/

ALTER TABLE rs_processos_seletivos ADD CONSTRAINT rel_nivfor_procsel FOREIGN KEY (niv_for_cod) REFERENCES rs_niveis_formacoes (niv_for_cod)
/

ALTER TABLE rs_proc_sele_pala_chav ADD CONSTRAINT rel_prosel_proselpalcha FOREIGN KEY (pro_sel_cod) REFERENCES rs_processos_seletivos (pro_sel_cod)
/

ALTER TABLE rs_proc_sele_pala_chav ADD CONSTRAINT rel_palcha_proselpalcha FOREIGN KEY (palavra_chave) REFERENCES rs_palavras_chave (palavra_chave)
/

ALTER TABLE td_turmas ADD CONSTRAINT rel_trein_instrut FOREIGN KEY (instrutor_cod) REFERENCES td_instrutores (instrutor_cod)
/


-- Trigger for sequence referencia_cod_seq for column referencia_cod in table rs_referencias ---------

CREATE OR REPLACE TRIGGER ts_rs_referencias_referencia_1 BEFORE INSERT
ON rs_referencias FOR EACH ROW
BEGIN
	SELECT referencia_cod_seq.nextval INTO :new.referencia_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_referencias_referenci_1 AFTER UPDATE OF referencia_cod
ON rs_referencias FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column referencia_cod in table rs_referencias as it uses sequence.');
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

CREATE OR REPLACE TRIGGER ts_rs_formacoes_academicas_f_1 BEFORE INSERT
ON rs_formacoes_academicas FOR EACH ROW
BEGIN
	SELECT formacao_academica_cod_seq.nextval INTO :new.for_aca_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_formacoes_academicas__1 AFTER UPDATE OF for_aca_cod
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

CREATE OR REPLACE TRIGGER ts_rs_experiencias_experienc_1 BEFORE INSERT
ON rs_experiencias FOR EACH ROW
BEGIN
	SELECT experiencia_cod_seq.nextval INTO :new.experiencia_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_experiencias_experien_1 AFTER UPDATE OF experiencia_cod
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

-- Trigger for sequence idioma_cod_seq for column idioma_cod in table rs_idiomas ---------

CREATE OR REPLACE TRIGGER ts_rs_idiomas_idioma_cod_seq BEFORE INSERT
ON rs_idiomas FOR EACH ROW
BEGIN
	SELECT idioma_cod_seq.nextval INTO :new.idioma_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_idiomas_idioma_cod_seq AFTER UPDATE OF idioma_cod
ON rs_idiomas FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column idioma_cod in table rs_idiomas as it uses sequence.');
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

CREATE OR REPLACE TRIGGER ts_ge_telefones_telefone_cod_1 BEFORE INSERT
ON ge_telefones FOR EACH ROW
BEGIN
	SELECT telefone_cod_seq.nextval INTO :new.telefone_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_telefones_telefone_co_1 AFTER UPDATE OF telefone_cod
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
CREATE OR REPLACE TRIGGER tsu_rs_questoes_questao_cod__1 AFTER UPDATE OF questao_cod
ON rs_questoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column questao_cod in table rs_questoes as it uses sequence.');
END;
/

-- Trigger for sequence alternativa_questao_cod_seq for column alt_que_cod in table rs_alternativas_questoes ---------

CREATE OR REPLACE TRIGGER ts_rs_alternativas_questoes__2 BEFORE INSERT
ON rs_alternativas_questoes FOR EACH ROW
BEGIN
	SELECT alternativa_questao_cod_seq.nextval INTO :new.alt_que_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_alternativas_questoes_2 AFTER UPDATE OF alt_que_cod
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

-- Trigger for sequence conhecimento_cod_seq for column conhecimento_cod in table rs_conhecimentos ---------

CREATE OR REPLACE TRIGGER ts_rs_conhecimentos_conhecim_1 BEFORE INSERT
ON rs_conhecimentos FOR EACH ROW
BEGIN
	SELECT conhecimento_cod_seq.nextval INTO :new.conhecimento_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_conhecimentos_conheci_1 AFTER UPDATE OF conhecimento_cod
ON rs_conhecimentos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column conhecimento_cod in table rs_conhecimentos as it uses sequence.');
END;
/

-- Trigger for sequence formacao_adicional_cod_seq for column for_adi_cod in table rs_formacoes_adicionais ---------

CREATE OR REPLACE TRIGGER ts_rs_formacoes_adicionais_f_1 BEFORE INSERT
ON rs_formacoes_adicionais FOR EACH ROW
BEGIN
	SELECT formacao_adicional_cod_seq.nextval INTO :new.for_adi_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_formacoes_adicionais__1 AFTER UPDATE OF for_adi_cod
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

-- Trigger for sequence avaliacao_cod_seq for column avaliacao_cod in table adp_avaliacoes ---------

CREATE OR REPLACE TRIGGER ts_adp_avaliacoes_avaliacao__0 BEFORE INSERT
ON adp_avaliacoes FOR EACH ROW
BEGIN
	SELECT avaliacao_cod_seq.nextval INTO :new.avaliacao_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_adp_avaliacoes_avaliacao_0 AFTER UPDATE OF avaliacao_cod
ON adp_avaliacoes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column avaliacao_cod in table adp_avaliacoes as it uses sequence.');
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

CREATE OR REPLACE TRIGGER ts_fp_colaborador_afastament_1 BEFORE INSERT
ON fp_colaborador_afastamentos FOR EACH ROW
BEGIN
	SELECT colaborador_afast_cod_seq.nextval INTO :new.col_afa_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_afastamen_1 AFTER UPDATE OF col_afa_cod
ON fp_colaborador_afastamentos FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_afa_cod in table fp_colaborador_afastamentos as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_beneficio_cod_seq for column col_ben_cod in table fp_colaborador_beneficios ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_beneficios_1 BEFORE INSERT
ON fp_colaborador_beneficios FOR EACH ROW
BEGIN
	SELECT colaborador_beneficio_cod_seq.nextval INTO :new.col_ben_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_beneficio_1 AFTER UPDATE OF col_ben_cod
ON fp_colaborador_beneficios FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_ben_cod in table fp_colaborador_beneficios as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_dependente_cod_seq for column col_dep_cod in table fp_colaborador_dependentes ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_dependente_1 BEFORE INSERT
ON fp_colaborador_dependentes FOR EACH ROW
BEGIN
	SELECT colaborador_dependente_cod_seq.nextval INTO :new.col_dep_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_dependent_1 AFTER UPDATE OF col_dep_cod
ON fp_colaborador_dependentes FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column col_dep_cod in table fp_colaborador_dependentes as it uses sequence.');
END;
/

-- Trigger for sequence colaborador_salario_cod for column col_sal_cod in table fp_colaborador_salarios ---------

CREATE OR REPLACE TRIGGER ts_fp_colaborador_salarios_c_1 BEFORE INSERT
ON fp_colaborador_salarios FOR EACH ROW
BEGIN
	SELECT colaborador_salario_cod.nextval INTO :new.col_sal_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_fp_colaborador_salarios__1 AFTER UPDATE OF col_sal_cod
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

CREATE OR REPLACE TRIGGER ts_sb_folha_pagamento_pagame_1 BEFORE INSERT
ON sb_folha_pagamento FOR EACH ROW
BEGIN
	SELECT pagamento_cod_seq.nextval INTO :new.fol_pag_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_sb_folha_pagamento_pagam_1 AFTER UPDATE OF fol_pag_cod
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

-- Trigger for sequence fase_cod_seq for column fase_cod in table rs_fases ---------

CREATE OR REPLACE TRIGGER ts_rs_fases_fase_cod_seq BEFORE INSERT
ON rs_fases FOR EACH ROW
BEGIN
	SELECT fase_cod_seq.nextval INTO :new.fase_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_fases_fase_cod_seq AFTER UPDATE OF fase_cod
ON rs_fases FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column fase_cod in table rs_fases as it uses sequence.');
END;
/

-- Trigger for sequence tip_fas_cod_seq for column tip_fas_cod in table rs_tipos_fases ---------

CREATE OR REPLACE TRIGGER ts_rs_tipos_fases_tip_fas_co_0 BEFORE INSERT
ON rs_tipos_fases FOR EACH ROW
BEGIN
	SELECT tip_fas_cod_seq.nextval INTO :new.tip_fas_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_rs_tipos_fases_tip_fas_c_0 AFTER UPDATE OF tip_fas_cod
ON rs_tipos_fases FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column tip_fas_cod in table rs_tipos_fases as it uses sequence.');
END;
/

-- Trigger for sequence inscricao_cod_seq for column inscricao_cod in table td_inscricao_web ---------

CREATE OR REPLACE TRIGGER ts_td_inscricao_web_inscrica_0 BEFORE INSERT
ON td_inscricao_web FOR EACH ROW
BEGIN
	SELECT inscricao_cod_seq.nextval INTO :new.inscricao_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_td_inscricao_web_inscric_0 AFTER UPDATE OF inscricao_cod
ON td_inscricao_web FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column inscricao_cod in table td_inscricao_web as it uses sequence.');
END;
/

-- Trigger for sequence log_cod_seq for column log_cod in table ge_logs ---------

CREATE OR REPLACE TRIGGER ts_ge_logs_log_cod_seq BEFORE INSERT
ON ge_logs FOR EACH ROW
BEGIN
	SELECT log_cod_seq.nextval INTO :new.log_cod FROM DUAL;
END;
/
CREATE OR REPLACE TRIGGER tsu_ge_logs_log_cod_seq AFTER UPDATE OF log_cod
ON ge_logs FOR EACH ROW
BEGIN
	RAISE_APPLICATION_ERROR(-20010,'Cannot update column log_cod in table ge_logs as it uses sequence.');
END;
/



