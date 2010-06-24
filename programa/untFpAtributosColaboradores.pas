unit untFpAtributosColaboradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, Menus;

type
  TfrmFpAtributosColaboradores = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    lkpAtributo: TDBLookupComboBox;
    btnAdicionar: TBitBtn;
    Label4: TLabel;
    gridAtributos: TDBGrid;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
    lblInfoColaborador: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnAdicionarClick(Sender: TObject);
    procedure lkpColaboradorClick(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpAtributosColaboradores: TfrmFpAtributosColaboradores;

implementation

uses uClassFP_ATRIBUTOS_COLABORADORES, uClassFP_ATRIBUTOS,
  uClassGE_COLABORADORES, uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmFpAtributosColaboradores.btnAdicionarClick(Sender: TObject);
var
  ATRIBUTOCOLAB: TuClassFP_ATRIBUTOS_COLABORADORES;
  CodPessoa:string;
begin
  inherited;
  ATRIBUTOCOLAB := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  try
    ATRIBUTOCOLAB.PPESSOA_COD := lkpColaborador.KeyValue;
    ATRIBUTOCOLAB.PATRIBUTO_COD := lkpAtributo.KeyValue;
    ATRIBUTOCOLAB.PSTATUS := 'A';
    ATRIBUTOCOLAB.Salvar;
    TuClassFuncoesGerais.GravaLog('Cadastrou novo Atributo para o colaborador: '+lkpColaborador.Text);

    CodPessoa := lkpColaborador.KeyValue;
    gridAtributos.DataSource := ATRIBUTOCOLAB.ConsultaAtributosColaboradores('(FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = '+CodPessoa+')')
  finally
    ATRIBUTOCOLAB.Free;
  end;

end;

procedure TfrmFpAtributosColaboradores.btnEditarClick(Sender: TObject);
var
  ATRIBUTOCOLABORADOR: TuClassFP_ATRIBUTOS_COLABORADORES;
  PessoaCod:string;
begin
  inherited;
  ATRIBUTOCOLABORADOR := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  try
    lkpColaborador.KeyValue := gridRegistros.Columns[0].Field.Value;

    PessoaCod := gridRegistros.Columns[0].Field.Value;
    gridAtributos.DataSource := ATRIBUTOCOLABORADOR.ConsultaAtributosColaboradores('(FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = '+PessoaCod+')')  
  finally
    ATRIBUTOCOLABORADOR.Free;
  end;
end;

procedure TfrmFpAtributosColaboradores.btnExcluirClick(Sender: TObject);
begin
  inherited;
  ShowMessage('Não é possível excluir um colaborador e todos os seus atributos, clique em Editar para realizar a manutenção.');
end;

procedure TfrmFpAtributosColaboradores.btnSalvarClick(Sender: TObject);
var
  ATRIBUTOCOLABORADOR: TuClassFP_ATRIBUTOS_COLABORADORES;
begin
  ATRIBUTOCOLABORADOR := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  try
    inherited;
    gridRegistros.DataSource := ATRIBUTOCOLABORADOR.ConsultaAtributosColaboradores('');
    lblModo1.Caption := 'Listando';
    tsVisualiza.Show;  
  finally
    ATRIBUTOCOLABORADOR.Free;
  end;
end;

procedure TfrmFpAtributosColaboradores.Excluir1Click(Sender: TObject);
var
  ATRIBUTOCOLABORADOR: TuClassFP_ATRIBUTOS_COLABORADORES;
  PessoaCod: String;
begin
  inherited;
  ATRIBUTOCOLABORADOR := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  try
    if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
      begin
        ATRIBUTOCOLABORADOR.PPESSOA_COD := gridAtributos.Columns[0].Field.Value;
        ATRIBUTOCOLABORADOR.PATRIBUTO_COD := gridAtributos.Columns[1].Field.Value;
        ATRIBUTOCOLABORADOR.Excluir;
        TuClassFuncoesGerais.GravaLog('Excluiu Atributo do colaborador: '+lkpColaborador.Text);

        PessoaCod := lkpColaborador.KeyValue;
        gridAtributos.DataSource := ATRIBUTOCOLABORADOR.ConsultaAtributosColaboradores('(FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = '+PessoaCod+')')
      end;

  finally
    ATRIBUTOCOLABORADOR.Free;
  end;
end;

procedure TfrmFpAtributosColaboradores.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassAtributos;
  COLABORADOR: TuClassGE_COLABORADORES;
  ATRIBUTOCOLABORADOR: TuClassFP_ATRIBUTOS_COLABORADORES;
begin
  inherited;
  ATRIBUTO := TuClassAtributos.Create;
  ATRIBUTOCOLABORADOR := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.ConsultaPessoaColaborador('');
    lkpAtributo.ListSource := ATRIBUTO.Consultar('');
    gridRegistros.DataSource := ATRIBUTOCOLABORADOR.ConsultaAtributosColaboradores('');
  finally
    COLABORADOR.Free;
    ATRIBUTO.Free;
    ATRIBUTOCOLABORADOR.Free;
  end;

end;

procedure TfrmFpAtributosColaboradores.lkpColaboradorClick(Sender: TObject);
var
  CodPessoa: String;
  ATRIBUTOCOLAB: TuClassFP_ATRIBUTOS_COLABORADORES;
begin
  inherited;
  ATRIBUTOCOLAB := TuClassFP_ATRIBUTOS_COLABORADORES.Create;
  try
    lblInfoColaborador.Caption := lkpColaborador.Text;
    CodPessoa := lkpColaborador.KeyValue;
    gridAtributos.DataSource := ATRIBUTOCOLAB.ConsultaAtributosColaboradores('(FP_ATRIBUTOS_COLABORADORES.PESSOA_COD = '+CodPessoa+')')
  finally
    ATRIBUTOCOLAB.Free;
  end;
end;

end.
