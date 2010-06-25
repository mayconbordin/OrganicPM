unit uClassSB_SALDO_FERIAS; 

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassSB_SALDO_FERIAS = class 

  private 
    FPESSOA_COD: String; 
    FFOL_PAG_COD: String; 
    FMESES_TRABALHADOS: String; 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFFOL_PAG_COD(const Value: String); 
    procedure SetFMESES_TRABALHADOS(const Value: String); 

  public 
    {Propriedades da classe}
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PFOL_PAG_COD: String read FFOL_PAG_COD write SetFFOL_PAG_COD; 
    property PMESES_TRABALHADOS: String read FMESES_TRABALHADOS write SetFMESES_TRABALHADOS; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function CarregarUltima: Boolean;    

end;

implementation

uses uClassConexao;

function TuClassSB_SALDO_FERIAS.Consultar(Condicao: string): TDataSource;
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
                  '  SB_SALDO_FERIAS.PESSOA_COD, '+
                  '  SB_SALDO_FERIAS.FOL_PAG_COD, '+
                  '  SB_SALDO_FERIAS.MESES_TRABALHADOS, '+
                  '  GE_PESSOAS.NOME, ' +
                  '  GE_PESSOAS.DATA_NASC ' +
                  'FROM SB_SALDO_FERIAS ' +
                  ' inner join GE_PESSOAS on (SB_SALDO_FERIAS.PESSOA_COD = GE_PESSOAS.PESSOA_COD) '+
                  Condicao +
                  ' order by(SB_SALDO_FERIAS.MESES_TRABALHADOS) DESC';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassSB_SALDO_FERIAS.Carregar: Boolean;
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
                  '  SB_SALDO_FERIAS.PESSOA_COD, '+ 
                  '  SB_SALDO_FERIAS.FOL_PAG_COD, '+ 
                  '  SB_SALDO_FERIAS.MESES_TRABALHADOS '+ 
                  'FROM SB_SALDO_FERIAS '+
                  'WHERE '+
                  '  SB_SALDO_FERIAS.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  SB_SALDO_FERIAS.FOL_PAG_COD = :pFOL_PAG_COD'; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Open;
        if not IsEmpty then
        begin
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PFOL_PAG_COD:= FieldByName('FOL_PAG_COD').AsString; 
          PMESES_TRABALHADOS:= FieldByName('MESES_TRABALHADOS').AsString; 
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




function TuClassSB_SALDO_FERIAS.CarregarUltima: Boolean;
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
        SQL.Text := 'SELECT SB_SALDO_FERIAS.MESES_TRABALHADOS, '+
                    ' SB_SALDO_FERIAS.FOL_PAG_COD ' +
                  'FROM SB_SALDO_FERIAS '+
                  'WHERE rownum = 1 and SB_SALDO_FERIAS.PESSOA_COD = :pPESSOA_COD'+
                  ' ORDER BY SB_SALDO_FERIAS.FOL_PAG_COD DESC ';

        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Open;
        if not IsEmpty then
        begin
          PMESES_TRABALHADOS:= FieldByName('MESES_TRABALHADOS').AsString;
          PFOL_PAG_COD:= FieldByName('FOL_PAG_COD').AsString;
          
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











function TuClassSB_SALDO_FERIAS.Editar: Boolean;
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
        SQL.Text := 'UPDATE SB_SALDO_FERIAS SET '+
                  '  SB_SALDO_FERIAS.MESES_TRABALHADOS = :pMESES_TRABALHADOS '+
                    'WHERE '+
                  '  SB_SALDO_FERIAS.PESSOA_COD = :pPESSOA_COD and '+ 
                  '  SB_SALDO_FERIAS.FOL_PAG_COD = :pFOL_PAG_COD '; 
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pMESES_TRABALHADOS').Value := FMESES_TRABALHADOS;
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

function TuClassSB_SALDO_FERIAS.Excluir: Boolean;
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
        SQL.Text := 'DELETE from SB_SALDO_FERIAS '+
                    'WHERE '+
                  '   SB_SALDO_FERIAS.PESSOA_COD = :pPESSOA_COD and  '+
                  '  SB_SALDO_FERIAS.FOL_PAG_COD = :pFOL_PAG_COD ';
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

function TuClassSB_SALDO_FERIAS.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO SB_SALDO_FERIAS ('+
                  '  SB_SALDO_FERIAS.PESSOA_COD, '+ 
                  '  SB_SALDO_FERIAS.FOL_PAG_COD, '+ 
                  '  SB_SALDO_FERIAS.MESES_TRABALHADOS'+ 
                  ') VALUES ('+
                  '  :pPESSOA_COD, '+ 
                  '  :pFOL_PAG_COD, '+ 
                  '  :pMESES_TRABALHADOS)'; 
        // passa parametros
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pFOL_PAG_COD').Value := FFOL_PAG_COD;
        Parameters.ParamByName('pMESES_TRABALHADOS').Value := FMESES_TRABALHADOS;
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

procedure TuClassSB_SALDO_FERIAS.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 
procedure TuClassSB_SALDO_FERIAS.SetFFOL_PAG_COD(const Value: string);
begin
  FFOL_PAG_COD := Value;
end; 
procedure TuClassSB_SALDO_FERIAS.SetFMESES_TRABALHADOS(const Value: string);
begin
  FMESES_TRABALHADOS := Value;
end; 

end.
