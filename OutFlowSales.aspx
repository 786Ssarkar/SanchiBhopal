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
                    <asp:DropDownList autocomplete="off" CssClass="form-select" ID="DdlUnit" runat="server" required="required">
                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>


                    </asp:DropDownList>
                </div>
                <div class="col-lg-3 col-md-6 mt-2">
                    <label class="text-dark text-lg">Date</label>
                    <asp:TextBox autocomplete="off" TextMode="Date" runat="server" ID="TxtDate" CssClass="form-control" required></asp:TextBox>


                </div>
                <div class="col-lg-3 col-md-6 mt-2">
                    <label class="custom-label">
                        LYSD Qty (in KG)
                    </label>
                    <asp:TextBox autocomplete="off"  runat="server" ClientIDMode="Static" TextMode="number" ID="txtLYSDQty" CssClass="form-control" placeholder="Enter  LYSD Quantity" oninput="calculateLYSDPercentages()"></asp:TextBox>
                </div>
                <div class="col-lg-3 col-md-6 mt-2 text-center">
                    <asp:Button ID="btnMilk" Text="Milk" runat="server" CssClass="mb-0 btn bg-gradient-primary" OnClick="btnMilk_Click" />
                    <asp:Button ID="btnProduct" Text="Product" runat="server" CssClass=" mb-0 btn bg-gradient-primary" OnClick="btnMilk_Click" />
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
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item" ControlStyle-CssClass="text-bolder">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                                <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox autocomplete="off" runat="server" TextMode="Number" ID="TxtQty" class="form-control" Text='<%#!(string.IsNullOrEmpty(Eval("Quantity").ToString()))?Eval("Quantity"):"0" %>' oninput="updateTotalQuantity(this)"></asp:TextBox>

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
                                                <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label runat="server" Text='Total'></asp:Label>
                                            </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox autocomplete="off" TextMode="Number" runat="server" ID="txtQty" class="form-control" Text='<%#!(string.IsNullOrEmpty(Eval("Quantity").ToString()))?Eval("Quantity"):"0" %>' oninput="updateTotalQuantity(this)"></asp:TextBox>

                                            </ItemTemplate>

                                        </asp:TemplateField>
                                    </Columns>
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
                                <asp:GridView runat="server" ID="grdOutFlow" CssClass="table " AutoGenerateColumns="false" HeaderStyle-CssClass="text-dark text-lg" OnRowCommand="grdOutFlow_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No">
                                            <ItemTemplate>
                                                <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblUnitName" Text='<%# Eval("UnitName") %>'></asp:Label>
                                                <asp:HiddenField runat="server" ID="hfUnitID" Value='<%# Eval("UnitID") %>'></asp:HiddenField>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblDate" Text='<%# DateTime.Parse( Eval("Date").ToString()).ToString("yyyy-MM-dd")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Item Category">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblItemCategory" Text='<%# Eval("ItemCategory") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblLYSDQty" Text='<%# Eval("LYSDQty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Sales">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblTotal" Text='<%# Eval("Total") %>'></asp:Label>

                                            </ItemTemplate>
                                        </asp:TemplateField>
                                      
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton CssClass="btn btn-info btn-sm" runat="server" CommandArgument='<%# Eval("SalesID") %>' CommandName="EditData">
                                                   <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                                       <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                                    </svg>
                                                </asp:LinkButton>
                                                <asp:LinkButton CssClass="btn btn-danger btn-sm" runat="server" CommandArgument='<%# Eval("SalesID") %>' CommandName="DeleteData">
                                                   <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                                       <path d="M 10.806641 2 C 10.289641 2 9.7956875 2.2043125 9.4296875 2.5703125 L 9 3 L 4 3 A 1.0001 1.0001 0 1 0 4 5 L 20 5 A 1.0001 1.0001 0 1 0 20 3 L 15 3 L 14.570312 2.5703125 C 14.205312 2.2043125 13.710359 2 13.193359 2 L 10.806641 2 z M 4.3652344 7 L 5.8925781 20.263672 C 6.0245781 21.253672 6.877 22 7.875 22 L 16.123047 22 C 17.121047 22 17.974422 21.254859 18.107422 20.255859 L 19.634766 7 L 4.3652344 7 z"></path>
                                                   </svg>
                                                </asp:LinkButton>
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
            var gridView = document.getElementById('<%= grdOutFlow.ClientID%>');

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
























