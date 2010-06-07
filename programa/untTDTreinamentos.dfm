inherited frmTDTreinamentos: TfrmTDTreinamentos
  Caption = 'Manuten'#231#227'o de Treinamentos'
  ExplicitTop = -43
  ExplicitWidth = 1043
  ExplicitHeight = 572
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
              FieldName = 'TREINAMENTO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 665
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_INICIO'
              Title.Caption = 'Data In'#237'cio'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_FIM'
              Title.Caption = 'Data Fim'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TURMA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'OBJETIVO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'METODO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'INSTRUTOR_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TECNICA_COD'
              Title.Caption = 'T'#233'cnica'
              Visible = False
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            OnChange = edtPesquisaChange
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = -16
        ExplicitTop = 28
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 13
          Width = 150
          Height = 13
          Caption = 'Descri'#231#227'o do Treinamento'
        end
        object Label3: TLabel
          Left = 30
          Top = 72
          Width = 80
          Height = 13
          Caption = 'Data de In'#237'cio'
        end
        object Label4: TLabel
          Left = 203
          Top = 72
          Width = 69
          Height = 13
          Caption = 'Data de Fim'
        end
        object Label5: TLabel
          Left = 30
          Top = 133
          Width = 37
          Height = 13
          Caption = 'Turma'
        end
        object Label6: TLabel
          Left = 30
          Top = 189
          Width = 142
          Height = 13
          Caption = 'Objetivo do Treinamento'
        end
        object Label7: TLabel
          Left = 30
          Top = 245
          Width = 113
          Height = 13
          Caption = 'M'#233'todo a ser Usado'
        end
        object Label8: TLabel
          Left = 30
          Top = 301
          Width = 50
          Height = 13
          Caption = 'Instrutor'
        end
        object Label9: TLabel
          Left = 30
          Top = 357
          Width = 43
          Height = 13
          Caption = 'T'#233'cnica'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 32
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
        object DtInicio: TDateTimePicker
          Left = 30
          Top = 91
          Width = 149
          Height = 21
          Date = 40335.956649837960000000
          Time = 40335.956649837960000000
          TabOrder = 1
        end
        object DtFim: TDateTimePicker
          Left = 203
          Top = 91
          Width = 186
          Height = 21
          Date = 40335.956793067140000000
          Time = 40335.956793067140000000
          TabOrder = 2
        end
        object lkpTurma: TDBLookupComboBox
          Left = 30
          Top = 152
          Width = 501
          Height = 21
          KeyField = 'TURMA_COD'
          ListField = 'NOME'
          TabOrder = 3
        end
        object lkpObjetivo: TDBLookupComboBox
          Left = 30
          Top = 208
          Width = 501
          Height = 21
          KeyField = 'OBJETIVO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 4
        end
        object lkpMetodo: TDBLookupComboBox
          Left = 30
          Top = 264
          Width = 501
          Height = 21
          KeyField = 'METODO_COD'
          ListField = 'NOME'
          TabOrder = 5
        end
        object lkpInstrutor: TDBLookupComboBox
          Left = 30
          Top = 320
          Width = 501
          Height = 21
          KeyField = 'INSTRUTOR_COD'
          ListField = 'NOME'
          TabOrder = 6
        end
        object lkpTecnica: TDBLookupComboBox
          Left = 30
          Top = 376
          Width = 501
          Height = 21
          Enabled = False
          KeyField = 'TECNICA_COD'
          ListField = 'NOME'
          TabOrder = 7
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
