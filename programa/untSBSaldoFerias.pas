unit untSBSaldoFerias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBSaldoFerias = class(TfrmModelo)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBSaldoFerias: TfrmSBSaldoFerias;

implementation

uses uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBSaldoFerias.FormShow(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
begin
  inherited;
  
  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a tela de consulta de mêses de trabalho que um colaborador já compensou');
  UTILS.Free;

end;

end.
