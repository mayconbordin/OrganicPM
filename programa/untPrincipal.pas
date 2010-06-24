unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls, Buttons, ComCtrls, shellapi, 
  IniFiles;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    StatusBar1: TStatusBar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Label2: TLabel;
    SpeedButton7: TSpeedButton;
    procedure Principal1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untModelo, untAvaliacaoPrincipal, untFichaPrincipal, untPerfilPrincipal,
  untRecrutPrincipal, untSalBenPrincipal, untTDPrincipal, uClassConexao,
  uClassFuncoesGerais, untConLogs;

{$R *.dfm}

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TuClassConexao.Create;
  StatusBar1.Panels[2].Text := FormatDateTime('dd/MM/yyyy',date);
  TuClassFuncoesGerais.GravaLog('Executou o Sistema');
end;

procedure TfrmPrincipal.Principal1Click(Sender: TObject);
begin
  frmModelo := TfrmModelo.Create(self);
  frmModelo.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  TuClassFuncoesGerais.GravaLog('Acessou o módulo de Perfil de Cargo');
  frmPerfilPrincipal := TfrmPerfilPrincipal.Create(self);
  frmPerfilPrincipal.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton2Click(Sender: TObject);
var
  Ini: TIniFile;
  endereco: String;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName)+'conf.ini');
  endereco := Ini.ReadString('LINK','ENDERECO_WEB','');

  TuClassFuncoesGerais.GravaLog('Acessou o módulo RECRUTAMENTO E SELEÇÃO');
  ShellExecute(handle,'open',PansiChar(endereco),nil,nil,SW_SHOWNORMAL)

end;

procedure TfrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  TuClassFuncoesGerais.GravaLog('Acessou o módulo Treinamento e Desenvolvimento');
  frmTDPrincipal := TfrmTDPrincipal.Create(Self);
  frmTDPrincipal.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  TuClassFuncoesGerais.GravaLog('Acessou o módulo de Ficha Funcional');
  frmFichaPrincipal := TfrmFichaPrincipal.Create(self);
  frmFichaPrincipal.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton5Click(Sender: TObject);
begin
  TuClassFuncoesGerais.GravaLog('Acessou o módulo de Salários e Benefícios');
  frmSalBenPrincipal := TfrmSalBenPrincipal.Create(self);
  frmSalBenPrincipal.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton6Click(Sender: TObject);
begin
  TuClassFuncoesGerais.GravaLog('Acessou o módulo de Avaliação de Desempenho e Potencial');
  frmAvalicaoPrincipal := TfrmAvalicaoPrincipal.Create(Self);
  frmAvalicaoPrincipal.ShowModal;
end;

procedure TfrmPrincipal.SpeedButton7Click(Sender: TObject);
begin
  frmConLogs := TfrmConLogs.Create(Self);
  frmConLogs.ShowModal;
end;

end.
