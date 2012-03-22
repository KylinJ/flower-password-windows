Attribute VB_Name = "modPoint"
Option Explicit

Public Password_Hwnd As Long

Private Declare Function GetWindowRect _
                Lib "user32.dll" (ByVal hwnd As Long, _
                                  lpRect As Rect) As Long

Private Type Rect

    Left As Long
    Top As Long
    Right As Long
    Bottom As Long

End Type

Private Declare Function GetCursorPos Lib "user32.dll" (lpPoint As POINTAPI) As Long

Private Type POINTAPI

    x As Long
    y As Long

End Type

Private Declare Function WindowFromPoint _
                Lib "user32.dll" (ByVal xPoint As Long, _
                                  ByVal yPoint As Long) As Long

'���ӵ�����뽹��Ĵ��ڵľ��
Private Declare Function GetFocus Lib "user32.dll" () As Long

'���ǰ̨���ڵľ��������ġ�ǰ̨���ڡ���ָǰ̨Ӧ�ó���Ļ����
Private Declare Function GetForegroundWindow Lib "user32.dll" () As Long

'ͨ����ϵͳ�ڵ�ÿ���̶߳����Լ���������С����������ȡ������߳����뺯�����������̺߳ͽ��̹���������С��������̺߳����뽹�㡢���ڼ����겶�񡢼���״̬�Լ��������״̬������빲��״̬
Private Declare Function AttachThreadInput _
                Lib "user32.dll" (ByVal idAttach As Long, _
                                  ByVal idAttachTo As Long, _
                                  ByVal fAttach As Long) As Long

'��ȡ��ǰ�߳�һ��Ψһ���̱߳�ʶ��
Private Declare Function GetCurrentThreadId Lib "kernel32.dll" () As Long

'��ȡ��ָ�����ڹ�����һ���һ�����̺��̱߳�ʶ��
Private Declare Function GetWindowThreadProcessId _
                Lib "user32.dll" (ByVal hwnd As Long, _
                                  lpdwProcessId As Long) As Long

'�жϲ�����ĵ�ǰλ��
Private Declare Function GetCaretPos Lib "user32.dll" (lpPoint As POINTAPI) As Long

'�жϴ������Կͻ��������ʾ��һ�������Ļ����
Private Declare Function ClientToScreen _
                Lib "user32.dll" (ByVal hwnd As Long, _
                                  lpPoint As POINTAPI) As Long

Public Function GetDesktopWindowRect(ByRef rct As Rect, ByRef pos As POINTAPI) As Long
    GetCursorPos pos

    Dim WinHandle As Long

    WinHandle = WindowFromPoint(pos.x, pos.y)

    Dim execute As Integer

    execute = GetWindowRect(WinHandle, rct)

    If execute = 0 Then
        GetDesktopWindowRect = 0
    Else
        GetDesktopWindowRect = WinHandle

    End If

End Function

Public Function GetDesktopWindowCaretPos(ByRef point As POINTAPI) As Long

    Dim foregroundWindowHandle As Long

    foregroundWindowHandle = GetForegroundWindow

    Dim remoteThreadId As Long

    remoteThreadId = GetWindowThreadProcessId(foregroundWindowHandle, 0)

    Dim currentThreadId As Long

    currentThreadId = GetCurrentThreadId()

    Dim result As Long

    result = AttachThreadInput(currentThreadId, remoteThreadId, True)

    If result <> 0 Then

        Dim focused As Long

        focused = GetFocus

        Dim ThisPoint As Long

        ThisPoint = GetCaretPos(point)
        ClientToScreen focused, point
        AttachThreadInput currentThreadId, remoteThreadId, False
        GetDesktopWindowCaretPos = focused
    Else
        GetDesktopWindowCaretPos = 0

    End If

End Function

Public Sub getLocation(ByRef point_x As Long, ByRef point_y As Long)

    Dim caretpos As POINTAPI, mousepos As POINTAPI, rects As Rect, caretpos_hWnd As Long, rect_hWnd As Long

    caretpos_hWnd = GetDesktopWindowCaretPos(caretpos)
    rect_hWnd = GetDesktopWindowRect(rects, mousepos)

    If caretpos_hWnd <> 0 Then
        Password_Hwnd = caretpos_hWnd

        If (mousepos.y - caretpos.y) < 50 Then
            point_x = caretpos.x '* Screen.TwipsPerPixelX
            point_y = (caretpos.y + 17) '* Screen.TwipsPerPixelY
        Else
            point_x = mousepos.x '* Screen.TwipsPerPixelX
            point_y = (mousepos.y + 10) '* Screen.TwipsPerPixelY

        End If

    ElseIf rect_hWnd <> 0 Then
        Password_Hwnd = rect_hWnd

        If (rects.Bottom - caretpos.y) < 50 Then
            point_x = rects.Left '* Screen.TwipsPerPixelX
            point_y = rects.Bottom '* Screen.TwipsPerPixelY
        Else
            point_x = mousepos.x '* Screen.TwipsPerPixelX
            point_y = (mousepos.y + 10) '* Screen.TwipsPerPixelY

        End If

    Else
        Password_Hwnd = 0
        point_x = mousepos.x '* Screen.TwipsPerPixelX
        point_y = (mousepos.y + 10) '* Screen.TwipsPerPixelY

    End If

End Sub
