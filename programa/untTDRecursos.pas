unit untTDRecursos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDRecursos = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtDescricaoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDRecursos: TfrmTDRecursos;

implementation

uses uClassTD_RECURSOS;

{$R *.dfm}

procedure TfrmTDRecursos.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RECURSOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_RECURSOS.Create;
  try
    ATRIBUTO.PRECURSO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDRecursos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RECURSOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_RECURSOS.Create;
      try
        ATRIBUTO.PRECURSO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDRecursos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RECURSOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_RECURSOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;

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

procedure TfrmTDRecursos.edtDescricaoExit(Sender: TObject);
begin
  inherited;
  if edtDescricao.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       edtDescricao.SetFocus
     end;
end;

procedure TfrmTDRecursos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RECURSOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_RECURSOS.Create;
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

procedure TfrmTDRecursos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_RECURSOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_RECURSOS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;


end.
