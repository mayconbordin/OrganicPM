unit untFpDepartamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmFpDepartamentos = class(TfrmModelo)
    Label2: TLabel;
    edtDescricao: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpDepartamentos: TfrmFpDepartamentos;

implementation

uses uClassFP_DEPARTAMENTOS;

{$R *.dfm}

procedure TfrmFpDepartamentos.btnEditarClick(Sender: TObject);
var
  DEPARTAMENTO: TuClassDepartamentos;
begin
  inherited;
  DEPARTAMENTO := TuClassDepartamentos.Create;
  try
    DEPARTAMENTO.PDEPARTAMENTO_COD := gridRegistros.Columns[0].Field.Value;
    DEPARTAMENTO.Carregar;
    edtDescricao.Text := DEPARTAMENTO.PDESCRICAO;
  finally
    DEPARTAMENTO.Free;
  end;

end;

procedure TfrmFpDepartamentos.btnExcluirClick(Sender: TObject);
var
  DEPARTAMENTO: TuClassDepartamentos;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      DEPARTAMENTO := TuClassDepartamentos.Create;
      try
        DEPARTAMENTO.PDEPARTAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        DEPARTAMENTO.Excluir;
        gridRegistros.DataSource := DEPARTAMENTO.Consultar('');
      finally
        DEPARTAMENTO.Free;
      end;
    end;
end;

procedure TfrmFpDepartamentos.btnSalvarClick(Sender: TObject);
var
  DEPARTAMENTO: TuClassDepartamentos;
begin
  inherited;
  DEPARTAMENTO := TuClassDepartamentos.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        DEPARTAMENTO.PDESCRICAO := edtDescricao.Text;
        if DEPARTAMENTO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := DEPARTAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir Registro!');
      end
    else if lblModo1.Caption = 'Editando' then         
      begin
        DEPARTAMENTO.PDESCRICAO := edtDescricao.Text;
        DEPARTAMENTO.PDEPARTAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        if DEPARTAMENTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := DEPARTAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Alterar Registro!');
      end;
    
  finally
    DEPARTAMENTO.Free;
  end;
end;

procedure TfrmFpDepartamentos.FormShow(Sender: TObject);
var
  DEPARTAMENTO: TuClassDepartamentos;
begin
  inherited;
  DEPARTAMENTO := TuClassDepartamentos.Create;
  try
    gridRegistros.DataSource := DEPARTAMENTO.Consultar('');
  finally
    DEPARTAMENTO.Free;
  end;
end;

end.
