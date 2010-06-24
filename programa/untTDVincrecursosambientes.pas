unit untTDVincrecursosambientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDVincrecursosAmbientes = class(TfrmModelo)
    TabControl1: TTabControl;
    Label8: TLabel;
    ComboBox1: TComboBox;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    ComboBox2: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDVincrecursosAmbientes: TfrmTDVincrecursosAmbientes;

implementation

uses uClassTD_RECURSOS_AMBIENTES;

{$R *.dfm}

end.
