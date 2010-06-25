inherited frmSBEventosFolha: TfrmSBEventosFolha
  Caption = 'Eventos que compuseram uma determinada folha de pagamento'
  ExplicitWidth = 1043
  ExplicitHeight = 579
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
              FieldName = 'PESSOA_COD'
              Title.Caption = 'Pessoa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 677
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ADMISSAO'
              Title.Caption = 'Admiss'#227'o'
              Width = 123
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            Width = 472
            ExplicitWidth = 472
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = -52
        ExplicitTop = 48
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 335
          Top = 5
          Width = 134
          Height = 13
          Caption = 'Benef'#237'cios de valor fixo'
        end
        object Label3: TLabel
          Left = 661
          Top = 5
          Width = 180
          Height = 13
          Caption = 'Eventos de valor vari'#225'vel'
        end
        object Label4: TLabel
          Left = 3
          Top = 5
          Width = 37
          Height = 13
          Caption = 'Label4'
        end
        object gridFolha: TDBGrid
          Left = 3
          Top = 24
          Width = 320
          Height = 380
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDblClick = gridFolhaDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'FOL_PAG_COD'
              Title.Caption = 'Folha'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_INICIAL'
              Title.Caption = 'Inicial'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_FINAL'
              Title.Caption = 'Final'
              Width = 112
              Visible = True
            end>
        end
        object gridFixos: TDBGrid
          Left = 335
          Top = 24
          Width = 320
          Height = 380
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object valorFinal: TLabeledEdit
          Left = 662
          Top = 383
          Width = 320
          Height = 21
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Valor'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Verdana'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          TabOrder = 2
        end
        object gridVeriaveis: TDBGrid
          Left = 661
          Top = 24
          Width = 320
          Height = 337
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
      end
    end
    inherited btnNovo: TBitBtn
      Caption = 'DETALHES (F3)'
    end
    inherited btnSalvar: TBitBtn
      Left = 115
      Top = 297
      Visible = False
      ExplicitLeft = 115
      ExplicitTop = 297
    end
    inherited btnEditar: TBitBtn
      Left = 115
      Top = 233
      Visible = False
      ExplicitLeft = 115
      ExplicitTop = 233
    end
    inherited btnExcluir: TBitBtn
      Left = 115
      Top = 352
      Visible = False
      ExplicitLeft = 115
      ExplicitTop = 352
    end
    inherited btnCancel: TBitBtn
      Left = 215
      ExplicitLeft = 215
    end
  end
end
