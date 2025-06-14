Attribute VB_Name = "Module2"
Public Sub DataPreparing()

'Preparing table

Dim TableName As String

If ActiveSheet.ListObjects.Count <> 0 Then
    TableName = ActiveSheet.ListObjects(1).Name
Else
    Range("A1").Select
    If ActiveCell.Value = "" Then
        MsgBox "Please paste your data in cell A1 and try again", vbOKOnly
        Exit Sub
    End If
    
    Range(Selection, Selection.End(xlDown)).Select
        Selection.TextToColumns Destination:=Range("A1"), DataType:=xlDelimited, _
            Other:=True, OtherChar:="|", FieldInfo:=Array(Array(1, 1), Array(2, 1), _
            Array(3, 1), Array(4, 1), Array(5, 1), Array(6, 1), Array(7, 1), _
            Array(8, 1), Array(9, 1), Array(10, 1), Array(11, 1), Array(12, 1)), _
            TrailingMinusNumbers:=True
            
    ActiveSheet.ListObjects.Add(xlSrcRange, Selection.CurrentRegion, , xlYes).Name = "ChartsData"
    TableName = ActiveSheet.ListObjects(1).Name
End If

Selection.CurrentRegion.Select
ActiveSheet.ListObjects(TableName).TableStyle = "TableStyleLight1"

'formatting song length column

Call LengthFormat

'formatting song bpm column

Call BPMFormat

'formatting technical notation column

Call NotationFormat

'formatting step artist column

Call StepArtistFormat

'general simple formatting cleaned up table

Range("A1").CurrentRegion.Select
Selection.HorizontalAlignment = xlLeft
Rows("1:1").Select
With Selection.Font
    .Bold = True
    .Size = 16
    .Name = "Arial"
End With
Range("A1").CurrentRegion.Select
Selection.Columns.AutoFit

Range("A1").Select

End Sub

Public Sub LengthFormat()

Dim x As Integer

For x = 1 To 30
    If Cells(1, x).Value = "Song_Length" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Exit For
    End If
Next x

Selection.Insert Shift:=xlToRight
Selection.End(xlUp).Select
ActiveCell.Offset(1, 0).Select
ActiveCell.FormulaR1C1 = "=RC[1]/86400"
Range(Selection, Selection.End(xlDown)).Select
Selection.Copy
ActiveCell.Offset(0, 1).Select
Selection.PasteSpecial Paste:=xlPasteValues
Selection.NumberFormat = "hh:mm:ss"

For x = 1 To 30
    If Cells(1, x).Value = "Song_Length" Then
        ActiveCell.Offset(0, -1).Select
        ActiveCell.EntireColumn.Delete
        Exit For
    End If
Next x

End Sub


Public Sub BPMFormat()

Dim x As Integer

For x = 1 To 30
    If Cells(1, x).Value = "MIN_BPM" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Selection.HorizontalAlignment = xlRight
        Selection.NumberFormat = "0.00"
        Exit For
    End If
Next x

For x = 1 To 30
    If Cells(1, x).Value = "MAX_BPM" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Selection.HorizontalAlignment = xlRight
        Selection.NumberFormat = "0.00"
        Exit For
    End If
Next x


End Sub

Public Sub NotationFormat()

Dim x As Integer

For x = 1 To 30
    If Cells(1, x).Value = "Technical_Notation" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Exit For
    End If
Next x

Selection.Replace What:="No Tech", Replacement:="NoTech"
Selection.Replace What:="BXF", Replacement:="BR XO FS"
Selection.Replace What:="XMOD", Replacement:="XM"
Selection.Replace What:="Wadat", Replacement:="GH"

Selection.Insert Shift:=xlToRight
Selection.End(xlUp).Select
ActiveCell.Offset(1, 0).Select
ActiveCell.FormulaR1C1 = "=TRIM(RC[1])"
Selection.AutoFill Destination:=Range(Selection, Selection.End(xlDown))
Range(Selection, Selection.End(xlDown)).Select
Selection.Copy
ActiveCell.Offset(0, 1).Select
Selection.PasteSpecial Paste:=xlPasteValues

For x = 1 To 30
    If Cells(1, x).Value = "Technical_Notation" Then
        ActiveCell.Offset(0, -1).Select
        ActiveCell.EntireColumn.Delete
        Exit For
    End If
Next x

End Sub

Public Sub StepArtistFormat()

Dim x As Integer

For x = 1 To 30
    If Cells(1, x).Value = "Step_Artist" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Exit For
    End If
Next x

Selection.Replace What:="DRK", Replacement:="D4RK"
Selection.Replace What:="HPF", Replacement:="HPF!"
Selection.Replace What:="Janusk", Replacement:="Janus5k"
Selection.Replace What:="zrk", Replacement:="z0rk"
Selection.Replace What:="CP", Replacement:="CP101"
Selection.Replace What:="Create", Replacement:="Create!"
Selection.Replace What:="hihi", Replacement:="hi19hi19"
Selection.Replace What:="ruunix", Replacement:="ruunix2"
Selection.Replace What:="GRC", Replacement:="GRC 009"
Selection.Replace What:="Halogen", Replacement:="Halogen-"
Selection.Replace What:="iamchrislife", Replacement:="iamchris4life"
Selection.Replace What:="LKD", Replacement:="LK4D4"
Selection.Replace What:="Maryushi", Replacement:="Maryushi3"
Selection.Replace What:="Mimix", Replacement:="Mimix2"
Selection.Replace What:="Monstrjoe", Replacement:="Monst4rjoe"
Selection.Replace What:="Sudzi", Replacement:="Sudzi781"

Selection.Insert Shift:=xlToRight
Selection.End(xlUp).Select
ActiveCell.Offset(1, 0).Select
ActiveCell.FormulaR1C1 = "=TRIM(RC[1])"
Selection.AutoFill Destination:=Range(Selection, Selection.End(xlDown))
Range(Selection, Selection.End(xlDown)).Select
Selection.Copy
ActiveCell.Offset(0, 1).Select
Selection.PasteSpecial Paste:=xlPasteValues

For x = 1 To 30
    If Cells(1, x).Value = "Song_Artist" Then
        ActiveCell.Offset(0, -1).Select
        ActiveCell.EntireColumn.Delete
        Exit For
    End If
Next x

End Sub
