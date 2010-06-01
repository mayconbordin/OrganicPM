unit untFpColaboradorBeneficios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmModelo1 = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    edtValor: TEdit;
    Label4: TLabel;
    edtDescricao: TEdit;
    Label5: TLabel;
    dtpInicial: TDateTimePicker;
    Label6: TLabel;
    dtpFinal: TDateTimePicker;
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
  frmModelo1: TfrmModelo1;

implementation

uses uClassFP_COLABORADOR_BENEFICIOS, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmModelo1.btnEditarClick(Sender: TObject);
var
  COLABBENEFICIO: TuClassFP_COLABORADOR_BENEFICIOS;
begin
  inherited;
  COLABBENEFICIO := TuClassFP_COLABORADOR_BENEFICIOS.Create;
  try
    COLABBENEFICIO.PCOL_BEN_COD := gridRegistros.Columns[0].Field.Value;
    COLABBENEFICIO.Carregar;

    lkpColaborador.KeyValue := COLABBENEFICIO.PPESSOA_COD;
    edtValor.Text := COLABBENEFICIO.PVALOR;
    dtpInicial.Date := StrToDate(COLABBENEFICIO.PDATA_INICIAL);
    dtpFinal.Date := StrToDate(COLABBENEFICIO.PDATA_FINAL);
    edtDescricao.Text := COLABBENEFICIO.PDESCRICAO;

  finally
    COLABBENEFICIO.Free;
  end;

end;

procedure TfrmModelo1.btnExcluirClick(Sender: TObject);
var
  COLABDENEFICIO: TuClassFP_COLABORADOR_BENEFICIOS;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABDENEFICIO := TuClassFP_COLABORADOR_BENEFICIOS.Create;
      try
        COLABDENEFICIO.PCOL_BEN_COD := gridRegistros.Columns[0].Field.Value;
        COLABDENEFICIO.Excluir;
        gridRegistros.DataSource := COLABDENEFICIO.Consultar('');
      finally
        COLABDENEFICIO.Free;
      end;
    end;
end;

procedure TfrmModelo1.btnSalvarClick(Sender: TObject);
var
  COLABBENEFICIO: TuClassFP_COLABORADOR_BENEFICIOS;
begin
  inherited;
  COLABBENEFICIO := TuClassFP_COLABORADOR_BENEFICIOS.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        COLABBENEFICIO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABBENEFICIO.PVALOR := StringReplace(edtValor.Text,',','.',[rfReplaceAll]);
        COLABBENEFICIO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpInicial.Date);
        COLABBENEFICIO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpFinal.Date);
        COLABBENEFICIO.PDESCRICAO := edtDescricao.Text;

        if COLABBENEFICIO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABBENEFICIO.Consultar('');           
          end
        else
          ShowMessage('Falha!');
        
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        COLABBENEFICIO.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABBENEFICIO.PVALOR := StringReplace(edtValor.Text,',','.',[rfReplaceAll]);
        COLABBENEFICIO.PDATA_INICIAL := FormatDateTime('dd/MM/yyyy',dtpInicial.Date);
        COLABBENEFICIO.PDATA_FINAL := FormatDateTime('dd/MM/yyyy',dtpFinal.Date);
        COLABBENEFICIO.PDESCRICAO := edtDescricao.Text;
        COLABBENEFICIO.PCOL_BEN_COD := gridRegistros.Columns[0].Field.Value;

        if COLABBENEFICIO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABBENEFICIO.Consultar('');
          end;
      end;
  finally
    COLABBENEFICIO.Free;
  end;
end;

procedure TfrmModelo1.FormShow(Sender: TObject);
var
  COLABBENEFICIO: TuClassFP_COLABORADOR_BENEFICIOS;
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
  COLABBENEFICIO := TuClassFP_COLABORADOR_BENEFICIOS.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.Consultar('GE_COLABORADORES.STATUS = ''A'' ');

    gridRegistros.DataSource := COLABBENEFICIO.Consultar('');

  finally
    COLABBENEFICIO.Free;
    COLABORADOR.Free;
  end;
end;

end.
