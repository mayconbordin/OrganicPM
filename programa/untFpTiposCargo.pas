unit untFpTiposCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmFpTiposCargo = class(TfrmModelo)
    Label2: TLabel;
    edtDescricao: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpTiposCargo: TfrmFpTiposCargo;

implementation

uses uClassFP_TIPOS_CARGO;

{$R *.dfm}

procedure TfrmFpTiposCargo.btnEditarClick(Sender: TObject);
var
  TIPOCARGO: TuClassTiposCargo;
begin
  inherited;
  TIPOCARGO := TuClassTiposCargo.Create;
  try
    TIPOCARGO.PTIP_CAR_COD := gridRegistros.Columns[0].Field.Value;
    TIPOCARGO.Carregar;
    edtDescricao.Text := TIPOCARGO.PDESCRICAO;
  finally
    TIPOCARGO.Free;
  end;

end;

procedure TfrmFpTiposCargo.btnExcluirClick(Sender: TObject);
var
  TIPOCARGO: TuClassTiposCargo;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      TIPOCARGO := TuClassTiposCargo.Create;
      try
        TIPOCARGO.PTIP_CAR_COD := gridRegistros.Columns[0].Field.Value;
        TIPOCARGO.Excluir;
        gridRegistros.DataSource := TIPOCARGO.Consultar('');
      finally
        TIPOCARGO.Free;
      end;
    end;
end;

procedure TfrmFpTiposCargo.btnSalvarClick(Sender: TObject);
var
  TIPOCARGO: TuClassTiposCargo;
begin
  inherited;
  TIPOCARGO := TuClassTiposCargo.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        TIPOCARGO.PDESCRICAO := edtDescricao.Text;
        if TIPOCARGO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := TIPOCARGO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir Registro!');
      end
    else if lblModo1.Caption = 'Editando' then         
      begin
        TIPOCARGO.PDESCRICAO := edtDescricao.Text;
        TIPOCARGO.PTIP_CAR_COD := gridRegistros.Columns[0].Field.Value;
        if TIPOCARGO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := TIPOCARGO.Consultar('');
          end
        else
          ShowMessage('Falha ao Alterar Registro!');
      end;
    
  finally
    TIPOCARGO.Free;
  end;
end;

procedure TfrmFpTiposCargo.FormShow(Sender: TObject);
var
  TIPOCARGO: TuClassTiposCargo;
begin
  inherited;
  TIPOCARGO := TuClassTiposCargo.Create;
  try
    gridRegistros.DataSource := TIPOCARGO.Consultar('');
  finally
    TIPOCARGO.Free;
  end;

end;

end.
