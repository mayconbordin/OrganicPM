inherited frmSBEventos: TfrmSBEventos
  Caption = 
    'Eventos cont'#225'beis dispon'#237'veis para montar a folha de pagamento d' +
    'os colaboradores'
  Position = poDesigned
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
              FieldName = 'EVENTO_COD'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 351
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMULA'
              Title.Caption = 'F'#243'rmula'
              Width = 502
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 16
            ExplicitLeft = 16
          end
          inherited edtPesquisa: TEdit
            Left = 16
            Width = 473
            ExplicitLeft = 16
            ExplicitWidth = 473
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 320
          Top = 3
          Width = 51
          Height = 13
          Caption = 'F'#243'rmula:'
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
          TabOrder = 3
          OnClick = Button1Click
        end
        object ListBox1: TListBox
          Left = 3
          Top = 134
          Width = 294
          Height = 228
          ItemHeight = 13
          Items.Strings = (
            'salario_fixo'
            'idade'
            'mes_aniversario'
            'nro_dependentes'
            'nro_estudantes_dependentes'
            'anos_de_servico')
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
