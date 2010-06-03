inherited frmSBCadastroFerias: TfrmSBCadastroFerias
  Caption = 'frmSBCadastroFerias'
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
          Left = 768
          Top = 13
          Width = 31
          Height = 13
          Caption = 'In'#237'cio'
        end
        object Label3: TLabel
          Left = 768
          Top = 221
          Width = 20
          Height = 13
          Caption = 'Fim'
        end
        object DBGrid1: TDBGrid
          Left = 11
          Top = 72
          Width = 734
          Height = 332
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object MonthCalendar1: TMonthCalendar
          Left = 768
          Top = 240
          Width = 191
          Height = 154
          Date = 40332.651138773150000000
          TabOrder = 1
        end
        object MonthCalendar2: TMonthCalendar
          Left = 768
          Top = 32
          Width = 191
          Height = 154
          Date = 40332.651277662040000000
          TabOrder = 2
        end
        object LabeledEdit1: TLabeledEdit
          Left = 11
          Top = 32
          Width = 734
          Height = 21
          EditLabel.Width = 116
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar pela pessoa:'
          TabOrder = 3
        end
      end
    end
  end
end
