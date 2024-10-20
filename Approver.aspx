﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Approver.aspx.cs" Inherits="Approver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />--%>

    <style>
        .catchy-title {
            font-size: 24px;
            font-weight: bold;
            color: #06048a;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>

    <div class="row align-items-end">
        <div class="col-lg-12">
            <div class="card mb-5 ">
                <div class="card-header ">
                    <h3 class="catchy-title">Approve Inflows   </h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="table-responsive">
                                <asp:GridView runat="server" ID="grdApprove" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grdApprove_RowCommand" HeaderStyle-CssClass="text-dark">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkQty" class="form-control" Text='<%# Eval("Milkqty").ToString() %>'  oninput="calculateCurrentValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFatPerc" class="form-control" Text='<%# Eval("MilkfatPerc").ToString() %>' oninput="calculateCurrentValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNFPerc" class="form-control" Text='<%# Eval("MilkSNFPerc").ToString() %>'  oninput="calculateCurrentValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk  Fat ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFatKg" class="form-control" Text='<%# Eval("Milkfat").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNFKg" class="form-control" Text='<%# Eval("MilkSNF").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="Txtlysdqty" class="form-control" Text='<%# Eval("lysdqty").ToString() %>' oninput="calculateValues(this)"
                                                    ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="LYSD Milk Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtLYSDFatPercent" TextMode="Number" class="form-control" Text='<%# Eval("LYSDFatPercent").ToString() %>' oninput="calculateValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtLYSDSNFPercent" class="form-control" Text='<%# Eval("LYSDSNFPercent").ToString() %>' oninput="calculateValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk Fat ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtLYSDFatKG" class="form-control" Text='<%# Eval("LYSDFatKG").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtLYSDSNFKG" class="form-control" Text='<%# Eval("LYSDSNFKG").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterQty" class="form-control" Text='<%# Eval("Butterqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterStck" class="form-control" Text='<%# Eval("Butterstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderQty" class="form-control" Text='<%# Eval("MilkPowderqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderStk" class="form-control" Text='<%# Eval("MilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtWholeMilkPwderqty" class="form-control" Text='<%# Eval("WholeMilkPowderqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtWholeMilkPwderStk" class="form-control" Text='<%# Eval("WholeMilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee KG">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtGheeqty" class="form-control" Text='<%# Eval("Gheeqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtGheeStk" class="form-control " Text='<%# Eval("Gheestock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="BtnAction"
                                                    CssClass='<%# (Convert.ToBoolean(Eval("IsApproved")))?"btn bg-gradient-success disabled":"btn bg-gradient-info" %>'
                                                    Text='<%# (Convert.ToBoolean(Eval("IsApproved")))?"Approved":"Approve" %>'
                                                    Enabled='<%# (Convert.ToBoolean(Eval("IsApproved")))?false:true %>'
                                                    CommandArgument='<%# Eval("InflowId") %>'
                                                    CommandName="Approve">
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
            <div class="card ">
                <div class="card-header pb-0 px-3 d-flex">
                    <h3 class="catchy-title col">Approved InFlow Details</h3>
                    <div class="col text-end">
                        <button id="ExcelBtn" class="btn bg-gradient-info" onclick="exportToExcel()" type="button">Export Excel</button>
                    </div>
                </div>

                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="table-responsive ">
                                <asp:GridView runat="server" ID="grdApproved" AutoGenerateColumns="false" CssClass="table" HeaderStyle-Wrap="true" OnRowCommand="grdApprove_RowCommand" HeaderStyle-CssClass="text-dark text-lg">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%--  <asp:TemplateField HeaderText="Date of Inflow">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# DateTime.Parse(Eval("Date").ToString()).ToString("dd/MM/yyyy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Milk KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkQty" Text='<%# Eval("Milkqty").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Fat %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkFatPerc" Text='<%# Eval("MilkfatPerc").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkSNFPerc" Text='<%# Eval("MilkSNFPerc").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Fat ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkFat" Text='<%# Eval("Milkfat").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkSNF" Text='<%# Eval("MilkSNF").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server"  Text='<%# (!string.IsNullOrEmpty(Eval("lysdqty").ToString())) ? Eval("lysdqty").ToString() : "0"  %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="LYSD Milk Fat %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtLYSDFatPercent" Text='<%#  (!string.IsNullOrEmpty(Eval("LYSDFatPercent").ToString())) ? Eval("LYSDFatPercent").ToString() : "0" %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtLYSDSNFPercent" Text='<%#  (!string.IsNullOrEmpty(Eval("LYSDSNFPercent").ToString())) ? Eval("LYSDSNFPercent").ToString() : "0"  %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk Fat ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtLYSDFatKG" Text='<%# (!string.IsNullOrEmpty(Eval("LYSDFatKG").ToString())) ? Eval("LYSDFatKG").ToString() : "0" %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtLYSDSNFKG" Text='<%# (!string.IsNullOrEmpty(Eval("LYSDSNFKG").ToString())) ? Eval("LYSDSNFKG").ToString() : "0" %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WB KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtButterQty" Text='<%# Eval("Butterqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WB  Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtButterStck" Text='<%# Eval("Butterstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkPwderQty" Text='<%# Eval("MilkPowderqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkPwderStk" Text='<%# Eval("MilkPowderstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP  KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtWholeMilkPwderqty" Text='<%# Eval("WholeMilkPowderqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtWholeMilkPwderStk" Text='<%# Eval("WholeMilkPowderstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee KG">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtGheeqty" Text='<%# Eval("Gheeqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee  Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtGheeStk" Text='<%# Eval("Gheestock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function exportToExcel() {

            // Get the GridView element

            var gridView = document.getElementById('<%= grdApproved.ClientID%>');

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
            link.setAttribute('download', 'Details.csv');
            document.body.appendChild(link);
            link.click();


        }
    </script>
    <script>
        function calculateCurrentValues(input) {
            // Get the current row of the input field
            const row = input.closest('tr');

            // Access the relevant input fields in the same row
            const TxtMilkQty = row.querySelector('input[id*="TxtMilkQty"]')                                                                    
            
            const TxtTxtMilkSNF = row.querySelector('input[id*="TxtMilkSNFKg"]')
            const TxtMilkFat = row.querySelector('input[id*="TxtMilkFatKg"]')
            const TxtMilkFatPerc = row.querySelector('input[id*="TxtMilkFatPerc"]')
            const TxtMilkSNFPerc = row.querySelector('input[id*="TxtMilkSNFPerc"]')

            // Parse input values as decimals
            const milkQty = parseFloat(TxtMilkQty.value) || 0; // Default to 0 if NaN
            const milkSNFPerc = parseFloat(TxtMilkSNFPerc.value) || 0;
            const milkFatPerc = parseFloat(TxtMilkFatPerc.value) || 0;

            // Calculate milk SNF and fat
            const milkSNF = (milkQty * milkSNFPerc) / 100;
            const milkFat = (milkQty * milkFatPerc) / 100;

            // Update the corresponding fields
            TxtTxtMilkSNF.value = milkSNF.toFixed(2); // Set SNF value with two decimal places
            TxtMilkFat.value = milkFat.toFixed(2); // Set fat value with two decimal places
        }

        function calculateValues(input) {
            // Get the current row of the input field
            const row = input.closest('tr');

            // Access the relevant input fields in the same row
            const Txtlysdqty = row.querySelector('input[id*="Txtlysdqty"]')
            const TxtLYSDFatPercent = row.querySelector('input[id*="TxtLYSDFatPercent"]')
            const TxtLYSDSNFPercent = row.querySelector('input[id*="TxtLYSDSNFPercent"]')
            const TxtLYSDSNFKG = row.querySelector('input[id*="TxtLYSDSNFKG"]')
            const TxtLYSDFatKG = row.querySelector('input[id*="TxtLYSDFatKG"]')

            // Parse input values as decimals
            const milkQty = parseFloat(Txtlysdqty.value) || 0; // Default to 0 if NaN
            const milkSNFPerc = parseFloat(TxtLYSDSNFPercent.value) || 0;
            const milkFatPerc = parseFloat(TxtLYSDFatPercent.value) || 0;

            // Calculate milk SNF and fat
            const milkSNF = (milkQty * milkSNFPerc) / 100;
            const milkFat = (milkQty * milkFatPerc) / 100;

            // Update the corresponding fields
            TxtLYSDSNFKG.value = milkSNF.toFixed(2); // Set SNF value with two decimal places
            TxtLYSDFatKG.value = milkFat.toFixed(2); // Set fat value with two decimal places
        }
    </script>



</asp:Content>

