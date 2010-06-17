unit uClassFP_COLABORADOR_AFASTAMENTOS;

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassFP_COLABORADOR_AFASTAMENTOS = class 

  private 
    FPESSOA_COD: String; 
    FCOL_AFA_COD: String; 
    FMOTIVO: String; 
    FDATA_INICIAL: String; 
    FDATA_FINAL: String; 
    FATESTADO_MEDICO: String;
    FPHORA_FINAL: string;
    FPHORA_INICIAL: string;
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFCOL_AFA_COD(const Value: String); 
    procedure SetFMOTIVO(const Value: String); 
    procedure SetFDATA_INICIAL(const Value: String); 
    procedure SetFDATA_FINAL(const Value: String); 
    procedure SetFATESTADO_MEDICO(const Value: String);
    procedure SetPHORA_FINAL(const Value: string);
    procedure SetPHORA_INICIAL(const Value: string);

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PCOL_AFA_COD: String read FCOL_AFA_COD write SetFCOL_AFA_COD; 
    property PMOTIVO: String read FMOTIVO write SetFMOTIVO;
    property PDATA_INICIAL: String read FDATA_INICIAL write SetFDATA_INICIAL; 
    property PDATA_FINAL: String read FDATA_FINAL write SetFDATA_FINAL; 
    property PATESTADO_MEDICO: String read FATESTADO_MEDICO write SetFATESTADO_MEDICO;
    property PHORA_INICIAL:string read FPHORA_INICIAL write SetPHORA_INICIAL;
    property PHORA_FINAL: string read FPHORA_FINAL write SetPHORA_FINAL;

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassFP_COLABORADOR_AFASTAMENTOS.Consultar(Condicao: string): TDataSource;
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
                  '  FP_COLABORADOR_AFASTAMENTOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.MOTIVO, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_INICIAL, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_FINAL, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.ATESTADO_MEDICO, FP_COLABORADOR_AFASTAMENTOS.HORA_FINAL, '+
                  ' FP_COLABORADOR_AFASTAMENTOS.HORA_INICIAL '+ 
                  'FROM FP_COLABORADOR_AFASTAMENTOS '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassFP_COLABORADOR_AFASTAMENTOS.Carregar: Boolean;
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
                  '  FP_COLABORADOR_AFASTAMENTOS.PESSOA_COD, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.MOTIVO, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_INICIAL, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_FINAL, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.ATESTADO_MEDICO, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.HORA_INICIAL, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.HORA_FINAL, '+
                  'FROM FP_COLABORADOR_AFASTAMENTOS '+
                  'WHERE '+
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD = :pCOL_AFA_COD ';
        Parameters.ParamByName('pCOL_AFA_COD').Value := FCOL_AFA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PCOL_AFA_COD:= FieldByName('COL_AFA_COD').AsString; 
          PMOTIVO:= FieldByName('MOTIVO').AsString; 
          PDATA_INICIAL:= FieldByName('DATA_INICIAL').AsString; 
          PDATA_FINAL:= FieldByName('DATA_FINAL').AsString; 
          PATESTADO_MEDICO:= FieldByName('ATESTADO_MEDICO').AsString; 
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

function TuClassFP_COLABORADOR_AFASTAMENTOS.Editar: Boolean;
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
        SQL.Text := 'UPDATE FP_COLABORADOR_AFASTAMENTOS SET '+
                  '  FP_COLABORADOR_AFASTAMENTOS.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.MOTIVO = :pMOTIVO, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_INICIAL = TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_FINAL = TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+
                  '  FP_COLABORADOR_AFASTAMENTOS.ATESTADO_MEDICO = :pATESTADO_MEDICO, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.HORA_INICIAL = TO_DATE(:pHORA_INICIAL,''HH24:MI''), '+
                  '  FP_COLABORADOR_AFASTAMENTOS.HORA_FINAL = TO_DATE(:pHORA_FINAL,''HH24:MI'') '+
                    'WHERE '+
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD = :pCOL_AFA_COD ';
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCOL_AFA_COD').Value := FCOL_AFA_COD;
        Parameters.ParamByName('pMOTIVO').Value := FMOTIVO;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pATESTADO_MEDICO').Value := FATESTADO_MEDICO;
        Parameters.ParamByName('pHORA_INICIAL').Value := FPHORA_INICIAL;
        Parameters.ParamByName('pHORA_FINAL').Value := FPHORA_FINAL;
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

function TuClassFP_COLABORADOR_AFASTAMENTOS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from FP_COLABORADOR_AFASTAMENTOS '+
                    'WHERE '+
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD = :pCOL_AFA_COD ';
        Parameters.ParamByName('pCOL_AFA_COD').Value := FCOL_AFA_COD;
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

function TuClassFP_COLABORADOR_AFASTAMENTOS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO FP_COLABORADOR_AFASTAMENTOS ('+
                  '  FP_COLABORADOR_AFASTAMENTOS.PESSOA_COD, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.COL_AFA_COD, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.MOTIVO, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_INICIAL, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.DATA_FINAL, '+ 
                  '  FP_COLABORADOR_AFASTAMENTOS.ATESTADO_MEDICO, FP_COLABORADOR_AFASTAMENTOS.HORA_INICIAL, '+
                  '  FP_COLABORADOR_AFASTAMENTOS.HORA_FINAL '+
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pCOL_AFA_COD, '+ 
                  '  :pMOTIVO, '+ 
                  '  TO_DATE(:pDATA_INICIAL,''DD/MM/RR''), '+
                  '  TO_DATE(:pDATA_FINAL,''DD/MM/RR''), '+
                  '  :pATESTADO_MEDICO), '+
                  '  TO_DATE(:pHORA_INICIAL,''HH24:MI''),  '+
                  '  TO_DATE(:pHORA_FINAL,''HH24:MI'') ';
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pCOL_AFA_COD').Value := FCOL_AFA_COD;
        Parameters.ParamByName('pMOTIVO').Value := FMOTIVO;
        Parameters.ParamByName('pDATA_INICIAL').Value := FDATA_INICIAL;
        Parameters.ParamByName('pDATA_FINAL').Value := FDATA_FINAL;
        Parameters.ParamByName('pATESTADO_MEDICO').Value := FATESTADO_MEDICO;
        Parameters.ParamByName('pHORA_INICIAL').Value := FPHORA_INICIAL;
        Parameters.ParamByName('pHORA_FINAL').Value := FPHORA_FINAL;
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

procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetPHORA_FINAL(
  const Value: string);
begin
  FPHORA_FINAL := Value;
end;

procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetPHORA_INICIAL(
  const Value: string);
begin
  FPHORA_INICIAL := Value;
end;

procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFCOL_AFA_COD(const Value: string);
begin
  FCOL_AFA_COD := Value;
end; 
procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFMOTIVO(const Value: string);
begin
  FMOTIVO := Value;
end; 
procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFDATA_INICIAL(const Value: string);
begin
  FDATA_INICIAL := Value;
end; 
procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFDATA_FINAL(const Value: string);
begin
  FDATA_FINAL := Value;
end; 
procedure TuClassFP_COLABORADOR_AFASTAMENTOS.SetFATESTADO_MEDICO(const Value: string);
begin
  FATESTADO_MEDICO := Value;
end; 

end.
