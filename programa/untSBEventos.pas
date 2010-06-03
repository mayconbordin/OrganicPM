unit untSBEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, ValEdit;

type
  TfrmSBEventos = class(TfrmModelo)
    LabeledEdit2: TLabeledEdit;
    Label2: TLabel;
    DBComboBox1: TDBComboBox;
    Tipo: TLabel;
    Label3: TLabel;
    DBRichEdit1: TDBRichEdit;
    ValueListEditor1: TValueListEditor;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventos: TfrmSBEventos;

implementation

{$R *.dfm}

procedure TfrmSBEventos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  
  if key = VK_F3 then
    btnNovo.Click
  else if key = VK_F4 then
    btnSalvar.Click
  else if Key = VK_F5 then
    btnEditar.Click
  else if Key = VK_F7 then
    btnExcluir.Click
  else if Key = VK_F8 then
    btnCancel.Click;
end;

procedure TfrmSBEventos.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  if Key = #13 Then
//    Begin
//       Key := #0;
//       PostMessage(Handle,WM_NEXTDLGCTL,0,0);
//    End;

end;

end.
