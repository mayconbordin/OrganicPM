unit uClassFuncoesGerais;

interface

Uses ADODB, DB, SysUtils, Windows;

Type
  TuClassFuncoesGerais = class

    private
     class function NomeDoComputador:string;
     class function UsuarioLogado:String;
    public

      function UltimoID(Tabela,Campo:string):Integer;
      class procedure GravaLog(Acao:string);
      class function ConsultaLog(DataIni,DataFim:string): TDataSource;

      {Função utilizadas na contratação do funcionário}
      function BuscaProcessoSeletivo(condicao:string): TdataSource;
      function BuscaCandidatosProcessSel(IdProcesso,Status:string): TdataSource;
      class procedure AtualizaStatusCandidato(IdPessoa,IdProcSel,Status:string);
      class procedure InfoPessoa(IdPessoa: string; var Nome, Endereco, Nascimento:String);
      {</>}

      {Funções de Login ->!}
      class function Logar(Idpessoa: String): Boolean;
      class function ExisteBio(Idpessoa,FpId,SampleNo: Integer): Boolean;
      class procedure GravaBiometria(Idpessoa,FpId,SampleNo: Integer);
      {</>}

  end;

implementation

uses uClassConexao, untLogin, untPerfilPrincipal, untPrincipal;

{ TuClassFuncoesGerais }

class procedure TuClassFuncoesGerais.AtualizaStatusCandidato(IdPessoa,IdProcSel,Status: string);
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
          SQL.Text := 'update RS_CANDIDATOS_PROCESSOS_SELETI set STATUS = :pStatus '+
                      'where (pessoa_cod = :pPessoaCod) and (pro_sel_cod = :pProcesCod)';

          Parameters.ParamByName('pStatus').Value := Status;
          Parameters.ParamByName('pPessoaCod').Value := IdPessoa;
          Parameters.ParamByName('pProcesCod').Value := IdProcSel;
          ExecSQL;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

function TuClassFuncoesGerais.BuscaCandidatosProcessSel(IdProcesso,
  Status: string): TdataSource;
var
  Qry: TADOQuery;
  ds: TdataSource;
begin
  try
    Qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);

    with Qry do
      begin
        Connection := TuClassConexao.ObtemConexao;
        Close;
        SQL.Text := 'select rs_candidatos_processos_seleti.status, ge_pessoas.nome, ge_pessoas.pessoa_cod from rs_candidatos_processos_seleti '+
                    'inner join ge_pessoas on (rs_candidatos_processos_seleti.pessoa_cod = ge_pessoas.pessoa_cod) '+
                    'where (rs_candidatos_processos_seleti.pro_sel_cod = :pIdProce) and (rs_candidatos_processos_seleti.status = :pStatus)';

        Parameters.ParamByName('pIdProce').Value := IdProcesso;
        Parameters.ParamByName('pStatus').Value := Status;
        Open;
      end;

    ds.DataSet := Qry;
    Result := ds;

  except on E: Exception do
    raise Exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

function TuClassFuncoesGerais.BuscaProcessoSeletivo(
  condicao: string): TdataSource;
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
        SQL.Text := 'select pro_sel_cod, descricao from rs_processos_seletivos '+condicao;

        Open;
      end;

    ds.DataSet := Qry;
    Result := ds;  
      
  except on E: Exception do
    raise exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

class function TuClassFuncoesGerais.ConsultaLog(DataIni,
  DataFim: string): TDataSource;
var
  qry: TADOQuery;
  ds: TDataSource;
begin
  try
    qry := TADOQuery.Create(nil);
    ds := TDataSource.Create(nil);
    with qry do
      begin
        Connection := TuClassConexao.ObtemConexao;
        Close;
        SQL.Text := 'select GE_LOGS.USUARIO, TO_CHAR(DATA, ''DD/MM/RR HH24:MI:SS'') DATA_LOG, GE_LOGS.IP, GE_LOGS.ACAO from GE_LOGS '+
                    'where GE_LOGS.DATA BETWEEN TO_DATE(:pDataIni, ''DD/MM/RR'') and TO_DATE(:pDataFim, ''DD/MM/RR'') '+
                    'order by DATA_LOG desc';

        Parameters.ParamByName('pDataIni').Value := DataIni;
        Parameters.ParamByName('pDataFim').Value := DataFim;
        Open;
      end;

    ds.DataSet := qry;
    Result := ds;

  except on E: Exception do
    raise exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

