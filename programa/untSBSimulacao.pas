unit untSBSimulacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls;

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
  untSBFolhaPagamento, Lua;

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




 function LuaRunScript(event, colab: Integer ) : Real;
 var
  CONTEVE: TuClassSB_EVENTOS;
  formula:String;

  pL: ^lua_State;
  LuaResultado: real;



  

 begin
  try
    CONTEVE:= TuClassSB_EVENTOS.Create;
    CONTEVE.PEVENTO_COD:= IntToStr(event);
    CONTEVE.Carregar;

    formula:= CONTEVE.PFORMULA;

    // agora vai escrevendo o valor das variaveis na formula


























    // legal! Agora Buffa um interpretador LUA!!!Valeu UFRJ!!!
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
    CONTEVE.Free;
  end;
  
   lua_close(pL); // fecha
   Result := LuaResultado;
 end;



procedure TfrmSBSimulacao.simularClick(Sender: TObject);
var
  evento,pessoa:Integer;
  res: Real;
begin
  evento:= gridEventos.Columns[0].Field.Value;
  pessoa:= gridColab.Columns[0].Field.Value;

  res:= LuaRunScript(evento,pessoa);
  resultado.Text:= FloatToStr(res);
end;


end.
