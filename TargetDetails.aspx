<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TargetDetails.aspx.cs" Inherits="TargetDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            ADD Target
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Item Category  <span style="color: red">*</span></label>
                             <asp:RequiredFieldValidator ErrorMessage="<br>Select Item Category First" ControlToValidate="DdlItemCat" ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" autocomplete="off"  >
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Milk" Value="Milk" />
                            <asp:ListItem Text="Product" Value="Product" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">Target Date  <span style="color: red">*</span></label>
                        
                             <asp:RequiredFieldValidator ErrorMessage="<br>Select Target Date First" ControlToValidate="Txtdate" ForeColor="Red" Display="Dynamic" runat="server" ValidationGroup="Add"  Font-Size="Small"/>

                            <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" autocomplete="off" class="form-control" ></asp:TextBox>

                       
                    </div>
                </div>
                <%--<div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Choose LYSD 
                        </label>
                        <asp:TextBox autocomplete="off"  runat="server" ClientIDMode="Static" TextMode="Date" ID="txtLYSDDate" CssClass="form-control"  placeholder="Enter  LYSD Date"></asp:TextBox>
                        
                    </div>
                </div>--%>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" Enabled="false" runat="server" ID="BtnAdd" type="button"  Text="Add"  ValidationGroup="Add"  OnClick="BtnAdd_Click" />
                    <a href="TargetDetails.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                </div>
            </div>

            <fieldset id="FS_Details" runat="server">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive">
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
                                            <asp:HiddenField runat="server" ID="lblItemId" Value='<%# Eval("ItemId") %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Target">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control"   ID="txtTarget"  oninput="updateTotalQuantity(this)" Text='<%# (Eval("TargetData").ToString()!="")? Eval("TargetData").ToString():"0.0" %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cumulative ">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control"    ID="txtCumulative" oninput="updateTotalQuantity(this)" Text='<%# (Eval("SaleCumulative").ToString()!="")? Eval("SaleCumulative").ToString():"0.0" %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Average Growth Percentage">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control"   ID="txtPerc" Text='<%# (Eval("AvgGrowthPer").ToString()!="")? Eval("AvgGrowthPer").ToString():"0.0"%>' oninput="updateTotalQuantity(this)"></asp:TextBox>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Target Achieved">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control"  ID="txtAchieved" oninput="updateTotalQuantity(this)" Text='<%# (Eval("SaleAbsolute").ToString()!="")? Eval("SaleAbsolute").ToString():"0.0"%>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-12 mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-5 text-center">
                                <asp:Button Text="Submit" class="mb-0 btn bg-gradient-success" runat="server" ID="BtnSubmit" Enabled="false" OnClick="BtnSubmit_Click" />

                                <a href="TargetDetails.aspx" class=" mb-0 btn bg-gradient-warning">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
    <div class="card mt-4">

        <div class="card-header catchy-title">
            Target Details
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">From Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="FromTxtdate" runat="server" class="form-control" ></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">To Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="ToTxtdate" runat="server" class="form-control" ></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <br />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-success w-lg btn-border" OnClick="btnSearch_Click" type="button" CausesValidation="true" />
                </div>
            </div>
            <div class="row">


                <div class="col-lg-12">
                    <div class="table-responsive ">
                        <asp:GridView runat="server" ID="grdTargate" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grdTargate_RowCommand" HeaderStyle-CssClass="text-dark">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Target Date">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTargetmonth" Text='<%# DateTime.Parse(Eval("Targetmonth").ToString()).ToString("yyyy-MM-dd") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Category">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemCategory" Text='<%# Eval("ItemCategory").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Target">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotalTarget" Text='<%# Eval("TotalTarget").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            CssClass="btn btn-info btn-sm "
                                            CommandArgument='<%# Eval("TargetId") %>'
                                            CommandName="EditData">
                                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                        <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                     </svg>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server"
                                            CssClass="btn btn-danger btn-sm "
                                            CommandArgument='<%# Eval("TargetId") %>'
                                            CommandName="DeleteData">
                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                            <path d="M 10.806641 2 C 10.289641 2 9.7956875 2.2043125 9.4296875 2.5703125 L 9 3 L 4 3 A 1.0001 1.0001 0 1 0 4 5 L 20 5 A 1.0001 1.0001 0 1 0 20 3 L 15 3 L 14.570312 2.5703125 C 14.205312 2.2043125 13.710359 2 13.193359 2 L 10.806641 2 z M 4.3652344 7 L 5.8925781 20.263672 C 6.0245781 21.253672 6.877 22 7.875 22 L 16.123047 22 C 17.121047 22 17.974422 21.254859 18.107422 20.255859 L 19.634766 7 L 4.3652344 7 z"></path>
                                        </svg>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        function updateTotalQuantity(textBox) {
            var gridView = textBox.parentNode.parentNode.parentNode; // get the GridView
            var totalTarget = 0;
            var totalCumulative = 0;
            var totalAbsolute = 0;
            var totalGrowth = 0;
            var rows = gridView.rows;

            var footerRow = gridView.rows[gridView.rows.length - 1];
            if (footerRow.cells[0].innerHTML.indexOf("Total:") == -1) {
                // Add footer row if it doesn't exist
                footerRow = gridView.insertRow(gridView.rows.length);
                footerRow.innerHTML = `<td class="text-bolder" colspan="2" >Total:</td> 
                                       <td ><span id="totalTarget"> </span></td>
                                       <td ><span id="totalCumulative"> </span></td>
                                       <td ><span id="totalAbsolute"> </span></td>
                                       <td ><span id="totalGrowth"> </span></td>`;
            }
            // Update total quantity in existing footer row
            let totalTargetSpan = footerRow.cells[1].children[0];
            let totalCumulativeSpan = footerRow.cells[2].children[0];
            let totalAbsoluteSpan = footerRow.cells[3].children[0];
            let totalGrowthSpan = footerRow.cells[4].children[0];

            for (var i = 1; i < rows.length - 1; i++) { // skip header row
                var TargetTextBox = rows[i].cells[2].children[0]; // get the TextBox in the Quantity column
                totalTarget += parseInt(TargetTextBox.value, 0) || 0;

                var CumulativeTextBox = rows[i].cells[3].children[0]; // get the TextBox in the Quantity column
                totalCumulative += parseInt(CumulativeTextBox.value, 0) || 0;

                var AbsoluteTextBox = rows[i].cells[4].children[0]; // get the TextBox in the Quantity column
                totalAbsolute += parseInt(AbsoluteTextBox.value, 0) || 0;

                var GrowthTextBox = rows[i].cells[5].children[0]; // get the TextBox in the Quantity column
                totalGrowth += parseInt(GrowthTextBox.value) || 0;

            }
            totalTargetSpan.textContent = totalTarget;
            totalCumulativeSpan.textContent = totalCumulative;
            totalAbsoluteSpan.textContent = totalAbsolute;
            totalGrowthSpan.textContent = totalGrowth;

            // Check if footer row exists

        }


    </script>

</asp:Content>

