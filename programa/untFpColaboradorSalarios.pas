unit untFpColaboradorSalarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmFpColaboradorSalarios = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    edtSalario: TEdit;
    dtpDataAlter: TDateTimePicker;
    Label4: TLabel;
    rgStatus: TRadioGroup;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpColaboradorSalarios: TfrmFpColaboradorSalarios;

implementation

uses uClassFP_COLABORADOR_SALARIOS, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmFpColaboradorSalarios.btnEditarClick(Sender: TObject);
var
  COLABSALARIO: TuClassFP_COLABORADOR_SALARIOS;
begin
  inherited;
  COLABSALARIO := TuClassFP_COLABORADOR_SALARIOS.Create;
  try
    COLABSALARIO.PCOL_SAL_COD := gridRegistros.Columns[0].Field.Value;
    COLABSALARIO.Carregar;

    lkpColaborador.KeyValue := COLABSALARIO.PPESSOA_COD;
    edtSalario.Text := COLABSALARIO.PSALARIO_VALOR;
    dtpDataAlter.Date := StrToDate(COLABSALARIO.PSALARIO_DATA_ALTERACAO);
    if COLABSALARIO.PSALARIO_STATUS = 'A' then
      rgStatus.ItemIndex := 0
    else
      rgStatus.ItemIndex := 1;

  finally
    COLABSALARIO.Free;
  end;
end;

procedure TfrmFpColaboradorSalarios.btnExcluirClick(Sender: TObject);
var
  COLABSALARIO: TuClassFP_COLABORADOR_SALARIOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABSALARIO := TuClassFP_COLABORADOR_SALARIOS.Create;
      try
        COLABSALARIO.PCOL_SAL_COD := gridRegistros.Columns[0].Field.Value;
        COLABSALARIO.Excluir;
        gridRegistros.DataSource := COLABSALARIO.Consultar('');
      finally
        COLABSALARIO.Free;
      end;
    end;

end;

procedure TfrmFpColaboradorSalarios.btnSalvarClick(Sender: TObject);
var
  COLABSALARIO: TuClassFP_COLABORADOR_SALARIOS;
begin
  inherited;
  COLABSALARIO := TuClassFP_COLABORADOR_SALARIOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        COLABSALARIO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABSALARIO.PSALARIO_DATA_ALTERACAO := FormatDateTime('dd/MM/yyyy',dtpDataAlter.Date);
        COLABSALARIO.PSALARIO_VALOR := StringReplace(edtSalario.Text,',','.',[rfReplaceAll]);
        if rgStatus.ItemIndex = 0 then
          COLABSALARIO.PSALARIO_STATUS := 'A'
        else
          COLABSALARIO.PSALARIO_STATUS := 'I';

        if COLABSALARIO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABSALARIO.Consultar('');           
          end
        else
          ShowMessage('Falha!');
        
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        COLABSALARIO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABSALARIO.PSALARIO_DATA_ALTERACAO := FormatDateTime('dd/MM/yyyy',dtpDataAlter.Date);
        COLABSALARIO.PSALARIO_VALOR := edtSalario.Text;
        if rgStatus.ItemIndex = 0 then
          COLABSALARIO.PSALARIO_STATUS := 'A'
        else
          COLABSALARIO.PSALARIO_STATUS := 'I';
        COLABSALARIO.PCOL_SAL_COD := gridRegistros.Columns[0].Field.Value;

        if COLABSALARIO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABSALARIO.Consultar('');
          end;
      end;
  finally
    COLABSALARIO.Free;
  end;
  
end;

procedure TfrmFpColaboradorSalarios.FormShow(Sender: TObject);
var
  COLABORADOR: TuClassGE_COLABORADORES;
  COLABSALARIO: TuClassFP_COLABORADOR_SALARIOS;
begin
  inherited;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  COLABSALARIO := TuClassFP_COLABORADOR_SALARIOS.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A'' ');

    gridRegistros.DataSource := COLABSALARIO.Consultar('');
    dtpDataAlter.Date := Date;

  finally
    COLABORADOR.Free;
    COLABSALARIO.Free;
  end;
end;

end.
