<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学分制教务管理系统</title>
    <style type="text/css">
        #form1
        {
            height: 753px;
        }
    </style>
</head>
<body style="height: 515px">
    <form id="LoginForm" runat="server" style="text-align: center; height: 471px;">
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" ForeColor="Blue"  Font-Bold="True" Font-Size=Larger Text="学分制教学管理系统"></asp:Label>
    <br />    
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#3399FF" 
        Text="用户登录"></asp:Label>
    <br />
    <br />
    用户名： 
    <asp:TextBox ID="IDTextBox" runat="server"></asp:TextBox>
    <br />
    <br />
    密&nbsp;&nbsp;&nbsp; 码： 
    <asp:TextBox ID="PwdTextBox" runat="server" TextMode="Password"></asp:TextBox>
    <br />
    <br />
    <br />
    <asp:RadioButton ID="AdminRB" runat="server" GroupName="user" Text="管理员" />
&nbsp;&nbsp;
    <asp:RadioButton ID="TeacherRB" runat="server" GroupName="user" Text="教师" />
&nbsp;
    <asp:RadioButton ID="StuRB" runat="server" Checked="True" GroupName="user" 
        Text="学生" />
    <br />
    <br />
    <asp:Button ID="LoginBtn" runat="server" Height="31px" onclick="LoginBtn_Click" 
        Text="登录" Width="111px" />
    </form>
</body>
</html>
