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
                            Select Item <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" autocomplete="off" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Milk" Value="Milk" />
                            <asp:ListItem Text="Product" Value="Product" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">Target Date</label>
                        <div class="col-md-10">
                            <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" autocomplete="off" class="form-control" AutoPostBack="true" required="required" OnTextChanged="Txtdate_TextChanged"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Choose LYSD 
                        </label>
                        <asp:TextBox autocomplete="off"  runat="server" ClientIDMode="Static" TextMode="Date" ID="txtLYSDDate" CssClass="form-control"  placeholder="Enter  LYSD Date"></asp:TextBox>
                        
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" Enabled="false" runat="server" ID="BtnAdd" Text="Add" OnClick="BtnAdd_Click" />
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
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" TextMode="Number" ID="txtTarget" oninput="updateTotalQuantity(this)" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cumulative ">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" TextMode="Number" ID="txtCumulative" oninput="updateTotalQuantity(this)" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Average Growth Percentage">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" TextMode="Number" ID="txtPerc" Text="0" oninput="updateTotalQuantity(this)"></asp:TextBox>
                                        </ItemTemplate>
                                     
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Target Achieved">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" TextMode="Number" ID="txtAchieved" oninput="updateTotalQuantity(this)" Text="0"></asp:TextBox>
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

