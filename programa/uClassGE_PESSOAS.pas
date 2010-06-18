unit uClassGE_PESSOAS;

interface 

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassGE_PESSOAS = class 

  private 
    FPESSOA_COD: String; 
    FNOME: String; 
    FDATA_NASC: String; 
    FCPF: String; 
    FENDERECO: String; 
    FBAIRRO: String; 
    FEMAIL_1: String; 
    FEMAIL_2: String; 
    FNATURALIDADE: String; 
    FCIDADE: String; 
    FCEP: String; 
    FPAIS: String; 
    FUNI_FED_COD: String; 
    FNUMERO: String; 
    FCOMPLEMENTO: String; 
    FEST_CIV_COD: String;
    FPSEXO: String;
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 
    procedure SetFDATA_NASC(const Value: String); 
    procedure SetFCPF(const Value: String); 
    procedure SetFENDERECO(const Value: String); 
    procedure SetFBAIRRO(const Value: String); 
    procedure SetFEMAIL_1(const Value: String); 
    procedure SetFEMAIL_2(const Value: String); 
    procedure SetFNATURALIDADE(const Value: String); 
    procedure SetFCIDADE(const Value: String); 
    procedure SetFCEP(const Value: String); 
    procedure SetFPAIS(const Value: String); 
    procedure SetFUNI_FED_COD(const Value: String); 
    procedure SetFNUMERO(const Value: String); 
    procedure SetFCOMPLEMENTO(const Value: String); 
    procedure SetFEST_CIV_COD(const Value: String);
    procedure SetPSEXO(const Value: String);

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PNOME: String read FNOME write SetFNOME; 
    property PDATA_NASC: String read FDATA_NASC write SetFDATA_NASC;
    property PCPF: String read FCPF write SetFCPF; 
    property PENDERECO: String read FENDERECO write SetFENDERECO;
    property PBAIRRO: String read FBAIRRO write SetFBAIRRO; 
    property PEMAIL_1: String read FEMAIL_1 write SetFEMAIL_1; 
    property PEMAIL_2: String read FEMAIL_2 write SetFEMAIL_2; 
    property PNATURALIDADE: String read FNATURALIDADE write SetFNATURALIDADE; 
    property PCIDADE: String read FCIDADE write SetFCIDADE; 
    property PCEP: String read FCEP write SetFCEP; 
    property PPAIS: String read FPAIS write SetFPAIS; 
    property PUNI_FED_COD: String read FUNI_FED_COD write SetFUNI_FED_COD; 
    property PNUMERO: String read FNUMERO write SetFNUMERO; 
    property PCOMPLEMENTO: String read FCOMPLEMENTO write SetFCOMPLEMENTO;
    property PEST_CIV_COD: String read FEST_CIV_COD write SetFEST_CIV_COD;
    property PSEXO:String read FPSEXO write SetPSEXO;

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassGE_PESSOAS.Consultar(Condicao: string): TDataSource;
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
                  '  GE_PESSOAS.PESSOA_COD, '+ 
                  '  GE_PESSOAS.NOME, '+
                  '  GE_PESSOAS.DATA_NASC, '+ 
                  '  GE_PESSOAS.CPF, '+ 
                  '  GE_PESSOAS.ENDERECO, '+ 
                  '  GE_PESSOAS.BAIRRO, '+ 
                  '  GE_PESSOAS.EMAIL_1, '+ 
                  '  GE_PESSOAS.EMAIL_2, '+ 
                  '  GE_PESSOAS.NATURALIDADE, '+ 
                  '  GE_PESSOAS.CIDADE, '+ 
                  '  GE_PESSOAS.CEP, '+ 
                  '  GE_PESSOAS.PAIS, '+ 
                  '  GE_PESSOAS.UNI_FED_COD, '+ 
                  '  GE_PESSOAS.NUMERO, '+ 
                  '  GE_PESSOAS.COMPLEMENTO, '+ 
                  '  GE_PESSOAS.EST_CIV_COD, '+
                  '  GE_PESSOAS.SEXO '+ 
                  'FROM GE_PESSOAS '+Condicao+ ' order by GE_PESSOAS.NOME asc';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassGE_PESSOAS.Carregar: Boolean;
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
                  '  GE_PESSOAS.PESSOA_COD, '+ 
                  '  GE_PESSOAS.NOME, '+ 
                  '  GE_PESSOAS.DATA_NASC, '+ 
                  '  GE_PESSOAS.CPF, '+ 
                  '  GE_PESSOAS.ENDERECO, '+ 
                  '  GE_PESSOAS.BAIRRO, '+ 
                  '  GE_PESSOAS.EMAIL_1, '+ 
                  '  GE_PESSOAS.EMAIL_2, '+ 
                  '  GE_PESSOAS.NATURALIDADE, '+ 
                  '  GE_PESSOAS.CIDADE, '+ 
                  '  GE_PESSOAS.CEP, '+ 
                  '  GE_PESSOAS.PAIS, '+ 
                  '  GE_PESSOAS.UNI_FED_COD, '+ 
                  '  GE_PESSOAS.NUMERO, '+ 
                  '  GE_PESSOAS.COMPLEMENTO, '+ 
                  '  GE_PESSOAS.EST_CIV_COD '+ 
                  'FROM GE_PESSOAS '+
                  'WHERE '+
                  '  GE_PESSOAS.PESSOA_COD = :pPESSOA_COD';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString;
          PDATA_NASC:= FieldByName('DATA_NASC').AsString;
          PCPF:= FieldByName('CPF').AsString; 
          PENDERECO:= FieldByName('ENDERECO').AsString; 
          PBAIRRO:= FieldByName('BAIRRO').AsString; 
          PEMAIL_1:= FieldByName('EMAIL_1').AsString; 
          PEMAIL_2:= FieldByName('EMAIL_2').AsString; 
          PNATURALIDADE:= FieldByName('NATURALIDADE').AsString; 
          PCIDADE:= FieldByName('CIDADE').AsString; 
          PCEP:= FieldByName('CEP').AsString; 
          PPAIS:= FieldByName('PAIS').AsString; 
          PUNI_FED_COD:= FieldByName('UNI_FED_COD').AsString; 
          PNUMERO:= FieldByName('NUMERO').AsString; 
          PCOMPLEMENTO:= FieldByName('COMPLEMENTO').AsString; 
          PEST_CIV_COD:= FieldByName('EST_CIV_COD').AsString; 
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

