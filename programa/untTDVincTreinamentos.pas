unit untTDVincTreinamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDVincTreinamentos = class(TfrmModelo)
    PageControl1: TPageControl;
    Turmas: TTabSheet;
    Label5: TLabel;
    GridTurmas: TDBGrid;
    btnNovaTurma: TBitBtn;
    Metodos: TTabSheet;
    Label6: TLabel;
    btnNovoMetodo: TBitBtn;
    GridMetodos: TDBGrid;
    Objetivos: TTabSheet;
    Label7: TLabel;
    GridObjetivos: TDBGrid;
    btnNovoObjetivo: TBitBtn;
    Label2: TLabel;
    lkpTreinamento: TDBLookupComboBox;
    lkpTurma: TDBLookupComboBox;
    lkpMetodo: TDBLookupComboBox;
    lkpObjetivo: TDBLookupComboBox;
    btnDelTurma: TBitBtn;
    btnDelMetodo: TBitBtn;
    btnDelObjetivo: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnNovaTurmaClick(Sender: TObject);
    procedure btnNovoMetodoClick(Sender: TObject);
    procedure btnNovoObjetivoClick(Sender: TObject);
    procedure btnDelTurmaClick(Sender: TObject);
    procedure btnDelMetodoClick(Sender: TObject);
    procedure btnDelObjetivoClick(Sender: TObject);
   // procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDVincTreinamentos: TfrmTDVincTreinamentos;

implementation

uses uClassTD_TREINAMENTOS, uClassTD_TURMAS, uClassTD_METODOS,
  uClassTD_OBJETIVOS, uClassTD_TURMAS_TREINAMENTOS,
  uClassTD_TREINAMENTO_METODOS, uClassTD_OBJETIVOS_TREINAMENTO, Lua;

{$R *.dfm}

procedure TfrmTDVincTreinamentos.btnDelMetodoClick(Sender: TObject);
var
  METODO_TREINAMENTO: TuClassTD_TREINAMENTO_METODOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      METODO_TREINAMENTO:= TuClassTD_TREINAMENTO_METODOS.Create;
      try
        METODO_TREINAMENTO.PMETODO_COD := gridMetodos.Columns[0].Field.Value;
        METODO_TREINAMENTO.PTREINAMENTO_COD := gridMetodos.Columns[1].Field.Value;
        METODO_TREINAMENTO.Excluir;
        gridMetodos.DataSource := METODO_TREINAMENTO.Consultar('');
      finally
        METODO_TREINAMENTO.Free;
      end;
    end;

end;

procedure TfrmTDVincTreinamentos.btnDelObjetivoClick(Sender: TObject);
var
  OBJETIVO_TREINAMENTO: TuClassTD_OBJETIVOS_TREINAMENTO;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      OBJETIVO_TREINAMENTO:= TuClassTD_OBJETIVOS_TREINAMENTO.Create;
      try
        OBJETIVO_TREINAMENTO.POBJETIVO_COD := gridObjetivos.Columns[0].Field.Value;
        OBJETIVO_TREINAMENTO.PTREINAMENTO_COD := gridObjetivos.Columns[1].Field.Value;
        OBJETIVO_TREINAMENTO.Excluir;
        gridObjetivos.DataSource := OBJETIVO_TREINAMENTO.Consultar('');
      finally
        OBJETIVO_TREINAMENTO.Free;
      end;
    end;

end;

procedure TfrmTDVincTreinamentos.btnDelTurmaClick(Sender: TObject);
var
  TURMA_TREINAMENTO: TuClassTD_TURMAS_TREINAMENTOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      TURMA_TREINAMENTO:= TuClassTD_TURMAS_TREINAMENTOS.Create;
      try
        TURMA_TREINAMENTO.PTURMA_COD := gridTurmas.Columns[0].Field.Value;
        TURMA_TREINAMENTO.PTREINAMENTO_COD := gridTurmas.Columns[1].Field.Value;
        TURMA_TREINAMENTO.Excluir;
        gridTurmas.DataSource := TURMA_TREINAMENTO.Consultar('');
      finally
        TURMA_TREINAMENTO.Free;
      end;
    end;
end;

procedure TfrmTDVincTreinamentos.btnNovaTurmaClick(Sender: TObject);
var
  TURMA_TREINAMENTO: TuClassTD_TURMAS_TREINAMENTOS;
  begin
  inherited;
  TURMA_TREINAMENTO := TuClassTD_TURMAS_TREINAMENTOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        TURMA_TREINAMENTO.PTREINAMENTO_COD := lkpTreinamento.KeyValue;
        TURMA_TREINAMENTO.PTURMA_COD := lkpTurma.KeyValue;
        if TURMA_TREINAMENTO.Salvar then
          begin
            gridTurmas.DataSource := TURMA_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        TURMA_TREINAMENTO.PTREINAMENTO_COD := gridRegistros.Columns[0].Field.Value;
        TURMA_TREINAMENTO.PTURMA_COD := gridTurmas.Columns[0].Field.Value;
        if TURMA_TREINAMENTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridTurmas.DataSource := TURMA_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    TURMA_TREINAMENTO.Free;
  end;
