unit untTDTurmas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmTDTurmas = class(TfrmModelo)
    edtNome: TEdit;
    Label2: TLabel;
    lkpAmbienteCod: TDBLookupComboBox;
    lkpInstrutorCod: TDBLookupComboBox;
    Label3: TLabel;
    DtFim: TDateTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    DtInicio: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDTurmas: TfrmTDTurmas;

implementation

uses uClassTD_TURMAS, uClassTD_AMBIENTES, uClassTD_INSTRUTORES;

{$R *.dfm}

procedure TfrmTDTurmas.btnEditarClick(Sender: TObject);
var
  AMBIENTE: TuClassTD_AMBIENTES;
  ATRIBUTO: TuClassTD_TURMAS;
  INSTRUTOR: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO := TuClassTD_TURMAS.Create;
  try
    ATRIBUTO.PTURMA_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    lkpAmbienteCod.KeyValue := ATRIBUTO.PAMBIENTE_COD;
    edtNome.Text := ATRIBUTO.PNOME;
    lkpInstrutorCod.KeyValue := ATRIBUTO.PINSTRUTOR_COD; 
    DtInicio.Date := StrToDate(ATRIBUTO.PDATA_INICIAL);
    DtFim.Date := StrToDate(ATRIBUTO.PDATA_FINAL);     
    if ATRIBUTO.PTURNO = 'M' then
    begin
        RadioGroup1.ItemIndex := 0;
    end;
    if ATRIBUTO.PTURNO = 'T' then
    begin
        RadioGroup1.ItemIndex := 1;
    end;
    if ATRIBUTO.PTURNO = 'N' then
    begin
        RadioGroup1.ItemIndex := 2;
    end;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTurmas.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TURMAS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_TURMAS.Create;
      try
        ATRIBUTO.PTURMA_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;

end;

procedure TfrmTDTurmas.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.Text := '';
  lkpAmbienteCod.KeyValue := 0;
  lkpInstrutorCod.KeyValue := 0;
  RadioGroup1.ItemIndex := 0;

end;

procedure TfrmTDTurmas.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TURMAS;
begin
  inherited;
  ATRIBUTO := TuClassTD_TURMAS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.PAMBIENTE_COD := lkpAmbienteCod.KeyValue;
        ATRIBUTO.PINSTRUTOR_COD :=  lkpInstrutorCod.KeyValue;
        ATRIBUTO.PDATA_INICIAL := DateToStr(DtInicio.Date);
        ATRIBUTO.PDATA_FINAL := DateToStr(DtFim.Date);
        if RadioGroup1.ItemIndex = 0 then
           ATRIBUTO.PTURNO := 'M';
        if RadioGroup1.ItemIndex = 1 then
           ATRIBUTO.PTURNO := 'T';
        if RadioGroup1.ItemIndex = 2 then
           ATRIBUTO.PTURNO := 'N';
             
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
        ATRIBUTO.PTURMA_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.PAMBIENTE_COD := lkpAmbienteCod.KeyValue;
        ATRIBUTO.PINSTRUTOR_COD := lkpInstrutorCod.KeyValue;
        ATRIBUTO.PDATA_INICIAL := DateToStr(DtInicio.Date);
        ATRIBUTO.PDATA_FINAL := DateToStr(DtFim.Date);
        if RadioGroup1.ItemIndex = 0 then
        ATRIBUTO.PTURNO := 'M';
        if RadioGroup1.ItemIndex = 1 then
           ATRIBUTO.PTURNO := 'T';
        if RadioGroup1.ItemIndex = 2 then
           ATRIBUTO.PTURNO := 'N';
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

procedure TfrmTDTurmas.edtNomeExit(Sender: TObject);
begin
  inherited;
  if edtNome.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       edtNome.SetFocus;
     end;
end;

procedure TfrmTDTurmas.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TURMAS;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TURMAS.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
        gridRegistros.DataSource := ATRIBUTO.Consultar('NOME LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDTurmas.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_TURMAS;
  AMBIENTE: TuClassTD_AMBIENTES;
  INSTRUTOR: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO:= TuClassTD_TURMAS.Create;
  AMBIENTE := TuClassTD_AMBIENTES.Create;
  INSTRUTOR := TuClassTD_INSTRUTORES.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
    lkpAmbienteCod.ListSource := AMBIENTE.Consultar('');
    lkpInstrutorCod.ListSource := INSTRUTOR.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

end.
