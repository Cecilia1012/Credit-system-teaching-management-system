using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void LoginBtn_Click(object sender, EventArgs e)
    {
        if ((IDTextBox.Text == "") || (PwdTextBox.Text == ""))
            Response.Write("<SCRIPT language='javascript'>alert('账号或密码不能为空！！！'); </SCRIPT>");
        else
        {
            string userid = this.IDTextBox.Text;//账号
            string pwd = this.PwdTextBox.Text;//密码
            //连接数据库
            SqlConnection LoginConn = new SqlConnection();
            LoginConn.ConnectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ToString();
            LoginConn.Open();
            if (this.AdminRB.Checked)
            {
                SqlCommand LoginCmd = new SqlCommand("SELECT * FROM TB_Admin WHERE AdminID='" + userid + "' AND AdminPwd='" + pwd + "'", LoginConn);
                SqlDataReader RsLogin = LoginCmd.ExecuteReader();
                RsLogin.Read();
                if (RsLogin.HasRows)
                {
                    Session["AdminID"] = RsLogin["AdminID"].ToString();
                    Session["AdminName"] = RsLogin["AdminName"].ToString();
                    Session["IsLogin"] = "True";
                    Response.Write("<script language='javascript'>window.location='Admin/AdminMain.aspx'</script>");
                }
                else
                    Response.Write("<SCRIPT language='javascript'>alert('账号或密码错误！！！'); </SCRIPT>");
                RsLogin.Close();
            }
            else if (this.TeacherRB.Checked)
            {
                SqlCommand LoginCmd = new SqlCommand("SELECT * FROM TB_Teacher WHERE TeacherID='" + userid + "' AND TPassword='" + pwd + "'", LoginConn);
                SqlDataReader RsLogin = LoginCmd.ExecuteReader();
                RsLogin.Read();
                if (RsLogin.HasRows)
                {
                    Session["TeacherID"] = RsLogin["TeacherID"].ToString();
                    Session["TeacherName"] = RsLogin["TeacherName"].ToString();
                    Session["IsLogin"] = "True";
                    Response.Write("<script language='javascript'>window.location='Teacher/TeacherMain.aspx'</script>");
                }
                else
                    Response.Write("<SCRIPT language='javascript'>alert('账号或密码错误！！！'); </SCRIPT>");
                RsLogin.Close();
            }
            else if (this.StuRB.Checked)
            {
                SqlCommand LoginCmd = new SqlCommand("SELECT * FROM TB_Student WHERE StuID='" + userid + "' AND SPassword='" + pwd + "'", LoginConn);
                SqlDataReader RsLogin = LoginCmd.ExecuteReader();
                RsLogin.Read();
                if (RsLogin.HasRows)
                {
                    Session["StuID"] = RsLogin["StuID"].ToString();
                    Session["StuName"] = RsLogin["StuName"].ToString();
                    Session["IsLogin"] = "True";
                    Response.Write("<script language='javascript'>window.location='Student/StuMain.aspx'</script>");
                }
                else
                    Response.Write("<SCRIPT language='javascript'>alert('账号或密码错误！！！'); </SCRIPT>");
                RsLogin.Close();
            }
            LoginConn.Close();
        }
    }
}