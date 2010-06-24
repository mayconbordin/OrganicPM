unit untSBColaboradorEventos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBColaboradorEvento = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure LabeledEdit2Change(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridRegistrosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBColaboradorEvento: TfrmSBColaboradorEvento;

implementation

uses uClassSB_COLABORADOR_EVENTOS, uClassGE_COLABORADORES, uClassSB_EVENTOS,
  uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmSBColaboradorEvento.btnExcluirClick(Sender: TObject);
var
  EVESCOL : TuClassSB_COLABORADOR_EVENTOS;
  UTILS: TuClassFuncoesGerais;  
begin
  inherited;
  try
    EVESCOL:= TuClassSB_COLABORADOR_EVENTOS.Create;
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      EVESCOL.PEVENTO_COD := gridRegistros.Columns[0].Field.Value;
      EVESCOL.PPESSOA_COD:= gridRegistros.Columns[6].Field.Value;
      if(EVESCOL.Excluir) then
      begin

        UTILS:= TuClassFuncoesGerais.Create;
        UTILS.GravaLog('Excluiu a relação entre o evento '+EVESCOL.PEVENTO_COD+' e o colaborador '+EVESCOL.PPESSOA_COD);
        UTILS.Free;

        gridRegistros.DataSource:= EVESCOL.ConsultarDetalhes('');
        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
      end;
    end;
  finally
    EVESCOL.Free;
  end;
end;

procedure TfrmSBColaboradorEvento.btnSalvarClick(Sender: TObject);
var
  EVE : TuClassSB_COLABORADOR_EVENTOS;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;

  try
    EVE:= TuClassSB_COLABORADOR_EVENTOS.Create;
    if(lblModo1.Caption = 'Inserindo') then
    begin
      EVE.PPESSOA_COD:= DBGrid1.Columns[0].Field.Value;
      EVE.PEVENTO_COD:= DBGrid2.Columns[0].Field.Value;

      if(EVE.Salvar) then
      begin
        UTILS:= TuClassFuncoesGerais.Create;
        UTILS.GravaLog('Gravou a ligação entre o evento '+EVE.PEVENTO_COD+' e o colaborador '+EVE.PPESSOA_COD);
        UTILS.Free;

        gridRegistros.DataSource:= EVE.ConsultarDetalhes('');
        lblModo1.Caption:= 'Listando';
        tsVisualiza.Show;
      end;
      
    end;
  
  finally
    EVE.Free;
  end;
  
end;

procedure TfrmSBColaboradorEvento.DBGrid1DblClick(Sender: TObject);
var
   CADEVE: TuClassSB_EVENTOS;
begin
  inherited;
  try
    CADEVE:= TuClassSB_EVENTOS.Create;
    DBGrid2.DataSource:= CADEVE.Consultar(' EVENTO_COD not in('+
                        ' select EVENTO_COD from SB_COLABORADOR_EVENTOS '+
                        ' where PESSOA_COD = '+ IntToStr(DBGrid1.Columns[0].Field.AsInteger)+') ');
                        
    Label4.Caption:= DBGrid1.Columns[1].Field.AsString;
    
  finally
    CADEVE.Free;
  end;  


end;

procedure TfrmSBColaboradorEvento.FormShow(Sender: TObject);
var
  EVENTOS : TuClassSB_COLABORADOR_EVENTOS;
  CADEVE : TuClassSB_EVENTOS;
  PESSOA: TuClassGE_COLABORADORES;
  UTILS: TuClassFuncoesGerais;
begin
  inherited;

  UTILS:= TuClassFuncoesGerais.Create;
  UTILS.GravaLog('Acesso a para ligar eventos a um colaborador');
  UTILS.Free;


  try
    EVENTOS:= TuClassSB_COLABORADOR_EVENTOS.Create;
    CADEVE:= TuClassSB_EVENTOS.Create;
    PESSOA:= TuClassGE_COLABORADORES.Create;
    
    gridRegistros.DataSource:= EVENTOS.ConsultarDetalhes('');
    DBGrid1.DataSource:= PESSOA.ConsultaPessoaColaborador('');
    DBGrid2.DataSource:= CADEVE.Consultar('');
  finally
    EVENTOS.Free;
    PESSOA.Free;
    CADEVE.Free;
  end;

end;

procedure TfrmSBColaboradorEvento.gridRegistrosDblClick(Sender: TObject);
begin
  inherited;
  tsVisualiza.Show;
end;

procedure TfrmSBColaboradorEvento.LabeledEdit1Change(Sender: TObject);
var 
  PESSOA: TuClassGE_COLABORADORES;
begin
  inherited;
  try
    PESSOA:= TuClassGE_COLABORADORES.Create;
    DBGrid1.DataSource:= PESSOA.ConsultaPessoaColaborador('NOME like ''%'+LabeledEdit1.Text+'%''');
  finally
    PESSOA.Free;
  end;
end;

procedure TfrmSBColaboradorEvento.LabeledEdit2Change(Sender: TObject);
  var
  CADEVE: TuClassSB_EVENTOS;
begin
  inherited;
  try
    CADEVE:= TuClassSB_EVENTOS.Create;
    DBGrid2.DataSource:= CADEVE.Consultar('DESCRICAO like ''%'+LabeledEdit2.Text+'%'' '+
                        ' and  EVENTO_COD not in('+
                        ' select EVENTO_COD from SB_COLABORADOR_EVENTOS '+
                        ' where PESSOA_COD = '+ IntToStr(DBGrid1.Columns[0].Field.AsInteger)+')');
  finally
    CADEVE.Free;
  end;
end;

end.
