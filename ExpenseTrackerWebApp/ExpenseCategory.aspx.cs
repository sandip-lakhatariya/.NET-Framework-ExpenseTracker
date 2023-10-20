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
    public partial class ExpenseCategory : System.Web.UI.Page
    {
        string Username = "sandip";
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
                food.Text = "0".ToString();
                rent.Text = "0".ToString();
                travel.Text = "0".ToString();
                ent.Text = "0".ToString();
                misc.Text = "0".ToString();

                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

                try
                {
                    string query1 = "SELECT SUM(Amount) From ExpensesTB WHERE Category=@cat AND Username=@unm";

                    using (con)
                    {
                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            cmd.Parameters.AddWithValue("@cat", "Food");
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                food.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            cmd.Parameters.AddWithValue("@cat", "Rent");
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                rent.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            cmd.Parameters.AddWithValue("@cat", "Travel");
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                travel.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            cmd.Parameters.AddWithValue("@cat", "Entertainment");
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                ent.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            cmd.Parameters.AddWithValue("@cat", "Misc");
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                misc.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }
                    }

                }
                catch (Exception ex)
                {
                    // Response.Write("errors : " + ex.Message);
                    Console.WriteLine(ex.Message);
                }
            }
        }
    }
}