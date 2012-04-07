Attribute VB_Name = "modHSIMP"
Option Explicit

Public Const PASSWORD_INSECURE    As Long = &H4

Public Const PASSWORD_WARNING     As Long = &H3

Public Const PASSWORD_ADVICE      As Long = &H2

Public Const PASSWORD_ACHIEVEMENT As Long = &H1

Public Function check_password_level(ByVal strPassword As String, _
                                     Optional ByRef strInfo As String) As Long

    Dim result As Long

    result = check_repeated_pattern(strPassword, strInfo)

    If result > PASSWORD_ACHIEVEMENT Then
        check_password_level = result
    Else
        result = check_common_password(strPassword, strInfo)

        If result > PASSWORD_ACHIEVEMENT Then
            check_password_level = result
        Else
            result = check_possibly_a_number(strPassword, strInfo)

            If result > PASSWORD_ACHIEVEMENT Then
                check_password_level = result
            Else
                result = check_possibly_a_word(strPassword, strInfo)

                If result > PASSWORD_ACHIEVEMENT Then
                    check_password_level = result
                Else
                    result = check_possibly_a_telephone_number_date(strPassword, strInfo)

                    If result > PASSWORD_ACHIEVEMENT Then
                        check_password_level = result
                    Else
                        result = check_possibly_a_word_and_a_number(strPassword, strInfo)

                        If result > PASSWORD_ACHIEVEMENT Then
                            check_password_level = result
                        Else
                            result = check_length(strPassword, strInfo)

                            If result > PASSWORD_ACHIEVEMENT Then
                                check_password_level = result
                            Else
                                result = check_character_variety(strPassword, strInfo)

                                If result > PASSWORD_ACHIEVEMENT Then
                                    check_password_level = result
                                Else
                                    result = check_symbols(strPassword, strInfo)

                                    If result > PASSWORD_ACHIEVEMENT Then
                                        check_password_level = result
                                    Else
                                        check_password_level = PASSWORD_ACHIEVEMENT

                                    End If

                                End If

                            End If

                        End If

                    End If

                End If

            End If

        End If

    End If

End Function

Private Function check_character_variety(ByVal strPassword As String, _
                                         Optional ByRef strInfo As String) As Long

    If password_match(strPassword, "/^[a-zA-Z]+$/") Then
        strInfo = "�����������һ�����ʻ�һ�����֣�����ǵĻ����⽫ʹ������ױ��ƽ�"
        check_character_variety = PASSWORD_WARNING
    ElseIf password_match(strPassword, "/^[A-Za-z0-9]+$/") Then
        strInfo = "������ֻ�������ֺ���ĸ��������ſ����ǿ��"
        check_character_variety = PASSWORD_WARNING
    ElseIf password_match(strPassword, "/[^A-Za-z0-9\u0000-\u007E]/") Then
        'strInfo = "���������һ�������Ǽ������������ַ����⽫ʹ�����ȫ"
        check_character_variety = PASSWORD_ACHIEVEMENT

    End If

End Function

Private Function check_common_password(ByVal strPassword As String, _
                                       Optional ByRef strInfo As String) As Long

    Dim arrCommonPassword() As String, isFound As Boolean

    arrCommonPassword = Split(strPassWords, "|")
    isFound = False

    Dim x As Long

    For x = LBound(arrCommonPassword) To UBound(arrCommonPassword)

        If strPassword = arrCommonPassword(x) Then
            isFound = True
            Exit For

        End If

    Next

    If isFound Then
        strInfo = "�������ǳ�������֮һ���ɱ�˲���ƽ�"
        check_common_password = PASSWORD_INSECURE
    Else
        check_common_password = 0

    End If

End Function

Private Function check_length(ByVal strPassword As String, _
                              Optional ByRef strInfo As String) As Long

    If Len(strPassword) < 5 Then
        strInfo = "������̫�̣���ʹ��8λ�����ϵ�����"
        check_length = PASSWORD_INSECURE
    ElseIf Len(strPassword) < 8 Then
        strInfo = "������Ƚ϶̣���ʹ��8λ�����ϵ�����"
        check_length = PASSWORD_WARNING
    ElseIf Len(strPassword) > 15 Then
        'strInfo = "�����볬��15���ַ����ȣ���ʹ��ܰ�ȫ"
        check_length = PASSWORD_ADVICE

    End If

End Function

