<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Approver.aspx.cs" Inherits="Approver" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

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
    <div class="card text-center">
        <div class="card-header catchy-title">
            Approve Details
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-lg-12">
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
                                        <asp:TemplateField HeaderText="Milk <br/> Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkQty" class="form-control" Text='<%# Eval("Milkqty").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>Fat %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFatPerc" class="form-control" Text='<%# Eval("MilkfatPerc").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>SNF %">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNFPerc" class="form-control" Text='<%# Eval("MilkSNFPerc").ToString() %>' OnTextChanged="CalculateSnfAndFat" AutoPostBack="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/> Fat ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkFat" class="form-control" Text='<%# Eval("Milkfat").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk <br/>SNF ">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkSNF" class="form-control" Text='<%# Eval("MilkSNF").ToString() %>' ReadOnly="true"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterQty" class="form-control" Text='<%# Eval("Butterqty").ToString() %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="White Butter <br/>Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtButterStck" class="form-control" Text='<%# Eval("Butterstock").ToString() %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Quantity">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderQty" class="form-control" Text='<%# Eval("MilkPowderqty").ToString() %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Milk Powder <br/>Stock">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="TxtMilkPwderStk" class="form-control" Text='<%# Eval("MilkPowderstock").ToString() %>'></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="BtnAction"
                                                    CssClass='<%# (Eval("IsApproved").ToString()=="True")?"btn bg-gradient-info disabled":"btn bg-gradient-info" %>'
                                                    Text='<%# (Eval("IsApproved").ToString()=="True")?"Approved":"Approve" %>'
                                                    Enabled='<%# (Eval("IsApproved").ToString()=="True")?false:true %>'
                                                    CommandArgument='<%# Eval("InflowId") %>'
                                                    CommandName="Approve"></asp:LinkButton>
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

