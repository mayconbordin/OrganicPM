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
    Tipo: TLabel;
    Label3: TLabel;
    ValueListEditor1: TValueListEditor;
    ComboBox1: TComboBox;
    RichEdit1: TRichEdit;
    Button1: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventos: TfrmSBEventos;

implementation

uses uClassSB_EVENTOS;

{$R *.dfm}

procedure TfrmSBEventos.btnSalvarClick(Sender: TObject);
  var
    EVENTO : TuClassSB_EVENTOS;
begin
  inherited;
  try
    EVENTO:=  TuClassSB_EVENTOS.Create;

    EVENTO.PDESCRICAO:= LabeledEdit2.Text;
    EVENTO.PFORMULA:= RichEdit1.Text;



    if(lblModo1.Caption = 'Inserindo') then
      begin
//        EVENTO.PEVENTO_COD:= 'null';
        if(EVENTO.Salvar) then
          begin
            gridRegistros.DataSource:= EVENTO.Consultar('');
            tsVisualiza.Show;
            lblModo1.Caption:= 'Listando';
          end; // fim do salvar
      end; // do inserindo



    if(lblModo1.Caption = 'Editando') then
      begin
        EVENTO.PEVENTO_COD:= gridRegistros.Columns[0].Field.Value;

        if(EVENTO.Editar) then
          begin
            gridRegistros.DataSource:= EVENTO.Consultar('');
            tsVisualiza.Show;
            lblModo1.Caption:= 'Listando';
          end;

      end;// do editando

  finally
    EVENTO.Free;
  end;

end;

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
// foo

end;

procedure TfrmSBEventos.FormShow(Sender: TObject);
var
  EVENTO : TuClassSB_EVENTOS;
begin
  inherited;
   EVENTO:= TuClassSB_EVENTOS.Create;
   gridRegistros.DataSource:= EVENTO.Consultar('');
   EVENTO.Free;
end;

end.
