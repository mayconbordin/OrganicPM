unit uClassTD_TREINAMENTOS;

interface

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TREINAMENTOS = class

  private
    FTREINAMENTO_COD: String;
    FDESCRICAO: String;
    FEMENTA: String;
    FOBSERVACOES: String;
    procedure SetFTREINAMENTO_COD(const Value: String);
    procedure SetFDESCRICAO(const Value: String);
    procedure SetFEMENTA(const Value: String);
    procedure SetFOBSERVACOES(const Value: String);

  public
    {Propriedades da classe}
    property PTREINAMENTO_COD: String read FTREINAMENTO_COD write SetFTREINAMENTO_COD;
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO;
    property PEMENTA: String read FEMENTA write SetFEMENTA;
    property POBSERVACOES: String read FOBSERVACOES write SetFOBSERVACOES;

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao, uClassTD_TURMAS, uClassTD_METODOS, uClassTD_OBJETIVOS;

function TuClassTD_TREINAMENTOS.Consultar(Condicao: string): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);
    if Condicao <> '' then
      Condicao := ' where ('+Condicao+')';
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'SELECT '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+
                  '  TD_TREINAMENTOS.DESCRICAO, '+
                  '  TD_TREINAMENTOS.EMENTA, '+
                  '  TD_TREINAMENTOS.OBSERVACOES '+
                  '  FROM TD_TREINAMENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TREINAMENTOS.Carregar: Boolean;
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
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+
                  '  TD_TREINAMENTOS.DESCRICAO, '+
                  '  TD_TREINAMENTOS.EMENTA, '+
                  '  TD_TREINAMENTOS.OBSERVACOES '+
                  'FROM TD_TREINAMENTOS '+
                  'WHERE '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Open;
        if not IsEmpty then
        begin
          PTREINAMENTO_COD:= FieldByName('TREINAMENTO_COD').AsString;
          PDESCRICAO:= FieldByName('DESCRICAO').AsString;
          PEMENTA:= FieldByName('EMENTA').AsString;
          POBSERVACOES:= FieldByName('OBSERVACOES').AsString;
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

function TuClassTD_TREINAMENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TREINAMENTOS SET '+
                  '  TD_TREINAMENTOS.DESCRICAO = :pDESCRICAO, '+
                  '  TD_TREINAMENTOS.EMENTA = :pEMENTA, '+
                  '  TD_TREINAMENTOS.OBSERVACOES = :pOBSERVACOES '+
                    'WHERE '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pEMENTA').Value := FEMENTA;
        Parameters.ParamByName('pOBSERVACOES').Value := FOBSERVACOES;
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

function TuClassTD_TREINAMENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TREINAMENTOS '+
                    'WHERE '+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD = :pTREINAMENTO_COD';
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
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

function TuClassTD_TREINAMENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TREINAMENTOS ('+
                  '  TD_TREINAMENTOS.TREINAMENTO_COD, '+
                  '  TD_TREINAMENTOS.DESCRICAO, '+
                  '  TD_TREINAMENTOS.EMENTA, '+
                  '  TD_TREINAMENTOS.OBSERVACOES'+
                  ') VALUES ('+
                  '  :pTREINAMENTO_COD, '+
                  '  :pDESCRICAO, '+
                  '  :pEMENTA, '+
                  '  :pOBSERVACOES)';
        // passa parametros
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pEMENTA').Value := FEMENTA;
        Parameters.ParamByName('pOBSERVACOES').Value := FOBSERVACOES;
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

procedure TuClassTD_TREINAMENTOS.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFEMENTA(const Value: string);
begin
  FEMENTA := Value;
end;
procedure TuClassTD_TREINAMENTOS.SetFOBSERVACOES(const Value: string);
begin
  FOBSERVACOES := Value;
end;

end.
