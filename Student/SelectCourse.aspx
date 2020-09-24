<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SelectCourse.aspx.cs" Inherits="Student_SelectCourse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 555px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="text-align: center">
    
    <br />
    <br />
    <a href="StuMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
    <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="网上课程选修"></asp:Label>
    
    <br />
    <br />
    <br />
    <asp:GridView ID="CourceClassGView" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" HorizontalAlign="Center" DataKeyNames="CourseClassID">
        <Columns>
            
            <asp:TemplateField HeaderText="勾选">
                <EditItemTemplate>
                    <asp:CheckBox ID="CBoxCourseClass" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CBoxCourseClass" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="CourseClassID" HeaderText="课程班编码" Visible="False" />
            <asp:BoundField DataField="CourseName" HeaderText="课程名称" />
            <asp:BoundField DataField="TeacherName" HeaderText="任课教师" />
            <asp:BoundField DataField="TeachingPlace" HeaderText="教学地点" />
            <asp:BoundField DataField="TeachingTime" HeaderText="教学时间" />
            <asp:BoundField DataField="MaxNumber" HeaderText="允许选修数" />
            <asp:BoundField DataField="SelectedNumber" HeaderText="已选数" />
            
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
    <asp:Button ID="StuSelectBtn" runat="server" Height="30px" Text="确定" 
        Width="96px" onclick="StuSelectBtn_Click" />
    </form>
</body>
</html>
