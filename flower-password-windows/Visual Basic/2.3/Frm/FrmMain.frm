VERSION 5.00
Begin VB.Form FrmMain 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Flower Password"
   ClientHeight    =   2970
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4110
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmMain.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FrmMain.frx":43B2
   ScaleHeight     =   2970
   ScaleWidth      =   4110
   ShowInTaskbar   =   0   'False
   Visible         =   0   'False
   Begin VB.PictureBox PicUser 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   300
      Left            =   360
      MousePointer    =   3  'I-Beam
      ScaleHeight     =   300
      ScaleWidth      =   3300
      TabIndex        =   9
      TabStop         =   0   'False
      ToolTipText     =   "�����������Ϊ�ա�"
      Top             =   1760
      Width           =   3300
   End
   Begin VB.PictureBox PicKey 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   300
      Left            =   360
      MousePointer    =   3  'I-Beam
      ScaleHeight     =   300
      ScaleWidth      =   3045
      TabIndex        =   8
      TabStop         =   0   'False
      ToolTipText     =   "��������ͬ��;����ļ�̴��ţ����Ա��˺ſ��á�taobao����tb���ȡ�"
      Top             =   1250
      Width           =   3045
   End
   Begin VB.PictureBox PicPassword 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00808080&
      Height          =   300
      Left            =   360
      MousePointer    =   3  'I-Beam
      ScaleHeight     =   300
      ScaleWidth      =   3285
      TabIndex        =   7
      TabStop         =   0   'False
      ToolTipText     =   "��ѡ��һ�����׼ǵ����룬��������������ǿ�����롣(���飺ѡ��һ���������Ϣ�޹ص����룬��ֹ��Ṥ��ѧ�ƽ⡣)"
      Top             =   740
      Width           =   3285
   End
   Begin VB.TextBox txtUser 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   260
      TabIndex        =   2
      ToolTipText     =   "�������롣"
      Top             =   1710
      Width           =   3550
   End
   Begin VB.ComboBox comKey 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   260
      TabIndex        =   1
      ToolTipText     =   "��������ͬ��;����ļ�̴��ţ����Ա��˺ſ��á�taobao����tb���ȡ�"
      Top             =   1200
      Width           =   3550
   End
   Begin VB.Timer TmrShow 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   0
      Top             =   2520
   End
   Begin VB.TextBox txtCode16 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00F0FBFF&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   260
      Left            =   320
      Locked          =   -1  'True
      MaxLength       =   16
      MousePointer    =   1  'Arrow
      TabIndex        =   3
      Top             =   2420
      Width           =   2565
   End
   Begin VB.TextBox txtPassword 
      BackColor       =   &H00FFFFFF&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   11.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      IMEMode         =   3  'DISABLE
      Left            =   260
      PasswordChar    =   "*"
      TabIndex        =   0
      ToolTipText     =   "��ѡ��һ�����׼ǵ����룬��������������ǿ�����롣(���飺ѡ��һ���������Ϣ�޹ص����룬��ֹ��Ṥ��ѧ�ƽ⡣)"
      Top             =   690
      Width           =   3550
   End
   Begin VB.Image ImgCopy 
      Height          =   360
      Left            =   1440
      Picture         =   "FrmMain.frx":5244
      Top             =   165
      Visible         =   0   'False
      Width           =   1125
   End
   Begin VB.Label lblCopy 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   345
      Left            =   2910
      MouseIcon       =   "FrmMain.frx":5323
      MousePointer    =   99  'Custom
      TabIndex        =   4
      Top             =   2360
      Width           =   900
   End
   Begin VB.Label lblClose 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   315
      Left            =   3800
      MouseIcon       =   "FrmMain.frx":5479
      MousePointer    =   99  'Custom
      TabIndex        =   5
      ToolTipText     =   "Close"
      Top             =   0
      Width           =   315
   End
   Begin VB.Label lblWebsite 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   350
      Left            =   910
      MouseIcon       =   "FrmMain.frx":55CF
      MousePointer    =   99  'Custom
      TabIndex        =   6
      ToolTipText     =   "Go to FlowerPassword.com"
      Top             =   160
      Width           =   2745
   End
   Begin VB.Menu munFlowerPassword 
      Caption         =   "����(&F)"
      Visible         =   0   'False
      Begin VB.Menu munShow 
         Caption         =   "��ʾ(&S)"
      End
      Begin VB.Menu munLine 
         Caption         =   "-"
      End
      Begin VB.Menu munExit 
         Caption         =   "�˳�(&E)"
      End
   End
