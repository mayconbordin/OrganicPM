unit uClassTD_INSTRUTORES; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_INSTRUTORES = class 

  private 
    FINSTRUTOR_COD: String; 
    FNOME: String; 
    FCPF: String; 
    FEMAIL: String; 
    FENDERECO: String; 
    FBAIRRO: String; 
    FLOCAL_REFERENCIA: String; 
    FLOGRADOURO: String; 
    FEXPERIENCIAS: String; 
    procedure SetFINSTRUTOR_COD(const Value: String); 
    procedure SetFNOME(const Value: String); 
    procedure SetFCPF(const Value: String); 
    procedure SetFEMAIL(const Value: String); 
    procedure SetFENDERECO(const Value: String); 
    procedure SetFBAIRRO(const Value: String); 
    procedure SetFLOCAL_REFERENCIA(const Value: String); 
    procedure SetFLOGRADOURO(const Value: String); 
    procedure SetFEXPERIENCIAS(const Value: String); 

  public 
    {Propriedades da classe}
    property PINSTRUTOR_COD: String read FINSTRUTOR_COD write SetFINSTRUTOR_COD; 
    property PNOME: String read FNOME write SetFNOME; 
    property PCPF: String read FCPF write SetFCPF; 
    property PEMAIL: String read FEMAIL write SetFEMAIL; 
    property PENDERECO: String read FENDERECO write SetFENDERECO; 
    property PBAIRRO: String read FBAIRRO write SetFBAIRRO; 
    property PLOCAL_REFERENCIA: String read FLOCAL_REFERENCIA write SetFLOCAL_REFERENCIA; 
    property PLOGRADOURO: String read FLOGRADOURO write SetFLOGRADOURO; 
    property PEXPERIENCIAS: String read FEXPERIENCIAS write SetFEXPERIENCIAS; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_INSTRUTORES.Consultar(Condicao: string): TDataSource;
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
                  '  TD_INSTRUTORES.INSTRUTOR_COD, '+ 
                  '  TD_INSTRUTORES.NOME, '+ 
                  '  TD_INSTRUTORES.CPF, '+ 
                  '  TD_INSTRUTORES.EMAIL, '+ 
                  '  TD_INSTRUTORES.ENDERECO, '+ 
                  '  TD_INSTRUTORES.BAIRRO, '+ 
                  '  TD_INSTRUTORES.LOCAL_REFERENCIA, '+ 
                  '  TD_INSTRUTORES.LOGRADOURO, '+ 
                  '  TD_INSTRUTORES.EXPERIENCIAS '+ 
                  'FROM TD_INSTRUTORES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_INSTRUTORES.Carregar: Boolean;
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
                  '  TD_INSTRUTORES.INSTRUTOR_COD, '+ 
                  '  TD_INSTRUTORES.NOME, '+ 
                  '  TD_INSTRUTORES.CPF, '+ 
                  '  TD_INSTRUTORES.EMAIL, '+ 
                  '  TD_INSTRUTORES.ENDERECO, '+ 
                  '  TD_INSTRUTORES.BAIRRO, '+ 
                  '  TD_INSTRUTORES.LOCAL_REFERENCIA, '+ 
                  '  TD_INSTRUTORES.LOGRADOURO, '+ 
                  '  TD_INSTRUTORES.EXPERIENCIAS '+ 
                  'FROM TD_INSTRUTORES '+
                  'WHERE '+
                  '  TD_INSTRUTORES.INSTRUTOR_COD = :pINSTRUTOR_COD'; 
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Open;
        if not IsEmpty then
        begin
          PINSTRUTOR_COD:= FieldByName('INSTRUTOR_COD').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
          PCPF:= FieldByName('CPF').AsString; 
          PEMAIL:= FieldByName('EMAIL').AsString; 
          PENDERECO:= FieldByName('ENDERECO').AsString; 
          PBAIRRO:= FieldByName('BAIRRO').AsString; 
          PLOCAL_REFERENCIA:= FieldByName('LOCAL_REFERENCIA').AsString; 
          PLOGRADOURO:= FieldByName('LOGRADOURO').AsString; 
          PEXPERIENCIAS:= FieldByName('EXPERIENCIAS').AsString; 
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