class function TuClassFuncoesGerais.ExisteBio(Idpessoa, FpId,
  SampleNo: Integer): Boolean;
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
          SQL.Text := 'select PESSOA_COD from GE_DIGITAL '+
                      'where (PESSOA_COD = :pPessoaCod AND fpid = :pfpId AND sampleno = :pSampleNo)';

          Parameters.ParamByName('pPessoaCod').Value := Idpessoa;
          Parameters.ParamByName('pfpId').Value := FpId;
          Parameters.ParamByName('pSampleNo').Value := SampleNo;

          Open;
          if not IsEmpty then
            if FieldByName('PESSOA_COD').AsString = '' then
              Result := False
          else
            Result := True;
        end;
    finally
      Qry.Free;
    end;
  except on E: Exception do
    raise exception.Create('Falha: '+E.Message);
  end;
end;

class procedure TuClassFuncoesGerais.GravaBiometria(Idpessoa, FpId,
  SampleNo: Integer);
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
          SQL.Text := 'insert into ge_digital (pessoa_cod,fpid,sampleno) '+
                      'values (:pIdPessoa,:pFpId,:pSampleNo)';

          Parameters.ParamByName('pIdPessoa').Value := Idpessoa;
          Parameters.ParamByName('pFpId').Value := FpId;
          Parameters.ParamByName('pSampleNo').Value := SampleNo;
          ExecSQL;

        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise Exception.Create('Falha: '+e.Message);
  end;
end;

class procedure TuClassFuncoesGerais.GravaLog(Acao: string);
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
          SQL.Text := 'INSERT INTO GE_LOGS (USUARIO, DATA, IP, ACAO) VALUES '+
                      '(:pUser, TO_DATE(:pDate, ''DD/MM/RR HH24:MI:SS''),:pIp,:pAcao)';

          Parameters.ParamByName('pUser').Value := 'eduardos';{//frmPrincipal.StatusBar1.Panels[2].Text;} UsuarioLogado;
          Parameters.ParamByName('pDate').Value := FormatDateTime('dd/MM/yyyy hh:mm:ss',Now);
          Parameters.ParamByName('pIp').Value := NomeDoComputador;
          Parameters.ParamByName('pAcao').Value := Acao;
          ExecSQL;

        end;
    finally
      Qry.Free;
    end;
  except on E: Exception do
    raise exception.Create(e.Message);
  end;
end;

class procedure TuClassFuncoesGerais.InfoPessoa(IdPessoa: string; var Nome,
  Endereco, Nascimento: String);
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
          SQL.Text := 'select nome, data_nasc, endereco from ge_pessoas '+
                      'where pessoa_cod = :pIdPessoa';

          Parameters.ParamByName('pIdPessoa').Value := IdPessoa;

          Open;
          if not IsEmpty then
            begin
              Nome := FieldByName('nome').AsString;
              Endereco := FieldByName('endereco').AsString;
              Nascimento := FieldByName('data_nasc').AsString;
            end;           

        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise Exception.Create('Falha: '+e.Message);
  end;
end;

class function TuClassFuncoesGerais.Logar(Idpessoa: String): Boolean;
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
          SQL.Text := 'select ge_pessoas.nome, ge_pessoas.pessoa_cod from ge_pessoas '+
                      'inner join ge_digital on (ge_pessoas.pessoa_cod = ge_digital.pessoa_cod) '+
                      'where ge_pessoas.pessoa_cod = :pIdPessoa';

          Parameters.ParamByName('pIdPessoa').Value := Idpessoa;
          Open;

          if not FieldByName('nome').IsNull then
            begin
              Result := true;
              frmLogin.pNomePessoa := FieldByName('nome').AsString;
            end
          else
            Result := False;
        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise Exception.Create('Falha Catastrófica: '+e.Message);
  end;
end;

class function TuClassFuncoesGerais.NomeDoComputador: string;
var
  lpBuffer : PChar;
  nSize    : DWord;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
  begin
  try
    nSize    := Buff_Size;
    lpBuffer := StrAlloc(Buff_Size);
    GetComputerName(lpBuffer,nSize);
    Result   := String(lpBuffer);
    StrDispose(lpBuffer);
  except
    Result := '';
  end;
end;

function TuClassFuncoesGerais.UltimoID(Tabela, Campo: string): Integer;
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
          SQL.Text := 'select max('+Campo+') AS ULTIMO from '+Tabela+'';

          Open;

          if not IsEmpty then
            Result := Fields[0].AsInteger;

        end;
    finally
      Qry.Free;
    end; 
  except on E: Exception do
    raise exception.Create('Falha Catastrófica:'+e.Message);
  end;
end;

class function TuClassFuncoesGerais.UsuarioLogado: String;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
    if GetUserName(buffer, size) then
       Result := buffer
    else
       Result := ''
end;

end.
