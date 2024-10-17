<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Verifier.aspx.cs" Inherits="VerifierAndApprover" %>

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
    <div class="card">
        <div class="card-header catchy-title">
            Verifier Details
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-lg-12">
                    <div class="row">
                        
                        <div class="col-lg-12 text-end">
                        <asp:Button Text="Verify All" runat="server" OnClick="VerifyAll_Click" CssClass="btn bg-gradient-info"  />
                            </div>
                        <div class="col-lg-12">
                            <div class="table-responsive ">
                                <asp:GridView runat="server" ID="GVDetails" AutoGenerateColumns="false" CssClass="table ps" OnRowCommand="GVDetails_RowCommand"  HeaderStyle-CssClass="text-dark" >
                                    <Columns>
                                        <asp:TemplateField HeaderText="Sr. No">
                                            <ItemTemplate>
                                                <asp:Label runat="server"  Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>  
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="GVIUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIMilkQty" oninput="calculateCurrentValues(this)" class="form-control" Text='<%# Eval("Milkqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Milk Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" oninput="calculateCurrentValues(this)" ID="GVIMilkFatPerc" class="form-control" Text='<%# Eval("Milkfatperc").ToString() %>'  ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF %" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" oninput="calculateCurrentValues(this)" ID="GVIMilkSNFPerc" class="form-control" Text='<%# Eval("MilkSNFperc").ToString() %>'  ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Fat " >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIMilkFatKg" class="form-control" Text='<%# Eval("Milkfat").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF " >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIMilkSNFKg" class="form-control" Text='<%# Eval("MilkSNF").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        
                                        
                                        
                                        
                                        <asp:TemplateField HeaderText="LYSD Milk KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIlysdqty"  class="form-control" Text='<%# Eval("lysdqty").ToString() %>' oninput="calculateValues(this)"
                                                    ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="LYSD Milk Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVILYSDFatPercent" TextMode="Number" class="form-control" Text='<%# Eval("LYSDFatPercent").ToString() %>' oninput="calculateValues(this)" ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF %" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server"  ID="GVILYSDSNFPercent" class="form-control" Text='<%# Eval("LYSDSNFPercent").ToString() %>' oninput="calculateValues(this)"  ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk Fat " >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVILYSDFatKG" class="form-control" Text='<%# Eval("LYSDFatKG").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="LYSD Milk SNF " >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVILYSDSNFKG" class="form-control" Text='<%# Eval("LYSDSNFKG").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIButterQty" class="form-control" Text='<%# Eval("Butterqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter Stock" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIButterStck" class="form-control" Text='<%# Eval("Butterstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SMP KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIMilkPwderQty" class="form-control" Text='<%# Eval("MilkPowderqty").ToString() %>'  ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SMP Stock" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIMilkPwderStk" class="form-control" Text='<%# Eval("MilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIWholeMilkPwderqty" class="form-control" Text='<%# Eval("WholeMilkPowderqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP Stock" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIWholeMilkPwderStk" class="form-control" Text='<%# Eval("WholeMilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField> 
                                        <asp:TemplateField HeaderText="Ghee KG" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIGheeqty" class="form-control" Text='<%# Eval("Gheeqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsVerifed"))) %>' ></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee Stock" >
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="GVIGheeStk" class="form-control " Text='<%# Eval("Gheestock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action" >
                                            <ItemTemplate>
                                                <%--<asp:LinkButton runat="server" CommandName="btnUpdate" CommandArgument='<%# Eval("InflowId") %>' CssClass="btn btn-outline-warning">Update</asp:LinkButton>--%>
                                                <%--<asp:Button runat="server" ID="GVAction" class="form-control" Text='<%# (Eval("IsVerifed").ToString()=="True")?"Verified":"Verify" %>' ReadOnly='<%# (Eval("IsVerifed").ToString()=="True")?true:false %>' />--%>

                                                <asp:LinkButton runat="server" ID="BtnAction"
                                                    CssClass='<%# (Eval("IsVerifed").ToString()=="True")?"btn bg-gradient-success disabled":"btn bg-gradient-info" %>'
                                                    Text='<%# (Eval("IsVerifed").ToString()=="True")?"Verifed":"Verify" %>'
                                                    Enabled='<%# (Eval("IsVerifed").ToString()=="True")?false:true %>'
                                                    CommandArgument='<%# Eval("InflowId") %>'
                                                    CommandName="btnUpdate">
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
        </div>                     
    </div>

  
        <script>
            function calculateCurrentValues(input) {
        // Get the current row of the input field
        const row = input.closest('tr');

            // Access the relevant input fields in the same row
                const TxtMilkQty = row.querySelector('input[id*="GVIMilkQty"]')
                const TxtGVIMilkSNF = row.querySelector('input[id*="GVIMilkSNFKg"]')
                const TxtMilkFat = row.querySelector('input[id*="GVIMilkFatKg"]')
                const TxtMilkFatPerc = row.querySelector('input[id*="GVIMilkFatPerc"]')
                const TxtMilkSNFPerc = row.querySelector('input[id*="GVIMilkSNFPerc"]')

            // Parse input values as decimals
                const milkQty = parseFloat(TxtMilkQty.value) || 0; // Default to 0 if NaN
                const milkSNFPerc = parseFloat(TxtMilkSNFPerc.value) || 0;
                const milkFatPerc = parseFloat(TxtMilkFatPerc.value) || 0;

            // Calculate milk SNF and fat
            const milkSNF = (milkQty * milkSNFPerc) / 100;
            const milkFat = (milkQty * milkFatPerc) / 100;

            // Update the corresponding fields
                TxtGVIMilkSNF.value = milkSNF.toFixed(2); // Set SNF value with two decimal places
                TxtMilkFat.value = milkFat.toFixed(2); // Set fat value with two decimal places
    }     
    
    function calculateValues(input) {
        // Get the current row of the input field
        const row = input.closest('tr');

            // Access the relevant input fields in the same row
                const Txtlysdqty = row.querySelector('input[id*="GVIlysdqty"]')
                const TxtLYSDFatPercent = row.querySelector('input[id*="GVILYSDFatPercent"]')
                const TxtLYSDSNFPercent = row.querySelector('input[id*="GVILYSDSNFPercent"]')
                const TxtLYSDSNFKG = row.querySelector('input[id*="GVILYSDSNFKG"]')
                const TxtLYSDFatKG = row.querySelector('input[id*="GVILYSDFatKG"]')

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

