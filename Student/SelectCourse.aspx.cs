using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class Student_SelectCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection CourseClassConn = new SqlConnection();
            CourseClassConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            CourseClassConn.Open();
            //调用存储过程
            SqlCommand CourseClassCmd = new SqlCommand("SP_StuCourseClass", CourseClassConn);
            CourseClassCmd.CommandType = CommandType.StoredProcedure;
            CourseClassCmd.Parameters.Add("@StuID", SqlDbType.Char, 8).Value = Session["StuID"].ToString();
            SqlDataAdapter StuGradeAdapter = new SqlDataAdapter(CourseClassCmd);
            DataSet StuCourseClassDS = new DataSet();
            StuGradeAdapter.Fill(StuCourseClassDS, "StuSelectCourseTable");
            CourseClassConn.Close();
            //数据绑定gridview显示
            this.CourceClassGView.DataSource = StuCourseClassDS.Tables["StuSelectCourseTable"];
            this.CourceClassGView.DataBind();
        }
    }
    protected void StuSelectBtn_Click(object sender, EventArgs e)
    {
        string CourseClassIDs;//课程班编码
        CourseClassIDs = "";//初始化字符串
        //循环遍历记录选中的课程班
        for (int i = 0; i < this.CourceClassGView.Rows.Count; i++)
        {
            CheckBox CheckedBox = (CheckBox)this.CourceClassGView.Rows[i].FindControl("CBoxCourseClass");
            if (CheckedBox.Checked)
            {
                if (CourseClassIDs == "")
                    CourseClassIDs = this.CourceClassGView.DataKeys[i].Value.ToString();
                else
                    CourseClassIDs = CourseClassIDs + "," + this.CourceClassGView.DataKeys[i].Value.ToString();
            }
        }
        //课程选择后存储
        if (CourseClassIDs == "")
        {
            //没有勾选
            Response.Write("<SCRIPT language='javascript'>alert('请先选择课程！');</SCRIPT>");
        }
        else
        {
            SqlConnection SelectCourseConn = new SqlConnection();
            SelectCourseConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            SelectCourseConn.Open();
            //调用选课的存储过程
            SqlCommand SelectCourseCmd = new SqlCommand("SP_SelectCourse", SelectCourseConn);
            SelectCourseCmd.CommandType = CommandType.StoredProcedure;
            //添加参数
            SelectCourseCmd.Parameters.Add("@StuID", SqlDbType.Char, 8).Value = Session["StuID"].ToString();
            SelectCourseCmd.Parameters.Add("@CourseClassIDs", SqlDbType.VarChar,100).Value = CourseClassIDs;
            SelectCourseCmd.ExecuteNonQuery();
            SelectCourseConn.Close();
            Response.Write("<SCRIPT language='javascript'>alert('课程选修成功！'); </SCRIPT>");
            Response.Redirect("ReturnCourse.aspx");
        }
    }
}