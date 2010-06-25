unit uClassSB_EVENTOS_FOLHA; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_EVENTOS_FOLHA = class 

  private 
    FPESSOA_COD: String; 
    FFOL_PAG_COD: String; 
    FEVENTO_COD: String; 
    FVALOR: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFFOL_PAG_COD(const Value: String); 
    procedure SetFEVENTO_COD(const Value: String); 
    procedure SetFVALOR(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PFOL_PAG_COD: String read FFOL_PAG_COD write SetFFOL_PAG_COD; 
    property PEVENTO_COD: String read FEVENTO_COD write SetFEVENTO_COD; 
    property PVALOR: String read FVALOR write SetFVALOR; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function ConsultarDesc(Condicao: string): TDataSource;

    function Carregar: Boolean;

end;

implementation

uses uClassConexao;


function TuClassSB_EVENTOS_FOLHA.ConsultarDesc(Condicao: string): TDataSource;
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
                  '  SB_EVENTOS_FOLHA.PESSOA_COD, '+
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD, '+
                  '  SB_EVENTOS_FOLHA.EVENTO_COD, '+
                  '  SB_EVENTOS_FOLHA.VALOR, '+
                  '  SB_EVENTOS.DESCRICAO, ' +
                  '  SB_EVENTOS.TIPO '+
                  'FROM SB_EVENTOS_FOLHA '+
                  ' inner join SB_EVENTOS on (SB_EVENTOS.EVENTO_COD = SB_EVENTOS_FOLHA.EVENTO_COD)'+ Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;




function TuClassSB_EVENTOS_FOLHA.Consultar(Condicao: string): TDataSource;
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
                  '  SB_EVENTOS_FOLHA.PESSOA_COD, '+
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD, '+
                  '  SB_EVENTOS_FOLHA.EVENTO_COD, '+
                  '  SB_EVENTOS_FOLHA.VALOR '+
                  'FROM SB_EVENTOS_FOLHA '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_EVENTOS_FOLHA.Carregar: Boolean;
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
                  '  SB_EVENTOS_FOLHA.PESSOA_COD, '+ 
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD, '+ 
                  '  SB_EVENTOS_FOLHA.EVENTO_COD, '+ 
                  '  SB_EVENTOS_FOLHA.VALOR '+ 
                  'FROM SB_EVENTOS_FOLHA '+
                  'WHERE '+
                  '  SB_EVENTOS_FOLHA.EVENTO_COD = :pEVENTO_COD AND '+ 
                  '  SB_EVENTOS_FOLHA.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD = :pFOL_PAG_COD'; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PFOL_PAG_COD:= FieldByName('FOL_PAG_COD').AsString; 
          PEVENTO_COD:= FieldByName('EVENTO_COD').AsString; 
          PVALOR:= FieldByName('VALOR').AsString; 
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

function TuClassSB_EVENTOS_FOLHA.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_EVENTOS_FOLHA SET '+
                  '  SB_EVENTOS_FOLHA.VALOR = :pVALOR '+
                    'WHERE '+
                  '  SB_EVENTOS_FOLHA.EVENTO_COD = :pEVENTO_COD, '+
                  '  SB_EVENTOS_FOLHA.PESSOA_COD = :pPESSOA_COD, '+
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD = :pFOL_PAG_COD ';
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pVALOR').Value := FVALOR;
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

function TuClassSB_EVENTOS_FOLHA.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_EVENTOS_FOLHA '+
                    'WHERE '+
                  '  SB_EVENTOS_FOLHA.EVENTO_COD = :pEVENTO_COD, '+ 
                  '  SB_EVENTOS_FOLHA.PESSOA_COD = :pPESSOA_COD, '+ 
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD = :pFOL_PAG_COD '; 
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
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

function TuClassSB_EVENTOS_FOLHA.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_EVENTOS_FOLHA ('+
                  '  SB_EVENTOS_FOLHA.PESSOA_COD, '+ 
                  '  SB_EVENTOS_FOLHA.FOL_PAG_COD, '+ 
                  '  SB_EVENTOS_FOLHA.EVENTO_COD, '+ 
                  '  SB_EVENTOS_FOLHA.VALOR'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pFOL_PAG_COD, '+ 
                  '  :pEVENTO_COD, '+ 
                  '  :pVALOR )'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pEVENTO_COD').Value := FEVENTO_COD;
        Parameters.ParamByName('pVALOR').Value := FVALOR;
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

procedure TuClassSB_EVENTOS_FOLHA.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassSB_EVENTOS_FOLHA.SetFFOL_PAG_COD(const Value: string);
begin
  FFOL_PAG_COD := Value;
end; 
procedure TuClassSB_EVENTOS_FOLHA.SetFEVENTO_COD(const Value: string);
begin
  FEVENTO_COD := Value;
end; 
procedure TuClassSB_EVENTOS_FOLHA.SetFVALOR(const Value: string);
begin
  FVALOR := Value;
end; 

end.
