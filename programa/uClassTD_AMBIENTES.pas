unit uClassTD_AMBIENTES; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassTD_AMBIENTES = class 

  private 
    FAMBIENTE_COD: String; 
    FRECURSO_COD: String; 
    FDESCRICAO: String; 
    FENDERECO: String; 
    FBAIRRO: String; 
    FLOCAIS_REFERENCIA: String; 
    FLOGRADOURO: String; 
    FOBSERVACOES: String; 
    procedure SetFAMBIENTE_COD(const Value: String); 
    procedure SetFRECURSO_COD(const Value: String); 
    procedure SetFDESCRICAO(const Value: String); 
    procedure SetFENDERECO(const Value: String); 
    procedure SetFBAIRRO(const Value: String); 
    procedure SetFLOCAIS_REFERENCIA(const Value: String); 
    procedure SetFLOGRADOURO(const Value: String); 
    procedure SetFOBSERVACOES(const Value: String); 

  public 
    {Propriedades da classe}
    property PAMBIENTE_COD: String read FAMBIENTE_COD write SetFAMBIENTE_COD; 
    property PRECURSO_COD: String read FRECURSO_COD write SetFRECURSO_COD; 
    property PDESCRICAO: String read FDESCRICAO write SetFDESCRICAO; 
    property PENDERECO: String read FENDERECO write SetFENDERECO; 
    property PBAIRRO: String read FBAIRRO write SetFBAIRRO; 
    property PLOCAIS_REFERENCIA: String read FLOCAIS_REFERENCIA write SetFLOCAIS_REFERENCIA; 
    property PLOGRADOURO: String read FLOGRADOURO write SetFLOGRADOURO; 
    property POBSERVACOES: String read FOBSERVACOES write SetFOBSERVACOES; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassTD_AMBIENTES.Consultar(Condicao: string): TDataSource;
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
                  '  TD_AMBIENTES.AMBIENTE_COD, '+ 
                  '  TD_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_AMBIENTES.DESCRICAO, '+ 
                  '  TD_AMBIENTES.ENDERECO, '+ 
                  '  TD_AMBIENTES.BAIRRO, '+ 
                  '  TD_AMBIENTES.LOCAIS_REFERENCIA, '+ 
                  '  TD_AMBIENTES.LOGRADOURO, '+ 
                  '  TD_AMBIENTES.OBSERVACOES '+ 
                  'FROM TD_AMBIENTES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassTD_AMBIENTES.Carregar: Boolean;
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
                  '  TD_AMBIENTES.AMBIENTE_COD, '+ 
                  '  TD_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_AMBIENTES.DESCRICAO, '+ 
                  '  TD_AMBIENTES.ENDERECO, '+ 
                  '  TD_AMBIENTES.BAIRRO, '+ 
                  '  TD_AMBIENTES.LOCAIS_REFERENCIA, '+ 
                  '  TD_AMBIENTES.LOGRADOURO, '+ 
                  '  TD_AMBIENTES.OBSERVACOES '+ 
                  'FROM TD_AMBIENTES '+
                  'WHERE '+
                  '  TD_AMBIENTES.RECURSO_COD = :pRECURSO_COD AND '+ 
                  '  TD_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD'; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Open;
        if not IsEmpty then
        begin
          PAMBIENTE_COD:= FieldByName('AMBIENTE_COD').AsString; 
          PRECURSO_COD:= FieldByName('RECURSO_COD').AsString; 
          PDESCRICAO:= FieldByName('DESCRICAO').AsString; 
          PENDERECO:= FieldByName('ENDERECO').AsString; 
          PBAIRRO:= FieldByName('BAIRRO').AsString; 
          PLOCAIS_REFERENCIA:= FieldByName('LOCAIS_REFERENCIA').AsString; 
          PLOGRADOURO:= FieldByName('LOGRADOURO').AsString; 
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

