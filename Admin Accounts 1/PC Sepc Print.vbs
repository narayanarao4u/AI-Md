Function PCinfo()
                         
  Set objShell = CreateObject("WScript.Shell")
  Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
  
  
  ' Get MAC Address
  Set colItems = objWMIService.ExecQuery("Select * From Win32_NetworkAdapterConfiguration Where IPEnabled = True")
  For Each objItem in colItems
    MACAddress = Replace(objItem.MACAddress, ":", "-")
  
  Next
  PCinfo = MACAddress
  
End Function


Dim objShell
Set objShell = WScript.CreateObject("WScript.Shell")
objShell.Run "http://10.34.130.254:81/printPcinfo?mac=" + PCinfo()
Set objShell = Nothing

