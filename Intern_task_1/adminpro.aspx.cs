using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Intern_task_1
{
    public partial class adminpro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming the logged-in user's ID is stored in a session variable
                if (Session["USERID"] != null)
                {
                    int userId = Convert.ToInt32(Session["USERID"]);
                    LoadUserDetails(userId);
                }
                else
                {
                    // Redirect to login page if session is null
                    Response.Redirect("Login.aspx");
                }
            }
        }

        private void LoadUserDetails(int userId)
        {
            string cs = ConfigurationManager.ConnectionStrings["spdb"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                //string query = "SELECT NAME, EMAIL, MOBILE, GENDER, USERTYPE, IMG FROM REG_TABLE WHERE ID = @ID";
                SqlCommand cmd = new SqlCommand("SP_MANAGE_USERS", con);
                cmd.Parameters.AddWithValue("@ACTION", "DETAILS");
                cmd.Parameters.AddWithValue("@ID", userId);
                con.Open();

                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.Read())
                {
                    // Populate user details
                    lblName.Text = rdr["NAME"].ToString();
                    lblEmail.Text = rdr["EMAIL"].ToString();
                    lblMobile.Text = rdr["MOBILE"].ToString();
                    lblGender.Text = rdr["GENDER"].ToString();
                    lblUserType.Text = rdr["USERTYPE"].ToString();

                    byte[] imgData = rdr["IMG"] as byte[];
                    if (imgData != null)
                    {
                        string base64String = Convert.ToBase64String(imgData);
                        imgProfile.ImageUrl = $"data:image/png;base64,{base64String}";
                    }
                    else
                    {
                        imgProfile.ImageUrl = "~/images/default-profile.png"; // Fallback image
                    }
                }
                else
                {
                    lblError.Text = "User details not found.";
                }
            }
        }

        protected void btnback_Click(object sender, EventArgs e)
        {
            // Redirect to the previous page
            Response.Redirect("AdminDatabase.aspx");
        }
    }
}
