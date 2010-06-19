unit untTdRelTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, DB, ADODB, RpDefine,
  RpCon, RpConDS, RpBase, RpSystem, RpRave;

type
  TfrmTdRelTurmas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    lkpTreinamentos: TDBLookupComboBox;
    Label2: TLabel;
    GridTurmas: TDBGrid;
    QryTurmas: TADOQuery;
    RvDsTurmas: TRvDataSetConnection;
    QryTurmasTURMA: TStringField;
    QryTurmasDATA_INICIAL: TDateField;
    QryTurmasDATA_FINAL: TDateField;
    QryTurmasNOME: TStringField;
    RvTD: TRvProject;
    RvSTd: TRvSystem;
    QryColaboradores: TADOQuery;
    RvDsColaboradores: TRvDataSetConnection;
    QryColaboradoresNOME: TStringField;
    QryColaboradoresDATA_ADMISSAO: TDateField;
    procedure FormShow(Sender: TObject);
    procedure lkpTreinamentosClick(Sender: TObject);
    procedure GridTurmasDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTdRelTurmas: TfrmTdRelTurmas;

implementation

uses uClassTD_TREINAMENTOS, uClassTdRelatorios, uClassConexao;

{$R *.dfm}

procedure TfrmTdRelTurmas.FormShow(Sender: TObject);
var
  TREINAMENTO: TuClassTD_TREINAMENTOS;
begin
  TREINAMENTO := TuClassTD_TREINAMENTOS.Create;
  try
    lkpTreinamentos.ListSource := TREINAMENTO.Consultar('');
  finally
    TREINAMENTO.Free;
  end;
end;

procedure TfrmTdRelTurmas.GridTurmasDblClick(Sender: TObject);
begin
  QryTurmas.Connection := TuClassConexao.ObtemConexao;
  QryTurmas.Close;
  QryTurmas.Parameters[0].Value := GridTurmas.Columns[0].Field.Value;
  QryTurmas.Open;

  QryColaboradores.Connection := TuClassConexao.ObtemConexao;
  QryColaboradores.Close;
  QryColaboradores.Parameters[0].Value := GridTurmas.Columns[0].Field.Value;
  QryColaboradores.Open;

  RvTD.Close;
  RvTD.ExecuteReport('rptTurmas');
  RvTD.Open;
end;

procedure TfrmTdRelTurmas.lkpTreinamentosClick(Sender: TObject);
var
  TDRELATORIO: TuClassTdRelatorios;
begin
  TDRELATORIO := TuClassTdRelatorios.Create;
  try
    GridTurmas.DataSource := TDRELATORIO.TurmasTreinamentos(lkpTreinamentos.KeyValue);
  finally
    TDRELATORIO.Free;
  end;
end;

end.
