unit uClassADP_AVALIACOES;

interface 

Uses ADODB, DB, SysUtils;

Type
  TuClassADP_AVALIACOES = class 

  private 
    FAVALIACAO_DATA: String; 
    FINDICADOR_COD: String; 
    FAVALIADOR_NOME: String; 
    FNOTA: String; 
    FPESSOA_COD: String; 
    FTIPO: String; 
    procedure SetFAVALIACAO_DATA(const Value: String); 
    procedure SetFINDICADOR_COD(const Value: String); 
    procedure SetFAVALIADOR_NOME(const Value: String);
    procedure SetFNOTA(const Value: String); 
    procedure SetFPESSOA_COD(const Value: String); 
    procedure SetFTIPO(const Value: String);


  public 
    {Propriedades da classe}
    property PAVALIACAO_DATA: String read FAVALIACAO_DATA write SetFAVALIACAO_DATA; 
    property PINDICADOR_COD: String read FINDICADOR_COD write SetFINDICADOR_COD; 
    property PAVALIADOR_NOME: String read FAVALIADOR_NOME write SetFAVALIADOR_NOME;
    property PNOTA: String read FNOTA write SetFNOTA; 
    property PPESSOA_COD: String read FPESSOA_COD write SetFPESSOA_COD; 
    property PTIPO: String read FTIPO write SetFTIPO; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function ListarAvaliacoes(Condicao: string): TDataSource;
    function Carregar: Boolean;
    function AvgIndicadorTipo(Ind, Dta, Pess:String): TDataSource;
    function NotasPorCompetencia(Pessoa, Data, CHA: String): TDataSource;
end;

implementation

uses uClassConexao;

function TuClassADP_AVALIACOES.Consultar(Condicao: string): TDataSource;
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
                  '  ADP_AVALIACOES.AVALIACAO_DATA, '+
                  '  ADP_AVALIACOES.INDICADOR_COD, '+
                  '  ADP_AVALIACOES.AVALIADOR_NOME, '+
                  '  ADP_AVALIACOES.NOTA, '+
                  '  ADP_AVALIACOES.PESSOA_COD, '+
                  '  ADP_AVALIACOES.TIPO, '+
                  '  ADP_INDICADORES.DESCRICAO AS DESCRICAO_IND,'+
                  '  GE_PESSOAS.NOME, '+
                  '  ADP_AVALIACAO_TIPO.DESCRICAO as TIPOA '+
                  'FROM ADP_AVALIACOES '+
                  '  LEFT OUTER JOIN GE_PESSOAS ON (GE_PESSOAS.PESSOA_COD = ADP_AVALIACOES.PESSOA_COD) '+
                  '  LEFT OUTER JOIN ADP_INDICADORES ON (ADP_INDICADORES.INDICADOR_COD = ADP_AVALIACOES.INDICADOR_COD) '+
                  '  LEFT OUTER JOIN ADP_AVALIACAO_TIPO ON (ADP_AVALIACAO_TIPO.TIPO = ADP_AVALIACOES.TIPO)  '+
                  Condicao+' ORDER BY ADP_AVALIACOES.AVALIACAO_DATA   ';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_AVALIACOES.AvgIndicadorTipo(Ind, Dta,
  Pess: String): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  // RETORNA MÉDIA NOTAS DE UM INDICADOR DE UMA PESSOA EM UMA AVALIACAO
  try
    Qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.Text := 'select TIPO, AVG(NOTA) from ADP_AVALIACOES '+
                  'WHERE PESSOA_COD = :P AND INDICADOR_COD = :I AND AVALIACAO_DATA = :D'+
                  'GROUP BY TIPO';
      Parameters.ParamByName('P').Value := Pess;
      Parameters.ParamByName('I').Value := Ind;
      Parameters.ParamByName('D').Value := Dta;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Erro durante cunsulta relatório de avaliação! '+e.Message);
  end;
end;

