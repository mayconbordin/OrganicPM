inherited frmSBCadastroFerias: TfrmSBCadastroFerias
  Caption = 'Registro das f'#233'rias do colaborador'
  ExplicitWidth = 1043
  ExplicitHeight = 579
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
              Title.Caption = 'C'#243'digo'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Colaborador'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAD_FER_DATA_INICIO'
              Title.Caption = 'In'#237'cio'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAD_FER_DATA_FIM'
              Title.Caption = 'Fim'
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 16
            Width = 188
            Caption = 'PESQUISA pelo colaborador :'
            ExplicitLeft = 16
            ExplicitWidth = 188
          end
          inherited edtPesquisa: TEdit
            Left = 16
            Width = 297
            OnChange = edtPesquisaChange
            ExplicitLeft = 16
            ExplicitWidth = 297
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 768
          Top = 3
          Width = 31
          Height = 13
          Caption = 'In'#237'cio'
        end
        object Label3: TLabel
          Left = 768
          Top = 189
          Width = 20
          Height = 13
          Caption = 'Fim'
        end
        object DBGrid1: TDBGrid
          Left = 11
          Top = 72
          Width = 734
          Height = 332
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Title.Caption = 'Colaborador'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 483
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ADMISSAO'
              Title.Caption = 'Data de admiss'#227'o'
              Width = 122
              Visible = True
            end>
        end
        object MonthCalendar1: TMonthCalendar
          Left = 768
          Top = 208
          Width = 191
          Height = 154
          Date = 40332.533024629630000000
          TabOrder = 1
        end
        object MonthCalendar2: TMonthCalendar
          Left = 768
          Top = 16
          Width = 191
          Height = 153
          Date = 40332.533024629630000000
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
          OnChange = LabeledEdit1Change
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
