unit untTDVinctecnicasmetodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, DBCtrls, StdCtrls, ComCtrls, Buttons, Grids, DBGrids,
  ExtCtrls;

type
  TfrmTDVinctecnicasmetodos = class(TfrmModelo)
    TabControl1: TTabControl;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    lkpmetodocod: TDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTDVinctecnicasmetodos: TfrmTDVinctecnicasmetodos;

implementation

{$R *.dfm}

end.