function TuClassADP_AVALIACOES.Carregar: Boolean;
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
                  '  ADP_AVALIACOES.AVALIACAO_DATA, '+ 
                  '  ADP_AVALIACOES.INDICADOR_COD, '+ 
                  '  ADP_AVALIACOES.AVALIADOR_NOME, '+ 
                  '  ADP_AVALIACOES.NOTA, '+ 
                  '  ADP_AVALIACOES.PESSOA_COD, '+ 
                  '  ADP_AVALIACOES.TIPO '+ 
                  'FROM ADP_AVALIACOES '+
                  'WHERE '+
                  '  ADP_AVALIACOES.AVALIACAO_DATA = :pAVALIACAO_DATA AND '+ 
                  '  ADP_AVALIACOES.INDICADOR_COD = :pINDICADOR_COD AND '+ 
                  '  ADP_AVALIACOES.PESSOA_COD = :pPESSOA_COD AND '+ 
                  '  ADP_AVALIACOES.TIPO = :pTIPO';
        Parameters.ParamByName('pAVALIACAO_DATA').Value := FAVALIACAO_DATA;
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
        Open;
        if not IsEmpty then
        begin
          PAVALIACAO_DATA:= FieldByName('AVALIACAO_DATA').AsString; 
          PINDICADOR_COD:= FieldByName('INDICADOR_COD').AsString; 
          PAVALIADOR_NOME:= FieldByName('AVALIADOR_NOME').AsString; 
          PNOTA:= FieldByName('NOTA').AsString; 
          PPESSOA_COD:= FieldByName('PESSOA_COD').AsString; 
          PTIPO:= FieldByName('TIPO').AsString; 
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

function TuClassADP_AVALIACOES.Editar: Boolean;
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
        SQL.Text := 'UPDATE ADP_AVALIACOES SET '+
//                  '  ADP_AVALIACOES.AVALIACAO_DATA = TO_DATE(:pAVALIACAO_DATA,''DD/MM/RR''), '+
//                  '  ADP_AVALIACOES.INDICADOR_COD = :pINDICADOR_COD, '+
//                  '  ADP_AVALIACOES.AVALIADOR_NOME = :pAVALIADOR_NOME, '+
                  '  ADP_AVALIACOES.NOTA = :pNOTA '+
//                  '  ADP_AVALIACOES.PESSOA_COD = :pPESSOA_COD, '+
//                  '  ADP_AVALIACOES.TIPO = :pTIPO '+
                    'WHERE '+
                  '  ADP_AVALIACOES.AVALIACAO_DATA = :pAVALIACAO_DATA and '+
                  '  ADP_AVALIACOES.INDICADOR_COD = :pINDICADOR_COD and '+
                  '  ADP_AVALIACOES.PESSOA_COD = :pPESSOA_COD and '+ 
//                  '  ADP_AVALIACOES.NOTA = :pNOTA, '+
                  '  ADP_AVALIACOES.TIPO = :pTIPO ';
        Parameters.ParamByName('pAVALIACAO_DATA').Value := FAVALIACAO_DATA;
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
//        Parameters.ParamByName('pAVALIADOR_NOME').Value := FAVALIADOR_NOME;
        Parameters.ParamByName('pNOTA').Value := FNOTA;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
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

function TuClassADP_AVALIACOES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from ADP_AVALIACOES ';
//                    'WHERE '+
//                    'ADP_AVALIACOES.AVALIACAO_DATA = TO_DATE(:pAVALIACAO_DATA,''DD/MM/RR''), '+ 
//                  '  ADP_AVALIACOES.TIPO = :pTIPO, '+
//                  '  ADP_AVALIACOES.INDICADOR_COD = :pINDICADOR_COD, '+ 
//                  '  ADP_AVALIACOES.PESSOA_COD = :pPESSOA_COD '; 
//        Parameters.ParamByName('pAVALIACAO_DATA').Value := FAVALIACAO_DATA;
//        Parameters.ParamByName('pTIPO').Value := FTIPO;
//        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
//        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
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

