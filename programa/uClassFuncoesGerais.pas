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
  end;

implementation

uses uClassConexao;

{ TuClassFuncoesGerais }

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

          Parameters.ParamByName('pUser').Value := UsuarioLogado;
          Parameters.ParamByName('pDate').Value := FormatDateTime('dd/MM/yyyy HH:mm:ss',Date);
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
