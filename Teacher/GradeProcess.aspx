<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GradeProcess.aspx.cs" Inherits="Teacher_GradeProcess" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center; height: 719px;">
     
    <br />
    <br />
    <br />
    <br />
    <a href="TeacherMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
    <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="教师成绩录入"></asp:Label>
    
    <br />
    <br />
    <asp:DropDownList ID="CourseClassDDList" runat="server" AutoPostBack="True" 
        Height="17px" ontextchanged="CourseClassDDList_TextChanged" Width="195px">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="QueryBtn" runat="server" onclick="QueryBtn_Click" Text="确定" 
        Width="94px" />
    
    <br />
    <br />
    <asp:GridView ID="GradeGView" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" GridLines="Vertical" HorizontalAlign="Center" 
        DataKeyNames="GradeSeedID">
        <AlternatingRowStyle BackColor="#DCDCDC" />
        <Columns>
            <asp:BoundField DataField="GradeSeedID" HeaderText="成绩编码" />
            <asp:BoundField DataField="StuID" HeaderText="学号" />
            <asp:BoundField DataField="StuName" HeaderText="姓名" />
            <asp:TemplateField HeaderText="平时成绩">
                <ItemTemplate>
                    <asp:TextBox ID="TBoxCommonScore" Width="60" Text="0" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="期中成绩">
                <ItemTemplate>
                    <asp:TextBox ID="TBoxMiddleScore" Width="60" Text="0" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="期末成绩">
                <ItemTemplate>
                    <asp:TextBox ID="TBoxLastScore" Width="60" Text="0" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="TotalScore" HeaderText="总评成绩" />
            <asp:TemplateField HeaderText="锁定">
                <ItemTemplate>
                    <asp:CheckBox ID="CBoxLockFlag" Enabled="False" runat="server" />
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
    <asp:Button ID="GradeProcBtn" runat="server" onclick="GradeProcBtn_Click" 
        Text="成绩处理" Width="100px" />
    </form>
</body>
</html>
