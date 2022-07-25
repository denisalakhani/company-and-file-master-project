using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CompanyViewPage : System.Web.UI.Page
{
    Company_Add mc = new Company_Add();
    //regii rg = new regii();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bind_grid();
        }
    }

    public void bind_ddl_number()
    {
        GridViewRow gvrPager = grd_company_list.BottomPagerRow;
        if (gvrPager == null) return;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        Label lblPageCount = (Label)gvrPager.Cells[0].FindControl("lblPageCount");

        if (ddlPages != null)
        {
            ddlPages.Items.Clear();
            for (int i = 0; i < grd_company_list.PageCount; i++)
            {
                ListItem lstItem = new ListItem((i + 1).ToString());
                if (i == grd_company_list.PageIndex)
                    lstItem.Selected = true;
                ddlPages.Items.Add(lstItem);
            }
        }

        if (lblPageCount != null)
            lblPageCount.Text = grd_company_list.PageCount.ToString();
    }

    public void ddlPages_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow gvrPager = grd_company_list.BottomPagerRow;
        DropDownList ddlPages = (DropDownList)gvrPager.Cells[0].FindControl("ddlPages");
        grd_company_list.PageIndex = ddlPages.SelectedIndex;
        bind_grid();
    }

    private void bind_grid()
    {
        DataTable dt = new DataTable();
        dt = mc.Company_LIST_GET();
        grd_company_list.DataSource = dt;
        grd_company_list.DataBind();
        bind_ddl_number();
    }

    protected void grd_vms_list_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (e.NewPageIndex != -1)
        {
            grd_company_list.PageIndex = e.NewPageIndex;
        }
        else
        {
            e.NewPageIndex = 0;
            grd_company_list.PageIndex = 0;
        }
        bind_grid();
    }

    protected void btn_show_documents_Click(object sender, EventArgs e)
    {
        ImageButton btn_c = (ImageButton)sender;
        GridViewRow gvr = (GridViewRow)btn_c.NamingContainer;
        HiddenField hdnDataId = (HiddenField)gvr.FindControl("HF_em_id");
        HF_em_id.Value = hdnDataId.Value;
        int id = Convert.ToInt32(HF_em_id.Value);
        DataTable data = mc.show_all_documents(id);
        datalist.DataSource = data;
        datalist.DataBind();
        ViewState["dirState"] = data;
        ViewState["sortorder"] = "Asc";
        div_popup.Style.Add("Display", "block");
    }

    protected void btn_app_diapp_Click(object sender, EventArgs e)
    {
        Button btn_c1 = (Button)sender;
        div_popup1.Style.Add("Display", "block");
    }

    protected void btn_approve_click(object sender, EventArgs e)
    {
        Button btn_c1 = (Button)sender;
        btn_c1.Text = "Approved";
        int id = Convert.ToInt32(HiddenField1.Value);
        mc.update_status(id, 1);
    }

    protected void btn_disapprove_click(object sender, EventArgs e)
    {
        Button btn_c1 = (Button)sender;
        btn_c1.Text = "Disapproved";
        int id = Convert.ToInt32(HiddenField1.Value);
        mc.update_status(id, 0);
    }

}