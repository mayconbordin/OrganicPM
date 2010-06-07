unit untTDResultados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDResultados = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
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
  frmTDResultados: TfrmTDResultados;

implementation

uses uClassTD_RESULTADOS;

{$R *.dfm}

procedure TfrmTDResultados.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RESULTADOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_RESULTADOS.Create;
  try
    ATRIBUTO.PRESULTADO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    Memo1.Lines.Text := ATRIBUTO.POBSERVACOES;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDResultados.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RESULTADOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_RESULTADOS.Create;
      try
        ATRIBUTO.PRESULTADO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;

end;

procedure TfrmTDResultados.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RESULTADOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_RESULTADOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Lines.Text;
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
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Lines.Text;
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

procedure TfrmTDResultados.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RESULTADOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_RESULTADOS.Create;
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

procedure TfrmTDResultados.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RESULTADOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_RESULTADOS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;

end.
