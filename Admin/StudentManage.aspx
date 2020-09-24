<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentManage.aspx.cs" Inherits="Admin_StudentManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 481px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
     <br />
    <br />
         <a href="AdminMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
        <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="学生信息维护"></asp:Label>
    <br />
    <br />
    <asp:DropDownList ID="ClassDDList" runat="server" Height="16px" Width="180px">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="QueryBtn" runat="server" Text="查询" onclick="QueryBtn_Click" 
         Width="77px" />
    <br />
    <br />
    <asp:GridView ID="StuGView" runat="server" HorizontalAlign="Center" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
        BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" 
         DataKeyNames="StuID">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="StuID" HeaderText="学生学号" />
            <asp:BoundField DataField="StuName" HeaderText="学生姓名" />
            <asp:BoundField DataField="EnrollYear" HeaderText="入学年份" />
            <asp:BoundField DataField="GradYear" HeaderText="毕业年份" />
            <asp:BoundField DataField="DeptName" HeaderText="系部" />
            <asp:BoundField DataField="ClassName" HeaderText="班级" />
            <asp:BoundField DataField="Sex" HeaderText="性别" />
            <asp:BoundField DataField="Birthday" HeaderText="出生日期" />
            <asp:BoundField DataField="StuAddress" HeaderText="地址" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" />
            <asp:HyperLinkField DataNavigateUrlFields="StuID" 
                DataNavigateUrlFormatString="StudentEdit.aspx?StuID={0}" HeaderText="编辑" 
                Text="编辑" />
            <asp:TemplateField HeaderText="删除" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="删除" OnClientClick="javascript:return confirm('真的要删除吗？');"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
        <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#0000A9" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#000065" />
    </asp:GridView>
    <br />
        <a href="StudentAdd.aspx">学生信息添加</a>
    </form>
</body>
</html>
