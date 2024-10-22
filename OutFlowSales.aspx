<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OutFlowSales.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        let currentDate = new Date().toISOString().substring(0, 10);
    </script>
    <style>
        .col-md-3, .col-md-9 {
            transition: width .9s ease-in-out;
        }

        .table th {
            background-color: lightsteelblue !important;
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
                <div class="col-lg-3 col-md-6 mt-2">
                    <label class="text-dark text-lg">Select Name of Unit</label>
                    <asp:DropDownList CssClass="form-select" ID="DdlUnit" runat="server" required="required">
                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>


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
                <div class="col-lg-3 col-md-6 mt-2">
                    <label class="text-dark text-lg">Date</label>
                    <asp:TextBox TextMode="Date" runat="server" ID="TxtDate" CssClass="form-control" required></asp:TextBox>
                    <script> document.getElementById('<%= TxtDate.ClientID%>').value = currentDate;</script>

                </div>
                <div class="col-lg-3 col-md-6 mt-2">
                    <label class="custom-label">
                        LYSD Qty (in KG)
                    </label>
                    <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="txtLYSDQty" CssClass="form-control" placeholder="Enter  LYSD Quantity" oninput="calculateLYSDPercentages()"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-6 mt-2 text-center">
                    <asp:Button ID="btnMilk" Text="Milk" runat="server" CssClass="mb-0 btn bg-gradient-primary" OnClick="btnMilk_Click" />
                    <asp:Button ID="btnProduct" Text="Product" runat="server" CssClass=" mb-0 btn bg-gradient-primary" OnClick="btnMilk_Click" />
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
                                    CssClass="table table-bordered"
                                    BorderWidth="0"
                                    HeaderStyle-CssClass=" text-dark text-lg">
                                    <columns>
                                        <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                                <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <itemtemplate>
                                                <asp:TextBox runat="server" TextMode="Number" ID="TxtQty" class="form-control" Text="0" oninput="updateTotalQuantity(this)"></asp:TextBox>

                                            </itemtemplate>
                                        </asp:TemplateField>
                                    </columns>
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
                                    <columns>
                                        <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                                <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                            </itemtemplate>
                                            <footertemplate>
                                                <asp:Label runat="server" Text='Total'></asp:Label>
                                            </footertemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <itemtemplate>
                                                <asp:TextBox TextMode="Number" runat="server" ID="txtQty" class="form-control" Text="0" oninput="updateTotalQuantity(this)"></asp:TextBox>

                                            </itemtemplate>

                                        </asp:TemplateField>
                                    </columns>
                                </asp:GridView>
                            </div>
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
            <div>
                <div class="card-body p-5">
                    <div class="card-header pb-0 px-3 d-flex">

                        <div class="col text-end">
                            <button id="ExcelBtn" class="btn bg-gradient-info" onclick="exportToExcel()" type="button">Export Excel</button>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="table-responsive">
                                <asp:GridView runat="server" ID="grdItems" CssClass="table " AutoGenerateColumns="false" HeaderStyle-CssClass="text-dark text-lg">
                                    <columns>
                                        <asp:TemplateField HeaderText="Sr. No">
                                            <itemtemplate>
                                                <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("NameOfUnit") %>'></asp:Label>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Category">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblDemand" Text='<%# Eval("ItemCategory") %>'></asp:Label>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Name">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblSales" Text='<%# Eval("ItemName") %>'></asp:Label>

                                            </itemtemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <itemtemplate>
                                                <asp:Label runat="server" ID="lblManufacturing" Text='<%# Eval("Quantity") %>'></asp:Label>
                                            </itemtemplate>
                                        </asp:TemplateField>
                                    </columns>

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
        function updateTotalQuantity(textBox) {
            var gridView = textBox.parentNode.parentNode.parentNode; // get the GridView
            var totalQuantity = 0;
            var rows = gridView.rows;

            var footerRow = gridView.rows[gridView.rows.length - 1];
            if (footerRow.cells[0].innerHTML.indexOf("Total:") == -1) {
                // Add footer row if it doesn't exist
                footerRow = gridView.insertRow(gridView.rows.length);
                footerRow.innerHTML = '<td class="text-bolder" >Total:</td> <td ><span id="totalQuantity"></span></td>';
            }
            // Update total quantity in existing footer row
            let totalQuantitySpan = footerRow.cells[1].children[0];

            for (var i = 1; i < rows.length - 1; i++) { // skip header row
                var quantityTextBox = rows[i].cells[1].children[0]; // get the TextBox in the Quantity column
                totalQuantity += parseInt(quantityTextBox.value);
            }
            totalQuantitySpan.textContent = totalQuantity;

            // Check if footer row exists

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


        function exportToExcel() {

            // Get the GridView element
            var gridView = document.getElementById('<%= grdItems.ClientID%>');

            // Initialize CSV string with header
            var csv = 'data:text/csv;charset=utf-8,';
            csv += Array.from(gridView.querySelectorAll('th')).map(th => th.innerText).join(',') + '\n';

            // Iterate through rows
            gridView.querySelectorAll('tr').forEach(row => {
                // Iterate through cells
                csv += Array.from(row.querySelectorAll('td')).map(td => td.innerText).join(',') + '\n';
            });

            // Create a download link and trigger download
            var encodedUri = encodeURI(csv);
            var link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'grdItems.csv');
            document.body.appendChild(link);
            link.click();


        }


    </script>

</asp:Content>
























