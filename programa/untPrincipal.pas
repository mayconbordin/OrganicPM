unit untPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls, StdCtrls, Buttons;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    btnPerfil: TBitBtn;
    btnficha: TBitBtn;
    btnTD: TBitBtn;
    btnRemBen: TBitBtn;
    btnRecSel: TBitBtn;
    btnAvalicaoDesemp: TBitBtn;
    procedure Principal1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure btnPerfilClick(Sender: TObject);
    procedure btnfichaClick(Sender: TObject);
    procedure btnRecSelClick(Sender: TObject);
    procedure btnRemBenClick(Sender: TObject);
    procedure btnTDClick(Sender: TObject);
    procedure btnAvalicaoDesempClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses untModelo, untAvaliacaoPrincipal, untFichaPrincipal, untPerfilPrincipal,
  untRecrutPrincipal, untSalBenPrincipal, untTDPrincipal, uClassConexao;

{$R *.dfm}

procedure TfrmPrincipal.btnAvalicaoDesempClick(Sender: TObject);
begin
  frmAvalicaoPrincipal := TfrmAvalicaoPrincipal.Create(Self);
  frmAvalicaoPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.btnfichaClick(Sender: TObject);
begin
  frmFichaPrincipal := TfrmFichaPrincipal.Create(self);
  frmFichaPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.btnPerfilClick(Sender: TObject);
begin
  frmPerfilPrincipal := TfrmPerfilPrincipal.Create(self);
  frmPerfilPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.btnRecSelClick(Sender: TObject);
begin
  frmRecrutPrincipal := TfrmRecrutPrincipal.Create(self);
  frmRecrutPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.btnRemBenClick(Sender: TObject);
begin
  frmSalBenPrincipal := TfrmSalBenPrincipal.Create(self);
  frmSalBenPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.btnTDClick(Sender: TObject);
begin
  frmTDPrincipal := TfrmTDPrincipal.Create(Self);
  frmTDPrincipal.ShowModal;
//  Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  TuClassConexao.Create;
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

end.
