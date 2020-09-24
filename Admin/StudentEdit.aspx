<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentEdit.aspx.cs" Inherits="Admin_StudentEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 721px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
     <br />
    <br />
         <a href="AdminMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
<asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="学生信息更新"></asp:Label>
    <br />
     <br />
     <br />
     <table align="center" class="style1" style="width:300px;">
        <tr>
            <td class="style3">
                <asp:Label ID="Label2" runat="server" Text="学生学号："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="StuIDTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label3" runat="server" Text="学生姓名："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="StuNameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label4" runat="server" Text="入学年份："></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="EnrollYearTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label5" runat="server" Text="毕业年份："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="GradYearTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label6" runat="server" Text="系部："></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DeptDDList" runat="server" Height="23px" Width="149px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label7" runat="server" Text="班级："></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ClassDDList" runat="server" Height="16px" Width="147px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label8" runat="server" Text="性别："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="SexTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label9" runat="server" Text="出生日期："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="BirthTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label10" runat="server" Text="学生地址："></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="AddressTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label ID="Label11" runat="server" Text="ZipCode:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="ZipCodeTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="UpdateBtn" runat="server" Text="更新" Width="139px" 
                    onclick="UpdateBtn_Click" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
