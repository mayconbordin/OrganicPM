unit untSBFolhaPagamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids;

type
  TfrmSBFolhaPagamento = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn2: TBitBtn;
    ComboBox1: TComboBox;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBFolhaPagamento: TfrmSBFolhaPagamento;

implementation

uses uClassSB_FOLHA_PAGAMENTO, uClassGE_COLABORADORES;

{$R *.dfm}

end.
