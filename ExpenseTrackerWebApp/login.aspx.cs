using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTrackerWebApp
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            lblError.Visible = false;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            string unm = txt_Username.Text;
            string psw = txt_Password.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            try
            {
                using(con)
                {
                    string query = "Select Id From UserTB Where Username=@unm AND Password=@psw";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();

                    cmd.Parameters.AddWithValue("@unm", unm);
                    cmd.Parameters.AddWithValue("@psw", psw);
 
                    SqlDataReader rdr = cmd.ExecuteReader();
                                        
                                        
                    if (rdr.HasRows == true)
                    {
                        // start session
                        Session["Username"] = unm;
                        // redirect user to dashbord
                        con.Close();
                        rdr.Close();
                        Response.Redirect("dashboard.aspx?");
                    }
                    else
                    {
                        lblError.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("errors : " + ex.Message);
            }
        }
    }
}