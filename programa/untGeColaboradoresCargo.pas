unit untGeColaboradoresCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmGeColaboradoresCargo = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    lkpCargo: TDBLookupComboBox;
    Label4: TLabel;
    edtHoras: TEdit;
    Label5: TLabel;
    dtpDataIni: TDateTimePicker;
    Label6: TLabel;
    dtpFinal: TDateTimePicker;
    rgStatus: TRadioGroup;
    procedure rgStatusClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeColaboradoresCargo: TfrmGeColaboradoresCargo;

implementation

uses uClassGE_COLABORADORES_CARGO, uClassFuncoesGerais, uClassGE_COLABORADORES,
  uClassFP_CARGOS;

{$R *.dfm}

procedure TfrmGeColaboradoresCargo.btnEditarClick(Sender: TObject);
var
  COLABCARGO: TuClassGE_COLABORADORES_CARGO;
begin
  inherited;
  COLABCARGO := TuClassGE_COLABORADORES_CARGO.Create;
  try
    COLABCARGO.PPESSOA_COD := gridRegistros.Columns[1].Field.Value;
    COLABCARGO.PCARGO_COD := gridRegistros.Columns[2].Field.Value;
    COLABCARGO.PCOL_CAR_MATRICULA := gridRegistros.Columns[0].Field.Value;
    COLABCARGO.Carregar;

    lkpColaborador.KeyValue := COLABCARGO.PPESSOA_COD;
    lkpCargo.KeyValue := COLABCARGO.PCARGO_COD;
    edtHoras.Text := COLABCARGO.PHORAS_SEMANAIS;
    dtpDataIni.Date := StrToDate(COLABCARGO.PDATA_INICIAL);
    if COLABCARGO.PSTATUS = 'A' then
      begin
        rgStatus.ItemIndex := 0;
        rgStatusClick(Sender);
      end
    else
      begin
        rgStatus.ItemIndex := 1;
        rgStatusClick(sender);
      end;    

  finally
    COLABCARGO.Free;
  end;
end;

procedure TfrmGeColaboradoresCargo.btnExcluirClick(Sender: TObject);
var
  COLABCARGO: TuClassGE_COLABORADORES_CARGO;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABCARGO := TuClassGE_COLABORADORES_CARGO.Create;
      try
        COLABCARGO.PPESSOA_COD := gridRegistros.Columns[1].Field.Value;
        COLABCARGO.PCARGO_COD := gridRegistros.Columns[2].Field.Value;
        COLABCARGO.PCOL_CAR_MATRICULA := gridRegistros.Columns[0].Field.Value;
        COLABCARGO.Excluir;
        gridRegistros.DataSource := COLABCARGO.Consultar('');
      finally
        COLABCARGO.Free;
      end;
    end;
end;

procedure TfrmGeColaboradoresCargo.btnSalvarClick(Sender: TObject);
var
  COLABCARGO: TuClassGE_COLABORADORES_CARGO;
  GERAL: TuClassFuncoesGerais;
begin
  inherited;
  COLABCARGO := TuClassGE_COLABORADORES_CARGO.Create;
  GERAL := TuClassFuncoesGerais.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        COLABCARGO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABCARGO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpDataIni.Date);
        COLABCARGO.PCARGO_COD := lkpCargo.KeyValue;
        COLABCARGO.PHORAS_SEMANAIS := edtHoras.Text;
        COLABCARGO.PCOL_CAR_MATRICULA := IntTostr(GERAL.UltimoID('GE_COLABORADORES_CARGO','COL_CAR_MATRICULA')+1);
        if rgStatus.ItemIndex = 1 then
          begin
            COLABCARGO.PSTATUS := 'I';
            COLABCARGO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpFinal.Date);
          end
        else
          begin
            COLABCARGO.PSTATUS := 'A';
          end;
        if COLABCARGO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABCARGO.Consultar(''); 
          end
        else
          ShowMessage('Falha!');  
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        COLABCARGO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABCARGO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpDataIni.Date);
        COLABCARGO.PCARGO_COD := lkpCargo.KeyValue;
        COLABCARGO.PHORAS_SEMANAIS := edtHoras.Text;
        COLABCARGO.PCOL_CAR_MATRICULA := gridRegistros.Columns[0].Field.Value;
        if rgStatus.ItemIndex = 1 then
          begin
            COLABCARGO.PSTATUS := 'I';
            COLABCARGO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpFinal.Date);
          end
        else
          begin
            COLABCARGO.PSTATUS := 'A';
          end;  
        if COLABCARGO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABCARGO.Consultar('');
          end
        else
          ShowMessage('Falha ao editar');
      end;

  finally
    COLABCARGO.Free;
    GERAL.Free;
  end;
end;

procedure TfrmGeColaboradoresCargo.FormShow(Sender: TObject);
var
  COLABORADOR: TuClassGE_COLABORADORES;
  CARGO: TuClassCargos;
  COLABCARGO: TuClassGE_COLABORADORES_CARGO;
begin
  inherited;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  CARGO := TuClassCargos.Create;
  COLABCARGO := TuClassGE_COLABORADORES_CARGO.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.ConsultaPessoaColaborador('GE_COLABORADORES.STATUS = ''A'' ');
    lkpCargo.ListSource := CARGO.Consultar('');

    gridRegistros.DataSource := COLABCARGO.Consultar('');

    dtpDataIni.Date := Date;
    dtpFinal.Date := Date;
  finally
    COLABORADOR.Free;
    CARGO.Free;
    COLABCARGO.Free;
  end;
end;

procedure TfrmGeColaboradoresCargo.rgStatusClick(Sender: TObject);
begin
  inherited;
  if rgStatus.ItemIndex = 1 then
    dtpDataIni.Enabled := True
  else
   dtpDataIni.Enabled := False;
  
end;

end.
