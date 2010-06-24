inherited frmTDVinctecnicasmetodos: TfrmTDVinctecnicasmetodos
  Caption = 'Vincula'#231#227'o das T'#233'cnicas aos M'#233'todos'
  ExplicitWidth = 1043
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
      end
      inherited tsManutencao: TTabSheet
        ExplicitTop = 28
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label3: TLabel
          Left = 30
          Top = 32
          Width = 41
          Height = 13
          Caption = 'M'#233'todo'
        end
        object TabControl1: TTabControl
          Left = 30
          Top = 128
          Width = 860
          Height = 272
          TabOrder = 0
          Tabs.Strings = (
            'T'#233'cnicas')
          TabIndex = 0
          object Label2: TLabel
            Left = 16
            Top = 34
            Width = 43
            Height = 13
            Caption = 'T'#233'cnica'
          end
          object DBGrid1: TDBGrid
            Left = 16
            Top = 80
            Width = 825
            Height = 177
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Verdana'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                Title.Caption = 'M'#233'todo'
                Width = 357
                Visible = True
              end
              item
                Expanded = False
                Title.Caption = 'Nome da T'#233'cnica'
                Width = 424
                Visible = True
              end>
          end
          object ComboBox1: TComboBox
            Left = 16
            Top = 53
            Width = 689
            Height = 21
            ItemHeight = 13
            TabOrder = 1
          end
          object BitBtn1: TBitBtn
            Left = 711
            Top = 40
            Width = 130
            Height = 34
            Caption = 'Adicionar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btnNovoClick
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00A3676900A3676900A3676900A3676900A3676900A3676900A3676900A367
              6900A3676900A3676900A3676900A3676900A3676900FF00FF00FF00FF00FF00
              FF00B18C8400F7E5D000F1D7B900EECFAD00EECBA100EEC99600ECC58E00EAC1
              8B00EAC18B00EAC18B00EAC18B00EDC79100A3676900FF00FF00FF00FF00FF00
              FF00B1908900F7E5D000F2D8BC00F0D4B600EDCDA800EECBA100EDC79100EBC3
              8C00E9BF8800E9BF8800E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
              FF00B2928B00F9EDDF00F4DEC600F2D8BC00F0D4B600EECFAD00EECBA100EEC9
              9600EBC38C00E9BF8800E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
              FF00B2968E00FAF2E800F7E5D000F4DEC600F2D8BC00F0D4B600EDCDA800EECB
              A100EDC79100EBC38C00E9BF8800EBC38C00A3676900FF00FF00FF00FF00FF00
              FF00B19D9700FCF8F300F9EDDF00F7E5D000F4DEC600F2D8BC00F0D4B600EECF
              AD00EECBA100EDC79100EBC38C00ECC58E00A3676900FF00FF00FF00FF00FF00
              FF00AFA19C00FDFCFB00FAF2E800F8E8D600F7E5D000F4DEC600F2D8BC00F0D4
              B600EDCDA800EECA9C00EDC79100EDC79100A3676900FF00FF00FF00FF00FF00
              FF00E2AC9A00FDFCFB00FCF8F300FAF2E800F8E8D600F7E5D000F4DEC600F2D8
              BC00F0D4B600EDCDA800EECBA100EEC99600A3676900FF00FF00FF00FF00FF00
              FF00E2AC9A00FDFCFB00FDFCFB00FBF5EF00FAF2E800F8E8D600F7E5D000F4DE
              C600F2D8BC00F0D4B600EDCDA800EECBA100A3676900FF00FF00FF00FF00FF00
              FF00E2AC9A00FDFCFB00FDFCFB00FDFCFB00FCF8F300FAF2E800F8E8D600F7E5
              D000F4DEC600F1D7B900F1D7B900EDCCA500A3676900FF00FF00FF00FF00FF00
              FF00E3B29600FDFCFB00FDFCFB00FDFCFB00FDFCFB00FCF8F300FAF2E800F8E8
              D600F7E5D000F7E5D000EED0B200B29B9300A3676900FF00FF00FF00FF00FF00
              FF00E3B29600FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FBF5EF00FAF2
              E800F4DEC600B0887E00A3706F00A3706F00A3676900FF00FF00FF00FF00FF00
              FF00E3B29600FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFA
              F700C4BDBC00B16F5B00D5863D00D6863C00B5725800FF00FF00FF00FF00FF00
              FF00EDCCA500FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFCFB00FDFC
              FB00C4BDBC00B5857400E9BF8800BF774F00FF00FF00FF00FF00FF00FF00FF00
              FF00E5BB8E00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5EF00FBF5
              EF00C4BDBC00B7735600B5857400FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00EECFAD00EED0B200EED0B200EED0B200EED0B200EED0B200EED0B200EED0
              B200EED0B200AC6C5F00FF00FF00FF00FF00FF00FF00FF00FF00}
          end
        end
        object lkpmetodocod: TDBComboBox
          Left = 30
          Top = 51
          Width = 705
          Height = 21
          ItemHeight = 13
          TabOrder = 1
        end
      end
    end
  end
end
