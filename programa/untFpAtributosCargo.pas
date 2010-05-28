unit untFpAtributosCargo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls,
  DBCtrls, Menus;

type
  TfrmFpAtributosCargo = class(TfrmModelo)
    Label2: TLabel;
    lkpCargo: TDBLookupComboBox;
    Label3: TLabel;
    lkpAtributo: TDBLookupComboBox;
    btnAdicionar: TBitBtn;
    gridAtributos: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    PopupMenu1: TPopupMenu;
    Excluir1: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpAtributosCargo: TfrmFpAtributosCargo;

implementation

{$R *.dfm}

end.
