unit untConLogs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, Grids, DBGrids;

type
  TfrmConLogs = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dtpDataIni: TDateTimePicker;
    Label3: TLabel;
    dtpDataFim: TDateTimePicker;
    BitBtn1: TBitBtn;
    GridRegistros: TDBGrid;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConLogs: TfrmConLogs;

implementation

uses uClassFuncoesGerais;

{$R *.dfm}

procedure TfrmConLogs.BitBtn1Click(Sender: TObject);
begin
  GridRegistros.DataSource := TuClassFuncoesGerais.ConsultaLog('19/06/2009','19/06/2010');
end;
                                                                                                    
end.