function TuClassTD_AMBIENTES.Editar: Boolean;
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
        SQL.Text := 'UPDATE TD_AMBIENTES SET '+
                  '  TD_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD, '+ 
                  '  TD_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_AMBIENTES.DESCRICAO = :pDESCRICAO, '+ 
                  '  TD_AMBIENTES.ENDERECO = :pENDERECO, '+ 
                  '  TD_AMBIENTES.BAIRRO = :pBAIRRO, '+ 
                  '  TD_AMBIENTES.LOCAIS_REFERENCIA = :pLOCAIS_REFERENCIA, '+ 
                  '  TD_AMBIENTES.LOGRADOURO = :pLOGRADOURO, '+ 
                  '  TD_AMBIENTES.OBSERVACOES = :pOBSERVACOES '+ 
                    'WHERE '+
                  '  TD_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD '; 
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pLOCAIS_REFERENCIA').Value := FLOCAIS_REFERENCIA;
        Parameters.ParamByName('pLOGRADOURO').Value := FLOGRADOURO;
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

function TuClassTD_AMBIENTES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from TD_AMBIENTES '+
                    'WHERE '+
                  '  TD_AMBIENTES.RECURSO_COD = :pRECURSO_COD, '+ 
                  '  TD_AMBIENTES.AMBIENTE_COD = :pAMBIENTE_COD '; 
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
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

function TuClassTD_AMBIENTES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO TD_AMBIENTES ('+
                  '  TD_AMBIENTES.AMBIENTE_COD, '+ 
                  '  TD_AMBIENTES.RECURSO_COD, '+ 
                  '  TD_AMBIENTES.DESCRICAO, '+ 
                  '  TD_AMBIENTES.ENDERECO, '+ 
                  '  TD_AMBIENTES.BAIRRO, '+ 
                  '  TD_AMBIENTES.LOCAIS_REFERENCIA, '+ 
                  '  TD_AMBIENTES.LOGRADOURO, '+ 
                  '  TD_AMBIENTES.OBSERVACOES'+ 
                  ') VALUES ('+
                  '  :pAMBIENTE_COD, '+ 
                  '  :pRECURSO_COD, '+ 
                  '  :pDESCRICAO, '+ 
                  '  :pENDERECO, '+ 
                  '  :pBAIRRO, '+ 
                  '  :pLOCAIS_REFERENCIA, '+ 
                  '  :pLOGRADOURO, '+ 
                  '  :pOBSERVACOES'; 
        // passa parametros
        Parameters.ParamByName('pAMBIENTE_COD').Value := FAMBIENTE_COD;
        Parameters.ParamByName('pRECURSO_COD').Value := FRECURSO_COD;
        Parameters.ParamByName('pDESCRICAO').Value := FDESCRICAO;
        Parameters.ParamByName('pENDERECO').Value := FENDERECO;
        Parameters.ParamByName('pBAIRRO').Value := FBAIRRO;
        Parameters.ParamByName('pLOCAIS_REFERENCIA').Value := FLOCAIS_REFERENCIA;
        Parameters.ParamByName('pLOGRADOURO').Value := FLOGRADOURO;
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

procedure TuClassTD_AMBIENTES.SetFAMBIENTE_COD(const Value: string);
begin
  FAMBIENTE_COD := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFRECURSO_COD(const Value: string);
begin
  FRECURSO_COD := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFDESCRICAO(const Value: string);
begin
  FDESCRICAO := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFENDERECO(const Value: string);
begin
  FENDERECO := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFBAIRRO(const Value: string);
begin
  FBAIRRO := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFLOCAIS_REFERENCIA(const Value: string);
begin
  FLOCAIS_REFERENCIA := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFLOGRADOURO(const Value: string);
begin
  FLOGRADOURO := Value;
end; 
procedure TuClassTD_AMBIENTES.SetFOBSERVACOES(const Value: string);
begin
  FOBSERVACOES := Value;
end; 

end;
