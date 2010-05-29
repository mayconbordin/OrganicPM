unit uClassTD_TECNICAS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TECNICAS = class 

  private 
    FTECNICA_COD: String; 
    FNOME: String; 
    procedure SetFTECNICA_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 

  public 
    {Propriedades da classe}
    property PTECNICA_COD: String read FTECNICA_COD write SetFTECNICA_COD; 
    property PNOME: String read FNOME write SetFNOME; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_TECNICAS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TECNICAS.TECNICA_COD, '+ 
                  '  TD_TECNICAS.NOME '+ 
                  'FROM TD_TECNICAS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TECNICAS.Carregar: Boolean;
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
                  '  TD_TECNICAS.TECNICA_COD, '+ 
                  '  TD_TECNICAS.NOME '+ 
                  'FROM TD_TECNICAS '+
                  'WHERE '+
                  '  TD_TECNICAS.TECNICA_COD = :pTECNICA_COD'; 
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
        Open;
        if not IsEmpty then
        begin
          PTECNICA_COD:= FieldByName('TECNICA_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
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

function TuClassTD_TECNICAS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TECNICAS SET '+
                  '  TD_TECNICAS.TECNICA_COD = :pTECNICA_COD, '+ 
                  '  TD_TECNICAS.NOME = :pNOME '+ 
                    'WHERE '+
                  '  TD_TECNICAS.TECNICA_COD = :pTECNICA_COD '; 
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
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

function TuClassTD_TECNICAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TECNICAS '+
                    'WHERE '+
                  '  TD_TECNICAS.TECNICA_COD = :pTECNICA_COD '; 
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
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

function TuClassTD_TECNICAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TECNICAS ('+
                  '  TD_TECNICAS.TECNICA_COD, '+ 
                  '  TD_TECNICAS.NOME'+ 
                  ') VALUES ('+
                  '  :pTECNICA_COD, '+ 
                  '  :pNOME'; 
        // passa parametros
        Parameters.ParamByName('pTECNICA_COD').Value := FTECNICA_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
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

procedure TuClassTD_TECNICAS.SetFTECNICA_COD(const Value: string);
begin
  FTECNICA_COD := Value;
end; 
procedure TuClassTD_TECNICAS.SetFNOME(const Value: string);
begin
  FNOME := Value;
end; 

end;
