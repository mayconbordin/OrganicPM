unit untFpCargos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, ImgList, StdCtrls, Buttons, Grids, DBGrids, ComCtrls,
  ExtCtrls, DBCtrls;

type
  TfrmFpCargos = class(TfrmModelo)
    Label3: TLabel;
    edtCargo: TEdit;
    Label4: TLabel;
    edtSalMinimo: TEdit;
    Label5: TLabel;
    edtSalMaximo: TEdit;
    Label6: TLabel;
    edtSalMedio: TEdit;
    Label7: TLabel;
    lkpDepto: TDBLookupComboBox;
    Label8: TLabel;
    lkpTipoCargo: TDBLookupComboBox;
    Label9: TLabel;
    edtHorasTotais: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpCargos: TfrmFpCargos;

implementation

uses uClassFP_CARGOS, uClassFP_Departamentos, uClassFP_TIPOS_CARGO;

{$R *.dfm}

procedure TfrmFpCargos.btnEditarClick(Sender: TObject);
var
  CARGO: TuClassCargos;
begin
  inherited;
  CARGO := TuClassCargos.Create;
  try
    CARGO.PCARGO_COD := gridRegistros.Columns[0].Field.Value;
    CARGO.Carregar;
    edtCargo.Text := CARGO.PDESCRICAO;
    edtSalMinimo.Text := CARGO.PSALARIO_MINIMO;
    edtSalMaximo.Text := CARGO.PSALARIO_MAXIMO;
    edtSalMedio.Text := CARGO.PSALARIO_MEDIO;
    edtHorasTotais.Text := IntToStr(CARGO.PHORAS_TOTAIS);
    lkpDepto.KeyValue := CARGO.PDEPARTAMENTO_COD;
    lkpTipoCargo.KeyValue := CARGO.PTIP_CAR_COD;
  finally
    CARGO.Free;
  end;
end;

procedure TfrmFpCargos.btnExcluirClick(Sender: TObject);
var
  CARGO: TuClassCargos;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      CARGO := TuClassCargos.Create;
      try
        CARGO.PCARGO_COD := gridRegistros.Columns[0].Field.Value;
        CARGO.Excluir;
        gridRegistros.DataSource := CARGO.Consultar('');
      finally
        CARGO.Free;
      end;
    end;    
end;

procedure TfrmFpCargos.btnSalvarClick(Sender: TObject);
var
  CARGO: TuClassCargos;
begin
  inherited;
  CARGO := TuClassCargos.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        CARGO.PDESCRICAO := edtCargo.Text;
        CARGO.PSALARIO_MINIMO := StringReplace(edtSalMinimo.Text,',','.',[rfReplaceAll]);
        CARGO.PSALARIO_MAXIMO := StringReplace(edtSalMaximo.Text,',','.',[rfReplaceAll]);
        CARGO.PSALARIO_MEDIO := StringReplace(edtSalMedio.Text,',','.',[rfReplaceAll]);
        CARGO.PDEPARTAMENTO_COD := lkpDepto.KeyValue;
        CARGO.PTIP_CAR_COD := lkpTipoCargo.KeyValue;
        CARGO.PHORAS_TOTAIS := StrToint(edtHorasTotais.Text);
        if cargo.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := CARGO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        CARGO.PDESCRICAO := edtCargo.Text;
        CARGO.PSALARIO_MINIMO := StringReplace(edtSalMinimo.Text,',','.',[rfReplaceAll]);
        CARGO.PSALARIO_MAXIMO := StringReplace(edtSalMaximo.Text,',','.',[rfReplaceAll]);
        CARGO.PSALARIO_MEDIO := StringReplace(edtSalMedio.Text,',','.',[rfReplaceAll]);
        CARGO.PDEPARTAMENTO_COD := lkpDepto.KeyValue;
        CARGO.PTIP_CAR_COD := lkpTipoCargo.KeyValue;
        CARGO.PHORAS_TOTAIS := StrToInt(edtHorasTotais.Text);
        cargo.PCARGO_COD := gridRegistros.Columns[0].Field.Value;
        if cargo.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := CARGO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');        
      end;
  finally
    CARGO.Free;  
  end;

end;

procedure TfrmFpCargos.edtPesquisaChange(Sender: TObject);
var
  CARGO: TuClassCargos;
begin
  inherited;
  CARGO := TuClassCargos.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
        gridRegistros.DataSource := CARGO.Consultar('DESCRICAO LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := CARGO.Consultar('');
  finally
    CARGO.Free;
  end;
  
end;

procedure TfrmFpCargos.FormShow(Sender: TObject);
var
  CARGO: TuClassCargos;
  DEPARTAMENTO: TuClassDepartamentos;
  TIPO_CARGO: TuClassTiposCargo;
begin
  inherited;
  CARGO := TuClassCargos.Create;
  DEPARTAMENTO := TuClassDepartamentos.Create;
  TIPO_CARGO := TuClassTiposCargo.Create;
  try
    gridRegistros.DataSource := CARGO.Consultar('');
    lkpDepto.ListSource := DEPARTAMENTO.Consultar('');
    lkpTipoCargo.ListSource := TIPO_CARGO.Consultar('');
  finally
    CARGO.Free;
    DEPARTAMENTO.Free;
    TIPO_CARGO.Free;
  end;
end;

end.
