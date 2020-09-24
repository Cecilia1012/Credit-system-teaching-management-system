using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_AdminMain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoginOKLabel.Text = Session["AdminName"].ToString() + "管理员，欢迎!";
    }
    protected void LoginOutBtn_Click(object sender, EventArgs e)
    {
        Response.Write("<script language='javascript'>window.location='../Login.aspx'</script>");
    }
}