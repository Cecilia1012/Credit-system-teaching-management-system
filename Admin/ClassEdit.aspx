<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClassEdit.aspx.cs" Inherits="Admin_ClassEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 680px;
        }
    </style>
</head>
<body style="height: 637px">
    <form id="form1" runat="server" style="text-align: center">
    
    <br />
    <br />
         <a href="AdminMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
<asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="班级信息更新"></asp:Label>
    <br />
    <br />
    <br />
     <table align="center" class="style1" style="width:300px;">
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="班级编码："></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="ClassIDTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="班级名称："></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="ClassNameTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Text="系部："></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="DeptDDList" runat="server" Height="16px" Width="149px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
              
            &nbsp;<asp:Label ID="Label5" runat="server" Text="班主任："></asp:Label>
              
            </td>
            <td class="style3">
                <asp:DropDownList ID="TeacherDDList" runat="server" Height="16px" Width="148px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="UpdateBtn" runat="server" onclick="UpdateBtn_Click" Text="更新" 
                    Width="107px" />
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
