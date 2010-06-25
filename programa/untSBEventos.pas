unit untSBEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, ValEdit, DB, DBClient;

type
  TfrmSBEventos = class(TfrmModelo)
    LabeledEdit2: TLabeledEdit;
    Label2: TLabel;
    Tipo: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    RichEdit1: TRichEdit;
    Button1: TButton;
    ListBox1: TListBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventos: TfrmSBEventos;

implementation

uses uClassSB_EVENTOS, untSBSimulacao, uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBEventos.btnEditarClick(Sender: TObject);
var
  EVENTO: TuClassSB_EVENTOS;
begin
  inherited;

  try
    EVENTO:= TuClassSB_EVENTOS.Create;
    EVENTO.PEVENTO_COD:= gridRegistros.Columns[0].Field.Value;
    EVENTO.Carregar;

    LabeledEdit2.Text:= EVENTO.PDESCRICAO;
    RichEdit1.Text:= EVENTO.PFORMULA;
    if(EVENTO.PTIPO = 'D') then
    begin
      ComboBox1.Clear;
      ComboBox1.Items.Add('Desconto');
      ComboBox1.Items.Add('Provento');
      ComboBox1.ItemIndex:= 0;
    end;

    if(EVENTO.PTIPO = 'P') then
    begin
      ComboBox1.Clear;
      ComboBox1.Items.Add('Provento');
      ComboBox1.Items.Add('Desconto');
        ComboBox1.ItemIndex:= 0;
    end;

  finally
     EVENTO.Free;
  end;

end;

procedure TfrmSBEventos.btnExcluirClick(Sender: TObject);
var
  EVE: TuClassSB_EVENTOS;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;

  try
    EVE:= TuClassSB_EVENTOS.Create;
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      EVE.PEVENTO_COD:= gridRegistros.Columns[0].Field.Value;
      if(EVE.Excluir) then
      begin

        UTILS:= TuClassFuncoesGerais.Create;
        UTILS.GravaLog('Excluiu um evento/f�rmula');
        UTILS.Free;

        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
        gridRegistros.DataSource:= EVE.Consultar('');

      end;
    end;

  finally
    EVE.Free;
  end;

end;

procedure TfrmSBEventos.btnSalvarClick(Sender: TObject);
  var
    EVENTO : TuClassSB_EVENTOS;
    UTILS: TuClassFuncoesGerais;
begin
  inherited;
  try
    EVENTO:=  TuClassSB_EVENTOS.Create;

    EVENTO.PDESCRICAO:= LabeledEdit2.Text;
    EVENTO.PFORMULA:= RichEdit1.Text;
    EVENTO.PTIPO:= Copy(ComboBox1.Text,1,1);

    if(lblModo1.Caption = 'Inserindo') then
      begin
        if(EVENTO.Salvar) then
          begin

            UTILS:= TuClassFuncoesGerais.Create;
            UTILS.GravaLog('Gravou um novo evento/f�rmula');
            UTILS.Free;


            gridRegistros.DataSource:= EVENTO.Consultar('');
            tsVisualiza.Show;
            lblModo1.Caption:= 'Listando';
          end; // fim do salvar
      end; // do inserindo



    if(lblModo1.Caption = 'Editando') then
      begin
        EVENTO.PEVENTO_COD:= gridRegistros.Columns[0].Field.Value;

        if(EVENTO.Editar) then
          begin
            UTILS:= TuClassFuncoesGerais.Create;
            UTILS.GravaLog('Fez altera��es em um evento/f�rmula');
            UTILS.Free;

            gridRegistros.DataSource:= EVENTO.Consultar('');
            lblModo1.Caption:= 'Listando';
            tsVisualiza.Show;
          end;

      end;// do editando

  finally
    EVENTO.Free;
  end;

end;

procedure TfrmSBEventos.Button1Click(Sender: TObject);
begin
  inherited;
  frmSBSimulacao.Show;
end;


procedure TfrmSBEventos.edtPesquisaChange(Sender: TObject);
begin
  inherited;
  gridRegistros.DataSource.DataSet.Locate('DESCRICAO',edtPesquisa.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure TfrmSBEventos.FormKeyPress(Sender: TObject; var Key: Char);
begin
 // foo

end;

procedure TfrmSBEventos.FormShow(Sender: TObject);
var
  EVENTO : TuClassSB_EVENTOS;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;

  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a tela de eventos cont�beis vari�veis, f�rmulas dos benef�cios');
  UTILS.Free;

  try
     EVENTO:= TuClassSB_EVENTOS.Create;
     gridRegistros.DataSource:= EVENTO.Consultar('');
  finally
    EVENTO.Free;
  end;

end;




end.