function TuClassADP_AVALIACOES.ListarAvaliacoes(Condicao: string): TDataSource;
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
      SQL.Text := 'SELECT ADP_AVALIACOES.AVALIACAO_DATA FROM ADP_AVALIACOES '+Condicao+
      ' GROUP BY ADP_AVALIACOES.AVALIACAO_DATA ORDER BY ADP_AVALIACOES.AVALIACAO_DATA';
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_AVALIACOES.NotasPorCompetencia(Pessoa, Data, CHA: String): TDataSource;
var
  Qry: TADOQuery;
  ds: TDataSource;
begin
  try
    Qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);
    with Qry do
    begin
      Connection := TuClassConexao.ObtemConexao;
      Close;
      SQL.text := ' SELECT ADP_AVALIACAO_TIPO.DESCRICAO AS TIPO, AVG(ADP_AVALIACOES.NOTA) as NOTA FROM ADP_AVALIACOES  '+
                  ' LEFT OUTER JOIN ADP_INDICADORES ON (ADP_INDICADORES.INDICADOR_COD = ADP_AVALIACOES.INDICADOR_COD)  '+
                  ' LEFT OUTER JOIN ADP_AVALIACAO_TIPO ON (ADP_AVALIACAO_TIPO.TIPO = ADP_AVALIACOES.TIPO)  '+
                  ' WHERE ADP_AVALIACOES.PESSOA_COD = :P AND '+
                  ' ADP_AVALIACOES.AVALIACAO_DATA = TO_DATE(:D,''DD/MM/RR'') AND  '+
                  ' ADP_INDICADORES.ATRIBUTO_COD = :C '+
                  ' GROUP BY ADP_AVALIACAO_TIPO.DESCRICAO ';
        Parameters.ParamByName('P').Value := Pessoa;
        Parameters.ParamByName('D').Value := Data;
        Parameters.ParamByName('C').Value := CHA;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassADP_AVALIACOES.Salvar: Boolean;
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
       SQL.Text := 'INSERT INTO ADP_AVALIACOES ('+
                  '  ADP_AVALIACOES.AVALIACAO_DATA, '+
                  '  ADP_AVALIACOES.INDICADOR_COD, '+
                  '  ADP_AVALIACOES.AVALIADOR_NOME, '+
                  '  ADP_AVALIACOES.NOTA, '+
                  '  ADP_AVALIACOES.PESSOA_COD, '+
                  '  ADP_AVALIACOES.TIPO) '+
                  ' VALUES ('+
                  '  TO_DATE(:pAVALIACAO_DATA,''DD/MM/RR''), '+
                  '  :pINDICADOR_COD, '+
                  '  :pAVALIADOR_NOME, '+
                  '  :pNOTA, '+
                  '  :pPESSOA_COD, '+
                  '  :pTIPO)';
        // passa parametros
        Parameters.ParamByName('pAVALIACAO_DATA').Value := FAVALIACAO_DATA;
        Parameters.ParamByName('pINDICADOR_COD').Value := FINDICADOR_COD;
        Parameters.ParamByName('pAVALIADOR_NOME').Value := FAVALIADOR_NOME;
        Parameters.ParamByName('pNOTA').Value := FNOTA;
        Parameters.ParamByName('pPESSOA_COD').Value := FPESSOA_COD;
        Parameters.ParamByName('pTIPO').Value := FTIPO;
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

procedure TuClassADP_AVALIACOES.SetFAVALIACAO_DATA(const Value: string);
begin
  FAVALIACAO_DATA := Value;
end; 
procedure TuClassADP_AVALIACOES.SetFAVALIADOR_NOME(const Value: String);
begin
  FAVALIADOR_NOME := Value;
end;
procedure TuClassADP_AVALIACOES.SetFINDICADOR_COD(const Value: string);
begin
  FINDICADOR_COD := Value;
end; 
procedure TuClassADP_AVALIACOES.SetFTIPO(const Value: string);
begin
  FTIPO := Value;
end; 
procedure TuClassADP_AVALIACOES.SetFNOTA(const Value: string);
begin
  FNOTA := Value;
end; 
procedure TuClassADP_AVALIACOES.SetFPESSOA_COD(const Value: string);
begin
  FPESSOA_COD := Value;
end; 

end.
