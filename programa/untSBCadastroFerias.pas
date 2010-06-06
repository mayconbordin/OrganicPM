unit untSBCadastroFerias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBCadastroFerias = class(TfrmModelo)
    DBGrid1: TDBGrid;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBCadastroFerias: TfrmSBCadastroFerias;

implementation

uses uClassSB_CADASTRO_FERIAS, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmSBCadastroFerias.btnEditarClick(Sender: TObject);
var
  FERIAS: TuClassSB_CADASTRO_FERIAS;
  COl: TuClassGE_COLABORADORES;
begin
  inherited;

  try
    FERIAS:= TuClassSB_CADASTRO_FERIAS.Create;
    FERIAS.PPESSOA_COD:= gridRegistros.Columns[0].Field.Value;
    FERIAS.PCAD_FER_DATA_INICIO:= gridRegistros.Columns[2].Field.Value;
    FERIAS.PCAD_FER_DATA_FIM:= gridRegistros.Columns[3].Field.Value;

    FERIAS.Carregar;

    MonthCalendar2.Date:= StrToDate(FERIAS.PCAD_FER_DATA_INICIO);
    MonthCalendar1.Date:= StrToDate(FERIAS.PCAD_FER_DATA_FIM);
    
    COl:= TuClassGE_COLABORADORES.Create;
    DBGrid1.DataSource:= COl.ConsultaPessoaColaborador('GE_PESSOAS.PESSOA_COD='+gridRegistros.Columns[0].Field.AsString+'');
    DBGrid1.SelectedIndex:=0;
    DBGrid1.SetFocus;
    
  finally
    FERIAS.Free;
    COl.Free;
  end;

end;

procedure TfrmSBCadastroFerias.btnSalvarClick(Sender: TObject);
var
  FERIAS: TuClassSB_CADASTRO_FERIAS;
begin
  inherited;
  try
    FERIAS:= TuClassSB_CADASTRO_FERIAS.Create;

   if(lblModo1.Caption = 'Editando') then
   begin
    // exclui o registro antigo e grava o novo
    FERIAS.PPESSOA_COD:= gridRegistros.Columns[0].Field.Value;
    FERIAS.PCAD_FER_DATA_INICIO:= gridRegistros.Columns[2].Field.Value;
    FERIAS.PCAD_FER_DATA_FIM:= gridRegistros.Columns[3].Field.Value;
    
     if(FERIAS.Excluir) then
     begin
          FERIAS.PPESSOA_COD:= DBGrid1.Columns[0].Field.Value;
          FERIAS.PCAD_FER_DATA_INICIO:= DateToStr(MonthCalendar2.Date);
          FERIAS.PCAD_FER_DATA_FIM:= DateToStr(MonthCalendar1.Date);

          if(FERIAS.Salvar) then
          begin
             gridRegistros.DataSource:= FERIAS.ConsultarFerias('');
             lblModo1.Caption:= 'Listando';
             tsVisualiza.Show;          
          end;
     
     end;
   end;

    // set new values       
    FERIAS.PPESSOA_COD:= DBGrid1.Columns[0].Field.Value;
    FERIAS.PCAD_FER_DATA_INICIO:= DateToStr(MonthCalendar2.Date);
    FERIAS.PCAD_FER_DATA_FIM:= DateToStr(MonthCalendar1.Date);
    
    if(lblModo1.Caption = 'Inserindo') then
    begin
       if(FERIAS.Salvar)then
       begin
         gridRegistros.DataSource:= FERIAS.ConsultarFerias('');
         lblModo1.Caption:= 'Listando';
         tsVisualiza.Show;
       end;
   end;

  finally
    FERIAS.Free;
  end;


end;

procedure TfrmSBCadastroFerias.FormShow(Sender: TObject);
var
  COLAB: TuClassGE_COLABORADORES;
  FERIAS: TuClassSB_CADASTRO_FERIAS;
begin
  inherited;

  try
    COLAB:= TuClassGE_COLABORADORES.Create;
    FERIAS:= TuClassSB_CADASTRO_FERIAS.Create;
    DBGrid1.DataSource:= COLAB.ConsultaPessoaColaborador('');
    gridRegistros.DataSource:= FERIAS.ConsultarFerias('');

  finally
    COLAB.Free;
    FERIAS.Free;
  end;

end;

procedure TfrmSBCadastroFerias.LabeledEdit1Change(Sender: TObject);
var
  COLAB: TuClassGE_COLABORADORES;
begin
  inherited;
  try
    COLAB:= TuClassGE_COLABORADORES.Create;
    DBGrid1.DataSource:= COLAB.ConsultaPessoaColaborador('NOME like ''%'+LabeledEdit1.Text+'%''');
  finally
    COLAB.Free;
  end;

end;

end.
