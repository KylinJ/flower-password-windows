Attribute VB_Name = "modControlRECT"
Option Explicit

Private Declare Function GetWindowRect _
                Lib "user32.dll" (ByVal hwnd As Long, _
                                  lpRect As Rect) As Long

Public Type Rect

    Left As Long
    Top As Long
    Right As Long
    Bottom As Long

End Type

Private Declare Function GetCursorPos Lib "user32.dll" (lpPoint As POINTAPI) As Long

Public Type POINTAPI

    x As Long
    y As Long

End Type

Private Declare Function WindowFromPoint _
                Lib "user32.dll" (ByVal xPoint As Long, _
                                  ByVal yPoint As Long) As Long

'���ӵ�����뽹��Ĵ��ڵľ��
Private Declare Function GetFocus Lib "user32" () As Long

'���ǰ̨���ڵľ��������ġ�ǰ̨���ڡ���ָǰ̨Ӧ�ó���Ļ����
Private Declare Function GetForegroundWindow Lib "user32" () As Long

'ͨ����ϵͳ�ڵ�ÿ���̶߳����Լ���������С����������ȡ������߳����뺯�����������̺߳ͽ��̹���������С��������̺߳����뽹�㡢���ڼ����겶�񡢼���״̬�Լ��������״̬������빲��״̬
Private Declare Function AttachThreadInput _
                Lib "user32" (ByVal idAttach As Long, _
                              ByVal idAttachTo As Long, _
                              ByVal fAttach As Long) As Long

'��ȡ��ǰ�߳�һ��Ψһ���̱߳�ʶ��
Private Declare Function GetCurrentThreadId Lib "kernel32" () As Long

'��ȡ��ָ�����ڹ�����һ���һ�����̺��̱߳�ʶ��
Private Declare Function GetWindowThreadProcessId _
                Lib "user32" (ByVal hwnd As Long, _
                              lpdwProcessId As Long) As Long

'�жϲ�����ĵ�ǰλ��
Private Declare Function GetCaretPos Lib "user32" (lpPoint As POINTAPI) As Long

'�жϴ������Կͻ��������ʾ��һ�������Ļ����
Private Declare Function ClientToScreen _
                Lib "user32" (ByVal hwnd As Long, _
                              lpPoint As POINTAPI) As Long

Public Function GetDesktopWindowRect(ByRef Rct As Rect, ByRef Pos As POINTAPI) As Long
    GetCursorPos Pos

    Dim WinHandle As Long

    WinHandle = WindowFromPoint(Pos.x, Pos.y)

    Dim execute As Integer

    execute = GetWindowRect(WinHandle, Rct)

    If execute = 0 Then
        GetDesktopWindowRect = 0
    Else
        GetDesktopWindowRect = WinHandle

    End If

End Function

Public Function GetDesktopWindowCaretPos(ByRef Point As POINTAPI) As Long

    Dim foregroundWindowHandle As Long

    foregroundWindowHandle = GetForegroundWindow

    Dim remoteThreadId As Long

    remoteThreadId = GetWindowThreadProcessId(foregroundWindowHandle, 0)

    Dim currentThreadId As Long

    currentThreadId = GetCurrentThreadId()

    Dim result As Long

    result = AttachThreadInput(remoteThreadId, currentThreadId, True)

    If result <> 0 Then

        Dim focused As Long

        focused = GetFocus

        Dim ThisPoint As Long

        ThisPoint = GetCaretPos(Point)
        ClientToScreen focused, Point
        AttachThreadInput remoteThreadId, currentThreadId, False
        GetDesktopWindowCaretPos = focused
    Else
        GetDesktopWindowCaretPos = 0

    End If

End Function
