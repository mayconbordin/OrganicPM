unit untSBInvestimentosSalarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls;

type
  TfrmSBInvestimentoSalario = class(TForm)
    dtpInicial: TDateTimePicker;
    dtpFinal: TDateTimePicker;
    gridRegistros: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBInvestimentoSalario: TfrmSBInvestimentoSalario;

implementation

uses uClassSB_FOLHA_PAGAMENTO;

{$R *.dfm}

procedure TfrmSBInvestimentoSalario.Button1Click(Sender: TObject);
var
  SALA: TuClassSB_FOLHA_PAGAMENTO;
begin
  try
    SALA:= TuClassSB_FOLHA_PAGAMENTO.Create;
{                                  +' and FP_COLABORADOR_BENEFICIOS.DATA_FINAL >= TO_DATE('''+DateToStr(dataFinal.Date)+''',''DD/MM/YYYY'')'
                                  + ' and FP_COLABORADOR_BENEFICIOS.DATA_INICIAL <= TO_DATE('''+DateToStr(dataInicial.Date)+''',''DD/MM/YYYY'')');
}

    gridRegistros.DataSource:= SALA.Consultar(' rownum<=20 order by(SB_FOLHA_PAGAMENTO.FOL_PAG_COD) DESC');
  finally
    SALA.Free;
  end;
end;

procedure TfrmSBInvestimentoSalario.FormShow(Sender: TObject);
var
  SALA: TuClassSB_FOLHA_PAGAMENTO;
begin
  try
    SALA:= TuClassSB_FOLHA_PAGAMENTO.Create;
    gridRegistros.DataSource:= SALA.Consultar('');
  finally
    SALA.Free;
  end;
  
end;

end.
