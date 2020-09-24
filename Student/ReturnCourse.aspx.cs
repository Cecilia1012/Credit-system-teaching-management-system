using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Student_ReturnCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            GridViewDataBind();
    }
    private void GridViewDataBind()
    {
        SqlConnection StuCourseConn = new SqlConnection();
        StuCourseConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        StuCourseConn.Open();
        //调用存储过程查找已选课程
        SqlCommand StuCourseCmd = new SqlCommand("SP_StuSelectedCourse", StuCourseConn);
        StuCourseCmd.CommandType = CommandType.StoredProcedure;
        StuCourseCmd.Parameters.Add("@StuID", SqlDbType.Char, 8).Value = Session["StuID"].ToString();
        SqlDataAdapter StuGradeAdapter = new SqlDataAdapter(StuCourseCmd);
        DataSet StuCourseDS = new DataSet();
        StuGradeAdapter.Fill(StuCourseDS, "StuCourseTable");
        StuCourseConn.Close();
        //数据绑定显示
        this.StuCourseGView.DataSource = StuCourseDS.Tables["StuCourseTable"];
        this.StuCourseGView.DataBind();
    }
    protected void StuCourseGView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string StuID = Session["StuID"].ToString();
        string CourseClassID = this.StuCourseGView.Rows[e.RowIndex].Cells[0].Text.ToString();
        SqlConnection DeleteConn = new SqlConnection();
        DeleteConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        DeleteConn.Open();
        SqlCommand DeleteCmd = new SqlCommand("DELETE FROM TB_SelectCourse WHERE StuID='" + StuID + "' AND CourseClassID='" + CourseClassID + "'", DeleteConn);
        DeleteCmd.ExecuteNonQuery();
        DeleteConn.Close();
        Response.Write("<script language='javascript'>alert('课程退选成功');</script>");
        GridViewDataBind();
    }
}