<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AddDemand.aspx.cs" Inherits="AddDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            ADD Demand
        </div>
        <div class="card-body">
            <div class="row justify-content-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">Date</label>
                        <div class="col-md-10">
                            <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" class="form-control" autocomplete="off" required="required"></asp:TextBox>

                        </div>
                    </div>
                </div>
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
                        <label class="text-dark text-lg">
                            Select Shift <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlShift" CssClass="form-control" autocomplete="off" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Selected="True" Text="Morning" Value="Morning" />
                            <asp:ListItem Text="Evening" Value="Evening" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Retailer <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlRetailer" CssClass="form-control" autocomplete="off" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Depot No. 94[D75]" />
                            <asp:ListItem Text="Depot No. 81[D05]" />
                            <asp:ListItem Text="Depot No. 01[D99]" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Vehicle Name <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlVehicleName" CssClass="form-control" autocomplete="off" required="required">
                            <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Demand Type<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlDemandType" CssClass="form-control" autocomplete="off" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Selected="True" Text="Regular Demand" Value="Regular" />
                            <asp:ListItem Text="Irregular Demand" Value="Irregular" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnAdd" OnClick="BtnAdd_Click" Text="Add" />
                    <a href="AddDemand.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
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
                                            <asp:HiddenField runat="server" ID="hfItemID" Value='<%# Eval("ItemID") %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Quantity">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" ID="txtQuantity" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Advanced Card">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" ID="txtAdvancedCard" Text="0" ReadOnly="true"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-12 mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-5 text-center">
                                <asp:Button Text="Submit" class="mb-0 btn bg-gradient-success" runat="server" ID="BtnSubmit" OnClick="BtnSubmit_Click" />
                                <a href="AddDemand.aspx" class=" mb-0 btn bg-gradient-warning">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>
        </div>
    </div>
    <div class="card">

        <div class="card-header catchy-title">
            ADD Demand
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive ">
                        <asp:GridView runat="server" ID="grdApproved" AutoGenerateColumns="false" CssClass="table" HeaderStyle-Wrap="true" HeaderStyle-CssClass="text-dark text-lg" OnRowCommand="grdApproved_RowCommand"   >
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Shift">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblShift" Text='<%# Eval("Shift") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Retailer">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblRetailer" Text='<%# Eval("Retailer") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Vehicle Name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblVehicleName" Text='<%# Eval("VehicleName") %>'></asp:Label>
                                        <asp:HiddenField runat="server" ID="hfUnitID" Value='<%# Eval("UnitID") %>'></asp:HiddenField>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Demand Type">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDemandType" Text='<%# Eval("DemandType")  %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton Text="Edit" runat="server" CommandArgument='<%# Eval("DemandId") %>' CommandName="EditData" />
                                        <asp:LinkButton Text="Delete" runat="server" CommandArgument='<%# Eval("DemandId") %>' CommandName="DeleteData" />

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

