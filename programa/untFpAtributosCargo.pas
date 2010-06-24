unit untFpAtributosCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, Menus;

type
  TfrmFpAtributosCargo = class(TfrmModelo)
    Label2: TLabel;
    lkpCargo: TDBLookupComboBox;
    Label3: TLabel;
    lkpAtributo: TDBLookupComboBox;
    btnAdicionar: TBitBtn;
    gridAtributos: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    lblInfoCargo: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edtNotaCargo: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpCargoClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpAtributosCargo: TfrmFpAtributosCargo;

implementation

uses uClassFP_CARGOS, uClassFP_ATRIBUTOS, uClassFP_ATRIBUTOS_CARGOS,
  uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmFpAtributosCargo.btnAdicionarClick(Sender: TObject);
var
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
  CodCargo:string;
begin
  inherited;
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    ATRIBUTOCARGO.PCARGO_COD := lkpCargo.KeyValue;
    ATRIBUTOCARGO.PATRIBUTO_COD := lkpAtributo.KeyValue;
    ATRIBUTOCARGO.PSTATUS := 'A';
    ATRIBUTOCARGO.PNOTA_CARGO := StrToFloat(edtNotaCargo.Text);
    ATRIBUTOCARGO.Salvar;
    TuClassFuncoesGerais.GravaLog('Atribuiu atributo ao cargo: '+lkpCargo.Text);

    CodCargo := lkpCargo.KeyValue;
    gridAtributos.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('(fp_atributos_cargos.cargo_cod = '+CodCargo+')')
  finally
    ATRIBUTOCARGO.Free;
  end;
end;

procedure TfrmFpAtributosCargo.btnEditarClick(Sender: TObject);
var
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
  CargoCod:string;
begin
  inherited;
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    lkpCargo.KeyValue := gridRegistros.Columns[1].Field.Value;

    CargoCod := gridRegistros.Columns[1].Field.Value;
    gridAtributos.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('(fp_atributos_cargos.cargo_cod = '+CargoCod+')')  
  finally
    ATRIBUTOCARGO.Free;
  end;
end;

procedure TfrmFpAtributosCargo.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Não é possível excluir um cargo e todos os seus atributos, clique em Editar para realizar a manutenção.');
end;

procedure TfrmFpAtributosCargo.btnSalvarClick(Sender: TObject);
var
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
begin
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    inherited;
    gridRegistros.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('');
    tsVisualiza.Show;
  finally
    ATRIBUTOCARGO.Free;
  end;
end;

procedure TfrmFpAtributosCargo.Excluir1Click(Sender: TObject);
var
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
  CodCargo: String;
begin
  inherited;
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        ATRIBUTOCARGO.PCARGO_COD := gridAtributos.Columns[3].Field.Value;
        ATRIBUTOCARGO.PATRIBUTO_COD := gridAtributos.Columns[2].Field.Value;
        ATRIBUTOCARGO.Excluir;
        TuClassFuncoesGerais.GravaLog('Excluiu atributo do cargo: '+lkpCargo.Text);

        CodCargo := lkpCargo.KeyValue;
        gridAtributos.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('(fp_atributos_cargos.cargo_cod = '+CodCargo+')')
      end;

  finally
    ATRIBUTOCARGO.Free;
  end;
end;

procedure TfrmFpAtributosCargo.FormShow(Sender: TObject);
var
  CARGO: TuClassCargos;
  ATRIBUTO: TuClassAtributos;
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
begin
  inherited;
  CARGO := TuClassCargos.Create;
  ATRIBUTO := TuClassAtributos.Create;
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    lkpCargo.ListSource := CARGO.Consultar('');
    lkpAtributo.ListSource := ATRIBUTO.Consultar('');
    gridRegistros.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('');
  finally
    CARGO.Free;
    ATRIBUTO.Free;
    ATRIBUTOCARGO.Free;
  end;
end;

procedure TfrmFpAtributosCargo.lkpCargoClick(Sender: TObject);
var
  CodCargo: String;
  ATRIBUTOCARGO: TuClassFP_ATRIBUTOS_CARGOS;
begin
  inherited;
  lblInfoCargo.Caption := lkpCargo.Text;
  ATRIBUTOCARGO := TuClassFP_ATRIBUTOS_CARGOS.Create;
  try
    CodCargo := lkpCargo.KeyValue;
    gridAtributos.DataSource := ATRIBUTOCARGO.ConsultarAtributoscargo('(fp_atributos_cargos.cargo_cod = '+CodCargo+')')
  finally
    ATRIBUTOCARGO.Free;
  end;
end;

end.
