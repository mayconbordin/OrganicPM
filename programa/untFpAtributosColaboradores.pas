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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFpAtributosColaboradores: TfrmFpAtributosColaboradores;

implementation

{$R *.dfm}

end.
