unit untSBColaboradorEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBColaboradorEvento = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBColaboradorEvento: TfrmSBColaboradorEvento;

implementation

uses uClassSB_COLABORADOR_EVENTOS, uClassGE_COLABORADORES, uClassSB_EVENTOS;

{$R *.dfm}

procedure TfrmSBColaboradorEvento.FormShow(Sender: TObject);
var
  EVENTOS : TuClassSB_COLABORADOR_EVENTOS;
  CADEVE : TuClassSB_EVENTOS;
  PESSOA: TuClassGE_COLABORADORES;
begin
  inherited;
  try
    EVENTOS:= TuClassSB_COLABORADOR_EVENTOS.Create;
    CADEVE:= TuClassSB_EVENTOS.Create;
    PESSOA:= TuClassGE_COLABORADORES.Create;
    
    gridRegistros.DataSource:= EVENTOS.ConsultarDetalhes('');
    DBGrid1.DataSource:= PESSOA.ConsultaPessoaColaborador('');
    DBGrid2.DataSource:= CADEVE.Consultar('');
  finally
    EVENTOS.Free;
    PESSOA.Free;
    CADEVE.Free;
  end;



end;

end.
