using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTrackerWebApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Logout_Click(object sender, EventArgs e)
        {
            Session["Username"] = "Guest";
            Session.Clear();
            Response.Redirect("login.aspx?");
        }

        protected void btn_OpenHistory(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx?");
        }

        protected void btn_OpenDashboard(object sender, EventArgs e)
        {
            Response.Redirect("dashboard.aspx?");
        }

        protected void btn_OpenCategory(object sender, EventArgs e)
        {
            Response.Redirect("ExpenseCategory.aspx?");
        }

        protected void btn_OpenDashboard1(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx?");
        }
    }
}