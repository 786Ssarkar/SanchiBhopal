<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Verifier.aspx.cs" Inherits="VerifierAndApprover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />

    <style>
        button[type="button"] {
            background-color: #229af5;
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
                Verifier Details
            </div>
            <div class="card-body">
                <div class="row align-items-end">
                    <div class="col-lg-12">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="table-responsive">


                                    <asp:GridView runat="server" ID="GVDetails" AutoGenerateColumns="false" CssClass="table" OnRowCommand="GVDetails_RowCommand">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Name of Unit" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIUnitName" class="form-control" Text='<%# Eval("UnitName").ToString() %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Milk Quantity" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIMilkQty" AutoPostBack="true" class="form-control" Text='<%# Eval("Milkqty").ToString() %>' OnTextChanged="GVIMilkQty_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Milk Fat %" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" AutoPostBack="true" ID="GVIMilkFatPerc" class="form-control" Text='<%# Eval("Milkfatperc").ToString() %>' OnTextChanged="GVIMilkQty_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Milk SNF %" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" AutoPostBack="true" ID="GVIMilkSNFPerc" class="form-control" Text='<%# Eval("MilkSNFperc").ToString() %>' OnTextChanged="GVIMilkQty_TextChanged"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Milk Fat " HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIMilkFat" class="form-control" Text='<%# Eval("Milkfat").ToString() %>' ReadOnly></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Milk SNF " HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIMilkSNF" class="form-control" Text='<%# Eval("MilkSNF").ToString() %>' ReadOnly></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="White Butter Quantity" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIButterQty" class="form-control" Text='<%# Eval("Butterqty").ToString() %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="White Butter Stock" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIButterStck" class="form-control" Text='<%# Eval("Butterstock").ToString() %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Skimmed Milk Powder Quantity" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIMilkPwderQty" class="form-control" Text='<%# Eval("MilkPowderqty").ToString() %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Skimmed Milk Powder Stock" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" ID="GVIMilkPwderStk" class="form-control" Text='<%# Eval("MilkPowderstock").ToString() %>'></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="text-primary p-4">
                                                <ItemTemplate>
                                                    <%--<asp:LinkButton runat="server" CommandName="btnUpdate" CommandArgument='<%# Eval("InflowId") %>' CssClass="btn btn-outline-warning">Update</asp:LinkButton>--%>
                                                    <%--<asp:Button runat="server" ID="GVAction" class="form-control" Text='<%# (Eval("IsVerifed").ToString()=="True")?"Verified":"Verify" %>' ReadOnly='<%# (Eval("IsVerifed").ToString()=="True")?true:false %>' />--%>

                                                    <asp:LinkButton runat="server" ID="BtnAction"
                                                        CssClass='<%# (Eval("IsVerifed").ToString()=="True")?"btn bg-gradient-info disabled":"btn bg-gradient-info" %>'
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


</asp:Content>

