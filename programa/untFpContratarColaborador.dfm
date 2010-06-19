object frmFpContratarColaborador: TfrmFpContratarColaborador
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contrata'#231#227'o dos Candidatos'
  ClientHeight = 339
  ClientWidth = 655
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 655
    Height = 89
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 788
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 145
      Height = 13
      Caption = 'Selecione o Processo Seletivo:'
    end
    object Label2: TLabel
      Left = 16
      Top = 69
      Width = 385
      Height = 13
      Caption = 
        'Candidatos Classificados, clique com o bot'#227'o direito para efetua' +
        'r a contrata'#231#227'o:'
    end
    object lkpProcessoSeletivo: TDBLookupComboBox
      Left = 16
      Top = 26
      Width = 401
      Height = 21
      KeyField = 'pro_sel_cod'
      ListField = 'descricao'
      TabOrder = 0
      OnClick = lkpProcessoSeletivoClick
    end
  end
  object gridCandidatos: TDBGrid
    Left = 0
    Top = 89
    Width = 655
    Height = 250
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Candidato'
        Width = 480
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Title.Caption = 'Status'
        Width = 100
        Visible = True
      end>
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 24
    object Editar1: TMenuItem
      Caption = 'Contratar'
    end
  end
end
