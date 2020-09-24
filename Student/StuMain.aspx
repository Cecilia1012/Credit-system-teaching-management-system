<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StuMain.aspx.cs" Inherits="Student_StuMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 617px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
    
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="LoginOutBtn" runat="server" BackColor="Red" BorderColor="Red" 
        BorderStyle="Dotted" ForeColor="White" Height="31px" 
        onclick="LoginOutBtn_Click" Text="登出" Width="70px" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="系统学生模块"></asp:Label>
    
    <br />
    <br />
    <asp:Label ID="LoginOKLabel" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <a href="SelectCourse.aspx">课程选修</a><img src="../images/Finger.png" alt="Finger.png" />
    <br />
    <br />
    <a href="StuGradeQuery.aspx">成绩查询</a><img src="../images/Finger.png" alt="Finger.png" />
    </form>
</body>
</html>
