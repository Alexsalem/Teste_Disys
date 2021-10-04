object DM1: TDM1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 179
  Width = 289
  object Ado_Conn1: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Integrated Security=SSPI;Persist Security In' +
      'fo=False;Initial Catalog=TESTE_DISYS;Data Source=DESKTOP-IM9C5R8' +
      '\SQLEXPRESS'
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 84
    Top = 66
  end
  object qryAux: TADOQuery
    Connection = Ado_Conn1
    Parameters = <>
    Left = 174
    Top = 42
  end
end
