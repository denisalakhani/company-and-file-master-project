using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Activities;

public partial class CompanyMaster : System.Web.UI.Page
{
    Company_Add obj = new Company_Add();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
        }
    }

    protected void btn_save_Click(object sender, EventArgs e)
    {
        string Name = txt_company_name.Text.ToString();
        int id = obj.Company_Details_Insert(Name);
        String image;
        if (txtimage.HasFile)
        {
            foreach(var file in txtimage.PostedFiles)
            {
                string filename = Path.GetFileName(file.FileName);
                file.SaveAs(Server.MapPath("/Image/" + filename));
                imgshow.ImageUrl = "~/Image/" + filename;
                image = filename.ToString() + ',';
                DataTable dt_file = obj.file_Details_Insert(image, id);
            }
        }
        else
        {
            image = Label1.Text;
            Label1.Text = "Select Photo";
        }
        ScriptManager.RegisterStartupScript(this, typeof(Page), "alert", "alert('Record Inserted successfully!');", true);
    }

}