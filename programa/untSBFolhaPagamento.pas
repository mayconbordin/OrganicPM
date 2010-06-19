unit untSBFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  DBCtrls;

type
  TfrmSBFolhaPagamento = class(TForm)
    gridEveVariaveis: TDBGrid;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    editColaborador: TLabeledEdit;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    dataInicial: TDateTimePicker;
    dataFinal: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    salarioFixo: TLabeledEdit;
    Label4: TLabel;
    gridBeneFixos: TDBGrid;
    Label5: TLabel;
    nomeColab: TLabeledEdit;
    DS: TDataSource;
    gridTemp: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit8: TLabeledEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBFolhaPagamento: TfrmSBFolhaPagamento;

implementation

uses uClassSB_FOLHA_PAGAMENTO, uClassGE_COLABORADORES,
  uClassFP_COLABORADOR_BENEFICIOS, uClassFP_COLABORADOR_SALARIOS,
  uClassGE_COLABORADORES_CARGO, uClassSB_COLABORADOR_EVENTOS, uClassSB_EVENTOS,
  uClassSB_EVENTOS_FOLHA, uClassSB_SALDO_FERIAS, Lua, uClassSB_TIPO_FOLHA,
  untSBSimulacao;

{$R *.dfm}

procedure TfrmSBFolhaPagamento.BitBtn2Click(Sender: TObject);
var
  PESSOA : TuClassGE_COLABORADORES; // dados desse carra enquanto colaborador
  CARGO : TuClassGE_COLABORADORES_CARGO; // dados do cargo
  SALARIO : TuClassFP_COLABORADOR_SALARIOS; // salario fixo
  BENEFICIOS : TuClassFP_COLABORADOR_BENEFICIOS; // beneficios de valor fixo
  EVENTOS : TuClassSB_COLABORADOR_EVENTOS; // os eventos associados a essa pessoa

  subTotalBeneficiosFixos, totalGanhos, totalDescontos, totalgeral :Real;
begin
  try
     PESSOA:= TuClassGE_COLABORADORES.Create;
     CARGO:= TuClassGE_COLABORADORES_CARGO.Create;
     SALARIO:= TuClassFP_COLABORADOR_SALARIOS.Create;
     BENEFICIOS:= TuClassFP_COLABORADOR_BENEFICIOS.Create;
     EVENTOS:= TuClassSB_COLABORADOR_EVENTOS.Create;

     // busca a pessoa conforme o codigo digitado
     PESSOA.PPESSOA_COD:= editColaborador.Text;
     PESSOA.Carregar;


     // agora busca os beneficios fixos dessa pessoa e coloca na grid
     // os que estao em data valida     -- > TO_DATE('2010-06-18 21:55:02', 'YYYY-MM-DD HH24:MI:SS')
     gridBeneFixos.DataSource:=  BENEFICIOS.Consultar('FP_COLABORADOR_BENEFICIOS.PESSOA_COD='+PESSOA.PPESSOA_COD);
                                  //  + ' and FP_COLABORADOR_BENEFICIOS.DATA_FINAL <= TO_DATE('+DateToStr(dataFinal.Date)+',''DD/MM/YYYY'')'
                                  //  + ' and FP_COLABORADOR_BENEFICIOS.DATA_INICIAL >= TO_DATE('+DateToStr(dataInicial.Date)+',''DD/MM/YYYY'')');

    // busca quais sao os eventos de valor variavel dessa pessoa
    gridEveVariaveis.DataSource:= EVENTOS.ConsultarDetalhes('GE_PESSOAS.PESSOA_COD='+PESSOA.PPESSOA_COD);

    // busca o salario fixo da pessoa

    DS:= SALARIO.Consultar('FP_COLABORADOR_SALARIOS.SALARIO_STATUS=''A'' '
                           +' and FP_COLABORADOR_SALARIOS.PESSOA_COD='+PESSOA.PPESSOA_COD );

    gridTemp.DataSource:= DS;
    salarioFixo.Text:= gridTemp.Columns[3].Field.Value;
    LabeledEdit6.Text:= gridTemp.Columns[3].Field.Value;

    DS:= PESSOA.ConsultaPessoaColaborador('GE_PESSOAS.PESSOA_COD='+PESSOA.PPESSOA_COD);
    gridTemp.DataSource:= DS;
    nomeColab.Text:= gridTemp.Columns[1].Field.Value;



    /// calculos




    ///  percirre a grid dos beneficios (FIXOS) e calcula
    subTotalBeneficiosFixos:=0;
    totalGanhos:=0;
    totalDescontos:= 0;
    totalgeral:= 0;

    gridBeneFixos.DataSource.DataSet.First;
    while (not gridBeneFixos.DataSource.DataSet.Eof) do
    begin
      subTotalBeneficiosFixos:= subTotalBeneficiosFixos + gridBeneFixos.DataSource.DataSet.FieldByName('VALOR').Value;

      // se eh um desconto
      if(gridBeneFixos.DataSource.DataSet.FieldByName('VALOR').Value < 0) then
        totalDescontos:= totalDescontos + gridBeneFixos.DataSource.DataSet.FieldByName('VALOR').Value;

      // se eh um provento, beneficio
      if(gridBeneFixos.DataSource.DataSet.FieldByName('VALOR').Value > 0) then
        totalGanhos:= totalGanhos + gridBeneFixos.DataSource.DataSet.FieldByName('VALOR').Value;

      gridBeneFixos.DataSource.DataSet.Next;
    end;
    LabeledEdit2.Text:= FloatToStr(subTotalBeneficiosFixos);
    LabeledEdit5.Text:= FloatToStr(totalGanhos);
    LabeledEdit4.Text:= FloatToStr(totalDescontos);
    

    // total dos beneficios fixos + salario fixo + eventos variveis
    totalgeral:= subTotalBeneficiosFixos +  StrToFloat(LabeledEdit6.Text);
    LabeledEdit1.Text:= FloatToStr(totalgeral);

    //frmSBSimulacao.LuaRunScript(1,1);
    

  finally
     PESSOA.Free;
     CARGO.Free;
     SALARIO.Free;
     BENEFICIOS.Free;
  end;

end;

procedure TfrmSBFolhaPagamento.CheckBox1Click(Sender: TObject);
begin
  if(CheckBox1.Checked) then
  begin
    BitBtn2.Visible:= False;
    editColaborador.Enabled:= False;
  end
  else
    begin
      BitBtn2.Visible:= True;
      editColaborador.Enabled:= True;
    end;
end;

procedure TfrmSBFolhaPagamento.FormShow(Sender: TObject);
var
  TIPOS : TuClassSB_TIPO_FOLHA; // lista de tipos
begin
  try
     TIPOS:= TuClassSB_TIPO_FOLHA.Create;
     // popula a lista de tipos
     DBLookupComboBox1.ListSource:= TIPOS.Consultar('');

     CheckBox1.Checked:= False;
     BitBtn2.Visible:= True;
     editColaborador.Enabled:= True;

  finally
    TIPOS.Free;
  end;

end;

end.
