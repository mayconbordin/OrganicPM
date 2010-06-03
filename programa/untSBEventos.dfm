inherited frmSBEventos: TfrmSBEventos
  Caption = 'frmSBEventos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 320
          Top = 3
          Width = 127
          Height = 13
          Caption = 'F'#243'rmula ou valor fixo:'
        end
        object Tipo: TLabel
          Left = 3
          Top = 3
          Width = 24
          Height = 13
          Caption = 'Tipo'
        end
        object Label3: TLabel
          Left = 3
          Top = 115
          Width = 273
          Height = 13
          Caption = 'Vari'#225'veis dispon'#237'veis para compor as f'#243'rmulas:'
        end
        object LabeledEdit2: TLabeledEdit
          Left = 3
          Top = 88
          Width = 294
          Height = 21
          EditLabel.Width = 56
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 1
        end
        object DBComboBox1: TDBComboBox
          Left = 3
          Top = 28
          Width = 294
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object DBRichEdit1: TDBRichEdit
          Left = 320
          Top = 22
          Width = 662
          Height = 382
          TabOrder = 3
        end
        object ValueListEditor1: TValueListEditor
          Left = 3
          Top = 134
          Width = 294
          Height = 270
          Strings.Strings = (
            'ccc=ccc')
          TabOrder = 2
          TitleCaptions.Strings = (
            'Vari'#225'vel'
            'Valor')
          ColWidths = (
            150
            138)
        end
      end
    end
  end
end
