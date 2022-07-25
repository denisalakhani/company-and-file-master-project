<%@ Page Title="" Language="C#" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="true" CodeFile="CompanyMaster.aspx.cs" Inherits="CompanyMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script type="text/javascript">
    var loadFile2 = function (event) {
        var output = document.getElementById('ContentPlaceHolder1_imgshow');
        output.src = URL.createObjectURL(event.target.files[0]);
    };
</script>
<%--<style>.content { width: 600px;border-color:lightsteelblue;align-self:baseline;}</style>--%>
<center>
 <div class="cont_right formWrapper">
        <div class="note_h1">
            <h1>Add Company</h1>
        </div>
        <div class="jumbotron" style="background-image:url('Image/im3.png');">
        <div class="container">
            <asp:ScriptManager ID="sc" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="upd12" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="table table-hover">
                        <tr>
                            <td>NAME OF Company: </td>
                            <td>
                                <asp:TextBox runat="server" ID="txt_company_name" ToolTip="please enter company name" CssClass="content"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_cname" runat="server" ErrorMessage="*Please Enter Company Name" ControlToValidate="txt_company_name" ForeColor="red" ValidationGroup="v_save"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>Upload Documents:</td>
                            <td>
                                <asp:FileUpload ID="txtimage" runat="server" CssClass="form-control col-5" onchange="loadFile2(event)" AllowMultiple="true"></asp:FileUpload> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Please Enter Photoes" ControlToValidate="txtimage" Display="Dynamic" ForeColor="red" ValidationGroup="v_save"></asp:RequiredFieldValidator>
                            </td>
                                <td><asp:Label ID="Label1" runat="server"></asp:Label></td>
                                <td><asp:image style="height:130px; width=120px;" runat="server" ID="imgshow"  /> </td>
                        </tr>
                      </table>
                      <center>
                             <asp:Button runat="server" ID="btn_save" CssClass="btn btn-primary" Text="Save" ValidationGroup="v_save" OnClick="btn_save_Click"/>
                      </center> 
                    </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_save" />
                </Triggers>
              </asp:UpdatePanel>
            </div>
    </div>
  </div>
  </center>
</asp:Content>