unit untADP_Avaliacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmAvaliacao = class(TfrmModelo)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtData: TEdit;
    listColaborador: TDBLookupComboBox;
    listTipoAva: TDBLookupComboBox;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvaliacao: TfrmAvaliacao;

implementation

uses uClassADP_AVALIACOES, uClassADP_INDICADORES, db, uClassADP_AVALIACAO_TIPO,
  uClassGE_PESSOAS;

{$R *.dfm}

procedure TfrmAvaliacao.btnNovoClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
begin
  inherited;
  AVA := TuClassADP_AVALIACOES.Create;
  TRY
//    AVA.PAVALIACAO_DATA := edtDescricao.Text;
//    AVA.PATRIBUTO_COD := listCHA.KeyValue;
    if lblModo1.Caption = 'Inserindo' then
    begin
      if AVA.Salvar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := AVA.Consultar('');
            end
          else
            ShowMessage('Falha ao Incluir o Registro.');
    end else if lblModo1.Caption = 'Editando' then begin
      AVA.PINDICADOR_COD := gridRegistros.Columns[0].Field.Value;
      if AVA.Editar then
            begin
              lblModo1.Caption := 'Listando';
              tsVisualiza.Show;
              gridRegistros.DataSource := AVA.Consultar('');
            end
          else
            ShowMessage('Falha ao Editar o Registro.');
    end;
  FINALLY
    AVA.Free;
  END;
end;

procedure TfrmAvaliacao.Button1Click(Sender: TObject);
var
  INDICADORES: TuClassADP_INDICADORES;
  AVA: TuClassADP_AVALIACOES;
  ds: Tdatasource;
  i: integer;
begin
  AVA := TuClassADP_AVALIACOES.Create;
  INDICADORES := TuClassADP_INDICADORES.Create;
  try
  // busca indicadores
  i :=indicadores.Consultar('').DataSet.FieldCount;
  ShowMessage(IntToStr(i));
  // cria avaliacao para cada indicador
  // exibe na grid para preenchimento da nota
  finally
    AVA.FREE;
    INDICADORES.FREE;
  end;
end;

procedure TfrmAvaliacao.edtPesquisaChange(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
begin
  inherited;
  AVA := TuClassADP_AVALIACOES.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
       gridRegistros.DataSource := AVA.Consultar(' ADP_AVALIACOES.PESSOA_COD = '+edtPesquisa.Text);
      end
    else
      gridRegistros.DataSource := AVA.Consultar('');
  finally
    AVA.Free;
  end;
end;

procedure TfrmAvaliacao.FormShow(Sender: TObject);
vAR
  AVA: TuClassADP_AVALIACOES;
  i: TuClassADP_AVALIACAO_TIPO;
  c: TuClassGE_PESSOAS;
begin
  inherited;
  c := TuClassGE_PESSOAS.Create;
  i := TuClassADP_AVALIACAO_TIPO.Create;
  AVA := TuClassADP_AVALIACOES.Create;
  try
    gridRegistros.DataSource := ava.Consultar('');
    listTipoAva.ListSource := i.Consultar('');
    listColaborador.ListSource := c.Consultar('');
  finally
    ava.free;
    c.free;
    i.free;
  end;
end;

end.
