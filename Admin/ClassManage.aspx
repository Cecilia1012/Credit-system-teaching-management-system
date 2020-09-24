<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ClassManage.aspx.cs" Inherits="Admin_ClassManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 551px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
        
    <br />
    <br />
         <a href="AdminMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
<asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="班级信息维护"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="DeptDDList" runat="server" Height="26px" Width="211px">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="QueryBtn" runat="server" Text="查询" onclick="QueryBtn_Click" 
        Width="82px" />
    <br />
    <br />
    <br />
    <asp:GridView ID="ClassGView" runat="server" BackColor="White" 
        BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
        AutoGenerateColumns="False" HorizontalAlign="Center" 
        DataKeyNames="ClassID" onrowdeleting="ClassGView_RowDeleting">
        <Columns>
            <asp:BoundField DataField="ClassID" HeaderText="班级编码" />
            <asp:BoundField DataField="ClassName" HeaderText="班级名称" />
            <asp:BoundField DataField="DeptName" HeaderText="系部" />
            <asp:BoundField DataField="TeacherName" HeaderText="班主任" />
            <asp:HyperLinkField DataNavigateUrlFields="ClassID" 
                DataNavigateUrlFormatString="ClassEdit.aspx?ClassID={0}" HeaderText="编辑" 
                Text="编辑" />
            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <br />
    <br />
    <a href="ClassAdd.aspx">班级信息添加</a>
    </form>
</body>
</html>
