using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI;
using System.Web;

namespace ExpenseTrackerWebApp
{
    public partial class history : System.Web.UI.Page
    {
        string Username;
        protected void Page_Load(object sender, EventArgs e)
        {
            NotFound.Visible = false;
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

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            try
            {
                using (con)
                {
                    string query1 = "Select Title, Category, Amount, CONVERT(VARCHAR, ExpenseDate, 105) AS ExpenseDate From ExpensesTB Where Username=@unm ORDER BY DATEPART(MONTH,ExpenseDate), DATEPART(DAY,ExpenseDate), DATEPART(YEAR,ExpenseDate)";

                    using (SqlCommand cmd = new SqlCommand(query1, con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@unm", Username);
                        SqlDataReader reader = cmd.ExecuteReader();
                        ExpenseView.DataSource = reader;
                        ExpenseView.DataBind();
                        reader.Close();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("errors : " + ex.Message);
            }
        }

        
        protected void btnShowHistory_Click(object sender, EventArgs e)
        {
            DateTime d1 = Convert.ToDateTime(FromDate.Text);
            DateTime d2 = Convert.ToDateTime(ToDate.Text);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;

            try
            {
                using (con)
                {
                    string query2 = "Select Title, Category, Amount, CONVERT(VARCHAR, ExpenseDate, 105) AS ExpenseDate From ExpensesTB Where ExpenseDate >= @dnm AND ExpenseDate <= @dmn AND Username=@unm ORDER BY DATEPART(MONTH,ExpenseDate), DATEPART(DAY,ExpenseDate), DATEPART(YEAR,ExpenseDate)";

                    using (SqlCommand cmd = new SqlCommand(query2, con))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@unm", Username);
                        cmd.Parameters.AddWithValue("@dnm", d1);
                        cmd.Parameters.AddWithValue("@dmn", d2);
                        SqlDataReader reader = cmd.ExecuteReader();
                        ExpenseView.DataSource = reader;
                        ExpenseView.DataBind();
                        if (!reader.HasRows)
                        {
                            ExpenseView.DataSource = null;
                            ExpenseView.DataBind();
                            NotFound.Visible = true;
                        }
                        reader.Close();
                        con.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("errors : " + ex.Message);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
  
        }

        protected void Export_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/ms-excel";
            Response.AddHeader("content-disposition", "attachment;filename=Expenses.xls");
            Response.Charset = "";
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            ExpenseView.RenderControl(hw);
            Response.Output.Write(sw.ToString());
            Response.End();
        }

        protected void ExpenseView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}