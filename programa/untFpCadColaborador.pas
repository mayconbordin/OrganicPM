unit untFpCadColaborador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ExtDlgs;

type
  TfrmFpCadColaborador = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label2: TLabel;
    edtnascimento: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    edtCnh: TEdit;
    Label6: TLabel;
    edtGrupo: TEdit;
    Label7: TLabel;
    edtObs: TEdit;
    Label8: TLabel;
    edtBanco: TEdit;
    Label9: TLabel;
    edtAgencia: TEdit;
    Label10: TLabel;
    edtContaCorrente: TEdit;
    Label11: TLabel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FpPessoaCod: Integer;
    FpProcessoCod: String;
    procedure SetpPessoaCod(const Value: Integer);
    procedure SetpProcessoCod(const Value: String);
    { Private declarations }
  public
    { Public declarations }
    property pPessoaCod: Integer read FpPessoaCod write SetpPessoaCod;
    property pProcessoCod: String read FpProcessoCod write SetpProcessoCod;
  end;

var
  frmFpCadColaborador: TfrmFpCadColaborador;
  SelecionouImagem: Boolean;
  CaminhoFoto:String;

implementation

uses uClassGE_COLABORADORES, uClassFuncoesGerais, untFpContratarColaborador;

{$R *.dfm}

procedure TfrmFpCadColaborador.Button1Click(Sender: TObject);
var
  COLAB: TuClassGE_COLABORADORES;
begin
  COLAB := TuClassGE_COLABORADORES.Create;
  try
    COLAB.PPESSOA_COD := IntToStr(pPessoaCod);
    COLAB.PCNH := edtCnh.Text;
    COLAB.PGRUPO_SANGUINEO := edtGrupo.Text;
    COLAB.POBSERVACAO := edtObs.Text;
    COLAB.PDATA_ADMISSAO := FormatDateTime('dd/MM/yyyy',DateTimePicker1.Date);
    COLAB.PSTATUS := 'A';
    COLAB.PBANCO := edtBanco.Text;
    COLAB.PAGENCIA := edtAgencia.Text;
    COLAB.PCONTA_CORRENTE := edtContaCorrente.Text;
    if SelecionouImagem then
      begin
        COLAB.PFOTO := 'imagens\'+edtNome.Text+ExtractFileExt(CaminhoFoto);
      end;

    if COLAB.Salvar then
      begin
        TuClassFuncoesGerais.AtualizaStatusCandidato(IntToStr(pPessoaCod),pProcessoCod,'contratado');
        ShowMessage('Colaborador Salvo com Sucesso!');
        Close;
      end;        

  finally
    COLAB.Free;
  end;
end;

procedure TfrmFpCadColaborador.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmFpCadColaborador.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  GERAL: TuClassFuncoesGerais;
begin
  GERAL := TuClassFuncoesGerais.Create;
  frmFpContratarColaborador.gridCandidatos.DataSource := GERAL.BuscaCandidatosProcessSel(frmFpContratarColaborador.lkpProcessoSeletivo.KeyValue,'classificado');
end;

procedure TfrmFpCadColaborador.FormShow(Sender: TObject);
var
  Nome, Ender,nasc: String;
begin
  TuClassFuncoesGerais.InfoPessoa(IntToStr(pPessoaCod),Nome,Ender,nasc);

  edtNome.Text := Nome;
  edtEndereco.Text := Ender;
  edtnascimento.Text := nasc;
end;

procedure TfrmFpCadColaborador.SetpPessoaCod(const Value: Integer);
begin
  FpPessoaCod := Value;
end;

procedure TfrmFpCadColaborador.SetpProcessoCod(const Value: String);
begin
  FpProcessoCod := Value;
end;

procedure TfrmFpCadColaborador.SpeedButton1Click(Sender: TObject);
var
  caminho: string;
begin
  caminho := ExtractFilePath(Application.ExeName)+'imagens\';
  OpenPictureDialog1.Execute();
  CopyFile(PAnsiChar(OpenPictureDialog1.FileName),PansiChar(Caminho+ExtractFileName(OpenPictureDialog1.FileName)),False);
  RenameFile(Caminho+ExtractFileName(OpenPictureDialog1.FileName),Caminho+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName));
  Image1.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'imagens/'+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName));
  CaminhoFoto := ExtractFilePath(Application.ExeName)+'imagens/'+edtNome.Text+ExtractFileExt(OpenPictureDialog1.FileName);
  SelecionouImagem:= True;
end;

end.
