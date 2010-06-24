unit untTDObjetivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDObjetivos = class(TfrmModelo)
    edtDescricao: TEdit;
    Memo1: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDObjetivos: TfrmTDObjetivos;

implementation

uses uClassTD_OBJETIVOS;

{$R *.dfm}

procedure TfrmTDObjetivos.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_OBJETIVOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_OBJETIVOS.Create;
  try
    ATRIBUTO.POBJETIVO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    Memo1.Lines.Text := ATRIBUTO.PFINALIDADE;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDObjetivos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_OBJETIVOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_OBJETIVOS.Create;
      try
        ATRIBUTO.POBJETIVO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDObjetivos.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.Text := '';
  Memo1.Lines.Text := '';
end;

procedure TfrmTDObjetivos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_OBJETIVOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_OBJETIVOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PFINALIDADE := Memo1.Lines.Text;
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
        ATRIBUTO.POBJETIVO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PFINALIDADE := Memo1.Lines.Text;
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

procedure TfrmTDObjetivos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_OBJETIVOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_OBJETIVOS.Create;
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

procedure TfrmTDObjetivos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_OBJETIVOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_OBJETIVOS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDObjetivos.Memo1Exit(Sender: TObject);
begin
  inherited;
  if Memo1.Lines.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       Memo1.SetFocus;
     end;
end;

end.
