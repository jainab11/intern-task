using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Intern_task_1
{
    /// <summary>
    /// Summary description for Handler1
    /// </summary>
    public class Handler1 : IHttpHandler
    {

        //public void ProcessRequest(HttpContext context)
        //{
        //    int id = Convert.ToInt32(context.Request.QueryString["id"]);
        //    // fetch the image format
        //    string cs = ConfigurationManager.ConnectionStrings["spdb"].ConnectionString;
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        string query = "SELECT IMG FROM REG_TABLE WHERE ID = @ID";
        //        SqlCommand cmd = new SqlCommand(query, con);
        //        cmd.Parameters.AddWithValue("@ID", id);

        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        if (rdr.Read())
        //        {
        //            byte[] imgData = rdr["IMG"] as byte[];
        //            if (imgData != null)
        //            {
        //                context.Response.ContentType = "image/jpg";
        //                context.Response.BinaryWrite(imgData);
        //                context.Response.End();
        //            }
        //        }

        //    }

        //}
        //public bool IsReusable
        //{
        //    get
        //    {
        //        return false;
        //    }
        //}
        public void ProcessRequest(HttpContext context)
        {
            int id;
            if (!int.TryParse(context.Request.QueryString["id"], out id))
            {
                context.Response.StatusCode = 400; // Bad Request
                context.Response.Write("Invalid ID");
                return;
            }

            string cs = ConfigurationManager.ConnectionStrings["spdb"].ConnectionString;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT IMG FROM REG_TABLE WHERE ID = @ID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ID", id);

                    con.Open();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            byte[] imgData = rdr["IMG"] as byte[];
                            if (imgData != null && imgData.Length > 0)
                            {
                                context.Response.ContentType = "image/png"; // Adjust if using JPG
                                context.Response.BinaryWrite(imgData);
                            }
                            else
                            {
                                context.Response.StatusCode = 404; // Not Found
                                context.Response.Write("Image not found.");
                            }
                        }
                        else
                        {
                            context.Response.StatusCode = 404; // Not Found
                            context.Response.Write("No data found for the provided ID.");
                        }
                    }
                }
            }
        }

        public bool IsReusable => false;
    }

}
