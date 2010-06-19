unit untSBFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient;

type
  TfrmSBFolhaPagamento = class(TForm)
    gridEveVariaveis: TDBGrid;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    editColaborador: TLabeledEdit;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
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
    procedure BitBtn2Click(Sender: TObject);
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
  uClassSB_EVENTOS_FOLHA, uClassSB_SALDO_FERIAS, Lua;

{$R *.dfm}

procedure TfrmSBFolhaPagamento.BitBtn2Click(Sender: TObject);
var
  PESSOA : TuClassGE_COLABORADORES; // dados desse carra enquanto colaborador
  CARGO : TuClassGE_COLABORADORES_CARGO; // dados do cargo
  SALARIO : TuClassFP_COLABORADOR_SALARIOS; // salario fixo
  BENEFICIOS : TuClassFP_COLABORADOR_BENEFICIOS; // beneficios de valor fixo

  EVENTOS : TuClassSB_COLABORADOR_EVENTOS; // os eventos associados a essa pessoa



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
     // os que estao em data valida
     gridBeneFixos.DataSource:=  BENEFICIOS.Consultar('FP_COLABORADOR_BENEFICIOS.PESSOA_COD='+PESSOA.PPESSOA_COD
                                  +' and FP_COLABORADOR_BENEFICIOS.DATA_FINAL <='''+DateToStr(dataFinal.Date)+''''
                                  +' and FP_COLABORADOR_BENEFICIOS.DATA_INICIAL >='''+DateToStr(dataInicial.Date)+'''');

    // busca quais sao os eventos de valor variavel dessa pessoa
    gridEveVariaveis.DataSource:= EVENTOS.ConsultarDetalhes('GE_PESSOAS.PESSOA_COD='+PESSOA.PPESSOA_COD);

    // busca o salario fixo da pessoa

    DS:= SALARIO.Consultar('FP_COLABORADOR_SALARIOS.SALARIO_STATUS=''A'' '
                           +' and FP_COLABORADOR_SALARIOS.PESSOA_COD='+PESSOA.PPESSOA_COD );

    gridTemp.DataSource:= DS;
    salarioFixo.Text:= gridTemp.Columns[3].Field.Value;

    DS:= PESSOA.ConsultaPessoaColaborador('GE_PESSOAS.PESSOA_COD='+PESSOA.PPESSOA_COD);
    gridTemp.DataSource:= DS;
    nomeColab.Text:= gridTemp.Columns[1].Field.Value;



  finally
     PESSOA.Free;
     CARGO.Free;
     SALARIO.Free;
     BENEFICIOS.Free;
  end;
  
end;

end.
