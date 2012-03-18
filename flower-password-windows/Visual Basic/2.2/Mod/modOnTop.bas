Attribute VB_Name = "modOnTop"
Option Explicit

'���������Ϊ����ָ��һ����λ�ú�״̬����Ҳ�ɸı䴰�����ڲ������б��е�λ�á��ú�����DeferWindowPos�������ƣ�ֻ�������������������ֳ����ģ���vb��ʹ�ã����vb���壬��������win32�����λ���С���������������״̬�����б�Ҫ������һ�����ദ��ģ�����������״̬
Private Declare Function SetWindowPos _
                Lib "user32" (ByVal hwnd As Long, _
                              ByVal hWndInsertAfter As Long, _
                              ByVal x As Long, _
                              ByVal y As Long, _
                              ByVal cx As Long, _
                              ByVal cy As Long, _
                              ByVal wFlags As Long) As Long

Private Const SWP_NOACTIVATE = &H10

Private Const SWP_SHOWWINDOW = &H40

Private Const SWP_NOMOVE = &H2

Private Const SWP_NOSIZE = &H1

Private Const HWND_TOPMOST = -1

Private Const HWND_NOTOPMOST = -2

Private Const FLAGS = SWP_NOMOVE Or SWP_NOSIZE

Public Function SetWinOnTop(ByVal WinhWnd As Long) As Long
    SetWinOnTop = SetWindowPos(WinhWnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)

End Function

Public Function UnSetWinOnTop(ByVal WinhWnd As Long) As Long
    UnSetWinOnTop = SetWindowPos(WinhWnd, HWND_NOTOPMOST, 0, 0, 0, 0, FLAGS)

End Function

Public Function SetWinByPoint(ByVal WinhWnd As Long, _
                              ByVal Point_x As Long, _
                              ByVal Point_y As Long) As Long
    SetWinByPoint = SetWindowPos(WinhWnd, HWND_TOPMOST, Point_x, Point_y, 0, 0, SWP_NOSIZE Or SWP_SHOWWINDOW)

End Function
