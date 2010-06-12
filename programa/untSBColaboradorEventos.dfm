inherited frmSBColaboradorEvento: TfrmSBColaboradorEvento
  Caption = 
    'Associar o colaborador a seus eventos padr'#245'es da folha de pagame' +
    'nto'
  ClientHeight = 548
  ExplicitWidth = 1043
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 548
    ExplicitHeight = 548
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
              FieldName = 'EVENTO_COD'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Evento'
              Visible = True
            end
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Visible = False
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 3
          Top = 367
          Width = 302
          Height = 13
          Caption = '* Clique duplo para selecionar o colaborador na lista'
          FocusControl = btnCancel
        end
        object Label3: TLabel
          Left = 11
          Top = 386
          Width = 111
          Height = 13
          Caption = 'Selecionado agora:'
        end
        object Label4: TLabel
          Left = 128
          Top = 386
          Width = 4
          Height = 13
        end
        object LabeledEdit1: TLabeledEdit
          Left = 3
          Top = 24
          Width = 414
          Height = 21
          EditLabel.Width = 83
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar pessoa'
          TabOrder = 0
          OnChange = LabeledEdit1Change
        end
        object LabeledEdit2: TLabeledEdit
          Left = 448
          Top = 24
          Width = 505
          Height = 21
          EditLabel.Width = 88
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar eventos'
          TabOrder = 1
          OnChange = LabeledEdit2Change
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 64
          Width = 414
          Height = 297
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento'
              Visible = True
            end>
        end
        object DBGrid2: TDBGrid
          Left = 448
          Top = 51
          Width = 505
          Height = 334
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'EVENTO_COD'
              Title.Caption = 'Evento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end>
        end
      end
    end
    inherited btnNovo: TBitBtn
      Left = 18
      Top = 481
      ExplicitLeft = 18
      ExplicitTop = 481
    end
    inherited btnSalvar: TBitBtn
      Left = 191
      Top = 481
      OnClick = btnSalvarClick
      ExplicitLeft = 191
      ExplicitTop = 481
    end
    inherited btnEditar: TBitBtn
      Left = 370
      Top = 481
      ExplicitLeft = 370
      ExplicitTop = 481
    end
    inherited btnExcluir: TBitBtn
      Left = 549
      Top = 481
      OnClick = btnExcluirClick
      ExplicitLeft = 549
      ExplicitTop = 481
    end
    inherited btnCancel: TBitBtn
      Left = 729
      Top = 481
      ExplicitLeft = 729
      ExplicitTop = 481
    end
  end
end
