object frmConLogs: TfrmConLogs
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Consulta de Logs de Usu'#225'rios'
  ClientHeight = 577
  ClientWidth = 846
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 81
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 795
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 142
      Height = 13
      Caption = 'Selecione o per'#237'odo de datas:'
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label3: TLabel
      Left = 160
      Top = 48
      Width = 21
      Height = 13
      Caption = 'At'#233':'
    end
    object dtpDataIni: TDateTimePicker
      Left = 38
      Top = 44
      Width = 97
      Height = 21
      Date = 40348.395769953710000000
      Time = 40348.395769953710000000
      TabOrder = 0
    end
    object dtpDataFim: TDateTimePicker
      Left = 187
      Top = 44
      Width = 94
      Height = 21
      Date = 40348.396678472220000000
      Time = 40348.396678472220000000
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 304
      Top = 42
      Width = 129
      Height = 25
      Caption = 'PESQUISAR'
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  object GridRegistros: TDBGrid
    Left = 0
    Top = 81
    Width = 846
    Height = 496
    Align = alClient
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_LOG'
        Title.Caption = 'Data - Hora'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IP'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACAO'
        Title.Caption = 'A'#231#227'o'
        Width = 500
        Visible = True
      end>
  end
end