function TuClassGE_PESSOAS.Editar: Boolean;
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
        SQL.Text := 'UPDATE GE_PESSOAS SET '+
//                  '  GE_PESSOAS.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  GE_PESSOAS.NOME = :pNOME, '+ 
                  '  GE_PESSOAS.DATA_NASC = TO_DATE(:pDATA_NASC,''DD/MM/RR''), '+ 
                  '  GE_PESSOAS.CPF = :pCPF, '+ 
                  '  GE_PESSOAS.ENDERECO = :pENDERECO, '+ 
                  '  GE_PESSOAS.BAIRRO = :pBAIRRO, '+ 
                  '  GE_PESSOAS.EMAIL_1 = :pEMAIL_1, '+ 
                  '  GE_PESSOAS.EMAIL_2 = :pEMAIL_2, '+ 
                  '  GE_PESSOAS.NATURALIDADE = :pNATURALIDADE, '+ 
                  '  GE_PESSOAS.CIDADE = :pCIDADE, '+ 
                  '  GE_PESSOAS.CEP = :pCEP, '+ 
                  '  GE_PESSOAS.PAIS = :pPAIS, '+ 
                  '  GE_PESSOAS.UNI_FED_COD = :pUNI_FED_COD, '+ 
                  '  GE_PESSOAS.NUMERO = :pNUMERO, '+ 
                  '  GE_PESSOAS.COMPLEMENTO = :pCOMPLEMENTO, '+ 
                  '  GE_PESSOAS.EST_CIV_COD = :pEST_CIV_COD, '+
                  '  GE_PESSOAS.SEXO = :pSEXO '+
                    'WHERE '+
                  '  GE_PESSOAS.PESSOA_COD = :pPESSOA_COD';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_NASC').Value := FDATA_NASC;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pEMAIL_1').Value := FEMAIL_1;
        Parameters.ParamByName('pEMAIL_2').Value := FEMAIL_2;
        Parameters.ParamByName('pNATURALIDADE').Value := FNATURALIDADE;
        Parameters.ParamByName('pCIDADE').Value := FCIDADE;
        Parameters.ParamByName('pCEP').Value := FCEP;
        Parameters.ParamByName('pPAIS').Value := FPAIS;
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
        Parameters.ParamByName('pNUMERO').Value := FNUMERO;
        Parameters.ParamByName('pCOMPLEMENTO').Value := FCOMPLEMENTO;
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
        Parameters.ParamByName('pSEXO').Value := FPSEXO;
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

function TuClassGE_PESSOAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from GE_PESSOAS '+
                    'WHERE '+
                  '  GE_PESSOAS.PESSOA_COD = :pPESSOA_COD';

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

