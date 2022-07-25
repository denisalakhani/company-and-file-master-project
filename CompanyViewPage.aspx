<%@ Page Title="" Language="C#" MasterPageFile="~/User_MasterPage.master" AutoEventWireup="true" CodeFile="CompanyViewPage.aspx.cs" Inherits="CompanyViewPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-sm-10">
                                    <h3 class="card-title"><a href="CompanyMaster.aspx" class="btn btn-dark">Company List</a></h3>
                                </div>
                            </div>
                        </div>

                        <div class="card-body">
                            <asp:GridView ID="grd_company_list" runat="server" AutoGenerateColumns="false" EnableViewState="true" RowStyle-HorizontalAlign="Left"
                                    BorderStyle="Solid" EmptyDataText="No Records Found" BorderWidth="0px" BorderColor="#dddddd" RowStyle-CssClass="tabe_12"
                                    AlternatingRowStyle-CssClass="tabe_13" Width="100%" AllowPaging="true" PageSize="10" DataKeyNames="id" OnPageIndexChanging="grd_vms_list_PageIndexChanging"
                                    CssClass="grd_box" GridLines="Both" HeaderStyle-BackColor="#cc3399" HeaderStyle-ForeColor="White">
                                   <PagerTemplate>
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:ImageButton ID="imagebtn1" runat="server" ImageUrl="Image/First.png" CommandArgument="first" CommandName="Page"/>
                                                </td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="Image/pri.png" CommandArgument="Prev" CommandName="Page"/></td>
                                                <td>Page<asp:DropDownList ID="ddlPages" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPages_SelectedIndexChanged"></asp:DropDownList>of</td>
                                                <td>
                                                    <asp:Label ID="lblPageCount" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="Image/next.png" CommandArgument="Next" CommandName="Page"/></td>
                                                <td>
                                                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="Image/last.png" CommandArgument="Last" CommandName="Page"/></td>
                                            </tr>
                                        </table>
                                    </PagerTemplate>
                                    <RowStyle HorizontalAlign="Center" Height="30px" CssClass="tabe_12" />
                                    <HeaderStyle CssClass="tabe_111" HorizontalAlign="Center" Height="35px" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr No." HeaderStyle-Width="15px" ItemStyle-CssClass="item_font">
                                            <ItemTemplate>
                                                <%#Container.DataItemIndex+1 %>
                                               <asp:HiddenField ID="vms_id" runat="server" Value='<%#Eval("id")%>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" HeaderStyle-Width="20%">
                                             <ItemTemplate>
                                                    <asp:Label ID="lblcompanyname" runat="server" Text='<%#Eval("name")%>'></asp:Label>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Show" HeaderStyle-Width="10%">
                                               <ItemTemplate>
                                                      <asp:ImageButton ID="btn_show_documents" runat="server" CausesValidation="false" Height="25px" ImageUrl="Image/gallery.png" OnClick="btn_show_documents_Click"></asp:ImageButton>
                                               </ItemTemplate>
                                          </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Approve/Disapprove" HeaderStyle-Width="10%">
                                               <ItemTemplate>
                                                      <asp:ImageButton ID="btn_app_diapp" runat="server" CausesValidation="false" Height="25px" ImageUrl="Image/green_acti.png" OnClick="btn_app_diapp_Click"></asp:ImageButton>
                                               </ItemTemplate>
                                          </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="tabe_111" HorizontalAlign="Center" Height="35px" />
                                    <AlternatingRowStyle CssClass="tabe_13" />
                                </asp:GridView>

                            <div class="c10"></div>
                            <div id="div_popup" runat="server" style="display: none;">
                                <div id="Div4" runat="server" class="center_pop" style="background-color: #616161; width: 800px; height: 360px; display: block; overflow: auto; margin-left:300px;">
                                    <div runat="server" style="width: 800px; height: 342px; background-color: #ffffff; margin-left: 3px; margin-top: 5px; overflow: auto;" class="modal-body center_pop_div">
                                        <div style="padding:5px; text-align: center;">
                                            <div class="modal-header" style="text-align: right;">
                                                <span onclick="hide_popup();" class="close">
                                                    <img src="delete.png" height="15px" width="15px"/></span>
                                            </div>
                                        </div>
                                        <div class="header" style="background-color: #6699ff; color: white; padding-top: 10px; font-weight: bold; text-align: left; height: 50px; width:800px; font-size: large;">FUNCTION PHOTOES</div>
                                        <br />
                                        <asp:DataList  runat="server" ID="datalist" RepeatColumns="2" CellSpacing="10"  RepeatDirection="Horizontal" RepeatLayout="Table" Border="1" BorderStyle="Groove" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                         <table>
                                       <tr rowspan="2" style="width:100px" >
                                       <td>
                                        <div>
                                           <asp:Image id="img" runat="server" ImageUrl='<%#Eval("document")%>' Width="600px" Heigh="400px"/>
                                            <asp:Label ID="lbl1" runat="server" Text='<%#Eval("FileName")%>'></asp:Label>
                                        </div>
                                        </td>
                                        </tr>
                                        </ItemTemplate>
                                        </asp:DataList>
                                        <asp:HiddenField ID="HF_em_id" runat="server" Value='<% #Eval("id")%>' />
                                    </div>
                                </div>
                            </div>

                            <div id="div_popup1" runat="server" style="display:none;">
                                <div id="Div2" runat="server" class="center_pop" style="background-color: #616161; width: 800px; height: 360px; display:block; overflow: auto; margin-left:300px;">
                                    <div runat="server" style="width: 800px; height: 342px; background-color: #ffffff; margin-left: 3px; margin-top: 5px; overflow: auto;" class="modal-body center_pop_div">
                                        <div style="padding: 5px; text-align: center;">
                                            <div class="modal-header" style="text-align: right;">
                                                <span onclick="hide_popup1();" class="close">
                                                    <img src="delete.png" height="15px" width="15px"/></span>
                                            </div>
                                        </div>
                                        <div class="header" style="background-color: #6699ff; color: white; padding-top: 10px; font-weight: bold; text-align: center; height: 50px; width:800px; font-size: large;">FUNCTION 2</div>
                                        <br />
                                        <table id="tbl_log" runat="server" style="width: 100%;" class="table table-hover">
                                            <tr>
                                                <td>
                                                     <asp:HiddenField ID="HiddenField1" runat="server" Value='<% #Eval("id")%>' />
                                                     <asp:Button id="btn_approve" runat="server" Text="Approve" BackColor="Green" OnClick="btn_approve_click"/>
                                                     <asp:Button id="btn_disapprove" runat="server" Text="DisApprove" BackColor="Red" OnClick="btn_disapprove_click"/>
                                                </td>
                                            </tr>
                                         </table>
                                    </div>
                                </div>
                            </div>
                            </div>
                     </div>
                 </div>
               </div>
            </div>
<script type="text/javascript">
    function hide_popup() {
        document.getElementById("<%=div_popup.ClientID %>").style.display = "none";
                window.location.href ="Event_display.aspx";

    }

    function hide_popup1() {
        document.getElementById("<%=div_popup1.ClientID %>").style.display = "none";
        window.location.href = "Event_display.aspx";

    }
</script>
<script type="text/javascript">
    function moveImage() {
        document.getElementById('img').style.top = '-100px';
    }
</script>
</asp:Content>
    
                       
                        
    