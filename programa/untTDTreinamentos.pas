unit untTDTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDTreinamentos = class(TfrmModelo)
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DtInicio: TDateTimePicker;
    DtFim: TDateTimePicker;
    lkpTurma: TDBLookupComboBox;
    lkpObjetivo: TDBLookupComboBox;
    lkpMetodo: TDBLookupComboBox;
    lkpInstrutor: TDBLookupComboBox;
    lkpTecnica: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDTreinamentos: TfrmTDTreinamentos;

implementation

uses uClassTD_TREINAMENTOS, uClassTD_TURMAS, uClassTD_OBJETIVOS,
  uClassTD_METODOS, uClassTD_INSTRUTORES, uClassTD_TECNICAS;

{$R *.dfm}

procedure TfrmTDTreinamentos.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
  TURMAS: TuClassTD_TURMAS;
  OBJETIVOS: TuClassTD_OBJETIVOS;
  METODOS: TuClassTD_METODOS;
  INSTRUTORES: TuClassTD_INSTRUTORES;
  TECNICAS: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TREINAMENTOS.Create;
  TURMAS:= TuClassTD_TURMAS.Create;
  OBJETIVOS:= TuClassTD_OBJETIVOS.Create;
  METODOS:= TuClassTD_METODOS.Create;
  INSTRUTORES:= TuClassTD_INSTRUTORES.Create;
  TECNICAS:= TuClassTD_TECNICAS.Create;
  try
    ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
    TURMAS. PTURMA_COD := gridRegistros.Columns[4].Field.Value;
    OBJETIVOS.POBJETIVO_COD := gridRegistros.Columns[5].Field.Value;
    METODOS.PMETODO_COD := gridRegistros.Columns[6].Field.Value;
    INSTRUTORES.PINSTRUTOR_COD := gridRegistros.Columns[7].Field.Value;
    TECNICAS.PTECNICA_COD := gridRegistros.Columns[8].Field.Value;
    ATRIBUTO.Carregar;
    TURMAS.Carregar;
    OBJETIVOS.Carregar;
    METODOS.Carregar;
    INSTRUTORES.Carregar;
    TECNICAS.Carregar;
    edtDescricao.Text := ATRIBUTO.PDESCRICAO;
    DtInicio.DateTime := StrToDate(ATRIBUTO.PDATA_INICIO);
    DtFim.DateTime := StrToDate(ATRIBUTO.PDATA_FIM);
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTreinamentos.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
      try
        ATRIBUTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDTreinamentos.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
  TURMAS: TuClassTD_TURMAS;
  OBJETIVOS: TuClassTD_OBJETIVOS;
  METODOS: TuClassTD_METODOS;
  INSTRUTORES: TuClassTD_INSTRUTORES;
  TECNICAS: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TREINAMENTOS.Create;
  TURMAS:= TuClassTD_TURMAS.Create;
  OBJETIVOS:= TuClassTD_OBJETIVOS.Create;
  METODOS:= TuClassTD_METODOS.Create;
  INSTRUTORES:= TuClassTD_INSTRUTORES.Create;
  TECNICAS:= TuClassTD_TECNICAS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PDATA_INICIO := DateToStr(DtInicio.DateTime);
        ATRIBUTO.PDATA_FIM := DateToStr(DtFim.DateTime);
        ATRIBUTO.PTURMA_COD := lkpTurma.KeyValue;
        ATRIBUTO.POBJETIVO_COD := lkpObjetivo.KeyValue;
        ATRIBUTO.PMETODO_COD := lkpMetodo.KeyValue;
        ATRIBUTO.PINSTRUTOR_COD := lkpInstrutor.KeyValue;
        //ATRIBUTO.PTECNICA_COD := lkpTecnica.KeyValue;
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
        ATRIBUTO.PDESCRICAO := edtDescricao.Text;
        ATRIBUTO.PDATA_INICIO := DateToStr(DtInicio.DateTime);
        ATRIBUTO.PDATA_FIM := DateToStr(DtFim.DateTime);
        ATRIBUTO.PTURMA_COD := lkpTurma.KeyValue;
        ATRIBUTO.POBJETIVO_COD := lkpObjetivo.KeyValue;
        ATRIBUTO.PMETODO_COD := lkpMetodo.KeyValue;
        ATRIBUTO.PINSTRUTOR_COD := lkpInstrutor.KeyValue;
        //ATRIBUTO.PTECNICA_COD := lkpTecnica.KeyValue;
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

procedure TfrmTDTreinamentos.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
        gridRegistros.DataSource := ATRIBUTO.Consultar('DESCRICAO LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTreinamentos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
  TURMAS: TuClassTD_TURMAS;
  OBJETIVOS: TuClassTD_OBJETIVOS;
  METODOS: TuClassTD_METODOS;
  INSTRUTORES: TuClassTD_INSTRUTORES;
  TECNICAS: TuClassTD_TECNICAS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
  TURMAS:= TuClassTD_TURMAS.Create;
  OBJETIVOS:= TuClassTD_OBJETIVOS.Create;
  METODOS:= TuClassTD_METODOS.Create;
  INSTRUTORES:= TuClassTD_INSTRUTORES.Create;
  TECNICAS:= TuClassTD_TECNICAS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
    lkpTurma.ListSource := TURMAS.Consultar('');
    lkpObjetivo.ListSource := OBJETIVOS.Consultar('');
    lkpMetodo.ListSource := METODOS.Consultar('');
    lkpInstrutor.ListSource := INSTRUTORES.Consultar('');
    lkpTecnica.ListSource := INSTRUTORES.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
