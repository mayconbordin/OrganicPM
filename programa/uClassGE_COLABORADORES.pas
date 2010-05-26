unit uClassGE_COLABORADORES;

interface 

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassGE_COLABORADORES = class 

  private
    FPESSOA_COD: String; 
    FCNH: String; 
    FGRUPO_SANGUINEO: String; 
    FOBSERVACAO: String; 
    FDATA_ADMISSAO: String; 
    FDATA_DEMISSAO: String; 
    FSTATUS: String; 
    FBANCO: String; 
    FAGENCIA: String; 
    FCONTA_CORRENTE: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFCNH(const Value: String); 
    procedure SetFGRUPO_SANGUINEO(const Value: String); 
    procedure SetFOBSERVACAO(const Value: String); 
    procedure SetFDATA_ADMISSAO(const Value: String); 
    procedure SetFDATA_DEMISSAO(const Value: String); 
    procedure SetFSTATUS(const Value: String); 
    procedure SetFBANCO(const Value: String); 
    procedure SetFAGENCIA(const Value: String); 
    procedure SetFCONTA_CORRENTE(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PCNH: String read FCNH write SetFCNH; 
    property PGRUPO_SANGUINEO: String read FGRUPO_SANGUINEO write SetFGRUPO_SANGUINEO; 
    property POBSERVACAO: String read FOBSERVACAO write SetFOBSERVACAO; 
    property PDATA_ADMISSAO: String read FDATA_ADMISSAO write SetFDATA_ADMISSAO; 
    property PDATA_DEMISSAO: String read FDATA_DEMISSAO write SetFDATA_DEMISSAO;
    property PSTATUS: String read FSTATUS write SetFSTATUS; 
    property PBANCO: String read FBANCO write SetFBANCO; 
    property PAGENCIA: String read FAGENCIA write SetFAGENCIA; 
    property PCONTA_CORRENTE: String read FCONTA_CORRENTE write SetFCONTA_CORRENTE; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function ConsultaPessoaColaborador(Condicao:string): TDataSource;

end;

implementation

uses uClassConexao;

function TuClassGE_COLABORADORES.ConsultaPessoaColaborador(
  Condicao: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil); 
    ds := TDataSource.Create(nil); 
    if Condicao <> '' then 
      Condicao := 'where('+Condicao+')'; 
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'select GE_PESSOAS.PESSOA_COD, GE_PESSOAS.NOME, GE_PESSOAS.DATA_NASC, GE_PESSOAS.EMAIL_1, '+
                  'GE_COLABORADORES.DATA_ADMISSAO from GE_PESSOAS '+
                  'inner join GE_COLABORADORES on (GE_PESSOAS.PESSOA_COD = GE_COLABORADORES.PESSOA_COD) '+Condicao; 
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassGE_COLABORADORES.Consultar(Condicao: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil); 
    ds := TDataSource.Create(nil); 
    if Condicao <> '' then 
      Condicao := 'where('+Condicao+')'; 
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'SELECT '+
                  '  GE_COLABORADORES.PESSOA_COD, '+ 
                  '  GE_COLABORADORES.CNH, '+ 
                  '  GE_COLABORADORES.GRUPO_SANGUINEO, '+ 
                  '  GE_COLABORADORES.OBSERVACAO, '+ 
                  '  GE_COLABORADORES.DATA_ADMISSAO, '+ 
                  '  GE_COLABORADORES.DATA_DEMISSAO, '+ 
                  '  GE_COLABORADORES.STATUS, '+ 
                  '  GE_COLABORADORES.BANCO, '+ 
                  '  GE_COLABORADORES.AGENCIA, '+ 
                  '  GE_COLABORADORES.CONTA_CORRENTE '+ 
                  'FROM GE_COLABORADORES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassGE_COLABORADORES.Carregar: Boolean;
var
  Qry: TADOQuery;
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao;
        Close;
        SQL.Text := 'SELECT '+
                  '  GE_COLABORADORES.PESSOA_COD, '+ 
                  '  GE_COLABORADORES.CNH, '+ 
                  '  GE_COLABORADORES.GRUPO_SANGUINEO, '+ 
                  '  GE_COLABORADORES.OBSERVACAO, '+ 
                  '  GE_COLABORADORES.DATA_ADMISSAO, '+ 
                  '  GE_COLABORADORES.DATA_DEMISSAO, '+ 
                  '  GE_COLABORADORES.STATUS, '+ 
                  '  GE_COLABORADORES.BANCO, '+ 
                  '  GE_COLABORADORES.AGENCIA, '+ 
                  '  GE_COLABORADORES.CONTA_CORRENTE '+ 
                  'FROM GE_COLABORADORES '+
                  'WHERE '+
                  '  GE_COLABORADORES.PESSOA_COD = :pPESSOA_COD ';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PCNH:= FieldByName('CNH').AsString; 
          PGRUPO_SANGUINEO:= FieldByName('GRUPO_SANGUINEO').AsString; 
          POBSERVACAO:= FieldByName('OBSERVACAO').AsString; 
          PDATA_ADMISSAO:= FieldByName('DATA_ADMISSAO').AsString;
          PDATA_DEMISSAO:= FieldByName('DATA_DEMISSAO').AsString; 
          PSTATUS:= FieldByName('STATUS').AsString; 
          PBANCO:= FieldByName('BANCO').AsString; 
          PAGENCIA:= FieldByName('AGENCIA').AsString; 
          PCONTA_CORRENTE:= FieldByName('CONTA_CORRENTE').AsString; 
          Result := True;
        end;
      end;
    finally
      Qry.Free;
    end;
  except on E: Exception do
    begin
      Result := False;
      raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
    end;
  end;
end;

function TuClassGE_COLABORADORES.Editar: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'UPDATE GE_COLABORADORES SET '+
//                  '  GE_COLABORADORES.PESSOA_COD = :pPESSOA_COD,  '+
                  '  GE_COLABORADORES.CNH = :pCNH, '+
                  '  GE_COLABORADORES.GRUPO_SANGUINEO = :pGRUPO_SANGUINEO, '+ 
                  '  GE_COLABORADORES.OBSERVACAO = :pOBSERVACAO, '+ 
                  '  GE_COLABORADORES.DATA_ADMISSAO = TO_DATE(:pDATA_ADMISSAO,''DD/MM/RR''), '+ 
                  '  GE_COLABORADORES.DATA_DEMISSAO = TO_DATE(:pDATA_DEMISSAO,''DD/MM/RR''), '+ 
                  '  GE_COLABORADORES.STATUS = :pSTATUS, '+ 
                  '  GE_COLABORADORES.BANCO = :pBANCO, '+ 
                  '  GE_COLABORADORES.AGENCIA = :pAGENCIA, '+ 
                  '  GE_COLABORADORES.CONTA_CORRENTE = :pCONTA_CORRENTE '+ 
                    'WHERE '+
                  '  GE_COLABORADORES.PESSOA_COD = :pPESSOA_COD ';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCNH').Value := FCNH;
        Parameters.ParamByName('pGRUPO_SANGUINEO').Value := FGRUPO_SANGUINEO;
        Parameters.ParamByName('pOBSERVACAO').Value := FOBSERVACAO;
        Parameters.ParamByName('pDATA_ADMISSAO').Value := FDATA_ADMISSAO;
        Parameters.ParamByName('pDATA_DEMISSAO').Value := FDATA_DEMISSAO;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
        Parameters.ParamByName('pBANCO').Value := FBANCO;
        Parameters.ParamByName('pAGENCIA').Value := FAGENCIA;
        Parameters.ParamByName('pCONTA_CORRENTE').Value := FCONTA_CORRENTE;
        ExecSQL;
        Result := True;
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

function TuClassGE_COLABORADORES.Excluir: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'update GE_COLABORADORES set STATUS = ''I'' '+
                    'WHERE '+
                  '  GE_COLABORADORES.PESSOA_COD = :pPESSOA_COD ';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        ExecSQL;
        Result := True;
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

function TuClassGE_COLABORADORES.Salvar: Boolean;
var
  Qry: TADOQuery;    //Variável que executará o comando SQL (Ojeto da classe TADOQuery, utilizada para conexão)
begin
  try
    Qry := TADOQuery.Create(nil);
    try
      with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao; 
        Close;
        SQL.Text := 'INSERT INTO GE_COLABORADORES ('+
                  '  GE_COLABORADORES.PESSOA_COD, '+ 
                  '  GE_COLABORADORES.CNH, '+ 
                  '  GE_COLABORADORES.GRUPO_SANGUINEO, '+ 
                  '  GE_COLABORADORES.OBSERVACAO, '+ 
                  '  GE_COLABORADORES.DATA_ADMISSAO, '+ 
                  '  GE_COLABORADORES.DATA_DEMISSAO, '+ 
                  '  GE_COLABORADORES.STATUS, '+ 
                  '  GE_COLABORADORES.BANCO, '+ 
                  '  GE_COLABORADORES.AGENCIA, '+ 
                  '  GE_COLABORADORES.CONTA_CORRENTE'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pCNH, '+ 
                  '  :pGRUPO_SANGUINEO, '+ 
                  '  :pOBSERVACAO, '+ 
                  '  TO_DATE(:pDATA_ADMISSAO,''DD/MM/RR''), '+
                  '  TO_DATE(:pDATA_DEMISSAO,''DD/MM/RR''), '+ 
                  '  :pSTATUS, '+ 
                  '  :pBANCO, '+ 
                  '  :pAGENCIA, '+ 
                  '  :pCONTA_CORRENTE )'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCNH').Value := FCNH;
        Parameters.ParamByName('pGRUPO_SANGUINEO').Value := FGRUPO_SANGUINEO;
        Parameters.ParamByName('pOBSERVACAO').Value := FOBSERVACAO;
        Parameters.ParamByName('pDATA_ADMISSAO').Value := FDATA_ADMISSAO;
        Parameters.ParamByName('pDATA_DEMISSAO').Value := FDATA_DEMISSAO;
        Parameters.ParamByName('pSTATUS').Value := FSTATUS;
        Parameters.ParamByName('pBANCO').Value := FBANCO;
        Parameters.ParamByName('pAGENCIA').Value := FAGENCIA;
        Parameters.ParamByName('pCONTA_CORRENTE').Value := FCONTA_CORRENTE;
        ExecSQL;  // Executa SQL 
        Result := True; // Se não houve erros retorna true
      end;
    finally
      Qry.Free;  //Liberando da memória
    end;
  except on E: Exception do
    begin
      Result := False;
      raise exception.Create('Ops! Ocorreu um erro: '+e.Message);  //Cria uma excessão caso haja algum erro.
    end;
  end;
end;

procedure TuClassGE_COLABORADORES.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFCNH(const Value: string);
begin
  FCNH := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFGRUPO_SANGUINEO(const Value: string);
begin
  FGRUPO_SANGUINEO := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFOBSERVACAO(const Value: string);
begin
  FOBSERVACAO := Value;
end;
procedure TuClassGE_COLABORADORES.SetFDATA_ADMISSAO(const Value: String);
begin
  FDATA_ADMISSAO := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFDATA_DEMISSAO(const Value: String);
begin
  FDATA_DEMISSAO := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFSTATUS(const Value: string);
begin
  FSTATUS := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFBANCO(const Value: string);
begin
  FBANCO := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFAGENCIA(const Value: string);
begin
  FAGENCIA := Value;
end; 
procedure TuClassGE_COLABORADORES.SetFCONTA_CORRENTE(const Value: string);
begin
  FCONTA_CORRENTE := Value;
end;

end.

