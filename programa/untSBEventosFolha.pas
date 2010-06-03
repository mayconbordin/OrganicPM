unit untSBEventosFolha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBEventosFolha = class(TfrmModelo)
    LabeledEdit1: TLabeledEdit;
    DBGrid1: TDBGrid;
    LabeledEdit2: TLabeledEdit;
    DBGrid2: TDBGrid;
    LabeledEdit3: TLabeledEdit;
    DBGrid3: TDBGrid;
    LabeledEdit4: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBEventosFolha: TfrmSBEventosFolha;

implementation

{$R *.dfm}

end.
