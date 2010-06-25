unit untSBSaldoFerias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls, DB,
  DBClient;

type
  TfrmSBSaldoFerias = class(TfrmModelo)
    procedure FormShow(Sender: TObject);
    procedure gridRegistrosDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBSaldoFerias: TfrmSBSaldoFerias;

implementation

uses uClassFuncoesGerais, uClassSB_SALDO_FERIAS;

{$R *.dfm}

procedure TfrmSBSaldoFerias.btnExcluirClick(Sender: TObject);
var
  FER: TuClassSB_SALDO_FERIAS;
  UTILS: TuClassFuncoesGerais;  
begin
  inherited;

  try
    FER:= TuClassSB_SALDO_FERIAS.Create;
    UTILS:= TuClassFuncoesGerais.Create;    
    FER.PPESSOA_COD:= gridRegistros.Columns[0].Field.Value;
    FER.PFOL_PAG_COD:= gridRegistros.Columns[1].Field.Value;

    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
        if(FER.Excluir) then
        begin
          UTILS.GravaLog('Excluido registro de meses trabalhados da pessoa ');
          lblModo1.Caption:= 'Listando';
          gridRegistros.DataSource:= FER.Consultar('');
          tsVisualiza.Show;
      
        end;
    end;
  finally
    FER.Free;
    UTILS.Free;    
  end;
end;

procedure TfrmSBSaldoFerias.edtPesquisaChange(Sender: TObject);
begin
  inherited;
    gridRegistros.DataSource.DataSet.Locate('NOME',edtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmSBSaldoFerias.FormShow(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
  FER: TuClassSB_SALDO_FERIAS;
begin
  inherited;
  try
    UTILS:= TuClassFuncoesGerais.Create;
    FER:= TuClassSB_SALDO_FERIAS.Create;
    UTILS.GravaLog('Acesso a tela de consulta de mêses de trabalho que um colaborador já compensou');  
    gridRegistros.DataSource:= FER.Consultar('');
    
  finally
    UTILS.Free;
    FER.Free;
  end;
end;

procedure TfrmSBSaldoFerias.gridRegistrosDblClick(Sender: TObject);
begin
  inherited;
  lblModo1.Caption:= 'Listando';
  tsVisualiza.Show;
end;

end.
