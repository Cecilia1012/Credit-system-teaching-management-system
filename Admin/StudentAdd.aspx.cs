using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            

public partial class Admin_StudentAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DropDownListBind();
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
    protected void InsertBtn_Click(object sender, EventArgs e)
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

        string StuInsertSQL = "INSERT INTO TB_Student(StuID,StuName,EnrollYear,GradYear,DeptID,ClassID,Sex,Birthday,SPassword,StuAddress,ZipCpde) VALUES(";
        StuInsertSQL = StuInsertSQL + "'" + StuID + "','" + StuName + "','" + enrollyear + "','" + gradyear + "','" + DeptID + "','" + ClassID + "','" + sex + "','" + birth + "','123456','" + address + "','" + zipcode + "')";
        SqlConnection StuInsertConn = new SqlConnection();
        StuInsertConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        StuInsertConn.Open();
        SqlCommand StuInsertCmd = new SqlCommand(StuInsertSQL, StuInsertConn);
        StuInsertCmd.ExecuteNonQuery();
        StuInsertConn.Close();
        Response.Write("<script language='javascript'>alert('新增学生记录成功');location.href='ClassManage.aspx';</script>");
    }
}