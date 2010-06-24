unit untTDTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDTreinamentos = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    lkpInstrutor: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDTreinamentos: TfrmTDTreinamentos;

implementation

uses uClassTD_TREINAMENTOS, uClassTD_TURMAS, uClassTD_OBJETIVOS,
  uClassTD_METODOS, uClassTD_INSTRUTORES, uClassTD_TECNICAS;

{$R *.dfm}

procedure TfrmTDTreinamentos.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TREINAMENTOS.Create;
  try
    ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    memo2.Lines.Text := ATRIBUTO.PEMENTA;
    memo1.Lines.Text := ATRIBUTO.POBSERVACOES;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTreinamentos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
      try
        ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDTreinamentos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TREINAMENTOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PEMENTA := memo2.Lines.Text;
        ATRIBUTO.POBSERVACOES := memo1.Lines.Text;

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
        ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PEMENTA := memo2.Lines.Text;
        ATRIBUTO.POBSERVACOES := memo1.Lines.Text;
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

procedure TfrmTDTreinamentos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
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

procedure TfrmTDTreinamentos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
