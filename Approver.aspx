<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Approver.aspx.cs" Inherits="Approver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />--%>

    <style>
        button[type="button"] {
            background-color: #4CAF50;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

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
                                <asp:GridView runat="server" ID="grdApprove" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grdApprove_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name of Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkQty" class="form-control" Text='<%# Eval("Milkqty").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFatPerc" class="form-control" Text='<%# Eval("MilkfatPerc").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNFPerc" class="form-control" Text='<%# Eval("MilkSNFPerc").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true" ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk  Fat ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFat" class="form-control" Text='<%# Eval("Milkfat").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk SNF ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNF" class="form-control" Text='<%# Eval("MilkSNF").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterQty" class="form-control" Text='<%# Eval("Butterqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter <br/>Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterStck" class="form-control" Text='<%# Eval("Butterstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderQty" class="form-control" Text='<%# Eval("MilkPowderqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderStk" class="form-control" Text='<%# Eval("MilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtWholeMilkPwderqty" class="form-control" Text='<%# Eval("WholeMilkPowderqty").ToString() %>' ReadOnly='<%# (Convert.ToBoolean(Eval("IsApproved"))) %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="txtWholeMilkPwderStk" class="form-control" Text='<%# Eval("WholeMilkPowderstock").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee Quantity">
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
                <div class="card-header ">
                    <h3 class="catchy-title">Approved InFlow Details</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-lg-12">

                            <div class="table-responsive">
                                <asp:GridView runat="server" ID="grdApproved" AutoGenerateColumns="false" CssClass="table" HeaderStyle-Wrap="true" OnRowCommand="grdApprove_RowCommand">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name of <br/>Unit">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date of <br/>Inflow">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtUnitName" Text='<%# DateTime.Parse(Eval("Date").ToString()).ToString("dd/MM/yyyy") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk  <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkQty" Text='<%# Eval("Milkqty").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>Fat %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkFatPerc" Text='<%# Eval("MilkfatPerc").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>SNF %">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkSNFPerc" Text='<%# Eval("MilkSNFPerc").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>Fat ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkFat" Text='<%# Eval("Milkfat").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>SNF ">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkSNF" Text='<%# Eval("MilkSNF").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WB <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtButterQty" Text='<%# Eval("Butterqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WB <br/>Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtButterStck" Text='<%# Eval("Butterstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkPwderQty" Text='<%# Eval("MilkPowderqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="TxtMilkPwderStk" Text='<%# Eval("MilkPowderstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtWholeMilkPwderqty" Text='<%# Eval("WholeMilkPowderqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="WMP <br/>Stock">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtWholeMilkPwderStk" Text='<%# Eval("WholeMilkPowderstock").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="txtGheeqty" Text='<%# Eval("Gheeqty").ToString() %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ghee <br/>Stock">
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

</asp:Content>

