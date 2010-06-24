unit untSBFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, DB, DBClient,
  DBCtrls,DateUtils, ValEdit, Gauges;

type
  TfrmSBFolhaPagamento = class(TForm)
    data: TBitBtn;
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
    StringGrid1: TStringGrid;
    Gauge1: TGauge;
    Edit1: TEdit;
    DS2: TDataSource;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure dataClick(Sender: TObject);
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
  untSBSimulacao, uClassSB_CADASTRO_FERIAS, uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBFolhaPagamento.dataClick(Sender: TObject);
var
  FOLHA: TuClassSB_FOLHA_PAGAMENTO;
  EVENTOSFOLHA: TuClassSB_EVENTOS_FOLHA;
  FERIAS:TuClassSB_SALDO_FERIAS;
  
  UTILS: TuClassFuncoesGerais;
  idf, iCount: Integer;

  COLAB: TuClassFP_COLABORADOR_SALARIOS;
begin
  try
    FOLHA:= TuClassSB_FOLHA_PAGAMENTO.Create;
    EVENTOSFOLHA:= TuClassSB_EVENTOS_FOLHA.Create;
    UTILS:= TuClassFuncoesGerais.Create;
    COLAB:= TuClassFP_COLABORADOR_SALARIOS.Create;


    // apenas deste colaborador -> Já esta tudo na tela calculado
    if(CheckBox1.Checked = False) then
    begin
      FOLHA.PTIP_FOL_COD := DBLookupComboBox1.KeyValue;
      FOLHA.PPESSOA_COD := editColaborador.Text;
      FOLHA.PTOTAL_PROVENTOS := StringReplace(LabeledEdit5.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
      FOLHA.PTOTAL_DESCONTOS := StringReplace(LabeledEdit4.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
      FOLHA.PTOTAL_REMUNERACAO := StringReplace(LabeledEdit1.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
      FOLHA.PDATA_INICIAL:= DateToStr(dataInicial.Date);
      FOLHA.PDATA_FINAL:= DateToStr(dataFinal.Date);
      FOLHA.PCARGO_COD:= Edit1.Text;
      idf:= UTILS.UltimoID('SB_FOLHA_PAGAMENTO','FOL_PAG_COD');
      FOLHA.PFOL_PAG_COD:= IntToStr(idf+1);

      if(FOLHA.Salvar) then
      begin
        UTILS.GravaLog('Salvou folha de pagamento do colaborador '+editColaborador.Text);
        FERIAS:= TuClassSB_SALDO_FERIAS.Create;
        FERIAS.PPESSOA_COD:= editColaborador.Text;
        // vai e busca de novo (sho pra garantir) o ID dessa folha
        idf:= UTILS.UltimoID('SB_FOLHA_PAGAMENTO','FOL_PAG_COD');
        FERIAS.PFOL_PAG_COD:= IntToStr(idf);
        FERIAS.PMESES_TRABALHADOS:= '1';
        FERIAS.Salvar;

        // para cada evento variavel grava quanto deu
        iCount:= 1;
        while (iCount <  StringGrid1.RowCount) do
        begin
           EVENTOSFOLHA.PPESSOA_COD:= editColaborador.Text;
           EVENTOSFOLHA.PFOL_PAG_COD:= IntToStr(idf);
           EVENTOSFOLHA.PEVENTO_COD:= StringGrid1.Cells[0,iCount];
           EVENTOSFOLHA.PVALOR:= StringReplace(StringGrid1.Cells[2,iCount],',','.',[rfReplaceAll, rfIgnoreCase]);

           // se salvou nos eventos da folha ...
           if(EVENTOSFOLHA.Salvar) then
           begin
              UTILS.GravaLog('[Folha '+IntToStr(idf)+']Salvou o evento '+EVENTOSFOLHA.PEVENTO_COD+' da folha de pagamento do colaborador '+editColaborador.Text);
           end;

           Inc(iCount);
        end;
      end;

    end;

    // tem que montar de todos os colaboradores
    if (CheckBox1.Checked = True) then
    begin
      Gauge1.Progress:= 0;
      DS2:= COLAB.Consultar('FP_COLABORADOR_SALARIOS.SALARIO_STATUS = ''A'' ');
      Gauge1.Visible:= True;
      Gauge1.MaxValue:= DS2.DataSet.RecordCount;
      // agora passa cada um desses caras e manda gravar a folha
      DS2.DataSet.First;
      while (not DS2.DataSet.Eof) do
      begin
        // passa para o editColaborador quem eh e manda carregar os dados
        editColaborador.Text:= DS2.DataSet.FieldByName('PESSOA_COD').AsString;

        // seta que eh para gerar individual
        CheckBox1.Checked:= False;

        // manda dar o clique no botão que calcula
        BitBtn2.Click;

        // clica no gerrar folha que eh o if acima
        data.Click; // bueno, agora gerou a folha (para nao precisar implemnetar de novo)


        Gauge1.Progress:= (Gauge1.Progress+1);
        DS2.DataSet.Next;
      end;

      // checa de novo o chechedbox
      CheckBox1.Checked:= True;

    end;

  finally
    FOLHA.Free;
    EVENTOSFOLHA.Free;
    UTILS.Free;
    FERIAS.Free;
    COLAB.Free;
  end;

end;

procedure TfrmSBFolhaPagamento.BitBtn2Click(Sender: TObject);
var
  PESSOA : TuClassGE_COLABORADORES; // dados desse carra enquanto colaborador
  CARGO : TuClassGE_COLABORADORES_CARGO; // dados do cargo
  SALARIO : TuClassFP_COLABORADOR_SALARIOS; // salario fixo
  BENEFICIOS : TuClassFP_COLABORADOR_BENEFICIOS; // beneficios de valor fixo
  EVENTOS : TuClassSB_COLABORADOR_EVENTOS; // os eventos associados a essa pessoa

  subTotalBeneficiosFixos, totalGanhos, totalDescontos, totalgeral :Real;
  subtotalBeneficiosVariaveis, tempResult, salBase, INSS : Real;
  colaborador, evento, iCount: Integer;
  temp: string;
  UTILS: TuClassFuncoesGerais;
begin
  try
     UTILS:= TuClassFuncoesGerais.Create;
     UTILS.GravaLog('Calculado a folha do colaborador '+editColaborador.Text);

     PESSOA:= TuClassGE_COLABORADORES.Create;
     CARGO:= TuClassGE_COLABORADORES_CARGO.Create;
     SALARIO:= TuClassFP_COLABORADOR_SALARIOS.Create;
     BENEFICIOS:= TuClassFP_COLABORADOR_BENEFICIOS.Create;
     EVENTOS:= TuClassSB_COLABORADOR_EVENTOS.Create;

     // busca a pessoa conforme o codigo digitado
     PESSOA.PPESSOA_COD:= editColaborador.Text;
     PESSOA.Carregar;


     // agora busca os beneficios fixos dessa pessoa e coloca na grid
     gridBeneFixos.DataSource:=  BENEFICIOS.Consultar('FP_COLABORADOR_BENEFICIOS.PESSOA_COD='+PESSOA.PPESSOA_COD
                                  +' and FP_COLABORADOR_BENEFICIOS.DATA_FINAL >= TO_DATE('''+DateToStr(dataFinal.Date)+''',''DD/MM/YYYY'')'
                                  + ' and FP_COLABORADOR_BENEFICIOS.DATA_INICIAL <= TO_DATE('''+DateToStr(dataInicial.Date)+''',''DD/MM/YYYY'')');

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







    // calcula os valores dos beneficios de valor variavel

    // busca quais sao os eventos de valor variavel dessa pessoa
    DS:= EVENTOS.ConsultarDetalhes('GE_PESSOAS.PESSOA_COD='+PESSOA.PPESSOA_COD);

    subtotalBeneficiosVariaveis:= 0;
    DS.DataSet.First;
    iCount:= 1;
    while(not DS.DataSet.Eof) do
    begin
      StringGrid1.Cells[0,iCount]:= DS.DataSet.FieldByName('EVENTO_COD').AsString;
      StringGrid1.Cells[1,iCount]:= DS.DataSet.FieldByName('DESCRICAO').AsString;

      tempResult:= 0;
      StringGrid1.RowCount:= iCount+1;
      tempResult:= frmSBSimulacao.LuaRunScript(frmSBSimulacao.LuaPrepareScript(DS.DataSet.FieldByName('EVENTO_COD').AsInteger,StrToInt(PESSOA.PPESSOA_COD)));
      StringGrid1.Cells[2,iCount]:= FloatToStr(tempResult);

      subtotalBeneficiosVariaveis:= subtotalBeneficiosVariaveis + tempResult;

      // se eh um desconto
      if(tempResult < 0) then
        totalDescontos:= totalDescontos + tempResult;
      // se eh um provento, beneficio
      if(tempResult > 0) then
        totalGanhos:= totalGanhos + tempResult;

      Inc(iCount);
      DS.DataSet.Next;
    end;




    LabeledEdit2.Text:= FloatToStr(subTotalBeneficiosFixos);
    LabeledEdit8.Text:= FloatToStr(subtotalBeneficiosVariaveis);

    LabeledEdit5.Text:= FloatToStr(totalGanhos);
    LabeledEdit4.Text:= FloatToStr(totalDescontos);

    // FGTS e INSS
    salBase:= StrToFloat(LabeledEdit6.Text);

    INSS:= 354.08; // comeca com o valor mais alto

    if(salBase <= 965.67) then
      INSS:= salBase * 0.08;

    if ((salBase <= 1609.45) and (salBase > 965.67)) then
      INSS:= salBase * 0.09;

    if ((salBase <= 3218.90) and (salBase > 1609.45)) then
      INSS:= salBase * 0.11;


     // total dos beneficios fixos + salario fixo + eventos variveis - FGTS/INSS
    totalgeral:= subTotalBeneficiosFixos +  StrToFloat(LabeledEdit6.Text) - INSS + subtotalBeneficiosVariaveis;
    LabeledEdit1.Text:= FloatToStr(totalgeral);

    LabeledEdit3.Text:= FloatToStr(INSS);

    CARGO.PPESSOA_COD:= PESSOA.PPESSOA_COD;
    CARGO.MaiorTempoServico;
    Edit1.Text:= CARGO.PCARGO_COD;


  finally
     PESSOA.Free;
     CARGO.Free;
     SALARIO.Free;
     BENEFICIOS.Free;
     UTILS.Free;
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
  UTILS: TuClassFuncoesGerais;
begin

  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a tela de folha de pagamento');
  UTILS.Free;

  try
      StringGrid1.Cells[0,0]:= 'Evento';
      StringGrid1.Cells[1,0]:= 'Descrição';
      StringGrid1.Cells[2,0]:= 'Valor';

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
