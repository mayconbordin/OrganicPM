unit uClassTD_TURMAS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TURMAS = class 

  private 
    FTURMA_COD: String; 
    FAMBIENTE_COD: String; 
    FNOME: String; 
    procedure SetFTURMA_COD(const Value: String); 
    procedure SetFAMBIENTE_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 

  public 
    {Propriedades da classe}
    property PTURMA_COD: String read FTURMA_COD write SetFTURMA_COD; 
    property PAMBIENTE_COD: String read FAMBIENTE_COD write SetFAMBIENTE_COD; 
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

function TuClassTD_TURMAS.Consultar(Condicao: string): TDataSource;
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
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME '+ 
                  'FROM TD_TURMAS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_TURMAS.Carregar: Boolean;
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
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME '+ 
                  'FROM TD_TURMAS '+
                  'WHERE '+
                  '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD AND '+ 
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD'; 
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Open;
        if not IsEmpty then
        begin
          PTURMA_COD:= FieldByName('TURMA_COD').AsString; 
          PAMBIENTE_COD:= FieldByName('AMBIENTE_COD').AsString; 
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

function TuClassTD_TURMAS.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_TURMAS SET '+
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME = :pNOME '+ 
                    'WHERE '+
                  '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD, '+ 
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD '; 
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

function TuClassTD_TURMAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_TURMAS '+
                    'WHERE '+
                  '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD, '+ 
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD '; 
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
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

function TuClassTD_TURMAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_TURMAS ('+
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME'+ 
                  ') VALUES ('+
                  '  :pTURMA_COD, '+ 
                  '  :pAMBIENTE_COD, '+ 
                  '  :pNOME'; 
        // passa parametros
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

procedure TuClassTD_TURMAS.SetFTURMA_COD(const Value: string);
begin
  FTURMA_COD := Value;
end; 
procedure TuClassTD_TURMAS.SetFAMBIENTE_COD(const Value: string);
begin
  FAMBIENTE_COD := Value;
end; 
procedure TuClassTD_TURMAS.SetFNOME(const Value: string);
begin
  FNOME := Value;
end; 

end.
