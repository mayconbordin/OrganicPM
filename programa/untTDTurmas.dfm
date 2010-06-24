inherited frmTDTurmas: TfrmTDTurmas
  Caption = 'Manuten'#231#227'o de Turmas'
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
              FieldName = 'TURMA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AMBIENTE_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome da Turma'
              Width = 950
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            OnChange = edtPesquisaChange
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 130
          Width = 92
          Height = 13
          Caption = 'Nome da Turma'
        end
        object Label3: TLabel
          Left = 30
          Top = 53
          Width = 54
          Height = 13
          Caption = 'Ambiente'
        end
        object Label4: TLabel
          Left = 291
          Top = 276
          Width = 69
          Height = 13
          Caption = 'Data de Fim'
        end
        object Label5: TLabel
          Left = 30
          Top = 276
          Width = 80
          Height = 13
          Caption = 'Data de In'#237'cio'
        end
        object Label6: TLabel
          Left = 30
          Top = 200
          Width = 50
          Height = 13
          Caption = 'Instrutor'
        end
        object edtNome: TEdit
          Left = 30
          Top = 149
          Width = 680
          Height = 21
          MaxLength = 40
          TabOrder = 1
          OnExit = edtNomeExit
        end
        object lkpAmbienteCod: TDBLookupComboBox
          Left = 30
          Top = 72
          Width = 680
          Height = 21
          KeyField = 'AMBIENTE_COD'
          ListField = 'DESCRICAO'
          TabOrder = 0
        end
        object DtFim: TDateTimePicker
          Left = 291
          Top = 295
          Width = 139
          Height = 21
          Date = 40335.956793067140000000
          Time = 40335.956793067140000000
          TabOrder = 2
        end
        object DtInicio: TDateTimePicker
          Left = 30
          Top = 295
          Width = 139
          Height = 21
          Date = 40335.956649837960000000
          Time = 40335.956649837960000000
          TabOrder = 3
        end
        object RadioGroup1: TRadioGroup
          Left = 547
          Top = 276
          Width = 163
          Height = 101
          Caption = 'Turno:'
          Items.Strings = (
            'Manha'
            'Tarde'
            'Noite')
          TabOrder = 4
        end
        object lkpInstrutorCod: TDBLookupComboBox
          Left = 30
          Top = 219
          Width = 680
          Height = 21
          KeyField = 'INSTRUTOR_COD'
          ListField = 'NOME'
          TabOrder = 5
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