end;

procedure TfrmTDVincTreinamentos.btnNovoClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
  TURMAS: TuClassTD_TURMAS;
  TURMAS_TREINAMENTOS: TuClassTD_TURMAS_TREINAMENTOS;
  METODO: TuClassTD_METODOS;
  METODO_TREINAMENTO: TuClassTD_TREINAMENTO_METODOS;
  OBJETIVO: TuClassTD_OBJETIVOS;
  OBJETIVO_TREINAMENTO: TuClassTD_OBJETIVOS_TREINAMENTO;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
  TURMAS := TuClassTD_TURMAS.Create;
  TURMAS_TREINAMENTOS:= TuClassTD_TURMAS_TREINAMENTOS.Create;
  METODO:= TuClassTD_METODOS.Create;
  METODO_TREINAMENTO:= TuClassTD_TREINAMENTO_METODOS.Create;
  OBJETIVO:= TuClassTD_OBJETIVOS.Create;
  OBJETIVO_TREINAMENTO:= TuClassTD_OBJETIVOS_TREINAMENTO.Create;
  try
    lkpTreinamento.ListSource := ATRIBUTO.Consultar('');
    lkpTurma.ListSource := TURMAS.Consultar('');
    lkpMetodo.ListSource := METODO.Consultar('');
    lkpObjetivo.ListSource := OBJETIVO.Consultar('');
    gridTurmas.DataSource := TURMAS_TREINAMENTOS.Consultar('');
    gridMetodos.DataSource := METODO_TREINAMENTO.Consultar('');
    gridObjetivos.DataSource := OBJETIVO_TREINAMENTO.Consultar('');
  finally
    TURMAS_TREINAMENTOS.Free;
  end;
end;

procedure TfrmTDVincTreinamentos.btnNovoMetodoClick(Sender: TObject);
var
  METODO_TREINAMENTO: TuClassTD_TREINAMENTO_METODOS;
  begin
  inherited;
  METODO_TREINAMENTO := TuClassTD_TREINAMENTO_METODOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        METODO_TREINAMENTO.PTREINAMENTO_COD := lkpTreinamento.KeyValue;
        METODO_TREINAMENTO.PMETODO_COD := lkpMetodo.KeyValue;
        if METODO_TREINAMENTO.Salvar then
          begin
            gridMetodos.DataSource := METODO_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        METODO_TREINAMENTO.PTREINAMENTO_COD := gridMetodos.Columns[0].Field.Value;
        METODO_TREINAMENTO.PMETODO_COD := gridMetodos.Columns[0].Field.Value;
        if METODO_TREINAMENTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridMetodos.DataSource := METODO_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    METODO_TREINAMENTO.Free;
  end;
end;

procedure TfrmTDVincTreinamentos.btnNovoObjetivoClick(Sender: TObject);
var
  OBJETIVO_TREINAMENTO: TuClassTD_OBJETIVOS_TREINAMENTO;
  begin
  inherited;
  OBJETIVO_TREINAMENTO := TuClassTD_OBJETIVOS_TREINAMENTO.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        OBJETIVO_TREINAMENTO.PTREINAMENTO_COD := lkpTreinamento.KeyValue;
        OBJETIVO_TREINAMENTO.POBJETIVO_COD := lkpObjetivo.KeyValue;
        if OBJETIVO_TREINAMENTO.Salvar then
          begin
            gridObjetivos.DataSource := OBJETIVO_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        OBJETIVO_TREINAMENTO.PTREINAMENTO_COD := gridObjetivos.Columns[0].Field.Value;
        OBJETIVO_TREINAMENTO.POBJETIVO_COD := gridObjetivos.Columns[0].Field.Value;
        if OBJETIVO_TREINAMENTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridObjetivos.DataSource := OBJETIVO_TREINAMENTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    OBJETIVO_TREINAMENTO.Free;
  end;
end;

//procedure TfrmTDVincTreinamentos.btnSalvarClick(Sender: TObject);
//var
//  ATRIBUTO: TuClassTD_TREINAMENTOS;
//begin
//  inherited;
//  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
//  try
//     tsVisualiza.Show;
//     gridRegistros.DataSource := ATRIBUTO.Consultar('');
//  finally
//     ATRIBUTO.Free;
//  end;
//end;

procedure TfrmTDVincTreinamentos.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TREINAMENTOS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TREINAMENTOS.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
