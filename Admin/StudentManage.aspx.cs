using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_StudentManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DropDownListBind();
            GridViewDataBind();
        }
    }
    private void DropDownListBind()
    {
        //新建一个连接实例
        SqlConnection DDLConn = new SqlConnection();
        //从Web.config文件获取数据库连接字符串
        DDLConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        DDLConn.Open();
        //并将班级部表中的数据填充到DDLDataSet对象的表“ClassTable”中
        SqlCommand ClassCmd = new SqlCommand("SELECT ClassID,ClassName FROM TB_Class", DDLConn);
        SqlDataAdapter ClassDataAdapter = new SqlDataAdapter(ClassCmd);
        DataSet DDLDataSet = new DataSet();
        ClassDataAdapter.Fill(DDLDataSet, "ClassTable");
        //班级下拉框绑定
        this.ClassDDList.DataTextField = "ClassName";
        this.ClassDDList.DataValueField = "ClassID";
        this.ClassDDList.DataSource = DDLDataSet.Tables["ClassTable"];
        this.ClassDDList.DataBind();
        this.ClassDDList.Items.Insert(0, new ListItem("===所有班级===", "全部"));
        //关闭数据库连接
        DDLConn.Close();
    }
    private void GridViewDataBind()
    {
        SqlConnection StuConn = new SqlConnection();
        StuConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        StuConn.Open();
        SqlCommand StuSelectCmd = new SqlCommand("SELECT StuID,StuName,EnrollYear,GradYear,TD.DeptName,TC.ClassName,Sex,Birthday,StuAddress,ZipCode FROM TB_Student TS,TB_Dept TD,TB_Class TC WHERE TS.DeptID=TD.DeptID AND TS.ClassID=TC.ClassID",StuConn);
        SqlDataAdapter StuAdapter = new SqlDataAdapter(StuSelectCmd);
        DataSet StuDS = new DataSet();
        StuAdapter.Fill(StuDS, "Student Table");
        StuConn.Close();
        this.StuGView.DataSource = StuDS.Tables["Student Table"];
        this.StuGView.DataBind();
    }
    protected void QueryBtn_Click(object sender, EventArgs e)
    {
        string QuerySQL = "SELECT StuID,StuName,EnrollYear,GradYear,DeptName,ClassName,Sex,Birthday,StuAddress,ZipCode FROM TB_Student TS,TB_Dept TD,TB_Class TC WHERE TS.DeptID=TD.DeptID AND TS.ClassID=TC.ClassID";
        if (this.ClassDDList.SelectedValue != "全部")
        {
            QuerySQL += " AND TC.ClassID='" + this.ClassDDList.SelectedValue + "'";
        }
        SqlConnection QueryConn = new SqlConnection();
        QueryConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        QueryConn.Open();
        SqlCommand QueryCmd = new SqlCommand(QuerySQL, QueryConn);
        SqlDataAdapter QueryAdapter = new SqlDataAdapter(QueryCmd);
        DataSet QueryDS = new DataSet();
        QueryAdapter.Fill(QueryDS);
        QueryConn.Close();
        this.StuGView.DataSource = QueryDS.Tables[0].DefaultView;
        this.StuGView.DataBind();
    }
}