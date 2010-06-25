unit uClassSB_FOLHA_PAGAMENTO; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_FOLHA_PAGAMENTO = class 

  private 
    FPESSOA_COD: String; 
    FFOL_PAG_COD: String; 
    FTIP_FOL_COD: String; 
    FTOTAL_PROVENTOS: String; 
    FTOTAL_DESCONTOS: String; 
    FTOTAL_REMUNERACAO: String; 
    FCARGO_COD: String; 
    FDATA_INICIAL: String; 
    FDATA_FINAL: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFFOL_PAG_COD(const Value: String); 
    procedure SetFTIP_FOL_COD(const Value: String); 
    procedure SetFTOTAL_PROVENTOS(const Value: String); 
    procedure SetFTOTAL_DESCONTOS(const Value: String); 
    procedure SetFTOTAL_REMUNERACAO(const Value: String); 
    procedure SetFCARGO_COD(const Value: String); 
    procedure SetFDATA_INICIAL(const Value: String); 
    procedure SetFDATA_FINAL(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PFOL_PAG_COD: String read FFOL_PAG_COD write SetFFOL_PAG_COD; 
    property PTIP_FOL_COD: String read FTIP_FOL_COD write SetFTIP_FOL_COD; 
    property PTOTAL_PROVENTOS: String read FTOTAL_PROVENTOS write SetFTOTAL_PROVENTOS; 
    property PTOTAL_DESCONTOS: String read FTOTAL_DESCONTOS write SetFTOTAL_DESCONTOS; 
    property PTOTAL_REMUNERACAO: String read FTOTAL_REMUNERACAO write SetFTOTAL_REMUNERACAO; 
    property PCARGO_COD: String read FCARGO_COD write SetFCARGO_COD; 
    property PDATA_INICIAL: String read FDATA_INICIAL write SetFDATA_INICIAL; 
    property PDATA_FINAL: String read FDATA_FINAL write SetFDATA_FINAL; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassSB_FOLHA_PAGAMENTO.Consultar(Condicao: string): TDataSource;
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
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_PROVENTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_DESCONTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_REMUNERACAO, '+ 
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_INICIAL, '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_FINAL '+ 
                  'FROM SB_FOLHA_PAGAMENTO '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_FOLHA_PAGAMENTO.Carregar: Boolean;
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
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_PROVENTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_DESCONTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_REMUNERACAO, '+ 
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_INICIAL, '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_FINAL '+ 
                  'FROM SB_FOLHA_PAGAMENTO '+
                  'WHERE '+
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD = :pFOL_PAG_COD ';
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PFOL_PAG_COD:= FieldByName('FOL_PAG_COD').AsString; 
          PTIP_FOL_COD:= FieldByName('TIP_FOL_COD').AsString; 
          PTOTAL_PROVENTOS:= FieldByName('TOTAL_PROVENTOS').AsString; 
          PTOTAL_DESCONTOS:= FieldByName('TOTAL_DESCONTOS').AsString; 
          PTOTAL_REMUNERACAO:= FieldByName('TOTAL_REMUNERACAO').AsString; 
          PCARGO_COD:= FieldByName('CARGO_COD').AsString; 
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString; 
          PDATA_FINAL:= FieldByName('DATA_FINAL').AsString; 
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

function TuClassSB_FOLHA_PAGAMENTO.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_FOLHA_PAGAMENTO SET '+
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD = :pFOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD = :pTIP_FOL_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_PROVENTOS = :pTOTAL_PROVENTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_DESCONTOS = :pTOTAL_DESCONTOS, '+ 
                  '  SB_FOLHA_PAGAMENTO.TOTAL_REMUNERACAO = :pTOTAL_REMUNERACAO, '+ 
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD = :pCARGO_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_INICIAL = TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+ 
                  '  SB_FOLHA_PAGAMENTO.DATA_FINAL = TO_DATE(:pDATA_FINAL,''DD/MM/RR'') '+ 
                    'WHERE '+
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD = :pCARGO_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD = :pFOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD = :pTIP_FOL_COD '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
        Parameters.ParamByName('pTOTAL_PROVENTOS').Value := FTOTAL_PROVENTOS;
        Parameters.ParamByName('pTOTAL_DESCONTOS').Value := FTOTAL_DESCONTOS;
        Parameters.ParamByName('pTOTAL_REMUNERACAO').Value := FTOTAL_REMUNERACAO;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
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

function TuClassSB_FOLHA_PAGAMENTO.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_FOLHA_PAGAMENTO '+
                    'WHERE '+
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD = :pCARGO_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD = :pFOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD = :pTIP_FOL_COD '; 
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
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

function TuClassSB_FOLHA_PAGAMENTO.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_FOLHA_PAGAMENTO ('+
                  '  SB_FOLHA_PAGAMENTO.PESSOA_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.FOL_PAG_COD, '+ 
                  '  SB_FOLHA_PAGAMENTO.TIP_FOL_COD, '+
                  '  SB_FOLHA_PAGAMENTO.TOTAL_PROVENTOS, '+
                  '  SB_FOLHA_PAGAMENTO.TOTAL_DESCONTOS, '+
                  '  SB_FOLHA_PAGAMENTO.TOTAL_REMUNERACAO, '+
                  '  SB_FOLHA_PAGAMENTO.CARGO_COD, '+
                  '  SB_FOLHA_PAGAMENTO.DATA_INICIAL, '+
                  '  SB_FOLHA_PAGAMENTO.DATA_FINAL'+
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+
                  '  :pFOL_PAG_COD, '+
                  '  :pTIP_FOL_COD, '+
                  '  :pTOTAL_PROVENTOS, '+
                  '  :pTOTAL_DESCONTOS, '+
                  '  :pTOTAL_REMUNERACAO, '+
                  '  :pCARGO_COD, '+
                  '  TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+
                  '  TO_DATE(:pDATA_FINAL,''DD/MM/RR'') ) ';
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pTIP_FOL_COD').Value := FTIP_FOL_COD;
        Parameters.ParamByName('pTOTAL_PROVENTOS').Value := FTOTAL_PROVENTOS;
        Parameters.ParamByName('pTOTAL_DESCONTOS').Value := FTOTAL_DESCONTOS;
        Parameters.ParamByName('pTOTAL_REMUNERACAO').Value := FTOTAL_REMUNERACAO;
        Parameters.ParamByName('pCARGO_COD').Value := FCARGO_COD;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;

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

procedure TuClassSB_FOLHA_PAGAMENTO.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFFOL_PAG_COD(const Value: string);
begin
  FFOL_PAG_COD := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFTIP_FOL_COD(const Value: string);
begin
  FTIP_FOL_COD := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFTOTAL_PROVENTOS(const Value: string);
begin
  FTOTAL_PROVENTOS := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFTOTAL_DESCONTOS(const Value: string);
begin
  FTOTAL_DESCONTOS := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFTOTAL_REMUNERACAO(const Value: string);
begin
  FTOTAL_REMUNERACAO := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFCARGO_COD(const Value: string);
begin
  FCARGO_COD := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFDATA_INICIAL(const Value: string);
begin
  FDATA_INICIAL := Value;
end; 
procedure TuClassSB_FOLHA_PAGAMENTO.SetFDATA_FINAL(const Value: string);
begin
  FDATA_FINAL := Value;
end; 

end.