function TuClassTD_INSTRUTORES.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_INSTRUTORES SET '+ 
                  '  TD_INSTRUTORES.NOME = :pNOME, '+ 
                  '  TD_INSTRUTORES.CPF = :pCPF, '+ 
                  '  TD_INSTRUTORES.EMAIL = :pEMAIL, '+ 
                  '  TD_INSTRUTORES.ENDERECO = :pENDERECO, '+ 
                  '  TD_INSTRUTORES.BAIRRO = :pBAIRRO, '+ 
                  '  TD_INSTRUTORES.LOCAL_REFERENCIA = :pLOCAL_REFERENCIA, '+ 
                  '  TD_INSTRUTORES.LOGRADOURO = :pLOGRADOURO, '+ 
                  '  TD_INSTRUTORES.EXPERIENCIAS = :pEXPERIENCIAS '+ 
                  '  WHERE '+
                  '  TD_INSTRUTORES.INSTRUTOR_COD = :pINSTRUTOR_COD '; 
        Parameters.ParamByName('pINSTRUTOR_COD').Value := PINSTRUTOR_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pEMAIL').Value := FEMAIL;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pLOCAL_REFERENCIA').Value := FLOCAL_REFERENCIA;
        Parameters.ParamByName('pLOGRADOURO').Value := FLOGRADOURO;
        Parameters.ParamByName('pEXPERIENCIAS').Value := FEXPERIENCIAS;
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

function TuClassTD_INSTRUTORES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_INSTRUTORES '+
                    'WHERE '+
                  '  TD_INSTRUTORES.INSTRUTOR_COD = :pINSTRUTOR_COD '; 
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

function TuClassTD_INSTRUTORES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_INSTRUTORES ('+
                  '  TD_INSTRUTORES.INSTRUTOR_COD, '+ 
                  '  TD_INSTRUTORES.NOME, '+ 
                  '  TD_INSTRUTORES.CPF, '+ 
                  '  TD_INSTRUTORES.EMAIL, '+ 
                  '  TD_INSTRUTORES.ENDERECO, '+ 
                  '  TD_INSTRUTORES.BAIRRO, '+ 
                  '  TD_INSTRUTORES.LOCAL_REFERENCIA, '+ 
                  '  TD_INSTRUTORES.LOGRADOURO, '+ 
                  '  TD_INSTRUTORES.EXPERIENCIAS'+ 
                  ') VALUES ('+
                  '  :pINSTRUTOR_COD, '+ 
                  '  :pNOME, '+ 
                  '  :pCPF, '+ 
                  '  :pEMAIL, '+ 
                  '  :pENDERECO, '+ 
                  '  :pBAIRRO, '+ 
                  '  :pLOCAL_REFERENCIA, '+ 
                  '  :pLOGRADOURO, '+ 
                  '  :pEXPERIENCIAS)'; 
        // passa parametros
        Parameters.ParamByName('pINSTRUTOR_COD').Value := FINSTRUTOR_COD;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pCPF').Value := FCPF;
        Parameters.ParamByName('pEMAIL').Value := FEMAIL;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pLOCAL_REFERENCIA').Value := FLOCAL_REFERENCIA;
        Parameters.ParamByName('pLOGRADOURO').Value := FLOGRADOURO;
        Parameters.ParamByName('pEXPERIENCIAS').Value := FEXPERIENCIAS;
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

procedure TuClassTD_INSTRUTORES.SetFINSTRUTOR_COD(const Value: string);
begin
  FINSTRUTOR_COD := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFNOME(const Value: string);
begin
  FNOME := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFCPF(const Value: string);
begin
  FCPF := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFEMAIL(const Value: string);
begin
  FEMAIL := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFENDERECO(const Value: string);
begin
  FENDERECO := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFBAIRRO(const Value: string);
begin
  FBAIRRO := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFLOCAL_REFERENCIA(const Value: string);
begin
  FLOCAL_REFERENCIA := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFLOGRADOURO(const Value: string);
begin
  FLOGRADOURO := Value;
end; 
procedure TuClassTD_INSTRUTORES.SetFEXPERIENCIAS(const Value: string);
begin
  FEXPERIENCIAS := Value;
end; 

end.
