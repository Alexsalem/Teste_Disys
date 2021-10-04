object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Principal'
  ClientHeight = 488
  ClientWidth = 793
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 793
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 0
      Top = 21
      Width = 144
      Height = 13
      Caption = 'Pesquisa(Somente por nome):'
    end
    object edtPesquisa: TEdit
      Left = 144
      Top = 18
      Width = 498
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
    object btnPesquisa: TButton
      Left = 648
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 55
    Width = 637
    Height = 433
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 637
      Height = 433
      Align = alClient
      DataSource = dsManutencao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 637
    Top = 55
    Width = 156
    Height = 433
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object btnIncluir: TButton
      Left = 30
      Top = 6
      Width = 109
      Height = 31
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btnIncluirClick
    end
    object btnExcluir: TButton
      Left = 30
      Top = 41
      Width = 109
      Height = 31
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnAlterar: TButton
      Left = 30
      Top = 78
      Width = 109
      Height = 31
      Caption = 'Alterar'
      TabOrder = 2
      OnClick = btnAlterarClick
    end
    object btnTodos: TButton
      Left = 30
      Top = 111
      Width = 109
      Height = 31
      Caption = 'Todos'
      TabOrder = 3
      OnClick = btnTodosClick
    end
    object btnSair: TButton
      Left = 30
      Top = 182
      Width = 109
      Height = 31
      Caption = 'Sair'
      TabOrder = 4
      OnClick = btnSairClick
    end
    object btnRelatorio: TButton
      Left = 30
      Top = 148
      Width = 109
      Height = 31
      Caption = 'Relat'#243'rio'
      TabOrder = 5
      OnClick = btnRelatorioClick
    end
  end
  object dsManutencao: TDataSource
    DataSet = SQLManutencao
    Left = 222
    Top = 48
  end
  object SQLManutencao: TADODataSet
    Connection = DM1.Ado_Conn1
    CursorType = ctStatic
    CommandText = 
      'select CLIENTE, NOME, ENDERECO, BAIRRO, CIDADE, UF, CEP, TELEFON' +
      'E_FIXO, TELEFONE_CELULAR, CPF, RG, NUMERO, COMPLEMENTO from CLIE' +
      'NTES'
    Parameters = <>
    Left = 216
    Top = 90
    object SQLManutencaoCLIENTE: TAutoIncField
      DisplayLabel = 'Identificador'
      FieldName = 'CLIENTE'
      ReadOnly = True
    end
    object SQLManutencaoNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 80
    end
    object SQLManutencaoENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 100
    end
    object SQLManutencaoBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object SQLManutencaoCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
    end
    object SQLManutencaoUF: TStringField
      DisplayLabel = 'U,F,'
      FieldName = 'UF'
      Size = 2
    end
    object SQLManutencaoCEP: TStringField
      DisplayLabel = 'C.E.P.'
      FieldName = 'CEP'
      EditMask = '99999-999;0; '
      Size = 8
    end
    object SQLManutencaoTELEFONE_FIXO: TStringField
      DisplayLabel = 'Telefone Fixo'
      FieldName = 'TELEFONE_FIXO'
      EditMask = '(99)9999-9999;0; '
      Size = 10
    end
    object SQLManutencaoTELEFONE_CELULAR: TStringField
      DisplayLabel = 'Telefone Celular'
      FieldName = 'TELEFONE_CELULAR'
      EditMask = '(99)99999-9999;0; '
      Size = 11
    end
    object SQLManutencaoCPF: TStringField
      DisplayLabel = 'C.P.F.'
      FieldName = 'CPF'
      EditMask = '999.999.999-99;0; '
      Size = 11
    end
    object SQLManutencaoRG: TStringField
      DisplayLabel = 'R,G,'
      FieldName = 'RG'
      Size = 9
    end
    object SQLManutencaoNUMERO: TIntegerField
      DisplayLabel = 'N'#186
      FieldName = 'NUMERO'
    end
    object SQLManutencaoCOMPLEMENTO: TStringField
      DisplayLabel = 'Compl.'
      FieldName = 'COMPLEMENTO'
    end
  end
  object frxReport1: TfrxReport
    Version = '2021.2'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44345.512337928200000000
    ReportOptions.LastChange = 44470.527531793980000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 390
    Top = 169
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = -3.779529999999999000
          Width = 706.772110000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Listagem de Clientes')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1NOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
        end
        object frxDBDataset1TELEFONE_CELULAR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 185.196970000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE_CELULAR'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."TELEFONE_CELULAR"]')
        end
        object frxDBDataset1CPF: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 291.023810000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          DataField = 'CPF'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CPF"]')
        end
        object frxDBDataset1RG: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 438.425480000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'RG'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."RG"]')
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Page#]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417161730000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Telefone')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 289.244280000000000000
          Top = 3.779529999999994000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'CPF')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 3.779527560000005000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RG')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = SQLManutencao
    BCDToCurrency = False
    Left = 384
    Top = 246
  end
end
