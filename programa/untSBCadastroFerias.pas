unit untSBCadastroFerias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBCadastroFerias = class(TfrmModelo)
    DBGrid1: TDBGrid;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBCadastroFerias: TfrmSBCadastroFerias;

implementation

uses uClassSB_CADASTRO_FERIAS, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmSBCadastroFerias.FormShow(Sender: TObject);
var
  FERIAS: TuClassSB_CADASTRO_FERIAS;
  COLABORADORES : TuClassGE_COLABORADORES;
begin
  inherited;
  FERIAS.Create;
  COLABORADORES:= TuClassGE_COLABORADORES.Create;
  try
    gridRegistros.DataSource:= FERIAS.Consultar('');
    DBGrid1.DataSource:= COLABORADORES.ConsultaPessoaColaborador('');
  finally
    FERIAS.Free;
  end;


end;

end.
