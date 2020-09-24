using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_StudentEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DropDownListBind();
            string StuID = Request.QueryString["StuID"];
            //新建一个连接实例
            SqlConnection StuConn = new SqlConnection();
            //从Web.config文件获取数据库连接字符串
            StuConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            StuConn.Open();
            SqlCommand StuCmd = new SqlCommand("SELECT StuID,StuName,EnrollYear,GradYear,DeptID,ClassID,Sex,Birthday,StuAddress,ZipCode FROM TB_Student WHERE StuID='" + StuID + "'", StuConn);
            SqlDataAdapter StuDataAdapter = new SqlDataAdapter(StuCmd);
            DataSet StuDataSet = new DataSet();
            StuDataAdapter.Fill(StuDataSet, "StuTable");
            StuConn.Close();
            this.StuIDTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][0].ToString();
            this.StuNameTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][1].ToString();
            this.EnrollYearTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][2].ToString();
            this.GradYearTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][3].ToString();
            this.DeptDDList.SelectedValue = StuDataSet.Tables["StuTable"].Rows[0][4].ToString();
            this.ClassDDList.SelectedValue = StuDataSet.Tables["StuTable"].Rows[0][5].ToString();
            this.SexTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][6].ToString();
            this.BirthTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][7].ToString();
            this.AddressTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][8].ToString();
            this.ZipCodeTextBox.Text = StuDataSet.Tables["StuTable"].Rows[0][9].ToString();
        }
    }
    private void DropDownListBind()
    {
        SqlConnection DDLConn = new SqlConnection();
        DDLConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        DDLConn.Open();
        SqlCommand DeptCmd = new SqlCommand("SELECT DeptID,DeptName FROM TB_Dept", DDLConn);
        SqlDataAdapter DeptDataAdapter = new SqlDataAdapter(DeptCmd);
        SqlCommand ClassCmd = new SqlCommand("SELECT ClassID,ClassName FROM TB_Class", DDLConn);
        SqlDataAdapter ClassDataAdapter = new SqlDataAdapter(ClassCmd);
        DataSet DDLDataSet = new DataSet();
        DeptDataAdapter.Fill(DDLDataSet, "DeptTable");
        ClassDataAdapter.Fill(DDLDataSet, "ClassTable");
        this.DeptDDList.DataTextField = "DeptName";
        this.DeptDDList.DataValueField = "DeptID";
        this.DeptDDList.DataSource = DDLDataSet.Tables["DeptTable"];
        this.DeptDDList.DataBind();
        this.ClassDDList.DataTextField = "ClassName";
        this.ClassDDList.DataValueField = "ClassID";
        this.ClassDDList.DataSource = DDLDataSet.Tables["ClassTable"];
        this.ClassDDList.DataBind();
        DDLConn.Close();
    }

    protected void UpdateBtn_Click(object sender, EventArgs e)
    {
        string StuID = this.StuIDTextBox.Text.Trim();
        string StuName = this.StuNameTextBox.Text.Trim();
        string enrollyear = this.EnrollYearTextBox.Text.Trim();
        string gradyear = this.GradYearTextBox.Text.Trim();
        string DeptID = this.DeptDDList.SelectedValue;
        string ClassID = this.ClassDDList.SelectedValue;
        string sex = this.SexTextBox.Text.Trim();
        string birth = this.BirthTextBox.Text.Trim();
        string address = this.AddressTextBox.Text.Trim();
        string zipcode = this.ZipCodeTextBox.Text.Trim();

        string StuUpdateSQL = "UPDATE TB_Student SET StuID='"+StuID+"',StuName='"+StuName+"',";
        StuUpdateSQL = StuUpdateSQL + "EnrollYear='" + enrollyear + "',GradYear='" + gradyear + "',DeptID='" + DeptID + "',";
        StuUpdateSQL = StuUpdateSQL + "ClassID='" + ClassID + "',Sex='" + sex + "',Birthday='" + birth + "',StuAddress='" + address + "',ZipCode='" + zipcode + "' ";
        StuUpdateSQL = StuUpdateSQL + "WHERE StuID='" + Request.QueryString["StuID"] + "'";
        SqlConnection StuUpdateConn = new SqlConnection();
        StuUpdateConn.ConnectionString=ConfigurationManager .ConnectionStrings["ConnStr"].ToString();
        StuUpdateConn.Open();
        SqlCommand StuUpdateCmd = new SqlCommand(StuUpdateSQL, StuUpdateConn);
        StuUpdateCmd.ExecuteNonQuery();
        StuUpdateConn.Close();
        Response.Write("<script language='javascript'>alert('更新学生记录成功');location.href='ClassManage.aspx';</script>");
    }
}