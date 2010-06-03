unit untSBCadastroFerias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, untModelo, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TfrmSBCadastroFerias = class(TfrmModelo)
    DBGrid1: TDBGrid;
    MonthCalendar1: TMonthCalendar;
    MonthCalendar2: TMonthCalendar;
    Label2: TLabel;
    Label3: TLabel;
    LabeledEdit1: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSBCadastroFerias: TfrmSBCadastroFerias;

implementation

{$R *.dfm}

end.
