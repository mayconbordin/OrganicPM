inherited frmFpColaboradorAfastamentos: TfrmFpColaboradorAfastamentos
  Caption = 'Manuten'#231#227'o dos Afastamentos do Colaborador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsManutencao: TTabSheet
        ExplicitTop = 28
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 33
          Top = 24
          Width = 146
          Height = 13
          Caption = 'Selecione o Colaborador:'
        end
        object Label3: TLabel
          Left = 33
          Top = 80
          Width = 42
          Height = 13
          Caption = 'Motivo:'
        end
        object Label4: TLabel
          Left = 33
          Top = 160
          Width = 70
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label5: TLabel
          Left = 171
          Top = 160
          Width = 62
          Height = 13
          Caption = 'Data Final:'
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 33
          Top = 41
          Width = 224
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object edtMotivo: TEdit
          Left = 33
          Top = 99
          Width = 456
          Height = 46
          TabOrder = 1
        end
        object dtpDataIni: TDateTimePicker
          Left = 33
          Top = 179
          Width = 120
          Height = 21
          Date = 40331.893675810180000000
          Time = 40331.893675810180000000
          TabOrder = 2
        end
        object dtpDataFim: TDateTimePicker
          Left = 171
          Top = 179
          Width = 120
          Height = 21
          Date = 40331.893675810180000000
          Time = 40331.893675810180000000
          TabOrder = 3
        end
        object rgAtestado: TRadioGroup
          Left = 312
          Top = 167
          Width = 185
          Height = 33
          Caption = 'Atestado M'#233'dico'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 4
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
end
