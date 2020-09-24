using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Teacher_TeaGradeQuery : System.Web.UI.Page
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
        SqlCommand CourseClassCmd = new SqlCommand("SP_CourseClassQuery", DDLConn);
        CourseClassCmd.CommandType = CommandType.StoredProcedure;
        CourseClassCmd.Parameters.Add("@TeacherID", SqlDbType.Char, 6).Value = Session["TeacherID"].ToString();
        SqlDataAdapter CourseClassDataAdapter = new SqlDataAdapter(CourseClassCmd);
        DataSet DDLDataSet = new DataSet();
        CourseClassDataAdapter.Fill(DDLDataSet, "CourseClassTable");
        this.CourseClassDDList.DataTextField = "CCName";
        this.CourseClassDDList.DataValueField = "CourseClassID";
        this.CourseClassDDList.DataSource = DDLDataSet.Tables["CourseClassTable"];
        this.CourseClassDDList.DataBind();
        DDLConn.Close();
    }
    protected void QueryBtn_Click(object sender, EventArgs e)
    {
        SqlConnection CourseClassGradeConn = new SqlConnection();
        CourseClassGradeConn.ConnectionString =ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        CourseClassGradeConn.Open();
        SqlCommand CourseClassCmd = new SqlCommand("SP_CourseClassGradeQuery",CourseClassGradeConn);
        CourseClassCmd.CommandType = CommandType.StoredProcedure;
        CourseClassCmd.Parameters.Add("@CourseClassID", SqlDbType.Char, 10).Value =this.CourseClassDDList.SelectedValue.ToString();
        SqlDataAdapter CourseClassDataAdapter = new SqlDataAdapter(CourseClassCmd);
        DataSet QueryDS = new DataSet();
        CourseClassDataAdapter.Fill(QueryDS, "CCGradeTable");
        this.GradeGView.DataSource = QueryDS.Tables["CCGradeTable"];
        this.GradeGView.DataBind();
        CourseClassGradeConn.Close();
    }
}