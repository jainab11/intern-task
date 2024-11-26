using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;

namespace Intern_task_1
{
    public partial class Login : System.Web.UI.Page
    {
        private static readonly string secretKey = "$ASPcAwSNIgcPPEoTS78ODw#";
        string cs = ConfigurationManager.ConnectionStrings["spdb"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["showForgotPassword"] = false;

                if (Request.Cookies["NAME"] != null && Request.Cookies["PASSWORD"] != null)
                {
                    TxtName.Text = Request.Cookies["NAME"].Value;
                    TxtPass.Attributes["value"] = Request.Cookies["PASSWORD"].Value;
                }

                if (Session["USERNAME"] != null)
                {
                    string role = Session["USERTYPE"]?.ToString().ToLower();

                    if (role == "admin")
                    {
                        Response.Redirect("AdminDatabase.aspx");
                    }
                    else if (role == "user")
                    {
                        Response.Redirect("UserDatabase.aspx");
                    }
                }
            }
            else
            {
                if (ViewState["showForgotPassword"] != null && (bool)ViewState["showForgotPassword"])
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowForgotPassword", "showForgotPassword(); ", true);
                }
            }
        }
    



        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string plainpass = TxtPass.Text;

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    using (SqlCommand cmd = new SqlCommand("SP_MANAGE_USERS", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@ACTION", "LOGIN");
                        cmd.Parameters.AddWithValue("@NAME", TxtName.Text);
                        //cmd.Parameters.AddWithValue("@PASSWORD", plainpass);

                        con.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {

                            if (dr.Read())
                            {
                                string message = dr["Message"].ToString();

                                string EncryptedPassword = dr["EncryptedPassword"].ToString();
                                string decryptedPAssword = Decrypt(EncryptedPassword);
                                System.Diagnostics.Debug.WriteLine("Decrypted password  : " + decryptedPAssword);

                                // Successful login
                                if (decryptedPAssword == plainpass)
                                {
                                    lblmessage.Text = "Login Succsessful";

                                    int userId = Convert.ToInt32(dr["ID"]);
                                    string userName = dr["NAME"].ToString();
                                    string userType = dr["USERTYPE"].ToString();
                                    byte[] userimg = dr["IMG"] as byte[];

                                    Session["USERID"] = userId;
                                    Session["USERNAME"] = userName;
                                    Session["PASSWORD"] = plainpass;
                                    Session["USERTYPE"] = userType;
                                    Session["IMG"] = userimg;
                                    // Handle "Remember Me" functionality
                                    HandleRememberMe();

                                    // Redirect user based on their role
                                    RedirectUser(userType);
                                }
                                else
                                {
                                    lblmessage.Text = "LOGIN FAILED";
                                }
                            }
                            else
                            {
                                lblmessage.Text = "LOGIN FAILED";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblmessage.Text = "Error: " + ex.Message;
            }
            if (ViewState["ShowForgotPassword"] != null && (bool)ViewState["ShowForgotPassword"])
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowForgotPassword", "showForgotPassword();", true);
            }
        }

        private void HandleRememberMe()
        {
            // If the "Remember Me" checkbox is checked
            if (checkbox.Checked)
            {
                // Set cookies with user name and password
                SetCookie("NAME", TxtName.Text, 1);
                SetCookie("PASSWORD", TxtPass.Text, 1);
            }
            else
            {
                // Expire cookies if they exist
                ExpireCookie("NAME");
                ExpireCookie("PASSWORD");
            }
        }

        private void SetCookie(string name, string value, int minutes)
        {
            HttpCookie cookie = new HttpCookie(name, value)
            {
                Expires = DateTime.Now.AddMinutes(minutes)
            };
            Response.Cookies.Add(cookie);
        }

        private void ExpireCookie(string name)
        {
            if (Request.Cookies[name] != null)
            {
                HttpCookie expiredCookie = new HttpCookie(name)
                {
                    Expires = DateTime.Now.AddDays(-1)
                };
                Response.Cookies.Add(expiredCookie);
            }
        }

        private void RedirectUser(string userType)
        {
            if (userType.ToLower() == "user")
            {
                Response.Redirect("UserDatabase.aspx");
            }
            else if (userType.ToLower() == "admin")
            {
                Response.Redirect("AdminDatabase.aspx");
            }
        }

        public string Decrypt(string encryptedText)
        {
            string SecretKey = "$ASPcAwSNIgcPPEoTS78ODw#"; // Your encryption key
            byte[] secretBytes = Encoding.UTF8.GetBytes(SecretKey);
            byte[] encryptedBytes = Convert.FromBase64String(encryptedText);

            using (Aes aes = Aes.Create())
            {
                aes.Key = secretBytes;
                aes.Mode = CipherMode.ECB;
                aes.Padding = PaddingMode.PKCS7;

                using (ICryptoTransform decryptor = aes.CreateDecryptor())
                {
                    byte[] decryptedBytes = decryptor.TransformFinalBlock(encryptedBytes, 0, encryptedBytes.Length);
                    return Encoding.UTF8.GetString(decryptedBytes);
                }
            }
        }


     
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();

                    string query = "SELECT EMAIL, PASSWORD FROM REG_TABLE WHERE EMAIL = @EMAIL";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@EMAIL", email);

                        SqlDataReader dr = cmd.ExecuteReader();

                        if (dr.HasRows)
                        {
                            dr.Read();
                            string eid = dr["EMAIL"].ToString();
                            string encryptedpwd = dr["PASSWORD"].ToString();
                            string decryptedpwd = Decrypt(encryptedpwd);

                            StringBuilder sb = new StringBuilder();
                            sb.AppendLine("EMAIL:-- " + eid);
                            sb.AppendLine("PASSWORD:- " + decryptedpwd);


                            SmtpClient client = new SmtpClient("smtp.gmail.com", 587)
                            {
                                EnableSsl = true,
                                DeliveryMethod = SmtpDeliveryMethod.Network,
                                UseDefaultCredentials = false,
                                Credentials = new NetworkCredential("theme0786@gmail.com", "uppt amwg fuka tqtz")
                            };

                            MailMessage msg = new MailMessage
                            {
                                From = new MailAddress("theme0786@gmail.com", "Forgot Password"),
                                Subject = "Your Password",
                                Body = sb.ToString(),
                                IsBodyHtml = false
                            };
                            msg.To.Add(txtEmail.Text);

                            client.Send(msg);
                            Lblmsg.Text = "Your password has been sent to the registered email ID.";
                        }
                        else
                        {
                            Lblmsg.Text = "Invalid Email ID.";
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                Lblmsg.Text = "General Error: " + ex.Message;
            }
        }

        protected void btngoback_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}