unit uClassTD_TURMAS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_TURMAS = class 

  private 
    FINSTRUTOR_COD: String; 
    FTURMA_COD: String; 
    FAMBIENTE_COD: String; 
    FNOME: String; 
    FDATA_INICIAL: String; 
    FDATA_FINAL: String; 
    FTURNO: String; 
    procedure SetFINSTRUTOR_COD(const Value: String); 
    procedure SetFTURMA_COD(const Value: String); 
    procedure SetFAMBIENTE_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 
    procedure SetFDATA_INICIAL(const Value: String); 
    procedure SetFDATA_FINAL(const Value: String); 
    procedure SetFTURNO(const Value: String); 

  public 
    {Propriedades da classe}
    property PINSTRUTOR_COD: String read FINSTRUTOR_COD write SetFINSTRUTOR_COD; 
    property PTURMA_COD: String read FTURMA_COD write SetFTURMA_COD; 
    property PAMBIENTE_COD: String read FAMBIENTE_COD write SetFAMBIENTE_COD; 
    property PNOME: String read FNOME write SetFNOME; 
    property PDATA_INICIAL: String read FDATA_INICIAL write SetFDATA_INICIAL; 
    property PDATA_FINAL: String read FDATA_FINAL write SetFDATA_FINAL; 
    property PTURNO: String read FTURNO write SetFTURNO; 

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
                  '  TD_TURMAS.INSTRUTOR_COD, '+ 
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME, '+ 
                  '  TD_TURMAS.DATA_INICIAL, '+ 
                  '  TD_TURMAS.DATA_FINAL, '+ 
                  '  TD_TURMAS.TURNO '+ 
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
                  '  TD_TURMAS.INSTRUTOR_COD, '+ 
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME, '+ 
                  '  TD_TURMAS.DATA_INICIAL, '+ 
                  '  TD_TURMAS.DATA_FINAL, '+ 
                  '  TD_TURMAS.TURNO '+ 
                  'FROM TD_TURMAS '+
                  'WHERE '+
        //          '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD AND '+ 
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD ';
        //         '  TD_TURMAS.INSTRUTOR_COD = :pINSTRUTOR_COD';
        //Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        //Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Open;
        if not IsEmpty then
        begin
          PINSTRUTOR_COD:= FieldByName('INSTRUTOR_COD').AsString; 
          PTURMA_COD:= FieldByName('TURMA_COD').AsString; 
          PAMBIENTE_COD:= FieldByName('AMBIENTE_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString; 
          PDATA_FINAL:= FieldByName('DATA_FINAL').AsString; 
          PTURNO:= FieldByName('TURNO').AsString; 
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
                  '  TD_TURMAS.INSTRUTOR_COD = :pINSTRUTOR_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD, '+
                  '  TD_TURMAS.NOME = :pNOME, '+ 
                  '  TD_TURMAS.DATA_INICIAL = TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  TD_TURMAS.DATA_FINAL = TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+ 
                  '  TD_TURMAS.TURNO = :pTURNO '+ 
                    'WHERE '+
                  //'  TD_TURMAS.AMBIENTE_COD = :pAMBIENTE_COD, '+
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD '; 
                  //'  TD_TURMAS.INSTRUTOR_COD = :pINSTRUTOR_COD '; 
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Parameters.ParamByName('pTURMA_COD').Value := PTURMA_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pTURNO').Value := FTURNO;
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
                  '  TD_TURMAS.TURMA_COD = :pTURMA_COD, '+ 
                  '  TD_TURMAS.INSTRUTOR_COD = :pINSTRUTOR_COD '; 
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
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
                  '  TD_TURMAS.INSTRUTOR_COD, '+ 
                  '  TD_TURMAS.TURMA_COD, '+ 
                  '  TD_TURMAS.AMBIENTE_COD, '+ 
                  '  TD_TURMAS.NOME, '+ 
                  '  TD_TURMAS.DATA_INICIAL, '+ 
                  '  TD_TURMAS.DATA_FINAL, '+ 
                  '  TD_TURMAS.TURNO'+ 
                  ') VALUES ('+
                  '  :pINSTRUTOR_COD, '+ 
                  '  :pTURMA_COD, '+ 
                  '  :pAMBIENTE_COD, '+ 
                  '  :pNOME, '+ 
                  '  TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+ 
                  '  :pTURNO)'; 
        // passa parametros
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Parameters.ParamByName('pTURMA_COD').Value := FTURMA_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pTURNO').Value := FTURNO;
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

procedure TuClassTD_TURMAS.SetFINSTRUTOR_COD(const Value: string);
begin
  FINSTRUTOR_COD := Value;
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
procedure TuClassTD_TURMAS.SetFDATA_INICIAL(const Value: string);
begin
  FDATA_INICIAL := Value;
end; 
procedure TuClassTD_TURMAS.SetFDATA_FINAL(const Value: string);
begin
  FDATA_FINAL := Value;
end; 
procedure TuClassTD_TURMAS.SetFTURNO(const Value: string);
begin
  FTURNO := Value;
end; 

end.
