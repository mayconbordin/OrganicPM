inherited frmFpAtributosColaboradores: TfrmFpAtributosColaboradores
  Caption = 
    'Manuten'#231'ao dos Conhecimentos, Habilidades e Atitudes do Colabora' +
    'dor'
  ExplicitWidth = 1043
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              ImeName = 'PESSOA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ATRIBUTO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Colaborador'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Atributo'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 50
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          object Label7: TLabel [3]
            Left = 589
            Top = 40
            Width = 370
            Height = 13
            Caption = 'C = Conhecimento   H = Habilidade   A = Atitude   T = Atividade'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 25
          Width = 146
          Height = 13
          Caption = 'Selecione o Colaborador:'
        end
        object Label3: TLabel
          Left = 30
          Top = 99
          Width = 120
          Height = 13
          Caption = 'Selecione o Atributo:'
        end
        object Label4: TLabel
          Left = 30
          Top = 157
          Width = 126
          Height = 13
          Caption = 'Atributos do Cargo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 30
          Top = 357
          Width = 228
          Height = 13
          Caption = 'Clique com o bot'#227'o direiro para excluir.'
        end
        object lblInfoColaborador: TLabel
          Left = 162
          Top = 154
          Width = 12
          Height = 13
          BiDiMode = bdLeftToRight
          Caption = '...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentBiDiMode = False
          ParentFont = False
        end
        object Label6: TLabel
          Left = 30
          Top = 373
          Width = 370
          Height = 13
          Caption = 'C = Conhecimento   H = Habilidade   A = Atitude   T = Atividade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 30
          Top = 44
          Width = 267
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
          OnClick = lkpColaboradorClick
        end
        object lkpAtributo: TDBLookupComboBox
          Left = 30
          Top = 118
          Width = 267
          Height = 21
          KeyField = 'ATRIBUTO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 1
        end
        object btnAdicionar: TBitBtn
          Left = 328
          Top = 115
          Width = 137
          Height = 25
          Caption = 'ADICIONAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnAdicionarClick
        end
        object gridAtributos: TDBGrid
          Left = 30
          Top = 176
          Width = 494
          Height = 177
          PopupMenu = PopupMenu1
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ATRIBUTO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Atributo'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 70
              Visible = True
            end>
        end
      end
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 560
    Top = 240
    object Excluir1: TMenuItem
      Bitmap.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0001079F000313AA000319B0000319B0000313
        AA000108A100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0001069F000319B0000530C2000733C6000733C6000733C6000733
        C6000531C2000420B60001069F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000108A100042CC0000733C6000733C6000531C2000531C2000531C2000531
        C2000733C6000733C600042CC000020CA500FF00FF00FF00FF00FF00FF000106
        9F000225CC000C38D3000531C3000223C900042EC1000531C2000531C2000530
        C200042ABE00042EC1000733C600042EC10001069F00FF00FF00FF00FF000219
        B9000836ED00022CDE00133BD8005070F1001C3FC800042CC000042CC0000A34
        C7005070F1001C3FC800042EC1000733C6000420B600FF00FF0001069F00022E
        E6000635F200022DE3005070F100FBFBFE00B8C6FB000B35CA00042EC100A1B3
        F700FBFBFE005070F100042ABE000733C6000531C2000108A100020FAB000333
        F6000333F6000230EE000836ED0096A2FA00FBFBFE00B2C1FA00A7B9F700FBFB
        FE00A7B9F7001C3FC800042EC1000531C2000733C6000313AA000219B9001A44
        E7000635F2000434F5000230F000022EE60096A5FA00FBFBFE00FBFBFE00A7B9
        F7000632C500042CC0000531C2000531C2000733C6000319B000031DBE004467
        F7001F49EB000333F6000231F3000231F200A4B6F700FBFBFE00FBFBFE00B8C6
        FB000C36CE00042CC0000531C2000531C2000733C6000319B0000215B3005070
        F1004A6CF6000333F6000635F200A1B3F700FBFBFE00A4B6F70096A5FA00FBFB
        FE00B8C6FB001C3FC800042EC1000632C5000733C6000313AA0001069F004A6A
        EE0096A5FA001F49EB004C6EF500FBFBFE00A7B9F7000333F6000230EC0096A2
        FA00FBFBFE005070F1000226D0000B35CA000530C20001069F00FF00FF001C3F
        C8009EAFF90096A2FA002850EF004C6EF5000635F2000231F3000231F3000635
        F2004C6DF1000C38E500032CDB000C38D3000420B600FF00FF00FF00FF000106
        9F004462E100B8C6FB009EAFF9003B60F8000635F2000333F6000333F6000333
        F6000231F2000836ED000836ED000225CC0001069F00FF00FF00FF00FF00FF00
        FF00010AA4004462E100A7B9F700C0CCFB0096A5FA005070F1005070F1004A6C
        F6003B60F8001A44E700032AD8000108A100FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0001069F001C3FC8005070F100999FFA0096A2FA00A096FB005070
        F1001F49EB00041FC10001069F00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0001069F000219B9000321C600041FC1000215
        B30001069F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      Caption = 'Excluir'
      OnClick = Excluir1Click
    end
  end
end
