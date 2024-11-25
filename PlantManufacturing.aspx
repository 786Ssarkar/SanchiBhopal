<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PlantManufacturing.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <%--   <div class="card-header ">
            ADD Demand
        </div>--%>
        <div class="card-header pb-0 px-4">
            <div class="row">
                <div class="col-md-6 ">
                    <h6 class="mb-0 catchy-title">Plant Manufacturing</h6>
                </div>
                <div class="col-md-6 d-flex justify-content-end align-items-center catchy-title fs-5">
                </div>
            </div>

        </div>
        <div class="card-body pt-4 p-3">
            <div class="row">
                <div class="col-md-12 mb-2">
                    <div class="row">
                        <div class="col-lg-3 col-md-6 ">
                             <asp:RequiredFieldValidator ErrorMessage="Date is Required" ControlToValidate="Txtdate" ForeColor="Red" Display="None" SetFocusOnError="true" runat="server" ValidationGroup="Form"  Font-Size="Small"/>

                            <asp:TextBox TextMode="Date" autocomplete="off" ID="Txtdate" runat="server" class="form-control" ></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 mt-4 px-5">

                    <div class="table-responsive">

                        <asp:GridView ID="gvProductItems" runat="server" AutoGenerateColumns="false" CssClass="table table-borderless" BorderWidth="0" EmptyDataText="No Data Found " HeaderStyle-CssClass="text-dark text-lg" HeaderStyle-Font-Bold="true">
                            <Columns>
                                <asp:TemplateField HeaderText="Indigenous Products" ControlStyle-CssClass="">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="GVItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                        <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:TextBox autocomplete="off" runat="server" ID="GVIQuantity" class="form-control" Text='<%#!(string.IsNullOrEmpty(Eval("Quantity").ToString()))?Eval("Quantity"):"0" %>'></asp:TextBox>

                                    </ItemTemplate>
                                </asp:TemplateField>

                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
                <div class="col-12 mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-5 text-center">
                    <asp:ValidationSummary runat="server" ValidationGroup="Form"   ShowMessageBox="true" ShowSummary="false"/>

                            <asp:Button runat="server" ID="BtnSubmit" Text="Submit" CssClass="btn bg-gradient-success " OnClick="BtnSubmit_Click1"  ValidationGroup="Form" />

                            <a href="PlantManufacturing.aspx" class=" btn bg-gradient-warning">Clear</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4">

        <div class="card-header catchy-title">
            Manufacturing Details
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
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-success w-lg btn-border" OnClick="btnSearch_Click" type="button" CausesValidation="true" ValidationGroup="Search" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive ">
                        <asp:GridView runat="server" ID="grdManufacturing" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grdManufacturing_RowCommand" HeaderStyle-CssClass="text-dark">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date of Manufacturing">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDate" Text='<%# Eval("Date").ToString()%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Manufacturing">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblTotal" Text='<%# Eval("Total").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            CssClass="btn btn-info btn-sm "
                                            CommandArgument='<%# Eval("MnfID") %>'
                                            CommandName="EditData">
                                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                                <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                            </svg>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server"
                                            CssClass="btn btn-danger btn-sm "
                                            CommandArgument='<%# Eval("MnfID") %>'
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

</asp:Content>

