unit untGeColaboradores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls;

type
  TfrmGeColaboradores = class(TfrmModelo)
    Label2: TLabel;
    edtNome: TEdit;
    Label3: TLabel;
    edtEndereco: TEdit;
    Label4: TLabel;
    edtMail1: TEdit;
    Label5: TLabel;
    edtNaturalidade: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtCpf: TEdit;
    Label8: TLabel;
    edtBairro: TEdit;
    Label9: TLabel;
    edtMail2: TEdit;
    Label10: TLabel;
    edtCidade: TEdit;
    Label11: TLabel;
    edtCep: TEdit;
    Label12: TLabel;
    edtPais: TEdit;
    Label13: TLabel;
    edtNumero: TEdit;
    dtpDataNasc: TDateTimePicker;
    Label14: TLabel;
    lkpUnidFederat: TDBLookupComboBox;
    Label15: TLabel;
    edtComplemento: TEdit;
    Label16: TLabel;
    lkpEstadoCivil: TDBLookupComboBox;
    Label17: TLabel;
    Edit1: TEdit;
    Label18: TLabel;
    Edit2: TEdit;
    Label19: TLabel;
    edtBanco: TEdit;
    Label20: TLabel;
    dtpDataAdmissao: TDateTimePicker;
    Label21: TLabel;
    dtpDataDemissao: TDateTimePicker;
    Label22: TLabel;
    Edit4: TEdit;
    Label23: TLabel;
    Edit5: TEdit;
    Label24: TLabel;
    Edit6: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeColaboradores: TfrmGeColaboradores;

implementation

uses uClassGE_ESTADOS_CIVIS, uClassGE_UNIDADES_FEDERATIVAS;

{$R *.dfm}

procedure TfrmGeColaboradores.FormShow(Sender: TObject);
var
  ESTADOCIVIL: TuClassGE_ESTADOS_CIVIS;
  UNIDADEFEDERATIVA: TuClassGE_UNIDADES_FEDERATIVAS;
begin
  inherited;
  dtpDataNasc.Date := Date;
  dtpDataAdmissao.Date := Date;
  dtpDataDemissao.Date := Date;

  ESTADOCIVIL := TuClassGE_ESTADOS_CIVIS.Create;
  UNIDADEFEDERATIVA := TuClassGE_UNIDADES_FEDERATIVAS.Create;
  try
    lkpUnidFederat.ListSource := ESTADOCIVIL.Consultar('');
    lkpEstadoCivil.ListSource := UNIDADEFEDERATIVA.Consultar('');

    //consultar ultimas pessoas cadastradassss

  finally
    ESTADOCIVIL.Free;
    UNIDADEFEDERATIVA.Free;
  end;

end;

end.