End
Attribute VB_Name = "FrmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub comKey_Click()

    If Len(comKey.Text) > 0 And Len(txtPassword.Text) > 0 Then
        txtCode16.Text = getFlowerPassword(txtPassword.Text, comKey.Text + txtUser.Text, 16)
    Else
        txtCode16.Text = ""

    End If

End Sub

Private Sub ComKey_GotFocus()
    PicKey.Visible = False
    comKey.SelStart = 0
    comKey.SelLength = Len(comKey.Text)

End Sub

Private Sub ComKey_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 27 Then
        Me.Visible = False
        txtPassword.Text = ""
    ElseIf KeyCode = 13 Then
        SendCodeToEditBox

    End If

End Sub

Private Sub comKey_LostFocus()

    If Len(comKey.Text) > 0 Then
        PicKey.Visible = False
    Else
        PicKey.Visible = True

    End If

End Sub

Private Sub Form_Initialize()

    If App.PrevInstance Then
        MsgBox "�����Ѿ����У���رպ�̨����������һ�Σ�", vbCritical + vbOKOnly
        End
    Else
        App.TaskVisible = False
        InitCommonControlsVB

        If ProtectTextBox(txtPassword.hwnd) = 0 Then
            MsgBox "���ܼ�����������򱣻�ʧ�ܣ�", vbCritical + vbOKOnly

        End If

    End If

End Sub

Private Sub Form_Load()
    PicPassword.Print "�������������": PicKey.Print "���������ִ���": PicUser.Print "�����븽������"
    SetWinStyle Me.hwnd: Me.Width = 4110: Me.Height = 2970
    SetWinOnTop Me.hwnd

    If SetHotKey(Me.hwnd) = 0 Then
        MsgBox "���ܿ�ݼ���WIN + S����ϵͳ���������ͻ��", vbCritical + vbOKOnly
        End

    End If

    If SetMouseHook = 0 Then
        MsgBox "���ܼ������ҹ�ģ��ʧ�ܣ�", vbCritical + vbOKOnly
        End

    End If

    If AddToTray(FrmMain, App.Title) = 0 Then
        MsgBox "���ܼ�������ģ��ʧ�ܣ�", vbCritical + vbOKOnly
        End
    Else
        SetTrayMsgbox "����ݼ� WIN + S �������ܣ���Enter����Esc���ر����봰�ڡ�", NIIF_GUID, "��ӭ��ʹ�û���Windows��", Me.Icon

    End If

End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)

    If Not Me.Visible Then
        MouseOnTray Button, Shift, x, y

    End If

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    UnSetMouseHook
    UnSetHotKey Me.hwnd
    UnSetWinOnTop Me.hwnd

End Sub

Private Sub lblCopy_Click()

    If Len(txtCode16.Text) > 0 Then
        Clipboard.Clear
        Clipboard.SetText txtCode16.Text
        TmrShow.Enabled = True
        ImgCopy.Visible = True

    End If

End Sub

Private Sub munExit_Click()
    Unload Me

End Sub

Private Sub Form_Terminate()
    RemoveFromTray

End Sub

Private Sub Form_Unload(Cancel As Integer)
    UnProtectTextBox txtPassword.hwnd

End Sub

Private Sub lblClose_Click()
    Me.Visible = False
    txtPassword.Text = ""

End Sub

