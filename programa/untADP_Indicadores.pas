unit untADP_Indicadores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmADP_Indicadores = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    listCHA: TDBLookupComboBox;
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmADP_Indicadores: TfrmADP_Indicadores;

implementation

uses uClassADP_INDICADORES, uClassFP_ATRIBUTOS;

{$R *.dfm}

procedure TfrmADP_Indicadores.btnEditarClick(Sender: TObject);
var
  INDICADOR: TuClassADP_INDICADORES;
begin
  inherited;
  INDICADOR := TuClassADP_INDICADORES.Create;
  try
    INDICADOR.PINDICADOR_COD := gridRegistros.Columns[0].Field.Value;
    INDICADOR.Carregar;
    edtDescricao.Text := INDICADOR.PDESCRICAO;
    listCHA.KeyValue := INDICADOR.PATRIBUTO_COD;
  finally
    INDICADOR.Free;
  end;
end;

procedure TfrmADP_Indicadores.btnExcluirClick(Sender: TObject);
var
  INDICADOR: TuClassADP_INDICADORES;
begin
  inherited;
  INDICADOR := TuClassADP_INDICADORES.Create;
  try
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      INDICADOR.PINDICADOR_COD := gridRegistros.Columns[0].Field.Value;
      INDICADOR.Excluir;
      gridRegistros.DataSource := INDICADOR.Consultar('');
    end;
  finally
    INDICADOR.Free;
  end;
end;

procedure TfrmADP_Indicadores.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.Text := '';
end;

procedure TfrmADP_Indicadores.btnSalvarClick(Sender: TObject);
var
  INDICADOR: TuClassADP_INDICADORES;
begin
  inherited;
  INDICADOR := TuClassADP_INDICADORES.Create;
  TRY
    INDICADOR.PDESCRICAO := edtDescricao.Text;
    INDICADOR.PATRIBUTO_COD := listCHA.KeyValue;
    if lblModo1.Caption = 'Inserindo' then
    begin
      if INDICADOR.Salvar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := INDICADOR.Consultar('');
            end
          else
            ShowMessage('Falha ao Incluir o Registro.');
    end else if lblModo1.Caption = 'Editando' then begin
      INDICADOR.PINDICADOR_COD := gridRegistros.Columns[0].Field.Value;
      if INDICADOR.Editar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := INDICADOR.Consultar('');
            end
          else
            ShowMessage('Falha ao Editar o Registro.');
    end;
  FINALLY
    INDICADOR.Free;
  END;
end;

procedure TfrmADP_Indicadores.edtPesquisaChange(Sender: TObject);
var
  INDICADOR: TuClassADP_INDICADORES;
begin
  inherited;
  INDICADOR := TuClassADP_INDICADORES.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
       gridRegistros.DataSource := INDICADOR.Consultar(' UPPER(ADP_INDICADORES.DESCRICAO) LIKE '''+UpperCase(edtPesquisa.Text)+'%''');
      end
    else
      gridRegistros.DataSource := INDICADOR.Consultar('');
  finally
    INDICADOR.Free;
  end;
end;

procedure TfrmADP_Indicadores.FormShow(Sender: TObject);
var
  INDICADOR: TuClassADP_INDICADORES;
  CHA: TuClassAtributos;
begin
  inherited;
  CHA := TuClassAtributos.Create;
  INDICADOR := TuClassADP_INDICADORES.Create;
  try
    gridRegistros.DataSource := INDICADOR.Consultar('');
    listCHA.ListSource := CHA.Consultar('');
  finally
    INDICADOR.Free;
    CHA.Free;
  end;
end;

end.
