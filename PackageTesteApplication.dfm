object frmPackageTestApplication: TfrmPackageTestApplication
  Left = 0
  Top = 0
  Caption = 'Package Test Application'
  ClientHeight = 405
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 425
    Height = 21
    TabOrder = 0
    Text = 'C:\Users\Admin\Downloads\XML\leiauteNFe_v4.00.xsd'
    TextHint = 'XSD'
  end
  object Edit2: TEdit
    Left = 8
    Top = 48
    Width = 425
    Height = 21
    TabOrder = 1
    Text = 'C:\Users\Admin\Downloads\XML\NFE.xml'
    TextHint = 'XML'
  end
  object Button1: TButton
    Left = 439
    Top = 8
    Width = 75
    Height = 61
    Caption = 'Limpando'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 520
    Top = 8
    Width = 75
    Height = 61
    Caption = 'Sem Limpar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 24
    Top = 167
    Width = 523
    Height = 209
    Lines.Strings = (
      'Memo1')
    TabOrder = 4
  end
  object Button3: TButton
    Left = 439
    Top = 75
    Width = 90
    Height = 25
    Caption = 'Carrega Dados'
    TabOrder = 5
  end
end