Private Sub lblWebsite_Click()
    OpenWebsite "http://flowerpassword.com"

End Sub

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 27 Then
        Me.Visible = False
        txtPassword.Text = ""
    ElseIf KeyCode = 13 Then
        Me.Visible = False

        If Len(txtCode16.Text) > 0 Then
            Clipboard.Clear
            Clipboard.SetText txtCode16.Text

        End If

        txtPassword.Text = ""

    End If

End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    SetWinMove Me.hwnd

End Sub

Private Sub munShow_Click()
    Me.Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2
    Me.Visible = True
    txtPassword.SetFocus

End Sub

Private Sub PicKey_Click()
    PicKey.Visible = False
    comKey.SetFocus

End Sub

Private Sub PicPassword_Click()
    PicPassword.Visible = False
    txtPassword.SetFocus

End Sub

Private Sub PicUser_Click()
    PicUser.Visible = False
    txtUser.SetFocus

End Sub

Private Sub TmrShow_Timer()

    Static count As Long

    count = count + 1

    If count > 5 Then
        count = 0
        TmrShow.Enabled = False
        ImgCopy.Visible = False

    End If

End Sub

Private Sub txtPassword_Change()

    If Len(txtPassword.Text) > 0 And Len(comKey.Text) > 0 Then
        txtCode16.Text = getFlowerPassword(txtPassword.Text, comKey.Text + txtUser.Text, 16)
    Else
        txtCode16.Text = ""

    End If

End Sub

Private Sub txtPassword_GotFocus()
    PicPassword.Visible = False
    txtPassword.SelStart = 0
    txtPassword.SelLength = Len(txtPassword.Text)

End Sub

Private Sub txtPassword_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 27 Then
        Me.Visible = False
        txtPassword.Text = ""
    ElseIf KeyCode = 13 Then

        If Len(txtCode16.Text) > 0 Then
            SendCodeToEditBox True
        Else
            comKey.SetFocus

        End If

    End If

End Sub

Private Sub txtPassword_LostFocus()

    If Len(txtPassword.Text) > 0 Then
        PicPassword.Visible = False
    Else
        PicPassword.Visible = True

    End If

End Sub

Private Sub txtUser_Change()

    If Len(txtPassword.Text) > 0 And Len(comKey.Text) > 0 Then
        txtCode16.Text = getFlowerPassword(txtPassword.Text, comKey.Text + txtUser.Text, 16)
    Else
        txtCode16.Text = ""

    End If

End Sub

Private Sub txtUser_GotFocus()
    PicUser.Visible = False
    txtUser.SelStart = 0
    txtUser.SelLength = Len(txtUser.Text)

End Sub

Private Sub txtUser_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = 27 Then
        Me.Visible = False
        txtPassword.Text = ""
    ElseIf KeyCode = 13 Then
        SendCodeToEditBox

    End If

End Sub

Private Function CompareComKey(ByVal strKey As String) As Boolean

    Dim I As Long

    CompareComKey = False

    For I = 0 To comKey.ListCount - 1

        If comKey.List(I) = strKey Then
            CompareComKey = True
            Exit For

        End If

    Next

End Function

Public Sub AddStrToComKey()

    If Not CompareComKey(comKey.Text) Then
        comKey.AddItem comKey.Text

    End If

End Sub

Public Sub SendCodeToEditBox(Optional ByVal Key As Boolean = True)
    Me.Visible = False

    If Len(txtCode16.Text) > 0 Then
        Clipboard.Clear
        Clipboard.SetText txtCode16.Text

        If Key Then
            PostCode txtCode16.Text, Password_Hwnd
        Else
            PostCode txtCode16.Text

        End If

    End If

    AddStrToComKey
    txtPassword.Text = ""

End Sub

Private Sub txtUser_LostFocus()

    If Len(txtUser.Text) > 0 Then
        PicUser.Visible = False
    Else
        PicUser.Visible = True

    End If

End Sub
