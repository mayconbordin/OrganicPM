unit uClassCLIENTES; 

interface 

Uses ADODB, DB, SysUtils, Controls;

Type
  TuClassCLIENTES = class 

  private 
    FID_CLIENTE: String; 
    FNOME: String; 
    FDATA_NASC: TDate; 
    procedure SetFID_CLIENTE(const Value: String); 
    procedure SetFNOME(const Value: String); 
    procedure SetFDATA_NASC(const Value: TDate); 

  public 
    {Propriedades da classe}
    property PID_CLIENTE: String read FID_CLIENTE write SetFID_CLIENTE; 
    property PNOME: String read FNOME write SetFNOME; 
    property PDATA_NASC: TDate read FDATA_NASC write SetFDATA_NASC; 

    {Métodos da classe}
    function Salvar: Boolean;
    function Editar: Boolean;
    function Excluir: Boolean;
    function Consultar(Condicao: string): TDataSource;
    function Carregar: Boolean;

end;

implementation

uses uClassConexao;

function TuClassCLIENTES.Consultar(Condicao: string): TDataSource;
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
                  '  CLIENTES.ID_CLIENTE, '+ 
                  '  CLIENTES.NOME, '+ 
                  '  CLIENTES.DATA_NASC '+ 
                  'FROM CLIENTES '+Condicao;
      Open;
    end;
    ds.DataSet := Qry;
    Result := ds;
  except on E: Exception do
    raise Exception.Create('Que feio, você não pode fazer isso! '+e.Message);
  end;
end;

function TuClassCLIENTES.Carregar: Boolean;
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
                  '  CLIENTES.ID_CLIENTE, '+ 
                  '  CLIENTES.NOME, '+ 
                  '  CLIENTES.DATA_NASC '+ 
                  'FROM CLIENTES '+
                  'WHERE '+
                  '  CLIENTES.ID_CLIENTE = :pID_CLIENTE'; 
        Parameters.ParamByName('pID_CLIENTE').Value := FID_CLIENTE;
        Open;
        if not IsEmpty then
        begin
          PID_CLIENTE:= FieldByName('ID_CLIENTE').AsString; 
          PNOME:= FieldByName('NOME').AsString; 
          PDATA_NASC:= FieldByName('DATA_NASC').AsDateTime; 
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

function TuClassCLIENTES.Editar: Boolean;
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
        SQL.Text := 'UPDATE CLIENTES SET '+
                  '  CLIENTES.ID_CLIENTE = :pID_CLIENTE, '+ 
                  '  CLIENTES.NOME = :pNOME, '+ 
                  '  CLIENTES.DATA_NASC = TO_DATE(:pDATA_NASC,''DD/MM/RR'') '+ 
                    'WHERE '+
                  '  CLIENTES.ID_CLIENTE = :pID_CLIENTE '; 
        Parameters.ParamByName('pID_CLIENTE').Value := FID_CLIENTE;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_NASC').Value := FDATA_NASC;
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

function TuClassCLIENTES.Excluir: Boolean;
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
        SQL.Text := 'DELETE from CLIENTES '+
                    'WHERE '+
                  '  CLIENTES.ID_CLIENTE = :pID_CLIENTE '; 
        Parameters.ParamByName('pID_CLIENTE').Value := FID_CLIENTE;
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

function TuClassCLIENTES.Salvar: Boolean;
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
        SQL.Text := 'INSERT INTO CLIENTES ('+
                  '  CLIENTES.ID_CLIENTE, '+ 
                  '  CLIENTES.NOME, '+ 
                  '  CLIENTES.DATA_NASC'+ 
                  ') VALUES ('+
                  '  :pID_CLIENTE, '+ 
                  '  :pNOME, '+ 
                  '  TO_DATE(:pDATA_NASC,''DD/MM/RR'') '; 
        // passa parametros
        Parameters.ParamByName('pID_CLIENTE').Value := FID_CLIENTE;
        Parameters.ParamByName('pNOME').Value := FNOME;
        Parameters.ParamByName('pDATA_NASC').Value := FDATA_NASC;
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

procedure TuClassCLIENTES.SetID_CLIENTE(const Value: string);
begin
  FID_CLIENTE := Value;
end; 
procedure TuClassCLIENTES.SetNOME(const Value: string);
begin
  FNOME := Value;
end; 
procedure TuClassCLIENTES.SetDATA_NASC(const Value: string);
begin
  FDATA_NASC := Value;
end; 

