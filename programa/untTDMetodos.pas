unit untTDMetodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDMetodos = class(TfrmModelo)
    edtNome: TEdit;
    lkpTecnicaCod: TDBLookupComboBox;
    Memo1: TMemo;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDMetodos: TfrmTDMetodos;

implementation

uses uClassTD_METODOS, uClassTD_TECNICAS;

{$R *.dfm}

procedure TfrmTDMetodos.btnEditarClick(Sender: TObject);
var
  TECNICAS: TuClassTD_TECNICAS;
  ATRIBUTO: TuClassTD_METODOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_METODOS.Create;
  try
    ATRIBUTO.PMETODO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtNome.Text := ATRIBUTO.PNOME;
    Memo1.Lines.Text := ATRIBUTO.POBSERVACOES;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDMetodos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_METODOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_METODOS.Create;
      try
        ATRIBUTO.PMETODO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDMetodos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_METODOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_METODOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Lines.Text;
        ATRIBUTO.PTECNICA_COD := lkpTecnicaCod.KeyValue;
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
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Lines.Text;
        ATRIBUTO.PTECNICA_COD := lkpTecnicaCod.KeyValue;
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

procedure TfrmTDMetodos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_METODOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_METODOS.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
        gridRegistros.DataSource := ATRIBUTO.Consultar('NOME LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDMetodos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_METODOS;
  TECNICAS: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_METODOS.Create;
  TECNICAS := TuClassTD_TECNICAS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
    lkpTecnicaCod.ListSource := TECNICAS.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDMetodos.Memo1Exit(Sender: TObject);
begin
  inherited;
  if Memo1.Lines.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       Memo1.SetFocus
     end;
end;

end.
