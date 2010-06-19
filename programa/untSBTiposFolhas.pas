unit untSBTiposFolhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBTiposFolhas = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBTiposFolhas: TfrmSBTiposFolhas;

implementation

uses uClassSB_TIPO_FOLHA;

{$R *.dfm}

procedure TfrmSBTiposFolhas.btnSalvarClick(Sender: TObject);
var
  TIPO : TuClassSB_TIPO_FOLHA;
begin
  inherited;
  try
    TIPO:= TuClassSB_TIPO_FOLHA.Create;
    TIPO.PDESCRICAO:= LabeledEdit1.Text;
    
    if (lblModo1.Caption = 'Inserindo') then
    begin
      if (TIPO.Salvar) then
      begin
        tsVisualiza.Show;
        gridRegistros.DataSource := TIPO.Consultar('');
        lblModo1.Caption:= 'Listando';
      end;
    end;

    if(lblModo1.Caption = 'Editando') then
    begin
      
    end;

  finally
      TIPO.Free;
  end;

end;

procedure TfrmSBTiposFolhas.FormShow(Sender: TObject);
var
  TIPOS : TuClassSB_TIPO_FOLHA;
begin
  inherited;
  try
    TIPOS:= TuClassSB_TIPO_FOLHA.Create;
    gridRegistros.DataSource:= TIPOS.Consultar('');
  finally
    TIPOS.Free;
  end;

end;

end.
