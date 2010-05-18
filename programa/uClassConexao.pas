unit uClassConexao;

interface

uses SysUtils, ADODB, IniFiles, Forms;

type
  TuClassConexao = class
     
  private

  public
    Constructor Create;     
    class function ObtemConexao(): TADOConnection;

  end;

implementation
var
Conexao: TADOConnection;

{ TuClassConexao }

constructor TuClassConexao.Create;
var
  Ini: TIniFile;
  UserId, DataSource, Password:string;
begin
  try
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'conf.ini');
    UserId := Ini.ReadString('DATABASE','USERID','');
    DataSource := Ini.ReadString('DATABASE','DATASOURCE','');
    Password := Ini.ReadString('DATABASE','PASSWORD','');    

    Conexao := TADOConnection.Create(nil);
    Conexao.LoginPrompt := False;
    Conexao.ConnectionString := 'Provider=OraOLEDB.Oracle.1;'+
    'Persist Security Info=False;User ID='+UserId+';Data Source='+DataSource+';Password='+Password+'';
    Conexao.Connected := True;
    Ini.Free;
  except on E: Exception do
    Raise Exception.Create('Não foi possível estabelecer a conexão com o Banco de Dados!');
  end;
end;

class function TuClassConexao.ObtemConexao: TADOConnection;
begin
  try
    Result := Conexao;  //Retorna a conexão
  except on E: Exception do
    raise exception.Create('Não foi possível conectar ao BD: '+e.Message);
  end; 
end;

end.
