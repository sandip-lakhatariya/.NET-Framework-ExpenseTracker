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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            lbl_ErrorUsername.Visible = false;
        }

        protected void btn_Register_Click(object sender, EventArgs e)
        {
            string unm = txt_Username.Text;
            string eml = txt_Email.Text;
            string psw = txt_Password.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string query = "Select Id From UserTB Where Username=@usrnm";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();

                    cmd.Parameters.AddWithValue("@usrnm", unm);

                    SqlDataReader rdr = cmd.ExecuteReader();
                    
                    if (rdr.HasRows == false)
                    {
                        rdr.Close();
                        con.Close();
                        // start session
                        // Session["Username"] = unm;

                        string insertQuery = "Insert Into UserTB (Username, Email, Password) Values (@unm, @eml, @psw)";
                        SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                        con.Open();
                        insertCmd.Parameters.AddWithValue("@unm", unm);
                        insertCmd.Parameters.AddWithValue("@eml", eml);
                        insertCmd.Parameters.AddWithValue("@psw", psw);
                        insertCmd.ExecuteNonQuery();

                        con.Close();
                        Response.Redirect("login.aspx?");
                    }
                    else
                    {
                        rdr.Close();
                        lbl_ErrorUsername.Visible = true;
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