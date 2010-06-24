unit untTDTecnicas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDTecnicas = class(TfrmModelo)
    edtNome: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDTecnicas: TfrmTDTecnicas;

implementation

uses uClassTD_TECNICAS, Lua;

{$R *.dfm}

procedure TfrmTDTecnicas.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TECNICAS.Create;
  try
    ATRIBUTO.PTECNICA_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtNome.Text := ATRIBUTO.PNOME;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTecnicas.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TECNICAS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_TECNICAS.Create;
      try
        ATRIBUTO.PTECNICA_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;

end;

procedure TfrmTDTecnicas.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := '';
end;

procedure TfrmTDTecnicas.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TECNICAS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PNOME := edtNome.Text;
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
        ATRIBUTO.PTECNICA_COD := gridRegistros.Columns[0].Field.Value; 
        ATRIBUTO.PNOME := edtNome.Text;
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

procedure TfrmTDTecnicas.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TECNICAS.Create;
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

procedure TfrmTDTecnicas.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TECNICAS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
