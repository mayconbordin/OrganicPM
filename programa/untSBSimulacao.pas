unit untSBSimulacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls;

type
  TfrmSBSimulacao = class(TForm)
    LabeledEdit1: TLabeledEdit;
    Button1: TButton;
    LabeledEdit2: TLabeledEdit;
    Label1: TLabel;
    gridColab: TDBGrid;
    gridEventos: TDBGrid;
    Label2: TLabel;
    DBRichEdit1: TDBRichEdit;
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBSimulacao: TfrmSBSimulacao;

implementation

uses uClassGE_COLABORADORES, uClassSB_EVENTOS;

{$R *.dfm}

procedure TfrmSBSimulacao.FormShow(Sender: TObject);
  var
  COLABORADOR: TuClassGE_COLABORADORES;
  EVENTOS: TuClassSB_EVENTOS;
begin
  try
    COLABORADOR:= TuClassGE_COLABORADORES.Create;
    EVENTOS:= TuClassSB_EVENTOS.Create;

    gridColab.DataSource:= COLABORADOR.ConsultaPessoaColaborador('');
    gridEventos.DataSource:= EVENTOS.Consultar('');
    DBRichEdit1.DataSource:= gridEventos.DataSource;

  finally
    COLABORADOR.Free;
    EVENTOS.Free;
  end;
end;

procedure TfrmSBSimulacao.LabeledEdit2Change(Sender: TObject);
var
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  try
    COLABORADOR:= TuClassGE_COLABORADORES.Create;
    gridColab.DataSource:= COLABORADOR.ConsultaPessoaColaborador('NOME like ''%'+LabeledEdit2.Text+'%''');
  finally
    COLABORADOR.Free;
  end;

end;

end.
