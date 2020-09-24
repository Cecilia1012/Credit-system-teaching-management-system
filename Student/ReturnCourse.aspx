<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReturnCourse.aspx.cs" Inherits="Student_ReturnCourse" %>

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
<body style="height: 479px">
    <form id="form1" runat="server" style="text-align: center">
    
    <br />
    <br />
    <a href="StuMain.aspx" style="text-decoration:none">返回</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
&nbsp;<br />
    <asp:Label ID="Label1" runat="server" ForeColor="#33CCFF" Font-Bold=true Font-Size=Large Text="网上课程退选"></asp:Label>
    
    <br />
    <br />
    
    <br />
    <asp:GridView ID="StuCourseGView" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" HorizontalAlign="Center" 
        onrowdeleting="StuCourseGView_RowDeleting">
        <Columns>
            <asp:BoundField DataField="CourseClassID" HeaderText="课程班编码" />
            <asp:BoundField DataField="CourseName" HeaderText="课程名称" />
            <asp:BoundField DataField="TeacherName" HeaderText="任课教师" />
            <asp:BoundField DataField="TeachingPlace" HeaderText="教学地点" />
            <asp:BoundField DataField="TeachingTime" HeaderText="教学时间" />
            <asp:TemplateField HeaderText="退选" ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="退选" OnClientClick="javascript:return confirm('真的要退选吗？');"></asp:LinkButton>
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
         </br>
          <a href="SelectCourse.aspx">课程选修</a><img src="../Images/Finger.png" alt="Finger.png" />
    </form>
</body>
</html>
