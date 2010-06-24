unit untTDVincturmastreinandos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmTDVincturmastreinandos = class(TfrmModelo)
    TabControl1: TTabControl;
    Label6: TLabel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox2: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDVincturmastreinandos: TfrmTDVincturmastreinandos;

implementation

{$R *.dfm}

end.
