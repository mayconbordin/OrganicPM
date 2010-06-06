inherited frmSBEventos: TfrmSBEventos
  Caption = 'frmSBEventos'
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
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
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMULA'
              Title.Caption = 'Valor/F'#243'rmula'
              Width = 400
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 0
            ExplicitLeft = 0
          end
          inherited edtPesquisa: TEdit
            Left = 0
            ExplicitLeft = 0
          end
        end
      end
      inherited tsManutencao: TTabSheet
        object Label2: TLabel
          Left = 320
          Top = 3
          Width = 127
          Height = 13
          Caption = 'F'#243'rmula ou valor fixo:'
        end
        object Tipo: TLabel
          Left = 3
          Top = 3
          Width = 24
          Height = 13
          Caption = 'Tipo'
        end
        object Label3: TLabel
          Left = 3
          Top = 115
          Width = 273
          Height = 13
          Caption = 'Vari'#225'veis dispon'#237'veis para compor as f'#243'rmulas:'
        end
        object LabeledEdit2: TLabeledEdit
          Left = 3
          Top = 88
          Width = 294
          Height = 21
          EditLabel.Width = 56
          EditLabel.Height = 13
          EditLabel.Caption = 'Descri'#231#227'o'
          TabOrder = 1
        end
        object ValueListEditor1: TValueListEditor
          Left = 3
          Top = 134
          Width = 294
          Height = 228
          Enabled = False
          Strings.Strings = (
            'ccc=ccc')
          TabOrder = 3
          TitleCaptions.Strings = (
            'Vari'#225'vel'
            'Valor')
          ColWidths = (
            150
            138)
        end
        object ComboBox1: TComboBox
          Left = 3
          Top = 22
          Width = 294
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Provento'
          Items.Strings = (
            'Provento'
            'Desconto')
        end
        object RichEdit1: TRichEdit
          Left = 320
          Top = 22
          Width = 649
          Height = 382
          PlainText = True
          TabOrder = 2
        end
        object Button1: TButton
          Left = 3
          Top = 368
          Width = 294
          Height = 25
          Caption = 'Simular f'#243'rmula'
          TabOrder = 4
          OnClick = Button1Click
        end
      end
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
  end
end
