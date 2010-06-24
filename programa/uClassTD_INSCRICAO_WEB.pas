unit uClassTD_INSCRICAO_WEB; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_INSCRICAO_WEB = class 

  private 
    FINSCRICAO_COD: String; 
    FLIBERADO: String; 
    FTREINAMENTO_COD: String; 
    procedure SetFINSCRICAO_COD(const Value: String); 
    procedure SetFLIBERADO(const Value: String); 
    procedure SetFTREINAMENTO_COD(const Value: String); 

  public 
    {Propriedades da classe}
    property PINSCRICAO_COD: String read FINSCRICAO_COD write SetFINSCRICAO_COD; 
    property PLIBERADO: String read FLIBERADO write SetFLIBERADO; 
    property PTREINAMENTO_COD: String read FTREINAMENTO_COD write SetFTREINAMENTO_COD; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_INSCRICAO_WEB.Consultar(Condicao: string): TDataSource;
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
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_WEB.LIBERADO, '+ 
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD '+ 
                  'FROM TD_INSCRICAO_WEB '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_INSCRICAO_WEB.Carregar: Boolean;
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
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_WEB.LIBERADO, '+ 
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD '+ 
                  'FROM TD_INSCRICAO_WEB '+
                  'WHERE '+
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD = :pTREINAMENTO_COD AND '+ 
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD = :pINSCRICAO_COD'; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
        Open;
        if not IsEmpty then
        begin
          PINSCRICAO_COD:= FieldByName('INSCRICAO_COD').AsString; 
          PLIBERADO:= FieldByName('LIBERADO').AsString; 
          PTREINAMENTO_COD:= FieldByName('TREINAMENTO_COD').AsString; 
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

function TuClassTD_INSCRICAO_WEB.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_INSCRICAO_WEB SET '+
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD = :pINSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_WEB.LIBERADO = :pLIBERADO, '+ 
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD = :pTREINAMENTO_COD '+ 
                    'WHERE '+
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD = :pINSCRICAO_COD '; 
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
        Parameters.ParamByName('pLIBERADO').Value := FLIBERADO;
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

function TuClassTD_INSCRICAO_WEB.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_INSCRICAO_WEB '+
                    'WHERE '+
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD = :pTREINAMENTO_COD, '+ 
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD = :pINSCRICAO_COD '; 
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
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

function TuClassTD_INSCRICAO_WEB.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_INSCRICAO_WEB ('+
                  '  TD_INSCRICAO_WEB.INSCRICAO_COD, '+ 
                  '  TD_INSCRICAO_WEB.LIBERADO, '+ 
                  '  TD_INSCRICAO_WEB.TREINAMENTO_COD'+ 
                  ') VALUES ('+
                  '  :pINSCRICAO_COD, '+ 
                  '  :pLIBERADO, '+ 
                  '  :pTREINAMENTO_COD'; 
        // passa parametros
        Parameters.ParamByName('pINSCRICAO_COD').Value := FINSCRICAO_COD;
        Parameters.ParamByName('pLIBERADO').Value := FLIBERADO;
        Parameters.ParamByName('pTREINAMENTO_COD').Value := FTREINAMENTO_COD;
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

procedure TuClassTD_INSCRICAO_WEB.SetFINSCRICAO_COD(const Value: string);
begin
  FINSCRICAO_COD := Value;
end; 
procedure TuClassTD_INSCRICAO_WEB.SetFLIBERADO(const Value: string);
begin
  FLIBERADO := Value;
end; 
procedure TuClassTD_INSCRICAO_WEB.SetFTREINAMENTO_COD(const Value: string);
begin
  FTREINAMENTO_COD := Value;
end; 

end.
