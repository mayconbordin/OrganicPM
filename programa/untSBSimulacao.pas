unit untSBSimulacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, DateUtils, DB;

type
  TfrmSBSimulacao = class(TForm)
    resultado: TLabeledEdit;
    simular: TButton;
    LabeledEdit2: TLabeledEdit;
    Label1: TLabel;
    gridColab: TDBGrid;
    gridEventos: TDBGrid;
    Label2: TLabel;
    DBRichEdit1: TDBRichEdit;
    Label3: TLabel;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure gridColabDblClick(Sender: TObject);
    procedure simularClick(Sender: TObject);
    
   // function LuaRunScript(colab:Integer; event:Integer): Real;

  private
    { Private declarations }
  public


  end;

var
  frmSBSimulacao: TfrmSBSimulacao;

implementation

uses uClassGE_COLABORADORES, uClassSB_EVENTOS, untFpColaboradorSalarios,
  untSBFolhaPagamento, Lua, uClassFP_COLABORADOR_SALARIOS, uClassGE_PESSOAS,
  uClassFP_COLABORADOR_DEPENDENTES, uClassGE_COLABORADORES_CARGO;

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

procedure TfrmSBSimulacao.gridColabDblClick(Sender: TObject);
begin
  Label4.Caption:= gridColab.Columns[1].Field.Value;
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




procedure SaveFile(const FileName: TFileName;
                   const content: string);
begin
  with TFileStream.Create(FileName, fmCreate) do
    try
      Write(Pointer(content)^, Length(content));
    finally
      Free;
    end;
end;



function LuaPrepareScript(event, colab: Integer ) : String;
var
  formula, temp :String;
  CONTEVE: TuClassSB_EVENTOS;

  SALARIO_FIXO:TuClassFP_COLABORADOR_SALARIOS; // obter salario_fixo
  IDADE: TuClassGE_PESSOAS;
  DEPEND: TuClassFP_COLABORADOR_DEPENDENTES;
  ANOS_SERV : TuClassGE_COLABORADORES_CARGO;

  nascimento:TDate;
  ds: TDataSource;
begin

  try
    CONTEVE:= TuClassSB_EVENTOS.Create;
    CONTEVE.PEVENTO_COD:= IntToStr(event);
    CONTEVE.Carregar;

    formula:= CONTEVE.PFORMULA;

    // agora vai escrevendo o valor das variaveis na formula

    // salario_fixo
    SALARIO_FIXO:= TuClassFP_COLABORADOR_SALARIOS.Create;
    SALARIO_FIXO.PPESSOA_COD:= IntToStr(colab);
    SALARIO_FIXO.SalarioAtual;

    // the new formula value ...
    formula  := StringReplace(formula, 'salario_fixo',SALARIO_FIXO.PSALARIO_VALOR,[rfReplaceAll, rfIgnoreCase]);


    // idade  e mes_aniversario
    IDADE:= TuClassGE_PESSOAS.Create;
    IDADE.PPESSOA_COD:= IntToStr(colab);
    IDADE.Carregar;
    nascimento:= StrToDate(IDADE.PDATA_NASC);

    // mes_aniversario
    temp:= IntToStr(MonthOf(nascimento));
    formula  := StringReplace(formula, 'mes_aniversario',temp,[rfReplaceAll, rfIgnoreCase]);

    // idade
    temp:= IntToStr(YearOf(Now) - YearOf(nascimento));
    formula  := StringReplace(formula, 'idade',temp,[rfReplaceAll, rfIgnoreCase]);

    // nro_dependentes
    DEPEND:= TuClassFP_COLABORADOR_DEPENDENTES.Create;
    ds:= DEPEND.Consultar('FP_COLABORADOR_DEPENDENTES.PESSOA_COD='+IntToStr(colab));

    temp:= IntToStr(ds.DataSet.RecordCount);
    formula  := StringReplace(formula, 'nro_dependentes',temp,[rfReplaceAll, rfIgnoreCase]);

    // nro_dependentes_estudantes
    ds:= DEPEND.Consultar('FP_COLABORADOR_DEPENDENTES.ESTUDANTE=''S'' '+
                           ' and FP_COLABORADOR_DEPENDENTES.PESSOA_COD='+IntToStr(colab));

    temp:= IntToStr(ds.DataSet.RecordCount);
    formula  := StringReplace(formula, 'nro_estudantes_dependentes',temp,[rfReplaceAll, rfIgnoreCase]);


    // anos_servico
    ANOS_SERV:= TuClassGE_COLABORADORES_CARGO.Create;
    ANOS_SERV.PPESSOA_COD:= IntToStr(colab);
    ANOS_SERV.MaiorTempoServico;

    // ano de agora nenos o ano de entrada no cargo (mais antiga)
    temp:=  IntToStr( YearOf(Now) -  YearOf(StrToDate(ANOS_SERV.PDATA_INICIAL)) );
    formula  := StringReplace(formula, 'anos_servico',temp,[rfReplaceAll, rfIgnoreCase]);



  finally
    CONTEVE.Free;
    SALARIO_FIXO.Free;
    IDADE.Free;
    DEPEND.Free;
    ANOS_SERV.Free;

  end;
  Result:= formula;
end;


function LuaRunScript(formula:String) : Real;
 var
  pL: ^lua_State;
  LuaResultado: real;
begin
  try
    pL:= lua_open();

    // habilita  as bibliotecas padrão de lua
    luaopen_base(pL);
    luaopen_string(pL);
    luaopen_table(pL);
    luaopen_math(pL);
    luaopen_io(pL);

    // passa ele para o interpretador
    lua_dostring(pL,PAnsiChar(formula));

    lua_settop(pL,0);// reseta a pilha
    lua_getglobal(pL,'resultado');

    LuaResultado := lua_tonumber(pL,1); // pegando o item 1 da pilha

  finally

  end;

   lua_close(pL);
   Result := LuaResultado;
 end;



procedure TfrmSBSimulacao.simularClick(Sender: TObject);
var
  evento,pessoa:Integer;
  res: Real;
begin
  evento:= gridEventos.Columns[0].Field.Value;
  pessoa:= gridColab.Columns[0].Field.Value;

  Memo1.Clear;

  // Local de debug ...
  Memo1.Text := LuaPrepareScript(evento,pessoa);

  res:= LuaRunScript(LuaPrepareScript(evento,pessoa));
  resultado.Text:= FloatToStr(res);
end;


end.
