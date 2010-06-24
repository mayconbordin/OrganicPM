unit untSBEventosFolha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBEventosFolha = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    DBGrid1: TDBGrid;
    LabeledEdit2: TLabeledEdit;
    DBGrid2: TDBGrid;
    LabeledEdit3: TLabeledEdit;
    DBGrid3: TDBGrid;
    LabeledEdit4: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventosFolha: TfrmSBEventosFolha;

implementation

uses uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBEventosFolha.btnNovoClick(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
begin
  inherited;
  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Visualizou os detalhes da folha de pagamento já processada');
  UTILS.Free;

end;

procedure TfrmSBEventosFolha.FormShow(Sender: TObject);
var
  UTILS: TuClassFuncoesGerais;
begin
  inherited;
  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a de visualização dos eventos de uma folha de pagamento (já processada)');
  UTILS.Free;

end;

end.
