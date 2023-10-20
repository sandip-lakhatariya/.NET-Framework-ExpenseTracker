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
    public partial class dashboard : System.Web.UI.Page
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
                lbl_DataTotal.Text = "0".ToString();
                lbl_DataLMT.Text = "0".ToString();
                lbl_DataLDA.Text = "0".ToString();
                lbl_DataCMT.Text = "0".ToString();
                lbl_DataCDA.Text = "0".ToString();
                lbl_DataHC.Text = "null".ToString();
                lbl_DataLC.Text = "null".ToString();

                // compute the required data
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

                try
                {
                    using (con)
                    {
                        string query1 = "Select SUM(Amount) From ExpensesTB Where Username=@unm";
                        string query2 = "Select SUM(Amount) From ExpensesTB Where DATEPART(month, ExpenseDate) = (DATEPART(month, GETDATE()) - 1)"
                                            + "AND DATEPART(year, ExpenseDate) = (DATEPART(year, GETDATE()))"
                                            + "AND Username=@unm";
                        string query3 = "Select SUM(Amount) From ExpensesTB Where DATEPART(month, ExpenseDate) = (DATEPART(month, GETDATE()))"
                                            + "AND DATEPART(year, ExpenseDate) = (DATEPART(year, GETDATE()))"
                                            + "AND Username=@unm";

                        string query4 = "SELECT TOP 1 Category FROM ExpensesTB where Amount = (SELECT MAX(Amount) FROM ExpensesTB WHERE Username=@unm)"; 

                        string query5 = "SELECT TOP 1 Category FROM ExpensesTB where Amount = (SELECT MIN(Amount) FROM ExpensesTB WHERE Username=@unm)";

                        // computing grand total amount
                        using (SqlCommand cmd = new SqlCommand(query1, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                lbl_DataTotal.Text = "Rs : " + rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }
                        

                        // computing last month's total and daily average
                        using (SqlCommand cmd = new SqlCommand(query2, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                float amount = float.Parse(rdr.GetValue(0).ToString());
                                lbl_DataLMT.Text = "Rs : " + amount.ToString();
                                float dla = amount / 30;
                                lbl_DataLDA.Text = "Rs : " + dla.ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }


                        // computing current month's total till now and daily average
                        // computing least and highest expense category with amount of current month
                        using (SqlCommand cmd = new SqlCommand(query3, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                float amount = float.Parse(rdr.GetValue(0).ToString());
                                lbl_DataCMT.Text = "Rs : " + amount.ToString();
                                float dla = amount / 30;
                                lbl_DataCDA.Text = "Rs : " + dla.ToString();
                            }
                          
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query4, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                lbl_DataHC.Text = rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }

                        using (SqlCommand cmd = new SqlCommand(query5, con))
                        {
                            con.Open();
                            cmd.Parameters.AddWithValue("@unm", Username);
                            SqlDataReader rdr = cmd.ExecuteReader();
                            if (rdr.Read())
                            {
                                lbl_DataLC.Text = rdr.GetValue(0).ToString();
                            }
                            rdr.Close();
                            con.Close();
                        }
                    }
                }
                catch(Exception ex)
                {
                    Response.Write("errors : " + ex.Message);
                    Console.WriteLine(ex.Message);
                }
            }
        }

        protected void btn_History_Click(object sender, EventArgs e)
        {
            Response.Redirect("history.aspx?");
        }

        protected void btn_AddExpense_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_expense.aspx?");
        }

        protected void btnAddNewExpense_Click(object sender, EventArgs e)
        {
            Response.Redirect("add_expense.aspx?");
        }
    }
}