<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlantManufacturing.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <div class="card-header pb-0 px-3">
            <div class="row">
                <div class="col-md-6">
                    <h6 class="mb-0">Plant Manufacturing</h6>
                </div>
                <div class="col-md-6 d-flex justify-content-end align-items-center">
                    <small>
                        <i class="far fa-calendar-alt me-2"></i>
                        <script>document.write(new Date().toISOString().substring(0, 10));</script>
                    </small>
                </div>
            </div>

        </div>
        <div class="card-body pt-4 p-3">
            <div class="row">
                <div class="col-12 mt-4 px-5">
                    <div class="table-responsive">
                        <asp:GridView ID="gvPlantItems" runat="server" AutoGenerateColumns="false" CssClass="table table-borderless" BorderWidth="0" EmptyDataText="No Data Found " HeaderStyle-CssClass=" text-dark text-lg">
                            <Columns>
                                <%-- <asp:TemplateField HeaderText="Sr.no" >
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                                <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="GVItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox runat="server" ID="GVIQuantity" class="form-control" Text="0"></asp:TextBox>

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-5 text-center">
                            <asp:Button runat="server" ID="BtnSubmit" Text="Submit" CssClass="btn bg-gradient-success " OnClick="BtnSubmit_Click1" />
                            
                            <a href="PlantManufacturing.aspx"  class=" btn bg-gradient-warning">Clear</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

