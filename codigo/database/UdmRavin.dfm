object dmRavin: TdmRavin
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 421
  Width = 603
  object cnxBancoDeDados: TFDConnection
    Params.Strings = (
      'Server='
      'Port='
      'DriverID=MySQL'
      'User_Name=root')
    UpdateOptions.AssignedValues = [uvUpdateMode]
    AfterConnect = cnxBancoDeDadosAfterConnect
    BeforeConnect = cnxBancoDeDadosBeforeConnect
    Left = 40
    Top = 24
  end
  object drvBancoDeDados: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Users\bcmsilva\Documents\ravin\projeto\libmysql.dll'
    Left = 40
    Top = 80
  end
  object wtcBancoDeDados: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 40
    Top = 136
  end
end
