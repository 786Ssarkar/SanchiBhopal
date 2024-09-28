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
          <%--  <div class="row">
                <div class="col-12">
                    <ul class="list-group p-4" id="TblBody">
                        <li class="list-group-item border-0   ps-0 mb-0 border-radius-lg">
                            <div class="row">
                                <div class="col-7">
                                    <label class="mb-1 text-dark text-lg">Items</label>
                                    <asp:DropDownList runat="server" ID="ddlplantitems" CssClass="form-control rounded-3 form-select">
                                        <asp:ListItem Value="select">--Select--</asp:ListItem>
                                        <asp:ListItem Value="0">Milk</asp:ListItem>
                                        <asp:ListItem Value="1">Products</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-5">
                                    <label class="mb-1 text-dark text-lg">Quantity</label>
                                    <asp:TextBox ID="txtQuantity" runat="server" class=" mb-2 text-xs form-control" type="number" placeholder="0" />
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>--%>



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
                                <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder" >
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="GVItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity" >
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
                            <asp:Button runat="server" ID="BtnClear" Text="Clear" CssClass="btn bg-gradient-danger " />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%-- <script>
        var Products = [
            "SMP",
            "Sweeten SMP",
            "WB",
            "Plain curd",
            "Sweet Curd",
            "Salted Butter Milk 200 ML",
            "Plain Butter Milk",
            "Cold Coffee",
            "Fl.Milk Pet Bottle",
            "S.F.M Glass(Bottles)",
            "Lassi 200 ML Glass",
            "Lite Lassi 200 ML",
            "Shrikhand",
            "Chena Rabdi",
            "Sabudana Kheer 100 gm",
            "Peda",
            "Milk Cake",
            "Mawa",
            "Paneer",
            "Vaccum Paneer",
            "Rasogulla",
            "Gulabjamun",
            "Shrikhand Lite 100 gms cups",
            "Table Butter",
            "Cookies",
            "Sugar Free Peda",
            "Butter Chiplet",
            "Besan Laddu",
            "Sanchi Neer lit",
            "Misti Doi 100gm",
            "Braj Peda",
            "Amrakhand 100 gms",]
        document.addEventListener("DOMContentLoaded", () => {
            LoadInput(Products, "TblBody");
        });
        function LoadInput(Fields, ID) {

            var tbody = document.getElementById(ID)
            tbody.innerHTML = `<li class="list-group-item border-0   ps-0 mb-0 border-radius-lg">
                            <div class="row">
                                <div class="col-7">
                                    <label class="mb-1 text-dark text-lg">Items</label>
                                </div>
                                <div class="col-5">
                                    <label class="mb-1 text-dark text-lg">Quantity</label>
                                </div>
                            </div>
                        </li>`;
            for (var i = 0; i < Fields.length; i++) {
                var li = `  <li class="list-group-item border-0   ps-0 mb-0 border-radius-lg">
                    <div class="row">
                     <div class="col-7">
                        <label class="mb-1 text-dark text-lg">`+ Fields[i] + `</label>
                          </div>
                        <div class="col-5">
                        <input class=" mb-2 text-xs form-control" type="number" placeholder="0" oninput="calculateGroupTotal('`+ ID + `')" />
                        </div>
                    </div>
                </li>`

                tbody.innerHTML += li
            }
        }
    </script>--%>
</asp:Content>