function TuClassGE_PESSOAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO GE_PESSOAS ('+
                  '  GE_PESSOAS.PESSOA_COD, '+ 
                  '  GE_PESSOAS.NOME, '+ 
                  '  GE_PESSOAS.DATA_NASC, '+ 
                  '  GE_PESSOAS.CPF, '+ 
                  '  GE_PESSOAS.ENDERECO, '+ 
                  '  GE_PESSOAS.BAIRRO, '+ 
                  '  GE_PESSOAS.EMAIL_1, '+ 
                  '  GE_PESSOAS.EMAIL_2, '+ 
                  '  GE_PESSOAS.NATURALIDADE, '+ 
                  '  GE_PESSOAS.CIDADE, '+ 
                  '  GE_PESSOAS.CEP, '+ 
                  '  GE_PESSOAS.PAIS, '+ 
                  '  GE_PESSOAS.UNI_FED_COD, '+ 
                  '  GE_PESSOAS.NUMERO, '+ 
                  '  GE_PESSOAS.COMPLEMENTO, '+ 
                  '  GE_PESSOAS.EST_CIV_COD, '+
                  '  GE_PESSOAS.SEXO '+
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pNOME, '+ 
                  '  TO_DATE(:pDATA_NASC,''DD/MM/RR''), '+ //reportar bug -> Bolívar
                  '  :pCPF, '+ 
                  '  :pENDERECO, '+ 
                  '  :pBAIRRO, '+ 
                  '  :pEMAIL_1, '+ 
                  '  :pEMAIL_2, '+ 
                  '  :pNATURALIDADE, '+ 
                  '  :pCIDADE, '+ 
                  '  :pCEP, '+ 
                  '  :pPAIS, '+ 
                  '  :pUNI_FED_COD, '+ 
                  '  :pNUMERO, '+ 
                  '  :pCOMPLEMENTO, '+ 
                  '  :pEST_CIV_COD, '+
                  '  :pSEXO )';
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_NASC').Value := FDATA_NASC;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pEMAIL_1').Value := FEMAIL_1;
        Parameters.ParamByName('pEMAIL_2').Value := FEMAIL_2;
        Parameters.ParamByName('pNATURALIDADE').Value := FNATURALIDADE;
        Parameters.ParamByName('pCIDADE').Value := FCIDADE;
        Parameters.ParamByName('pCEP').Value := FCEP;
        Parameters.ParamByName('pPAIS').Value := FPAIS;
        Parameters.ParamByName('pUNI_FED_COD').Value := FUNI_FED_COD;
        Parameters.ParamByName('pNUMERO').Value := FNUMERO;
        Parameters.ParamByName('pCOMPLEMENTO').Value := FCOMPLEMENTO;
        Parameters.ParamByName('pEST_CIV_COD').Value := FEST_CIV_COD;
        Parameters.ParamByName('pSEXO').Value := FPSEXO;
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

procedure TuClassGE_PESSOAS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end;
procedure TuClassGE_PESSOAS.SetFNOME(const Value: string);
begin
  FNOME := Value;
end;
procedure TuClassGE_PESSOAS.SetFDATA_NASC(const Value: String);
begin
  FDATA_NASC := Value;
end;
procedure TuClassGE_PESSOAS.SetFCPF(const Value: string);
begin
  FCPF := Value;
end;
procedure TuClassGE_PESSOAS.SetFENDERECO(const Value: string);
begin
  FENDERECO := Value;
end;
procedure TuClassGE_PESSOAS.SetFBAIRRO(const Value: string);
begin
  FBAIRRO := Value;
end;
procedure TuClassGE_PESSOAS.SetFEMAIL_1(const Value: string);
begin
  FEMAIL_1 := Value;
end;
procedure TuClassGE_PESSOAS.SetFEMAIL_2(const Value: string);
begin
  FEMAIL_2 := Value;
end;
procedure TuClassGE_PESSOAS.SetFNATURALIDADE(const Value: string);
begin
  FNATURALIDADE := Value;
end;
procedure TuClassGE_PESSOAS.SetFCIDADE(const Value: string);
begin
  FCIDADE := Value;
end;
procedure TuClassGE_PESSOAS.SetFCEP(const Value: string);
begin
  FCEP := Value;
end;
procedure TuClassGE_PESSOAS.SetFPAIS(const Value: string);
begin
  FPAIS := Value;
end;
procedure TuClassGE_PESSOAS.SetFUNI_FED_COD(const Value: string);
begin
  FUNI_FED_COD := Value;
end;
procedure TuClassGE_PESSOAS.SetPSEXO(const Value: String);
begin
  FPSEXO := Value;
end;

procedure TuClassGE_PESSOAS.SetFNUMERO(const Value: string);
begin
  FNUMERO := Value;
end;
procedure TuClassGE_PESSOAS.SetFCOMPLEMENTO(const Value: string);
begin
  FCOMPLEMENTO := Value;
end;
procedure TuClassGE_PESSOAS.SetFEST_CIV_COD(const Value: string);
begin
  FEST_CIV_COD := Value;
end;

end.
