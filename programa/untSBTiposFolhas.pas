unit untSBTiposFolhas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBTiposFolhas = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBTiposFolhas: TfrmSBTiposFolhas;

implementation

uses uClassSB_TIPO_FOLHA, uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBTiposFolhas.btnEditarClick(Sender: TObject);
  var
  TIPO: TuClassSB_TIPO_FOLHA;
begin
  inherited;
  try
    TIPO:= TuClassSB_TIPO_FOLHA.Create;

    LabeledEdit2.Text:= gridRegistros.Columns[0].Field.Value;
    LabeledEdit1.Text:= gridRegistros.Columns[1].Field.Value;
    
  finally
    TIPO.Free;
  end;

end;

procedure TfrmSBTiposFolhas.btnExcluirClick(Sender: TObject);
var
  TIPO : TuClassSB_TIPO_FOLHA;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;
  try
    TIPO:= TuClassSB_TIPO_FOLHA.Create;
    TIPO.PTIP_FOL_COD:= gridRegistros.Columns[0].Field.Value;

    if(MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
       if(TIPO.Excluir) then
       begin

        UTILS:= TuClassFuncoesGerais.Create;
        UTILS.GravaLog('Excluiu um tipo de folha de pagamento');
        UTILS.Free;

        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
        gridRegistros.DataSource := TIPO.Consultar('');

       end;

    end;

  finally
    TIPO.Free;
  end;
end;

procedure TfrmSBTiposFolhas.btnSalvarClick(Sender: TObject);
var
  TIPO : TuClassSB_TIPO_FOLHA;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;
  try
    TIPO:= TuClassSB_TIPO_FOLHA.Create;
    TIPO.PDESCRICAO:= LabeledEdit1.Text;

    if (lblModo1.Caption = 'Inserindo') then
    begin
      TIPO.PTIP_FOL_COD:= LabeledEdit2.Text;

      if (TIPO.Salvar) then
      begin

      UTILS:= TuClassFuncoesGerais.Create;
      UTILS.GravaLog('Salvou um novo tipo de tipo de folha de pagamento');
      UTILS.Free;

        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
        gridRegistros.DataSource := TIPO.Consultar('');

      end;
    end;

    if(lblModo1.Caption = 'Editando') then
    begin
      TIPO.PTIP_FOL_COD:= gridRegistros.Columns[0].Field.Value;
      if(TIPO.Editar) then
      begin

        UTILS:= TuClassFuncoesGerais.Create;
        UTILS.GravaLog('Fez modificação em um tipo de folha de pagamento');
        UTILS.Free;


        gridRegistros.DataSource := TIPO.Consultar('');
        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
      end;
    end;

  finally
      TIPO.Free;
  end;

end;

procedure TfrmSBTiposFolhas.FormShow(Sender: TObject);
var
  TIPOS : TuClassSB_TIPO_FOLHA;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;

  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a tela te tipos de folha de pagamento');
  UTILS.Free;


  try
    TIPOS:= TuClassSB_TIPO_FOLHA.Create;
    gridRegistros.DataSource:= TIPOS.Consultar('');
  finally
    TIPOS.Free;
  end;

end;

end.
