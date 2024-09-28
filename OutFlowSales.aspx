<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OutFlowSales.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        let currentDate = new Date().toISOString().substring(0, 10);
    </script>
    <style>
        .col-md-3, .col-md-9 {
            transition: width .9s ease-in-out;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <div class="card-header pb-0 px-3">
            <h6 class="mb-0">Milk/ Products Sales Detail</h6>
        </div>
        <div class="card-body pt-4 p-3">
            <div class="row align-items-end">
                <div class="col-lg-4 col-md-6 mt-2">
                    <label class="text-dark text-lg">Select Name of Unit</label>
                    <asp:DropDownList CssClass="form-select " ID="ddlRoutes" runat="server" AutoPostBack="true">
                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                        <asp:ListItem Text="BHOPAL Route" Value="BHOPAL Route"></asp:ListItem>
                        <asp:ListItem Text="TIMARNI Route" Value="TIMARNI Route"></asp:ListItem>
                        <asp:ListItem Text="HOSHANGABAD Route" Value="HOSHANGABAD Route"></asp:ListItem>
                        <asp:ListItem Text="ITARSI Route" Value="ITARSI Route"></asp:ListItem>
                        <asp:ListItem Text="PIPRIYA Route" Value="PIPRIYA Route"></asp:ListItem>
                        <asp:ListItem Text="VIDISHA Route" Value="VIDISHA Route"></asp:ListItem>
                        <asp:ListItem Text="GANJBASODA Route" Value="GANJBASODA Route"></asp:ListItem>
                        <asp:ListItem Text="RAISEN Route" Value="RAISEN Route"></asp:ListItem>
                        <asp:ListItem Text="BADI Route" Value="BADI Route"></asp:ListItem>
                        <asp:ListItem Text="NARSINGHGARH Route" Value="NARSINGHGARH Route"></asp:ListItem>
                        <asp:ListItem Text="GUNA Route" Value="GUNA Route"></asp:ListItem>
                        <asp:ListItem Text="NASRULLAGANJ Route" Value="NASRULLAGANJ Route"></asp:ListItem>
                        <asp:ListItem Text="SEHORE Route" Value="SEHORE Route"></asp:ListItem>
                        <asp:ListItem Text="SIRONJ Route" Value="SIRONJ Route"></asp:ListItem>
                        <asp:ListItem Text="HARDA Route" Value="HARDA Route"></asp:ListItem>
                        <asp:ListItem Text="BARELI Route" Value="BARELI Route"></asp:ListItem>
                        <asp:ListItem Text="BIAORA Route" Value="BIAORA Route"></asp:ListItem>
                        <asp:ListItem Text="BETUL" Value="BETUL"></asp:ListItem>
                        <asp:ListItem Text="SMP at BSDS" Value="SMP at BSDS"></asp:ListItem>
                        <asp:ListItem Text="SMP at Ware House" Value="SMP at Ware House"></asp:ListItem>
                        <asp:ListItem Text="SMP at Gwalior" Value="SMP at Gwalior"></asp:ListItem>
                        <asp:ListItem Text="SMP at Powan Shri Food" Value="SMP at Powan Shri Food"></asp:ListItem>
                        <asp:ListItem Text="SMP at Jai Shri Gayatri" Value="SMP at Jai Shri Gayatri"></asp:ListItem>
                        <asp:ListItem Text="SMP at Health Food LLP" Value="SMP at Health Food LLP"></asp:ListItem>
                        <asp:ListItem Text="SMP at Indore" Value="SMP at Indore"></asp:ListItem>
                        <asp:ListItem Text="SMP at USDS Ujjain" Value="SMP at USDS Ujjain"></asp:ListItem>

                    </asp:DropDownList>
                    <%--<script>
                        var Routes = [,
                              "BHOPAL Route"
                            , "TIMARNI Route"
                            , "HOSHANGABAD Route"
                            , "ITARSI Route"
                            , "PIPRIYA Route"
                            , "VIDISHA Route"
                            , "GANJBASODA Route"
                            , "RAISEN Route"
                            , "BADI Route"
                            , "NARSINGHGARH Route"
                            , "GUNA Route"
                            , "NASRULLAGANJ Route"
                            , "SEHORE Route"
                            , "SIRONJ Route"
                            , "HARDA Route"
                            , "BARELI Route"
                            , "BIAORA Route"
                            , "BETUL"
                            , "SMP at BSDS"
                            , "SMP at Ware House"
                            , "SMP at Gwalior"
                            , "SMP at Powan Shri Food"
                            , "SMP at Jai Shri Gayatri"
                            , "SMP at Health Food LLP"
                            , "SMP at Indore"
                            , "SMP at USDS Ujjain"
                        ]
                        for (var i in Routes) {
                            document.getElementById('<%= ddlRoutes.ClientID%>').innerHTML += '<option value="' + Routes[i] + '">' + Routes[i] + '</option>'
                        }
                    </script>--%>

                </div>
                <div class="col-lg-4 col-md-6 mt-2">
                    <label class="text-dark text-lg">Date</label>
                    <asp:TextBox TextMode="Date" runat="server" ID="TxtDate" CssClass="form-control"></asp:TextBox>
                    <script> document.getElementById('<%= TxtDate.ClientID%>').value = currentDate;</script>

                </div>
                <div class="col-lg-4 col-md-6 mt-2 text-center">
                    <asp:Button ID="btnMilk" Text="Milk" runat="server" CssClass="mb-0 btn bg-gradient-primary" OnClick="btnMilk_Click" />
                    <asp:Button ID="btnProduct" Text="Product" runat="server" CssClass=" mb-0 btn bg-gradient-primary" OnClick="btnProduct_Click" />
                    <%-- <button type="button" class=" mb-0 btn bg-gradient-primary" onclick='LoadInput(Milk, "UlMilk");'>Milk</button> <button type="button" class="mb-0  btn  bg-gradient-primary" onclick='LoadInput(Products, "UlProduct");'>Product</button>--%>
                </div>
            </div>
            <div class="row">

                <div class="col-md-6 mt-4" id="colMilk" runat="server">
                    <div class="card h-100 mb-4">
                        <div class="card-header pb-0 px-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="mb-0">Milk</h6>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end align-items-center">
                                    <small>
                                        <i class="far fa-calendar-alt me-2"></i>
                                        <script>document.write(currentDate);</script>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-4 p-3">
                            <div class="table-responsive">
                                <asp:GridView runat="server" ID="grdMilk"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-borderless"
                                    BorderWidth="0"
                                    HeaderStyle-CssClass=" text-dark text-lg">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" TextMode="Number" ID="lblQty" class="form-control" Text="0"></asp:TextBox>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mt-4" id="colProducts" runat="server">
                    <div class="card h-100 mb-4">
                        <div class="card-header pb-0 px-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h6 class="mb-0">Indigenous Products</h6>
                                </div>
                                <div class="col-md-6 d-flex justify-content-end align-items-center">
                                    <small>
                                        <i class="far fa-calendar-alt me-2"></i>
                                        <script>document.write(currentDate);</script>
                                    </small>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-4 p-3">
                            <div class="table-responsive">
                                <asp:GridView runat="server" ID="grdProduct" ClientIDMode="Static"
                                    AutoGenerateColumns="false"
                                    CssClass="table table-borderless"
                                    BorderWidth="0"
                                    HeaderStyle-CssClass=" text-dark text-lg">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label runat="server" Text='Total'></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox TextMode="Number" runat="server" ID="txtQty" class="form-control" Text="0" AutoPostBack="true"></asp:TextBox>

                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label runat="server" ID="lblTotel" Text='<%# Container.DisplayIndex %>'> </asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-5 text-center">
                            <asp:Button Text="Submit" runat="server" CssClass=" mb-0 btn bg-gradient-success" ID="BtnSubmit" OnClick="BtnSubmit_Click" />
                            <a href="OutFlowSales.aspx" class="mb-0 btn bg-gradient-warning">Clear</a>
                            <%--<button type="button" class="Alert-Save mb-0 btn bg-gradient-success">Submit</button>
                              <button type="reset" class=" mb-0 btn bg-gradient-warning">Clear</button> --%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>


        function calculateTotal(gridId) {
            var grid = document.getElementById(gridId);
            var rows = grid.rows;
            var total = 0;
            for (var i = 1; i < rows.length - 1; i++) {
                var qty = rows[i].cells[1].children[0].value;
                total += parseInt(qty);
            }
            var footerRow = rows[rows.length - 1];
            var footerCell = footerRow.cells[1];
            var footerLabel = footerCell.children[0];
            footerLabel.innerHTML = total;
        }
        //First Load Milk Default

        document.addEventListener("DOMContentLoaded", () => {
            // LoadInput(Milk, "UlMilk");
            if (<%= (ViewState["Category"]!= null)?1:0 %>) {

                ResizeCol('<%= ViewState["Category"]%>');
            }
        }
        );
        //ButtonClick and load input fields
        function ResizeCol(col) {
            const colMilk = document.getElementById('<%=colMilk.ClientID%>');
            const colProducts = document.getElementById('<%=colProducts.ClientID%>');
            if (col == "Milk") {

                colProducts.classList.replace('col-md-6', 'col-md-3');
                colMilk.classList.replace('col-md-6', 'col-md-9');

            } else if (col == "Product") {
                colMilk.classList.replace('col-md-6', 'col-md-3');
                colProducts.classList.replace('col-md-6', 'col-md-9');
            }
        }


        //function LoadInput(Fields, ID) {


        //    document.getElementById('UlProduct').innerHTML = ""
        //    document.getElementById('UlMilk').innerHTML = ""
        //    var ul = document.getElementById(ID)
        //    ul.innerHTML = "";
        //    for (var i = 0; i < Fields.length; i++) {
        //        var li = `   <li class="list-group-item border-0   ps-0 mb-0 border-radius-lg">
        //            <div class="row">
        //             <div class="col-7">
        //                <label class="mb-1 text-dark text-lg">`+ Fields[i] + `</label>
        //                  </div>
        //                <div class="col-5">
        //                <input class=" mb-2 text-xs form-control" type="number" value="0" oninput="calculateGroupTotal('`+ ID + `')" />
        //                </div>
        //            </div>
        //        </li>`
        //        ul.innerHTML += li
        //    }
        //    calculateGroupTotal(ID);
        //}



    </script>

</asp:Content>
























