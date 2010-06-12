unit untADP_Tipos_Avaliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmAvaTipo = class(TfrmModelo)
    Label2: TLabel;
    Edit1: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvaTipo: TfrmAvaTipo;

implementation

uses uClassADP_AVALIACAO_TIPO;

{$R *.dfm}

procedure TfrmAvaTipo.btnEditarClick(Sender: TObject);
var
  t: TuClassADP_AVALIACAO_TIPO;
begin
  inherited;
  t := TuClassADP_AVALIACAO_TIPO.Create;
  try
    t.PTIPO := gridRegistros.Columns[0].Field.Value;
    t.Carregar;
    Edit1.Text := t.PDESCRICAO;
  finally
    t.Free;
  end;
end;

procedure TfrmAvaTipo.btnExcluirClick(Sender: TObject);
var
  C: TuClassADP_AVALIACAO_TIPO;
begin
  inherited;
  C := TuClassADP_AVALIACAO_TIPO.Create;
  try
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      C.PTIPO := gridRegistros.Columns[0].Field.Value;
      C.Excluir;
      gridRegistros.DataSource := C.Consultar('');
    end;
  finally
    C.Free;
  end;
end;

procedure TfrmAvaTipo.btnNovoClick(Sender: TObject);
begin
  inherited;
  Edit1.Text := '';
end;

procedure TfrmAvaTipo.btnSalvarClick(Sender: TObject);
var
  TIPO: TuClassADP_AVALIACAO_TIPO;
begin
  inherited;
  TIPO := TuClassADP_AVALIACAO_TIPO.Create;
  try
    TIPO.PDESCRICAO := Edit1.Text;
    if lblModo1.Caption = 'Inserindo' then
    begin
      if tipo.Salvar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := tipo.Consultar('');
            end
          else
            ShowMessage('Falha ao Incluir o Registro.');
    end else if lblModo1.Caption = 'Editando' then begin
      tipo.PTIPO := gridRegistros.Columns[0].Field.Value;
      if tipo.Editar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := tipo.Consultar('');
            end
          else
            ShowMessage('Falha ao Editar o Registro.');
    end;
  finally
    TIPO.FRee;
  end;
end;

procedure TfrmAvaTipo.edtPesquisaChange(Sender: TObject);
var
  T: TuClassADP_AVALIACAO_TIPO;
begin
  inherited;
  T := TuClassADP_AVALIACAO_TIPO.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
       gridRegistros.DataSource := T.Consultar(' UPPER(ADP_AVALIACAO_TIPO.DESCRICAO) LIKE '''+UpperCase(edtPesquisa.Text)+'%''');
      end
    else
      gridRegistros.DataSource := T.Consultar('');
  finally
    T.Free;
  end;
end;

procedure TfrmAvaTipo.FormShow(Sender: TObject);
var
  TIPO: TuClassADP_AVALIACAO_TIPO;
begin
  inherited;
  TIPO := TuClassADP_AVALIACAO_TIPO.Create;
  try
    gridRegistros.DataSource := TIPO.Consultar('');
  finally
    TIPO.FRee;
  end;
end;

end.
