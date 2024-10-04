<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddDemand.aspx.cs" Inherits="AddDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />--%>

    <script>
        let currentDate = new Date().toISOString().substring(0, 10);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            ADD Demand
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">Date</label>
                        <div class="col-md-10">
                            <input type="date" id="Txtdate" runat="server" class="form-control" required="required">
                              <script> document.getElementById('<%= Txtdate.ClientID%>').value = currentDate;</script>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label  class="text-dark text-lg">
                            Select Item <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Milk" Value="Milk" />
                            <asp:ListItem Text="Product" Value="Product" />
                        </asp:DropDownList>
                        <%--<select class="form-control" id="DdlItemCat"  runat="server">
                            <option selected="selected" value="0">--Select--</option>
                            <option value="Milk">Milk</option>
                            <option value="Product">Product</option>
                        </select>--%>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label  class="text-dark text-lg">
                            Select Shift <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlShift" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Morning" Value="Morning" />
                            <asp:ListItem Text="Evening" Value="Evening" />
                        </asp:DropDownList>
                        <%--  <select class="form-control" id="DdlShift" runat="server">
                            <option selected="selected" value="0">--Select--</option>
                            <option value="2">Morning</option>
                            <option value="3">Evening</option>
                        </select>--%>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label  class="text-dark text-lg">
                            Select Retailer <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlRetailer" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Depot No. 94[D75]" />
                            <asp:ListItem Text="Depot No. 81[D05]" />
                            <asp:ListItem Text="Depot No. 01[D99]" />
                        </asp:DropDownList>
                        <%--  <select class="form-control" id="DdlRetailer" runat="server">
                            <option selected="selected" value="0">--Select--</option>
                            <option value="2">Depot No. 94[D75]</option>
                            <option value="3">Depot No. 81[D05]</option>
                            <option value="1">Depot No. 01[D99]</option>
                        </select>--%>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label  class="text-dark text-lg">
                            Select Vehicle No <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlVehicleNo" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="MP-04-GB-0338" />
                            <asp:ListItem Text="MP-04-HR-0554" />
                            <asp:ListItem Text="MP-04-MF-3212" />
                            <asp:ListItem Text="MP-04-GS-9999" />
                        </asp:DropDownList>
                        <%--  <select class="form-control" id="DdlVehicleNo" runat="server">
                            <option selected="selected" value="0">--Select--</option>
                            <option value="2">MP-04-GB-0338</option>
                            <option value="3">MP-04-HR-0554</option>
                            <option value="1">MP-04-MF-3212</option>
                            <option value="4">MP-04-GS-9999</option>
                        </select>--%>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label  class="text-dark text-lg">
                            Select Demand Type<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlDemandType" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Regular Demand" Value="Regular" />
                            <asp:ListItem Text="Irregular Demand" Value="Irregular" />
                        </asp:DropDownList>
                      <%--  <select class="form-control" id="DdlDemandType" runat="server">
                            <option selected="selected" value="0">--Select--</option>
                            <option value="2">Regular Demand</option>
                            <option value="3">Irregular Demand</option>
                        </select>--%>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <%--<button type="button" id="AddButton" class="Alert-Confirmation btn btn-outline-success btn-border  w-lg" onclick="document.getElementById('FS_Details').style.display = 'block'" runat="server">ADD</button>--%>
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnAdd" OnClick="BtnAdd_Click" Text="Add" />
                    <a href="AddDemand.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                </div>
            </div>

            <fieldset id="FS_Details" runat="server">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive ps">
                            <asp:GridView runat="server" ID="grdItems" CssClass="table " AutoGenerateColumns="false" HeaderStyle-CssClass="text-dark text-lg">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr. No">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtQuantity" Text="0" ></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Advanced Card">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control"  ID="txtAdvancedCard" Text="0" ReadOnly="true"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                            <%--<table class="table table-bordered text-center">
                                <thead>
                                    <tr class="nowrap">
                                        <th>Sr. No</th>
                                        <th>Item Name</th>
                                        <th>Quantity</th>
                                        <th>Advanced Card</th>

                                    </tr>
                                </thead>
                                <tbody id="TblBody">
                                    <tr>
                                        <td>1.</td>
                                        <td>Standard 500ML</td>
                                        <td>
                                            <input type="text" class="form-control" placeholder=" 0" /></td>
                                        <td>
                                            <input type="text" class="form-control" placeholder=" 0" disabled /></td>
                                    </tr>
                                    <tr></tr>
                                </tbody>

                            </table>--%>
                        </div>
                    </div>
                    <div class="col-12 mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-5 text-center">
                                <asp:Button Text="Submit" class="mb-0 btn bg-gradient-success" runat="server" ID="BtnSubmit" OnClick="BtnSubmit_Click" />
                               <%-- <button type="button" class="Alert-Save  mb-0 btn bg-gradient-success">Submit</button>--%>

                                <a href="AddDemand.aspx"  class=" mb-0 btn bg-gradient-warning">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>
        </div>
    </div>
    <%--<script>
        var Milk = ["STD",
            "DMT",
            "LITE",
            "FCM ",
            "Diamond",
            "TM",
            "CHAH",
            "FCM 1L",
            "Chai spl. 1000ML"]
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

            //document.addEventListener("DOMContentLoaded", () => {
            //    LoadInput(Products, "TblBody");
            //});
            document.getElementById('AddButton').addEventListener("click", () => {
                var item = document.getElementById('DdlItem').value
                if (item == "Milk") {

                    LoadInput(Milk, "TblBody");
                } else if (item == "Products") {
                    LoadInput(Products, "TblBody");

                }
            });
        function LoadInput(Fields, ID) {

            var tbody = document.getElementById(ID)
            tbody.innerHTML = ``;
            for (var i = 0; i < Fields.length; i++) {
                var li = `<tr>
                            <td>`+ (i + 1) + `</td>
                            <td>`+ Fields[i] + `</td>
                            <td>
                                <input type="text" class="form-control" placeholder="0" /></td>
                            <td>
                                <input type="text" class="form-control" placeholder=" 0" disabled /></td>
                        </tr>`

                tbody.innerHTML += li
            }
            tbody.innerHTML += `<tr></tr>`
        }
    </script>--%>
</asp:Content>

