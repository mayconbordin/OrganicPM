inherited frmFpColaboradorAfastamentos: TfrmFpColaboradorAfastamentos
  Caption = 'Manuten'#231#227'o dos Afastamentos do Colaborador'
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
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'COL_AFA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MOTIVO'
              Title.Caption = 'Motivo'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_INICIAL'
              Title.Caption = 'Data Inicial'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_FINAL'
              Title.Caption = 'Data Final'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATESTADO_MEDICO'
              Title.Caption = 'Atestado'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
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
          Left = 33
          Top = 216
          Width = 62
          Height = 13
          Caption = 'Data Final:'
        end
        object Label6: TLabel
          Left = 177
          Top = 160
          Width = 70
          Height = 13
          Caption = 'Hora Inicial:'
        end
        object Label7: TLabel
          Left = 177
          Top = 216
          Width = 62
          Height = 13
          Caption = 'Hora Final:'
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
          Height = 21
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
          Left = 33
          Top = 235
          Width = 120
          Height = 21
          Date = 40331.893675810180000000
          Time = 40331.893675810180000000
          TabOrder = 3
        end
        object rgAtestado: TRadioGroup
          Left = 33
          Top = 276
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
        object edtHoraInicial: TMaskEdit
          Left = 177
          Top = 179
          Width = 70
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 5
          Text = '  :  '
        end
        object edtHoraFinal: TMaskEdit
          Left = 177
          Top = 235
          Width = 70
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 6
          Text = '  :  '
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
