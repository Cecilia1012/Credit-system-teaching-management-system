using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Teacher_GradeProcess : System.Web.UI.Page
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
        QueryBtn.Enabled = true;
        GradeGView.Visible = false;
        GradeProcBtn.Visible = false;
    }

    private void GradeGViewDataBind()
    {
        string CourseClassID = this.CourseClassDDList.SelectedValue.ToString();
        SqlConnection CCGradeProcConn = new SqlConnection();
        CCGradeProcConn.ConnectionString =ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        CCGradeProcConn.Open();
        SqlCommand GradeQueryCmd = new SqlCommand("SELECT * FROM TB_Grade WHERE CourseClassID="+"'"+CourseClassID+"'", CCGradeProcConn);
        SqlDataReader GradeDataReader = GradeQueryCmd.ExecuteReader();
        GradeDataReader.Read();
        if (!GradeDataReader.HasRows)
        {
            GradeDataReader.Close();
            SqlCommand MakeGradeSheetCmd = new SqlCommand("SP_MakeGradeSheet", CCGradeProcConn);
            MakeGradeSheetCmd.CommandType = CommandType.StoredProcedure;
            MakeGradeSheetCmd.Parameters.Add("@CourseClassID", SqlDbType.Char, 10).Value = CourseClassID;
            MakeGradeSheetCmd.ExecuteNonQuery();
        }
        else
            GradeDataReader.Close();
        SqlCommand CourseClassCmd = new SqlCommand("SP_CourseClassGradeQuery",CCGradeProcConn);
        CourseClassCmd.CommandType = CommandType.StoredProcedure;
        CourseClassCmd.Parameters.Add("@CourseClassID", SqlDbType.Char, 10).Value =CourseClassID;
        SqlDataAdapter CourseClassDataAdapter = new SqlDataAdapter(CourseClassCmd);
        DataSet QueryDS = new DataSet();
        CourseClassDataAdapter.Fill(QueryDS, "CCGradeTable");
        this.GradeGView.DataSource = QueryDS.Tables["CCGradeTable"];
        this.GradeGView.DataBind();
        for (int i = 0; i < this.GradeGView.Rows.Count; i++)
        {
            TextBox CTextBox =    (TextBox)this.GradeGView.Rows[i].FindControl("TBoxCommonScore");
            TextBox MTextBox = (TextBox)this.GradeGView.Rows[i].FindControl("TBoxMiddleScore");
            TextBox LTextBox = (TextBox)this.GradeGView.Rows[i].FindControl("TBoxLastScore");
            CheckBox LockCheckBox =    (CheckBox)this.GradeGView.Rows[i].FindControl("CBoxLockFlag");
            CTextBox.Text =   QueryDS.Tables["CCGradeTable"].Rows[i]["CommonScore"].ToString();
            MTextBox.Text =    QueryDS.Tables["CCGradeTable"].Rows[i]["MiddleScore"].ToString();
            LTextBox.Text =   QueryDS.Tables["CCGradeTable"].Rows[i]["LastScore"].ToString();
            if (QueryDS.Tables["CCGradeTable"].Rows[i]["LockFlag"].ToString() == "L")
            {
                this.GradeGView.Rows[i].Enabled = false;
                LockCheckBox.Checked = true;
                GradeProcBtn.Enabled = false;
            }
            else
                GradeProcBtn.Enabled = true;
        }
        CCGradeProcConn.Close();
    }

    protected void QueryBtn_Click(object sender, EventArgs e)
    {
        GradeGView.Visible = true;
        GradeGViewDataBind();
        GradeProcBtn.Visible = true;
    }
    protected void GradeProcBtn_Click(object sender, EventArgs e)
    {
        int intGradeSeedID;
        float fltCommonScore, fltMiddleScore, fltLastScore;
        if (this.GradeGView.Rows.Count > 0)
        {
            SqlConnection GradeUpdateConn = new SqlConnection();
            GradeUpdateConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            GradeUpdateConn.Open();
            for (int i = 0; i < this.GradeGView.Rows.Count; i++)
            {
                intGradeSeedID = Convert.ToInt32(this.GradeGView.DataKeys[i].Value);
                fltCommonScore =Convert.ToSingle(((TextBox)this.GradeGView.Rows[i].FindControl("TBoxCommonScore")).Text);
                fltMiddleScore =Convert.ToSingle(((TextBox)this.GradeGView.Rows[i].FindControl("TBoxMiddleScore")).Text);
                fltLastScore =Convert.ToSingle(((TextBox)this.GradeGView.Rows[i].FindControl("TBoxLastScore")).Text);
                string GradeUpdateSQL = "UPDATE TB_Grade SET CommonScore=";
                GradeUpdateSQL = GradeUpdateSQL + fltCommonScore;
                GradeUpdateSQL = GradeUpdateSQL + ",MiddleScore=" + fltMiddleScore;
                GradeUpdateSQL = GradeUpdateSQL + ",LastScore=" + fltLastScore;
                GradeUpdateSQL = GradeUpdateSQL + " WHERE GradeSeedID=" + intGradeSeedID;
                SqlCommand GradeUpdateCmd = new SqlCommand(GradeUpdateSQL, GradeUpdateConn);
                GradeUpdateCmd.ExecuteNonQuery();
            }
            TotalScoreProc();
            GradeUpdateConn.Close();
            GradeGViewDataBind();
            Response.Write("<SCRIPT language='javascript'>alert('成绩处理成功并刷新！'); </SCRIPT>");
        }
    }

    private void TotalScoreProc()
    {
        SqlConnection GradeProcConn = new SqlConnection();
        GradeProcConn.ConnectionString =ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
        GradeProcConn.Open();
        SqlCommand SelectCourseCmd = new SqlCommand("SP_GradeProc",    GradeProcConn);
        SelectCourseCmd.CommandType = CommandType.StoredProcedure;
        SelectCourseCmd.Parameters.Add("@CourseClassID", SqlDbType.Char, 10).Value = this.CourseClassDDList.SelectedValue.ToString();
        SelectCourseCmd.ExecuteNonQuery();
        GradeProcConn.Close();
    }
    protected void CourseClassDDList_TextChanged(object sender, EventArgs e)
    {
        GradeGView.Visible = false;
        GradeProcBtn.Visible = false;
    }
}