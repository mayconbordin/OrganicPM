unit untTDResultadosObtidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmResultadosObtidos = class(TfrmModelo)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lkpTreinamentoCod: TDBLookupComboBox;
    lkpTurmaCod: TDBLookupComboBox;
    lkpTreinandoCod: TDBLookupComboBox;
    lkpObjetivoCod: TDBLookupComboBox;
    lkpResultadoCod: TDBLookupComboBox;
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResultadosObtidos: TfrmResultadosObtidos;

implementation

uses uClassTD_TREINANDOS, uClassTD_TREINAMENTOS, uClassTD_TURMAS,
 uClassTD_OBJETIVOS, uClassTD_RESULTADOS, uClassGE_PESSOAS;

{$R *.dfm}

procedure TfrmResultadosObtidos.btnEditarClick(Sender: TObject);
var
  TREINAMENTO: TuclassTD_TREINAMENTOS;
  TURMAS: TuclassTD_TURMAS;
  OBJETIVOS: TuclassTD_OBJETIVOS;
  ATRIBUTO: TuclassTD_TREINANDOS;
  RESULTADOS: TuclassTD_RESULTADOS;
begin
  inherited;
  lkptreinamentocod.Enabled := false;
  lkpturmacod.Enabled := false;
  lkptreinandocod.Enabled := false;
  lkpobjetivocod.Enabled := false;
  ATRIBUTO := TuclassTD_TREINANDOS.Create;
  try
    ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    lkpTreinamentoCod.KeyValue := ATRIBUTO.PTREINAMENTO_COD;
    lkpTurmaCod.KeyValue := ATRIBUTO.PTURMA_COD;
    lkpTreinandoCod.KeyValue := ATRIBUTO.PPESSOA_COD;
    lkpObjetivoCod.KeyValue := ATRIBUTO.POBJETIVO_COD;
    lkpResultadoCod.keyValue := ATRIBUTO.PRESULTADO_COD;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmResultadosObtidos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINANDOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_TREINANDOS.Create;
      try
        ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PTURMA_COD := gridRegistros.Columns[1].Field.Value;
        ATRIBUTO.PPESSOA_COD := gridRegistros.Columns[2].Field.Value;
        ATRIBUTO.POBJETIVO_COD := gridRegistros.Columns[3].Field.Value;
        ATRIBUTO.PRESULTADO_COD := gridRegistros.Columns[4].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;

end;

procedure TfrmResultadosObtidos.btnNovoClick(Sender: TObject);
begin
  inherited;
  lkptreinamentocod.Enabled := true;
  lkpturmacod.Enabled := true;
  lkptreinandocod.Enabled := true;
  lkpobjetivocod.Enabled := true;
end;

procedure TfrmResultadosObtidos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINANDOS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TREINANDOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PTREINAMENTO_COD := lkpTreinamentoCod.keyValue;
        ATRIBUTO.PTURMA_COD := lkpTurmaCod.KeyValue;
        ATRIBUTO.PPESSOA_COD :=  lkpTreinandoCod.KeyValue;
        ATRIBUTO.POBJETIVO_COD := lkpObjetivoCod.KeyValue;
        ATRIBUTO.PRESULTADO_COD := lkpResultadoCod.KeyValue;
        if ATRIBUTO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PTURMA_COD := gridRegistros.Columns[1].Field.Value;
        ATRIBUTO.PPESSOA_COD := gridRegistros.Columns[2].Field.Value;
        ATRIBUTO.POBJETIVO_COD := gridRegistros.Columns[3].Field.Value;
        ATRIBUTO.PRESULTADO_COD := gridRegistros.Columns[4].Field.Value;

        ATRIBUTO.PRESULTADO_COD := lkpResultadoCod.KeyValue;
        if ATRIBUTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    ATRIBUTO.Free;
  end;

  end;

procedure TfrmResultadosObtidos.FormShow(Sender: TObject);
var
   TREINAMENTOS: TuClassTD_TREINAMENTOS;
   ATRIBUTO: TuClassTD_TREINANDOS;
   TURMAS: TuClassTD_TURMAS;
   OBJETIVOS: TuClassTD_OBJETIVOS;
   RESULTADOS: TuClassTD_RESULTADOS;
   PESSOAS: TuClassGE_PESSOAS;
 begin
   inherited;
   TREINAMENTOS := TuClassTD_TREINAMENTOS.Create;
   ATRIBUTO := TuClassTD_TREINANDOS.Create;
   TURMAS := TuClassTD_TURMAS.Create;
   OBJETIVOS := TuClassTD_OBJETIVOS.Create;
   RESULTADOS := TuClassTD_RESULTADOS.Create;
   PESSOAS := TuClassGE_PESSOAS.Create;
   try
     //gridRegistros.DataSource := ATRIBUTO.Consultar('');
     lkpTreinamentoCod.ListSource := TREINAMENTOS.Consultar('');
     lkpTurmaCod.ListSource := TURMAS.Consultar('');
     lkpTreinandoCod.ListSource := PESSOAS.Consultar('');
     lkpObjetivoCod.ListSource := OBJETIVOS.Consultar('');
     lkpResultadoCod.ListSource := RESULTADOS.Consultar('');
     
   finally
     ATRIBUTO.Free;
   end;

   end;

end.
