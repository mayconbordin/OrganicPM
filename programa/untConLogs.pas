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
    procedure FormShow(Sender: TObject);
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
  GridRegistros.DataSource := TuClassFuncoesGerais.ConsultaLog(FormatDateTime('dd/MM/yyyy',dtpDataIni.Date),FormatDateTime('dd/MM/yyyy',dtpDataFim.Date));
end;
                                                                                                    
procedure TfrmConLogs.FormShow(Sender: TObject);
begin
  dtpDataIni.Date := Date;
  dtpDataFim.Date := Date; 
end;

end.
