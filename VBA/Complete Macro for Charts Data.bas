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

'formatting type column

Call TypeFormat

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

Dim x, BPMFormatOption, YNAnswer As Integer
Dim BPMMessage As String

For x = 1 To 30
    If Cells(1, x).Value = "Song_BPM" Then
        Cells(1, x).Select
        ActiveCell.EntireColumn.Select
        Exit For
    End If
Next x

BPMMessage = "Choose format for Song_BPM column:" & vbCrLf & _
"1 - Only MAX BPM" & vbCrLf & _
"2 - Only MIN BPM" & vbCrLf & _
"3 - Both MIN and MAX BPM in single column (100,00 - 200,00)" & vbCrLf & _
"4 - Don't do anything"

BPMFormatOption = InputBox(BPMMessage, "BPM column format", "Enter 1, 2, 3 or 4")
Select Case BPMFormatOption
    Case 1
        Selection.Insert Shift:=xlToRight
        Selection.End(xlUp).Select
        ActiveCell.Offset(1, 0).Select
        ActiveCell.FormulaR1C1 = _
        "=IFERROR(MID(RC[1], FIND(""-"", RC[1])+2, LEN(RC[1])), RC[1])"
        Selection.AutoFill Destination:=Range(Selection, Selection.End(xlDown))
        Range(Selection, Selection.End(xlDown)).Select
        Selection.Copy
        ActiveCell.Offset(0, 1).Select
        Selection.PasteSpecial Paste:=xlPasteValues
        Selection.NumberFormat = "0.00"
        
        For x = 1 To 30
            If Cells(1, x).Value = "Song_BPM" Then
                ActiveCell.Offset(0, -1).Select
                ActiveCell.EntireColumn.Delete
                Exit For
            End If
        Next x
        
    Case 2
        Selection.Insert Shift:=xlToRight
        Selection.End(xlUp).Select
        ActiveCell.Offset(1, 0).Select
        ActiveCell.FormulaR1C1 = _
        "=IFERROR(LEFT(RC[1],FIND(""-"",RC[1])-2), RC[1])"
        Selection.AutoFill Destination:=Range(Selection, Selection.End(xlDown))
        Range(Selection, Selection.End(xlDown)).Select
        Selection.NumberFormat = "0.00"
        Selection.Copy
        ActiveCell.Offset(0, 1).Select
        Selection.PasteSpecial Paste:=xlPasteValues
        
        For x = 1 To 30
            If Cells(1, x).Value = "Song_BPM" Then
                ActiveCell.Offset(0, -1).Select
                ActiveCell.EntireColumn.Delete
                Exit For
            End If
        Next x
        
    Case 3
        Selection.HorizontalAlignment = xlRight
        Selection.NumberFormat = "0.00"
        
    Case 4
        Exit Sub
        
    Case Else
        MsgBox "Wrong option, try again", vbOKOnly
        Call BPMFormat
End Select
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
Selection.Replace What:="+", Replacement:=""
Selection.Replace What:="-", Replacement:=""
Selection.Replace What:="XM", Replacement:="XMOD"

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
Public Sub TypeFormat()

Dim x, y, TypeFormatOption, ColNumber As Integer
Dim TypeMessage As String

For x = 1 To 30
    If Cells(1, x).Value = "Type" Then
        Cells(1, x).Select
        ColNumber = x
        Cells(Rows.Count, ColNumber).End(xlUp).Select
        Exit For
    End If
Next x

TypeMessage = "Choose format for Type column:" & vbCrLf & _
"1 - Delete all ""double"" Type from data" & vbCrLf & _
"2 - Delete all ""single"" Type from data" & vbCrLf & _
"3 - Don't do anything (keep all the Type data)"

TypeFormatOption = InputBox(TypeMessage, "Type column format", "Enter 1, 2 or 3")

Select Case TypeFormatOption
    Case 1
        For y = ActiveCell.Row To 2 Step -1
            If Cells(y, ColNumber).Value = "double" Then
                Rows(y).Delete
            End If
        Next y
        
    Case 2
        For y = ActiveCell.Row To 2 Step -1
            If Cells(y, ColNumber).Value = "single" Then
                Rows(y).Delete
            End If
        Next y
        
    Case 3
        Exit Sub
        
    Case Else
        MsgBox "Wrong option, try again", vbOKOnly
        Call TypeFormat
End Select

End Sub


