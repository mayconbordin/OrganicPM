unit untADP_Avaliacao;

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, DB, ADODB;

type
  TfrmAvaliacao = class(TfrmModelo)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    listColaborador: TDBLookupComboBox;
    listTipoAva: TDBLookupComboBox;
    Button1: TButton;
    DBGridAvaliacao: TDBGrid;
    Label5: TLabel;
    data: TDateTimePicker;
    Label6: TLabel;
    edtNome: TEdit;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAvaliacao: TfrmAvaliacao;

implementation

uses uClassADP_AVALIACOES, uClassADP_INDICADORES, uClassADP_AVALIACAO_TIPO,
  uClassGE_PESSOAS, SysUtils;

{$R *.dfm}

procedure TfrmAvaliacao.btnCancelClick(Sender: TObject);
var
  AVA: TuClassADP_AVALIACOES;
begin
  inherited;
  AVA := TuClassADP_AVALIACOES.Create;
  try
    gridRegistros.DataSource := AVA.Consultar('');
  finally
    AVA.Free;
  end;
end;

procedure TfrmAvaliacao.btnExcluirClick(Sender: TObject);
var
  a: TuClassADP_AVALIACOES;
begin
  inherited;
  if (MessageDlg('Excluir [TODOS] os Registros?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
  a := TuClassADP_AVALIACOES.Create;
  a.Excluir;
  gridRegistros.DataSource := a.Consultar('');
  a.free;
    end;
end;

procedure TfrmAvaliacao.btnSalvarClick(Sender: TObject);
var
  a: TuClassADP_AVALIACOES;
begin
  inherited;
  a := TuClassADP_AVALIACOES.Create;
  // PERCORRE GRID PEGANDO NOTAS E ATUALIZANDO NO BANCO
  try
    DBGridAvaliacao.DataSource.DataSet.First;
    while not DBGridAvaliacao.DataSource.DataSet.Eof do
    begin
      a.PAVALIACAO_DATA := DateToStr(data.date);
      a.PPESSOA_COD := listColaborador.KeyValue;
      a.pTIPO := listTipoAva.KeyValue;
      a.PINDICADOR_COD := DBGridAvaliacao.DataSource.DataSet.FieldByName('INDICADOR_COD').AsString;
      a.PNOTA := DBGridAvaliacao.DataSource.DataSet.FieldByName('NOTA').AsString;
      a.Editar;
      DBGridAvaliacao.DataSource.DataSet.Next;
    end;
  finally
    a.free;
  end;
end;

procedure TfrmAvaliacao.Button1Click(Sender: TObject);
var
  INDICADORES: TuClassADP_INDICADORES;
  AVA: TuClassADP_AVALIACOES;
  ds: Tdatasource;
  c,c1,c2:string;
begin
  AVA := TuClassADP_AVALIACOES.Create;
  INDICADORES := TuClassADP_INDICADORES.Create;
  try
    // busca indicadores
    ds := indicadores.Consultar('');
    // cria avaliacao para cada indicador
    ds.DataSet.First;
    while not ds.dataset.Eof do
    begin
      ava.PAVALIACAO_DATA := DateToStr(data.date);
      ava.PPESSOA_COD := listColaborador.KeyValue;
      ava.pTIPO := listTipoAva.KeyValue;
      if edtNome.Text <> '' then
        ava.PAVALIADOR_NOME := edtNome.Text
      else
        ava.PAVALIADOR_NOME := 'Não Informado';
      AVA.PINDICADOR_COD := ds.DataSet.FieldByName('INDICADOR_COD').AsString;
      ava.Salvar;
      ds.DataSet.Next;
    end;

    // exibe na grid para preenchimento da nota
    c1 := listColaborador.KeyValue;
    c2 := listTipoAva.KeyValue;
    c := 'ADP_AVALIACOES.AVALIACAO_DATA = TO_DATE('''+DateToStr(data.date)+''',''DD/MM/RR'') AND ADP_AVALIACOES.PESSOA_COD = '+c1+' AND ADP_AVALIACOES.TIPO = '+c2;
    //ShowMessage(c);
    DBGridAvaliacao.DataSource := ava.Consultar(c);
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
