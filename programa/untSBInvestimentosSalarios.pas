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
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  a,b,c: Real;
begin
  try
    SALA:= TuClassSB_FOLHA_PAGAMENTO.Create;
    gridRegistros.DataSource:= SALA.Consultar(' SB_FOLHA_PAGAMENTO.DATA_INICIAL >= TO_DATE('''+DateToStr(dtpInicial.Date)+''',''DD/MM/YYYY'')'
                                + ' and SB_FOLHA_PAGAMENTO.DATA_FINAL <= TO_DATE('''+DateToStr(dtpFinal.Date)+''',''DD/MM/YYYY'')'
                                +'order by(SB_FOLHA_PAGAMENTO.FOL_PAG_COD) DESC');

  a:= 0;
  b:= 0;
  c:= 0;


  gridRegistros.DataSource.DataSet.First;
  while (not gridRegistros.DataSource.DataSet.Eof) do
  begin
     a:= a + gridRegistros.Columns[3].Field.AsFloat;
     b:= b + gridRegistros.Columns[4].Field.AsFloat;
     c:= c + gridRegistros.Columns[5].Field.AsFloat;
     
    gridRegistros.DataSource.DataSet.Next;
  end;

  LabeledEdit2.Text:= FloatToStr(a);
  LabeledEdit3.Text:= FloatToStr(b);
  LabeledEdit1.Text:= FloatToStr(c);

  finally
    SALA.Free;
  end;
end;

procedure TfrmSBInvestimentoSalario.Button2Click(Sender: TObject);
begin
  dtpInicial.Date:= IncMonth(dtpInicial.Date);
  dtpFinal.Date:= IncMonth(dtpFinal.Date);

  Button1.Click;
end;

procedure TfrmSBInvestimentoSalario.Button3Click(Sender: TObject);
begin
  dtpInicial.Date:= IncMonth(dtpInicial.Date,-1);
  dtpFinal.Date:= IncMonth(dtpFinal.Date,-1);

  Button1.Click;
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