Private Function check_possibly_a_number(ByVal strPassword As String, _
                                         Optional ByRef strInfo As String) As Long

    If password_match(strPassword, "/^[0-9]+$/") Then
        strInfo = "������ֻ�������֣�������ĸ�ͷ��ſ����ǿ��"
        check_possibly_a_number = PASSWORD_WARNING
    Else
        check_possibly_a_number = 0

    End If

End Function

Private Function check_possibly_a_telephone_number_date(ByVal strPassword As String, _
                                                        Optional ByRef strInfo As String) As Long

    Dim lenPassword As Long

    lenPassword = Len(strPassword)

    If password_match(strPassword, "/^[\-\(\)\.\/\s0-9]+$/") Then
        strInfo = "�����������һ���绰�����һ�����ڣ�����ǵĻ����⽫ʹ������ױ��ƽ�"
        check_possibly_a_telephone_number_date = PASSWORD_WARNING
    ElseIf IsNumeric(strPassword) And (lenPassword = 11 Or lenPassword = 6 Or lenPassword = 8) Then
        strInfo = "�����������һ���绰�����һ�����ڣ�����ǵĻ����⽫ʹ������ױ��ƽ�"
        check_possibly_a_telephone_number_date = PASSWORD_WARNING
    ElseIf IsNumeric(strPassword) And (lenPassword = 15 Or lenPassword = 18) Then
        strInfo = "�����������һ�����֤��������ǵĻ����⽫ʹ������ױ��ƽ�"
        check_possibly_a_telephone_number_date = PASSWORD_WARNING
    ElseIf IsDate(strPassword) Then
        strInfo = "�����������һ�����ڣ�����ǵĻ����⽫ʹ������ױ��ƽ�"
        check_possibly_a_telephone_number_date = PASSWORD_WARNING
    Else
        check_possibly_a_telephone_number_date = 0

    End If

End Function

Private Function check_possibly_a_word(ByVal strPassword As String, _
                                       Optional ByRef strInfo As String) As Long

    If password_match(strPassword, "/^[A-Za-z]+$/") Then
        strInfo = "������ֻ������ĸ���������ֺͷ��ſ����ǿ��"
        check_possibly_a_word = PASSWORD_WARNING
    Else
        check_possibly_a_word = 0

    End If

End Function

Private Function check_possibly_a_word_and_a_number(ByVal strPassword As String, _
                                                    Optional ByRef strInfo As String) As Long

    If password_match(strPassword, "/^[a-zA-Z]+[0-9]+$/") Or password_match(strPassword, "/^[0-9]+[a-zA-Z]+$/") Then
        strInfo = "�����������һ�����ʺͼ������ֵ���ϣ����Ǻܳ�����ģʽ����˿��Ա����ٵ��ƽ�"
        check_possibly_a_word_and_a_number = PASSWORD_WARNING
    Else
        check_possibly_a_word_and_a_number = 0

    End If

End Function

Private Function check_repeated_pattern(ByVal strPassword As String, _
                                        Optional ByRef strInfo As String) As Long

    If password_match(strPassword, "/(.+)\1{2,}/gi") Then
        strInfo = "����������ظ��Ĳ��֣���ʹ������ױ��ƽ�"
        check_repeated_pattern = PASSWORD_WARNING
    Else
        check_repeated_pattern = 0

    End If

End Function

Private Function check_symbols(ByVal strPassword As String, _
                               Optional ByRef strInfo As String) As Long

    Dim strSymbol As String

    strSymbol = "!@��#$%^&*()-_=\+?/.>,<`~|';:]}[{" & Chr(34)

    Dim lenPassword As Long, index As Long, isFound As Long

    lenPassword = Len(strPassword): isFound = 0

    For index = 1 To lenPassword

        If InStr(1, strSymbol, Mid$(strPassword, index, 1), vbBinaryCompare) > 0 Then
            isFound = isFound + 1

        End If

    Next

    If isFound > 3 Then
        check_symbols = PASSWORD_ACHIEVEMENT
    Else
        strInfo = "���������3λ���ϵ�������ſ����ǿ��"
        check_symbols = PASSWORD_ADVICE

    End If

End Function

Private Function password_match(ByVal strPassword As String, _
                                ByVal strPattern As String) As Boolean

    Dim objRegExp As RegExp

    password_match = False
    Set objRegExp = New RegExp
    objRegExp.Pattern = strPattern
    objRegExp.Global = True
    password_match = objRegExp.Test(strPassword)
    Set objRegExp = Nothing

End Function

