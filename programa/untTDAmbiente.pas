unit untTDAmbiente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDAmbiente = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    edtEndereco: TEdit;
    edtBairro: TEdit;
    edtReferencia: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtLogradouro: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtLogradouroExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDAmbiente: TfrmTDAmbiente;

implementation

uses uClassTD_AMBIENTES, uClassTD_RECURSOS;

{$R *.dfm}

procedure TfrmTDAmbiente.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_AMBIENTES;
begin
  inherited;
  ATRIBUTO := TuClassTD_AMBIENTES.Create;
  try
    ATRIBUTO.PAMBIENTE_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    edtEndereco.Text := ATRIBUTO.PENDERECO;
    edtBairro.Text := ATRIBUTO.PBAIRRO;
    edtReferencia.Text := ATRIBUTO.PLOCAIS_REFERENCIA;
    edtLogradouro.Text := ATRIBUTO.PLOGRADOURO;
    Memo1.Text := ATRIBUTO.POBSERVACOES;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDAmbiente.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_AMBIENTES;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_AMBIENTES.Create;
      try
        ATRIBUTO.PAMBIENTE_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;

end;

procedure TfrmTDAmbiente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.Text := '';
  edtEndereco.Text := '';
  edtBairro.Text := '';
  edtReferencia.Text := '';
  edtLogradouro.Text := '';
  Memo1.Lines.Text := '';
end;

procedure TfrmTDAmbiente.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_AMBIENTES;
begin
  inherited;
  ATRIBUTO := TuClassTD_AMBIENTES.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PENDERECO := edtEndereco.Text;
        ATRIBUTO.PBAIRRO := edtBairro.Text;
        ATRIBUTO.PLOCAIS_REFERENCIA := edtReferencia.Text;
        ATRIBUTO.PLOGRADOURO := edtLogradouro.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Text;
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
        ATRIBUTO.PAMBIENTE_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PENDERECO := edtEndereco.Text;
        ATRIBUTO.PBAIRRO := edtBairro.Text;
        ATRIBUTO.PLOCAIS_REFERENCIA := edtReferencia.Text;
        ATRIBUTO.PLOGRADOURO := edtLogradouro.Text;
        ATRIBUTO.POBSERVACOES := Memo1.Text;
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

procedure TfrmTDAmbiente.edtLogradouroExit(Sender: TObject);
begin
  inherited;
  try
    edtLogradouro.text:=floattostr(strtofloat(edtLogradouro.text));
  except
    showmessage('Digite um valor numérico!');
    edtLogradouro.setfocus;
  end;
end;

procedure TfrmTDAmbiente.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_AMBIENTES;
begin
  inherited;
  ATRIBUTO:= TuClassTD_AMBIENTES.Create;
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

procedure TfrmTDAmbiente.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_AMBIENTES;
  RECURSO: TuClassTD_RECURSOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_AMBIENTES.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
