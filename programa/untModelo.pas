unit untModelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, ImgList,
  ActnList, DB, XPMan, DBCtrls, DBClient;

type
  TAuxDBGrid = class(TDBGrid);
  TfrmModelo = class(TForm)
    Panel1: TPanel;
    pgConsulta: TPageControl;
    tsVisualiza: TTabSheet;
    tsManutencao: TTabSheet;
    gridRegistros: TDBGrid;
    Panel2: TPanel;
    edtPesquisa: TEdit;
    Label1: TLabel;
    lblPesquisa: TLabel;
    btnNovo: TBitBtn;
    btnSalvar: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancel: TBitBtn;
    lblModo1: TLabel;
    procedure pgConsultaChanging(Sender: TObject; var AllowChange: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure gridRegistrosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure tsVisualizaShow(Sender: TObject);
    procedure tsManutencaoShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure EstadoBotoes(modo:string);
  public
    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;
  col: integer;

implementation

{$R *.dfm}

{ TfrmModelo }

procedure TfrmModelo.pgConsultaChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := False;
end;

procedure TfrmModelo.tsManutencaoShow(Sender: TObject);
begin
  EstadoBotoes(lblModo1.Caption);
  edtPesquisa.SetFocus;
end;

procedure TfrmModelo.tsVisualizaShow(Sender: TObject);
begin
  EstadoBotoes(lblModo1.Caption);
end;

procedure TfrmModelo.btnCancelClick(Sender: TObject);
begin
  lblModo1.Caption := 'Listando';
  tsVisualiza.Show;
end;

procedure TfrmModelo.btnEditarClick(Sender: TObject);
begin
  lblModo1.Caption := 'Editando';
  tsManutencao.Show;
end;

procedure TfrmModelo.btnNovoClick(Sender: TObject);
begin
  lblModo1.Caption := 'Inserindo';
  tsManutencao.Show;
end;

procedure TfrmModelo.EstadoBotoes(modo: string);
begin
  if modo = 'Listando' then
    begin
      btnNovo.Enabled := True;
      btnSalvar.Enabled := False;
      btnEditar.Enabled := true;
      btnExcluir.Enabled := True;
      btnCancel.Enabled := False;
    end
  else if (modo = 'Inserindo') or (modo = 'Editando') then
    begin
      btnNovo.Enabled := False;
      btnSalvar.Enabled := True;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancel.Enabled := True;
    end;        

end;

procedure TfrmModelo.FormCreate(Sender: TObject);
begin
  tsVisualiza.Show;
end;

procedure TfrmModelo.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_F3 then
    btnNovo.Click
  else if key = VK_F4 then
    btnSalvar.Click
  else if Key = VK_F5 then
    btnEditar.Click
  else if Key = VK_F7 then
    btnExcluir.Click
  else if Key = VK_F8 then
    btnCancel.Click;      
  
end;

procedure TfrmModelo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 Then
    Begin
       Key := #0;
       PostMessage(Handle,WM_NEXTDLGCTL,0,0);
    End;
end;

procedure TfrmModelo.FormShow(Sender: TObject);
begin
  lblModo1.Caption := 'Listando';
  tsVisualiza.Show;
  EstadoBotoes(lblModo1.Caption);
end;

procedure TfrmModelo.gridRegistrosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
   if (TAuxDBGrid(gridRegistros).DataLink.ActiveRecord + 1 = TAuxDBGrid(gridRegistros).Row) or (gdSelected in State) then
  begin
    gridRegistros.Canvas.Brush.Color := clSkyBlue;
    gridRegistros.Canvas.Font.Style := gridRegistros.Canvas.Font.Style + [fsBold];
    gridRegistros.Canvas.Font.Color := clBlue;
  end;
  try
    if gridRegistros.FieldCount > 0 then
      begin
        gridRegistros.Canvas.FillRect(Rect);
        gridRegistros.Canvas.TextOut(Rect.Left+2,Rect.Top,Column.Field.AsString)
      end;
  except on E: Exception do
  end;
end;

end.
