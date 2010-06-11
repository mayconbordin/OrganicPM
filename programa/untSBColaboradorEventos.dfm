inherited frmSBColaboradorEvento: TfrmSBColaboradorEvento
  Caption = 'frmSBColaboradorEvento'
  ClientHeight = 548
  ExplicitWidth = 1043
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 548
    ExplicitLeft = -8
    ExplicitHeight = 623
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsVisualiza: TTabSheet
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
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object LabeledEdit1: TLabeledEdit
          Left = 3
          Top = 24
          Width = 414
          Height = 21
          EditLabel.Width = 83
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar pessoa'
          TabOrder = 0
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
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 64
          Width = 414
          Height = 321
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object DBGrid2: TDBGrid
          Left = 448
          Top = 51
          Width = 505
          Height = 334
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
      Left = 18
      Top = 481
      ExplicitLeft = 18
      ExplicitTop = 481
    end
    inherited btnSalvar: TBitBtn
      Left = 191
      Top = 481
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
