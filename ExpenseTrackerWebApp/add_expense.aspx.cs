using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExpenseTrackerWebApp
{
    public partial class add_expense : System.Web.UI.Page
    {
        string Username;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            if ((string)Session["Username"] == "Guest")
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                Username = (string)Session["Username"];
                lbl_Username.Text = Username;
            }
        }

        protected void btnAddExpense_Click(object sender, EventArgs e)
        {
            string unm = Username;
            string title = inputTitle.Text;
            string amt = inputAmout.Text;
            string cat = inputCategory.Text;
            string date = inputDate.Text;
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string insertQuery = "Insert Into ExpensesTB (Username, Title, Category, Amount, ExpenseDate) Values (@unm, @title, @cat, @amt, @date)";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                    con.Open();
                    insertCmd.Parameters.AddWithValue("@unm", unm);
                    insertCmd.Parameters.AddWithValue("@title", title);
                    insertCmd.Parameters.AddWithValue("@cat", cat);
                    insertCmd.Parameters.AddWithValue("@amt", amt);
                    insertCmd.Parameters.AddWithValue("@date", date);
                    insertCmd.ExecuteNonQuery();

                    con.Close();
                    Response.Redirect("dashboard.aspx?");
                }
            }
            catch (Exception ex)
            {
                Response.Write("errors : " + ex.Message);
            }
        }
    }
}