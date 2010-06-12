unit untSBEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, ValEdit;

type
  TfrmSBEventos = class(TfrmModelo)
    LabeledEdit2: TLabeledEdit;
    Label2: TLabel;
    Tipo: TLabel;
    Label3: TLabel;
    ValueListEditor1: TValueListEditor;
    ComboBox1: TComboBox;
    RichEdit1: TRichEdit;
    Button1: TButton;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnExcluirClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventos: TfrmSBEventos;

implementation

uses uClassSB_EVENTOS, untSBSimulacao;

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
begin
  inherited;

  try
    EVE:= TuClassSB_EVENTOS.Create;
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      EVE.PEVENTO_COD:= gridRegistros.Columns[0].Field.Value;
      if(EVE.Excluir) then
      begin
        tsVisualiza.Show;
        gridRegistros.DataSource:= EVE.Consultar('');
        lblModo1.Caption:= 'Listando';
      end;
    end;

  finally
    EVE.Free;
  end;

end;

procedure TfrmSBEventos.btnSalvarClick(Sender: TObject);
  var
    EVENTO : TuClassSB_EVENTOS;
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
            gridRegistros.DataSource:= EVENTO.Consultar('');
            tsVisualiza.Show;
            lblModo1.Caption:= 'Listando';
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


procedure TfrmSBEventos.FormKeyPress(Sender: TObject; var Key: Char);
begin
 // foo

end;

procedure TfrmSBEventos.FormShow(Sender: TObject);
var
  EVENTO : TuClassSB_EVENTOS;
begin
  inherited;
  try
     EVENTO:= TuClassSB_EVENTOS.Create;
     gridRegistros.DataSource:= EVENTO.Consultar('');
  finally
    EVENTO.Free;
  end;

end;




end.
