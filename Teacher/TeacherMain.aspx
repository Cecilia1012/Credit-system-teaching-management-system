<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherMain.aspx.cs" Inherits="Teacher_TeacherMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 514px;
        }
    </style>
</head>
<body style="height: 554px">
    <form id="form1" runat="server" style="text-align: center">
    
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="LoginOutBtn" runat="server" BackColor="Red" BorderColor="Red" 
        BorderStyle="Dotted" ForeColor="White" Height="31px" 
        onclick="LoginOutBtn_Click" Text="登出" Width="70px" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=True 
        Font-Size=Large Text="系统教师模块"></asp:Label>
    
    <br />
    <br />
    <asp:Label ID="LoginOKLabel" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <a href="GradeProcess.aspx">录入成绩</a><img src="../images/Finger.png" alt="Finger.png" />
    <br />
    <br />
    <a href="TeaGradeQuery.aspx">成绩查询</a><img src="../images/Finger.png" alt="Finger.png" />
    </form>
</body>
</html>
