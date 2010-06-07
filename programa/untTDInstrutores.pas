unit untTDInstrutores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  Mask;

type
  TfrmTDInstrutores = class(TfrmModelo)
    Label2: TLabel;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtEmail: TEdit;
    Label5: TLabel;
    edtBairro: TEdit;
    Label6: TLabel;
    Memo1: TMemo;
    Label7: TLabel;
    edtReferencia: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtNome: TEdit;
    edtCPF: TMaskEdit;
    edtCEP: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtCPFExit(Sender: TObject);
    procedure edtEmailExit(Sender: TObject);
    procedure Memo1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDInstrutores: TfrmTDInstrutores;
  Dado : string;
  function TestaCPF(Dado : string) : boolean;

implementation

uses uClassTD_INSTRUTORES;

{$R *.dfm}

procedure TfrmTDInstrutores.btnEditarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO := TuClassTD_INSTRUTORES.Create;
  try
    ATRIBUTO.PINSTRUTOR_COD := gridRegistros.Columns[0].Field.Value;
    ATRIBUTO.Carregar;
    edtNome.Text := ATRIBUTO.PNOME;
    edtEndereco.Text := ATRIBUTO.PENDERECO;
    edtBairro.Text := ATRIBUTO.PBAIRRO;
    edtCPF.Text := ATRIBUTO.PCPF;
    edtEmail.Text := ATRIBUTO.PEMAIL;
    edtReferencia.Text := ATRIBUTO.PLOCAL_REFERENCIA;
    edtCEP.Text := ATRIBUTO.PLOGRADOURO;
    Memo1.Text := ATRIBUTO.PEXPERIENCIAS;
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDInstrutores.btnExcluirClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_INSTRUTORES;
begin
  inherited;
  if (MessageDlg('Excluir Registro?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
    begin
      ATRIBUTO:= TuClassTD_INSTRUTORES.Create;
      try
        ATRIBUTO.PINSTRUTOR_COD := gridRegistros.Columns[0].Field.Value;
        ATRIBUTO.Excluir;
        gridRegistros.DataSource := ATRIBUTO.Consultar('');
      finally
        ATRIBUTO.Free;
      end;
    end;
end;

procedure TfrmTDInstrutores.btnSalvarClick(Sender: TObject);
var
  ATRIBUTO: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO := TuClassTD_INSTRUTORES.Create;
  try
    if lblModo1.Caption = 'Inserindo' then
      begin
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.PENDERECO := edtEndereco.Text;
        ATRIBUTO.PBAIRRO := edtBairro.Text;
        ATRIBUTO.PCPF := edtCPF.Text;
        ATRIBUTO.PEMAIL := edtEmail.Text;
        ATRIBUTO.PLOCAL_REFERENCIA := edtReferencia.Text;
        ATRIBUTO.PLOGRADOURO := edtCEP.Text;
        ATRIBUTO.PEXPERIENCIAS := Memo1.Text;
        if ATRIBUTO.Salvar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Incluir o Registro.');
      end
    else if lblModo1.Caption = 'Editando' then
      begin
        ATRIBUTO.PNOME := edtNome.Text;
        ATRIBUTO.PENDERECO := edtEndereco.Text;
        ATRIBUTO.PBAIRRO := edtBairro.Text;
        ATRIBUTO.PCPF := edtCPF.Text;
        ATRIBUTO.PEMAIL := edtEmail.Text;
        ATRIBUTO.PLOCAL_REFERENCIA := edtReferencia.Text;
        ATRIBUTO.PLOGRADOURO := edtCEP.Text;
        ATRIBUTO.PEXPERIENCIAS := Memo1.Text;
        if ATRIBUTO.Editar then
          begin
            lblModo1.Caption := 'Listando';
            tsVisualiza.Show;
            gridRegistros.DataSource := ATRIBUTO.Consultar('');
          end
        else
          ShowMessage('Falha ao Editar o Registro.');
      end;
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDInstrutores.edtCPFExit(Sender: TObject);
begin
  inherited;
  if edtCPF.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       edtCPF.SetFocus
     end;
  if not testaCPF (edtCPF.Text) then
     begin
       ShowMessage ('Dígitos verificadores não fecham!');
       edtCPF.SetFocus
     end;

end;

procedure TfrmTDInstrutores.edtEmailExit(Sender: TObject);
begin
  inherited;
  if edtEmail.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       edtEmail.SetFocus
     end;
end;

procedure TfrmTDInstrutores.edtNomeExit(Sender: TObject);
begin
  inherited;
  if edtNome.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       edtNome.SetFocus
     end;
end;

procedure TfrmTDInstrutores.edtPesquisaChange(Sender: TObject);
var
  ATRIBUTO: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO:= TuClassTD_INSTRUTORES.Create;
  try
    if Length(edtPesquisa.Text) > 0 then
      begin
        gridRegistros.DataSource := ATRIBUTO.Consultar('NOME LIKE '''+edtPesquisa.Text+'%''');
      end
    else
      gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;

end;

procedure TfrmTDInstrutores.FormShow(Sender: TObject);
var
  ATRIBUTO: TuClassTD_INSTRUTORES;
begin
  inherited;
  ATRIBUTO:= TuClassTD_INSTRUTORES.Create;
  try
    gridRegistros.DataSource := ATRIBUTO.Consultar('');
  finally
    ATRIBUTO.Free;
  end;
end;

procedure TfrmTDInstrutores.Memo1Exit(Sender: TObject);
begin
  inherited;
  if Memo1.Lines.Text = EmptyStr then
     begin
       ShowMessage ('O campo não pode ser vazio!');
       Memo1.SetFocus
     end;
end;

function TestaCPF(Dado : string) : boolean;
var D1 : array[1..9] of byte;
    I, DF1, DF2, DF3, DF4, DF5, DF6,
    Resto1, Resto2, PrimeiroDigito, SegundoDigito : integer;
begin
    Result := true;
    for I := 1 to 9 do
        if Dado[I] in ['0'..'9'] then
           D1[I] := StrToInt(Dado[I])
        else
           Result := false;
    if Result then
    begin
       DF1 := 0; DF2 := 0; DF3 := 0; DF4 := 0; DF5 := 0; DF6 := 0;
       Resto1 := 0; Resto2 := 0;
       PrimeiroDigito := 0; SegundoDigito := 0;
       DF1 := 10*D1[1] + 9*D1[2] + 8*D1[3] + 7*D1[4] + 6*D1[5] + 5*D1[6] +
              4*D1[7] + 3*D1[8] + 2*D1[9];
       DF2 := DF1 div 11;
       DF3 := DF2 * 11;
       Resto1 := DF1 - DF3;
       if (Resto1 = 0) or (Resto1 = 1) then
           PrimeiroDigito := 0
       else
           PrimeiroDigito := 11 - Resto1;
           DF4 := 11*D1[1] + 10*D1[2] + 9*D1[3] + 8*D1[4] + 7*D1[5] + 6*D1[6] +
                  5*D1[7] + 4*D1[8] + 3*D1[9] + 2*PrimeiroDigito;
           DF5 := DF4 div 11;
           DF6 := DF5 * 11;
           Resto2 := DF4 - DF6;
           if (Resto2 = 0) or (Resto2 = 1) then
               SegundoDigito := 0
           else
               SegundoDigito := 11 - Resto2;
           if (PrimeiroDigito <> StrToInt(Dado[10])) or
              (SegundoDigito <> StrToInt(Dado[11])) then
               Result := false;
     end;
end;

end.
