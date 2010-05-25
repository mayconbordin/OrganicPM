unit untFpAtributos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmFpAtributos = class(TfrmModelo)
    Label2: TLabel;
    Label3: TLabel;
    edtDescricao: TEdit;
    cbTipo: TComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpAtributos: TfrmFpAtributos;

implementation

uses uClassFP_ATRIBUTOS;

{$R *.dfm}

procedure TfrmFpAtributos.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
  IndexCombo: Integer;
begin
  inherited;
  ATRIBUTO := TuClassAtributos.Create;
  try
    ATRIBUTO.PATRIBUTO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    if ATRIBUTO.PTIPO = 'C' then
      IndexCombo := 0
    else if ATRIBUTO.PTIPO = 'H' then
      IndexCombo := 1
    else if ATRIBUTO.PTIPO = 'A' then
      IndexCombo := 2
    else
      IndexCombo := 3;

    cbTipo.ItemIndex := IndexCombo;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmFpAtributos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO := TuClassAtributos.Create;
      try
        ATRIBUTO.PATRIBUTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmFpAtributos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
  Tipo:string;
begin
  inherited;
  ATRIBUTO := TuClassAtributos.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        if cbTipo.ItemIndex = 0 then
          Tipo := 'C'
        else if cbTipo.ItemIndex = 1 then
          Tipo := 'H'
        else if cbTipo.ItemIndex = 2 then
          Tipo := 'A'
        else
          Tipo := 'T';

        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PTIPO := Tipo;

        if ATRIBUTO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        if cbTipo.ItemIndex = 0 then
          Tipo := 'C'
        else if cbTipo.ItemIndex = 1 then
          Tipo := 'H'
        else if cbTipo.ItemIndex = 2 then
          Tipo := 'A'
        else
          Tipo := 'T';

        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PTIPO := Tipo;
        ATRIBUTO.PATRIBUTO_COD := gridRegistros.Columns[0].Field.Value;
        if ATRIBUTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmFpAtributos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
begin
  inherited;
  ATRIBUTO := TuClassAtributos.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
       gridRegistros.DataSource := ATRIBUTO.Consultar('DESCRICAO LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmFpAtributos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
begin
  inherited;
  ATRIBUTO := TuClassAtributos.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
