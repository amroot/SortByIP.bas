Sub SortByIP()
'
' SortByIP Macro
' Sorts a list of IPv4 addresses and removes duplicates
' First IP starts in A1
'

'
    Columns("A:A").Select

    Selection.TextToColumns Destination:=Range("A1"), DataType:=xlDelimited, _
        TextQualifier:=xlDoubleQuote, ConsecutiveDelimiter:=False, Tab:=False, _
        Semicolon:=False, Comma:=False, Space:=False, Other:=True, OtherChar _
        :=".", FieldInfo:=Array(Array(1, 1), Array(2, 1), Array(3, 1), Array(4, 1)), _
        TrailingMinusNumbers:=True
    Columns("A:D").Select
    ActiveWorkbook.Worksheets("Sheet1").Sort.SortFields.Clear
    ActiveWorkbook.Worksheets("Sheet1").Sort.SortFields.Add2 Key:=Range( _
        "A1:A" & Range("A" & Rows.Count).End(xlUp).Row), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
        xlSortNormal
    ActiveWorkbook.Worksheets("Sheet1").Sort.SortFields.Add2 Key:=Range( _
        "B1:B" & Range("A" & Rows.Count).End(xlUp).Row), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
        xlSortNormal
    ActiveWorkbook.Worksheets("Sheet1").Sort.SortFields.Add2 Key:=Range( _
        "C1:C" & Range("A" & Rows.Count).End(xlUp).Row), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
        xlSortNormal
    ActiveWorkbook.Worksheets("Sheet1").Sort.SortFields.Add2 Key:=Range( _
        "D1:D" & Range("A" & Rows.Count).End(xlUp).Row), SortOn:=xlSortOnValues, Order:=xlAscending, DataOption:= _
        xlSortNormal
    With ActiveWorkbook.Worksheets("Sheet1").Sort
        .SetRange Range("A1:D" & Range("A" & Rows.Count).End(xlUp).Row)
        .Header = xlGuess
        .MatchCase = False
        .Orientation = xlTopToBottom
        .SortMethod = xlPinYin
        .Apply
    End With
    Range("E1").Select
    ActiveCell.FormulaR1C1 = "=RC[-4]&"".""&RC[-3]&"".""&RC[-2]&"".""&RC[-1]"
    Range("E1").Select
    Selection.AutoFill Destination:=Range("E1:E" & Range("A" & Rows.Count).End(xlUp).Row)
    Columns("E:E").Select
    Selection.Copy
    Columns("E:E").Select
    Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
        :=False, Transpose:=False
    Columns("A:D").Select
    Range("D1").Activate
    Application.CutCopyMode = False
    Selection.Delete Shift:=xlToLeft
    Columns("A:A").Select
    ActiveSheet.Range("$A$1:$A$" & Range("A" & Rows.Count).End(xlUp).Row).RemoveDuplicates Columns:=1, Header:=xlNo
    Range("A1").Select
    Columns("A:A").EntireColumn.AutoFit
End Sub
