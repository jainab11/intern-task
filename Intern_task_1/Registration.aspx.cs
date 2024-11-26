using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.Web.UI;
using System.Text;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

namespace Intern_task_1
{
    public partial class Registration : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["spdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                BindGridView();
                FormsAuthentication.SignOut();
            }
        }

        private void BindGridView()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SP_MANAGE_USERS", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "SHOWUSERS");

                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    
                    gvspdb.DataSource = dt;
                    gvspdb.DataBind();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblError.Visible = true;
            string NamePattern = @"^[a-zA-Z]+$";
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            string PasswordPattern = @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$";
            string phonePattern = @"^\d{10}$";

            string name = TxtName.Text.Trim();
            string email = TxtEmail.Text.Trim();
            string password = TxtPassword.Text.Trim();
            string phone = TxtMobile.Text.Trim();




            if (!Regex.IsMatch(name, NamePattern))
            {
                lblError.Text = "Invalid name : only letters and space are allowed , Name cannot be Empty";
                return;
            }

            if (!Regex.IsMatch(email, emailPattern))
            {
                lblError.Text = "Invalid Email";
                return;
            }


            if (!Regex.IsMatch(password, PasswordPattern))
            {
                lblError.Text = "Enter a strong password with atleast 1 upper and lowercase with numric an dspecial charchter";
                return;
            }

            if (!Regex.IsMatch(phone, phonePattern))
            {
                lblError.Text = "Inavlid Mobile Number :  Mobile can only be 10 Digit ";
                return;
            }


            //string usertype = AdminRadioButton.Checked ? "Admin" : "User";

            string encryptedpass = Encrypt(password);
            //string pdfFilePath = null;
            //if (fuPdf.HasFile && fuPdf.PostedFile.ContentType == "application/pdf")
            //{
            //    string pdfFileName = Guid.NewGuid().ToString() + "_" + fuPdf.FileName;
            //    string pdfSavePath = Server.MapPath("~/fileupload/") + pdfFileName;
            //    fuPdf.SaveAs(pdfSavePath);
            //    pdfFilePath = "~/fileupload/" + pdfFileName;

            //}


            using (SqlConnection con = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand("SP_MANAGE_USERS", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ACTION", "CREATE");
                    cmd.Parameters.AddWithValue("@NAME", name);
                    cmd.Parameters.AddWithValue("@EMAIL", email);
                    cmd.Parameters.AddWithValue("@PASSWORD", encryptedpass);
                    cmd.Parameters.AddWithValue("@MOBILE", phone);
                    cmd.Parameters.AddWithValue("@GENDER", GenderDropDownList.SelectedValue);
                    cmd.Parameters.AddWithValue("@USERTYPE", "User");
                    cmd.Parameters.AddWithValue("@IMG", null);
                    //cmd.Parameters.AddWithValue("@PDF_PATH", pdfFilePath);

                    try
                    {
                        con.Open();
                        int newId = Convert.ToInt32(cmd.ExecuteScalar());
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Record Inserted with ID: {newId}');", true);

                        TxtName.Text = "";
                        TxtEmail.Text = "";

                        TxtMobile.Text = "";
                        TxtPassword.Text = "";
                        GenderDropDownList.SelectedIndex = -1;
                        //AdminRadioButton.Checked = false;
                        //UserRadioButton.Checked = false;

                        BindGridView();
                        Response.Redirect("Login.aspx");
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
                    }
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "hideLabel()", true);
        }



        public string Encrypt(string plainText)
        {
            string SecretKey = "$ASPcAwSNIgcPPEoTS78ODw#"; 
            byte[] secretBytes = Encoding.UTF8.GetBytes(SecretKey);

            using (Aes aes = Aes.Create())
            {
                aes.Key = secretBytes;
                aes.Mode = CipherMode.ECB;
                aes.Padding = PaddingMode.PKCS7;

                using (ICryptoTransform encryptor = aes.CreateEncryptor())
                {
                    byte[] plainBytes = Encoding.UTF8.GetBytes(plainText);
                    byte[] encryptedBytes = encryptor.TransformFinalBlock(plainBytes, 0, plainBytes.Length);
                    return Convert.ToBase64String(encryptedBytes);
                }
            }
        }

  
    }

}
