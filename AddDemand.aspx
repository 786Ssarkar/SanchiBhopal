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
                        <label for="date-picker" class="text-dark text-lg">Date<span style="color: red">*</span></label>
                             <asp:RequiredFieldValidator ErrorMessage="Date is Required" ControlToValidate="Txtdate" ForeColor="Red" Display="None" runat="server" SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>
                        <div class="col-md-10">

                            <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" class="form-control" autocomplete="off"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Item Category <span style="color: red">*</span></label>
                             <asp:RequiredFieldValidator ErrorMessage=" Item Category is Required" ControlToValidate="DdlItemCat" ForeColor="Red" Display="None" runat="server" SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" autocomplete="off">
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
                             <asp:RequiredFieldValidator ErrorMessage=" Shift is Required" ControlToValidate="DdlShift" ForeColor="Red" Display="None" runat="server" SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlShift" CssClass="form-control" autocomplete="off">
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
                             <asp:RequiredFieldValidator ErrorMessage=" Retailer is Required" ControlToValidate="DdlRetailer" ForeColor="Red" Display="None" runat="server"  SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlRetailer" CssClass="form-control" autocomplete="off">
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
                             <asp:RequiredFieldValidator ErrorMessage="  Vehicle Name is Required" ControlToValidate="DdlVehicleName" ForeColor="Red" Display="None" runat="server" SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlVehicleName" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Demand Type<span style="color: red">*</span></label>
                             <asp:RequiredFieldValidator ErrorMessage="  Demand Type is Required" ControlToValidate="DdlDemandType" ForeColor="Red" Display="None" runat="server" SetFocusOnError="true"  ValidationGroup="Add"  Font-Size="Small"/>

                        <asp:DropDownList runat="server" ID="DdlDemandType" CssClass="form-control" autocomplete="off">
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
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnAdd" OnClick="BtnAdd_Click" Text="Add" SetFocusOnError="true"  ValidationGroup="Add"/>
                    <a href="AddDemand.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>   
                    <asp:ValidationSummary runat="server" ValidationGroup="Add"   ShowMessageBox="true" ShowSummary="false"/>
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
                                            <asp:TextBox autocomplete="off" runat="server"  CssClass="form-control" ID="txtQuantity" Text='<%#(Eval("Quantity").ToString()!="")?Eval("Quantity"):"0" %>'></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Advanced Card">
                                        <ItemTemplate>
                                            <asp:TextBox autocomplete="off" runat="server" CssClass="form-control" ID="txtAdvancedCard" Text='<%# (Eval("AdvancedCard").ToString()!="")?Eval("AdvancedCard"):"0" %>' ReadOnly="true"></asp:TextBox>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                    <div class="col-12 mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-5 text-center">
                                <asp:Button Text="Submit" class="mb-0 btn bg-gradient-success" runat="server" ID="BtnSubmit" OnClick="BtnSubmit_Click" ValidationGroup="Add" />
                                <a href="AddDemand.aspx" class=" mb-0 btn bg-gradient-warning">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>

            </fieldset>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-header catchy-title">
            Demands Details
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">From Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="FromTxtdate" runat="server" class="form-control" ValidationGroup="Search"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">To Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="ToTxtdate" runat="server" class="form-control" ValidationGroup="Search"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <br />
                    <asp:ValidationSummary runat="server" ValidationGroup="Search"  ShowMessageBox="true" ShowSummary="false"/>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-success w-lg btn-border" OnClick="btnSearch_Click" type="button" CausesValidation="true" ValidationGroup="Search" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive ">
                        <asp:GridView runat="server" ID="grdDemands" AutoGenerateColumns="false" CssClass="table" HeaderStyle-Wrap="true" HeaderStyle-CssClass="text-dark text-lg" OnRowCommand="grdDemands_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDate" Text='<%#  Eval("Date").ToString()%>'></asp:Label>
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
                                        <asp:LinkButton CssClass="btn btn-info btn-sm" runat="server" CommandArgument='<%# Eval("DemandId") %>' CommandName="EditData">
                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                            <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                         </svg>
                                        </asp:LinkButton>
                                        <asp:LinkButton CssClass="btn btn-danger btn-sm" runat="server" CommandArgument='<%# Eval("DemandId") %>' CommandName="DeleteData">
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

