unit untFpColaboradorDependentes.dcu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmFpColaboradoresDependentes = class(TfrmModelo)
    Label2: TLabel;
    lkpColaborador: TDBLookupComboBox;
    Label3: TLabel;
    edtNome: TEdit;
    Label4: TLabel;
    edtCpf: TEdit;
    Label5: TLabel;
    edtRg: TEdit;
    rgEstudante: TRadioGroup;
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
  frmFpColaboradoresDependentes: TfrmFpColaboradoresDependentes;

implementation

uses uClassFP_COLABORADOR_DEPENDENTES, uClassGE_COLABORADORES;

{$R *.dfm}

procedure TfrmFpColaboradoresDependentes.btnEditarClick(Sender: TObject);
var
  COLABDEPENDENTE: TuClassFP_COLABORADOR_DEPENDENTES;
begin
  inherited;
  COLABDEPENDENTE := TuClassFP_COLABORADOR_DEPENDENTES.Create;
  try
    COLABDEPENDENTE.PCOL_DEP_COD := gridRegistros.Columns[0].Field.Value;
    COLABDEPENDENTE.Carregar;

    lkpColaborador.KeyValue := COLABDEPENDENTE.PPESSOA_COD;
    edtNome.Text := COLABDEPENDENTE.PNOME;
    edtCpf.Text := COLABDEPENDENTE.PCPF;
    edtRg.Text := COLABDEPENDENTE.PRG;
    if COLABDEPENDENTE.PESTUDANTE = 'S' then
      rgEstudante.ItemIndex := 0
    else
      rgEstudante.ItemIndex := 1;
    

  finally
    COLABDEPENDENTE.Free;
  end;
end;

procedure TfrmFpColaboradoresDependentes.btnExcluirClick(Sender: TObject);
var
  COLABDEPENDENTE: TuClassFP_COLABORADOR_DEPENDENTES;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      COLABDEPENDENTE := TuClassFP_COLABORADOR_DEPENDENTES.Create;
      try
        COLABDEPENDENTE.PCOL_DEP_COD := gridRegistros.Columns[0].Field.Value;
        COLABDEPENDENTE.Excluir;
        gridRegistros.DataSource := COLABDEPENDENTE.Consultar('');
      finally
        COLABDEPENDENTE.Free;
      end;
    end;
end;

procedure TfrmFpColaboradoresDependentes.btnSalvarClick(Sender: TObject);
var
  COLABDEPENDENTE: TuClassFP_COLABORADOR_DEPENDENTES;
begin
  inherited;
  COLABDEPENDENTE := TuClassFP_COLABORADOR_DEPENDENTES.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        COLABDEPENDENTE.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABDEPENDENTE.PNOME := edtNome.Text;
        COLABDEPENDENTE.PCPF := edtCpf.Text;
        COLABDEPENDENTE.PRG := edtRg.Text;

        if rgEstudante.ItemIndex = 0 then
          COLABDEPENDENTE.PESTUDANTE := 'S'
        else
          COLABDEPENDENTE.PESTUDANTE := 'N';

        if COLABDEPENDENTE.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABDEPENDENTE.Consultar('');
          end
        else
          ShowMessage('Falha!');

      end
    else if lblModo1.Caption = 'Editando' then
      begin
        COLABDEPENDENTE.PPESSOA_COD := lkpColaborador.KeyValue;
        COLABDEPENDENTE.PNOME := edtNome.Text;
        COLABDEPENDENTE.PCPF := edtCpf.Text;
        COLABDEPENDENTE.PRG := edtRg.Text;

        if rgEstudante.ItemIndex = 0 then
          COLABDEPENDENTE.PESTUDANTE := 'S'
        else
          COLABDEPENDENTE.PESTUDANTE := 'N';

        COLABDEPENDENTE.PCOL_DEP_COD := gridRegistros.Columns[0].Field.Value;  

        if COLABDEPENDENTE.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := COLABDEPENDENTE.Consultar('');
          end;
      end;
  finally
    COLABDEPENDENTE.Free;
  end;
end;

procedure TfrmFpColaboradoresDependentes.FormShow(Sender: TObject);
var
  COLABDEPENDENTE: TuClassFP_COLABORADOR_DEPENDENTES;
  COLABORADOR: TuClassGE_COLABORADORES;
begin
  inherited;
  COLABDEPENDENTE := TuClassFP_COLABORADOR_DEPENDENTES.Create;
  COLABORADOR := TuClassGE_COLABORADORES.Create;
  try
    lkpColaborador.ListSource := COLABORADOR.Consultar('GE_COLABORADORES.STATUS = ''A'' ');

    gridRegistros.DataSource := COLABDEPENDENTE.Consultar('');

  finally
    COLABDEPENDENTE.Free;
    COLABORADOR.Free;
  end;
end;

end.
