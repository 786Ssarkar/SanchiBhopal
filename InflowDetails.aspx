<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InflowDetails.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .large-text {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .custom-label {
            font-size: 16px; /* increase font size */
            font-weight: bold; /* make it bold */
            color: #333; /* change the text color */
            margin-bottom: 10px; /* add some margin below the label */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        var currentDate = new Date();
        currentDate.setFullYear(currentDate.getFullYear() - 1);
    </script>
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <div class="card-header catchy-title">
            In Flow  Details
        </div>

        <div class="card-body">
            <div class="row align-items-end m-2">
                <div class="col-lg-4 col-md-6 mt-2">

                    <label class="text-dark text-lg">Select Name of Unit</label>
                    <asp:RequiredFieldValidator ErrorMessage="Unit is Required" ControlToValidate="DdlUnit" ForeColor="Red" Display="None" SetFocusOnError="true" runat="server" ValidationGroup="Form" Font-Size="Small" />

                    <asp:DropDownList CssClass="form-select" ID="DdlUnit" runat="server" autocomplete="off" AutoPostBack="true" OnSelectedIndexChanged="DdlUnit_SelectedIndexChanged">
                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>


                    </asp:DropDownList>
                </div>


            </div>
            <div class="row align-items-end">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h2 class="catchy-title">Milk Details</h2>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-lg-12">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <h5 class="catchy-title fs-5">Last Year Same Date Details</h5>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    Choose LYSD 
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" TextMode="Date" ID="txtLYSDDate" CssClass="form-control" placeholder="Enter  LYSD Date"></asp:TextBox>
                                                <%--<script>
                                                    document.getElementById('<%= txtLYSDDate.ClientID%>').value = currentDate.toISOString().substring(0, 10);</script>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD Qty (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ID="txtLYSDQty" CssClass="form-control" placeholder="Enter  LYSD Quantity" oninput="calculateLYSDPercentages()"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    LYSD Fat %
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtLYSDFatPercent" placeholder="Enter LYSD Fat %" oninput="calculateLYSDPercentages()"></asp:TextBox>

                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    LYSD SNF %
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtLYSDSNFPercent" placeholder="Enter LYSD SNF %" oninput="calculateLYSDPercentages()"></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD  Fat (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ReadOnly="true" ID="txtLYSDFatKG" CssClass="form-control" placeholder="Fat "></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD   SNF (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ReadOnly="true" ID="txtLYSDSNFKG" CssClass="form-control" placeholder="SNF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 mt-3">
                                    <div class="row align-items-end">
                                        <div class="col-lg-12">
                                            <h5 class="catchy-title fs-5">Current Year Same Date Details</h5>
                                        </div>
                                        <div class="col-lg-4 col-md-6 mt-2">
                                            <div class="form-group">
                                                <label class="custom-label">Date</label>

                                                <asp:RequiredFieldValidator ErrorMessage="Date is Required" ControlToValidate="Txtdate" ForeColor="Red" Display="None" SetFocusOnError="true" runat="server" ValidationGroup="Form" Font-Size="Small" />
                                                <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" autocomplete="off" class="form-control" AutoPostBack="true" OnTextChanged="Txtdate_TextChanged"></asp:TextBox>
                                                <%-- <script>currentDate.setFullYear(currentDate.getFullYear() + 1);
                                                    document.getElementById('<%= Txtdate.ClientID%>').value = currentDate.toISOString().substring(0, 10);</script>--%>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    Received Quantity (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ID="qtyDispatched" CssClass="form-control" placeholder="Enter  Received Quantity" oninput="calculatePercentages()"></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    Fat %
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="fatPercent" placeholder="Enter Fat %" oninput="calculatePercentages()"></asp:TextBox>

                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    SNF %
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="snfPercent" placeholder="Enter SNF %" oninput="calculatePercentages()"></asp:TextBox>
                                            </div>

                                        </div>


                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    Fat (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ReadOnly="true" ID="fatKg" CssClass="form-control" placeholder="Fat "></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    SNF (in KG)
                                                </label>
                                                <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" ReadOnly="true" ID="snfKg" CssClass="form-control" placeholder="SNF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Ghee (in KG)</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Choose Variant
                                        </label>
                                        <asp:DropDownList autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" AutoPostBack="true" ID="DdlGheeVerient" OnSelectedIndexChanged="DdlGheeVerient_SelectedIndexChanged">
                                            <asp:ListItem Value="0">Select</asp:ListItem>
                                             <asp:ListItem Value="44">Ghee 200g</asp:ListItem>
                                            <asp:ListItem Value="45">Ghee 500ml</asp:ListItem>
                                            <asp:ListItem Value="46">Ghee 1 lit</asp:ListItem>
                                            <asp:ListItem Value="47">Ghee 5 lit</asp:ListItem>
                                            <asp:ListItem Value="48">Ghee 15 kg</asp:ListItem>
                                          <%--  <asp:ListItem Value="48">Ghee 200g</asp:ListItem>
                                            <asp:ListItem Value="49">Ghee 500ml</asp:ListItem>
                                            <asp:ListItem Value="50">Ghee 1 lit</asp:ListItem>
                                            <asp:ListItem Value="51">Ghee 5 lit</asp:ListItem>
                                            <asp:ListItem Value="52">Ghee 15 kg</asp:ListItem>--%>
                                        </asp:DropDownList>

                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Opening Balance
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="Gheebalnc" oninput="GheeTotal()" placeholder="Enter Opening Balance"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Manufactured
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="GheeManuf" oninput="GheeTotal()" placeholder="Enter Manufacturer" />
                                    </div>
                                </div>


                                <div class="col-md-4 col-lg-3">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received 
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtGheeQty" oninput="GheeTotal()" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-4 col-lg-3 ">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Total
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control disabled" ID="txtGheeStock" ReadOnly="true" placeholder="Enter Stock" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class=" catchy-title">White Butter (in KG)</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Opening Balance
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WBOpeningBln" oninput="WbTotal()" placeholder="Enter Opening Balance"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Manufactured
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WbManufacturer" oninput="WbTotal()" placeholder="Enter Manufacturer" />
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WbQty" oninput="WbTotal()" placeholder="Enter Received Quantity"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Total
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="Wbstock" ReadOnly="true" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Skimmed Milk Powder (in KG)</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Opening Balance
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderBal" oninput="SmpTotal()" placeholder="Enter Opening Balance"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Manufactured
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderManuf" oninput="SmpTotal()" placeholder="Enter Manufacturer" />
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderQty" oninput="SmpTotal()" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Total
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderStock" ReadOnly="true" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 ">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Whole Milk Powder (in KG)</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Opening Balance
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WMPblnc" oninput="WPTotal()" placeholder="Enter Opening Balance"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Manufactured
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WMPManuf" oninput="WPTotal()" placeholder="Enter Manufacturer" />
                                    </div>
                                </div>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WholeMilkPowderQty" oninput="WPTotal()" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Total
                                        </label>
                                        <asp:TextBox autocomplete="off" runat="server" ClientIDMode="Static" CssClass="form-control" ID="WholeMilkPowderStock" ReadOnly="true" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               
                <div class="col-12">
                    <div class="row justify-content-center">
                        <div class="col-md-12 text-center">
                            <hr />
                    <asp:ValidationSummary runat="server" ValidationGroup="Form"   ShowMessageBox="true" ShowSummary="false"/>

                            <asp:Button Text="Submit" runat="server" CssClass=" btn btn-outline-success btn-border  w-lg" ID="btnSubmit" OnClick="btnSubmit_Click" ValidationGroup="Form" />

                            <a href="InflowDetails.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="card mt-4">

        <div class="card-header catchy-title">
            Inflow Details
        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">From Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="FromTxtdate" runat="server" class="form-control"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">To Date</label>
                        <div class="col-md-10">
                            <asp:TextBox autocomplete="off" TextMode="Date" ID="ToTxtdate" runat="server" class="form-control"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                    <br />

                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-outline-success w-lg btn-border" OnClick="btnSearch_Click" type="button" />
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="table-responsive ">
                        <asp:GridView runat="server" ID="GVInflow" AutoGenerateColumns="false" CssClass="table ps" OnRowCommand="GVInflow_RowCommand" HeaderStyle-CssClass="text-dark">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name of Unit">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                                        <asp:HiddenField runat="server" ID="hfUnitID" Value='<%# Eval("UnitID").ToString() %>'></asp:HiddenField>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Inflow">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDate" Text='<%# DateTime.Parse(Eval("Date").ToString()).ToString("yyyy-MM-dd") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Milk KG">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkQty" Text='<%# Eval("Milkqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Milk Fat %">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkFatPerc" Text='<%# Eval("Milkfatperc").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Milk SNF %">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkSNFPerc" Text='<%# Eval("MilkSNFperc").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Milk Fat ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkFatKg" Text='<%# Eval("Milkfat").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Milk SNF ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkSNFKg" Text='<%# Eval("MilkSNF").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LYSD Date">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLYSDDate" Text='<%#  DateTime.Parse(Eval("LYSDDate").ToString()).ToString("yyyy-MM-dd")  %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LYSD Milk KG">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lbllysdqty" Text='<%# Eval("lysdqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="LYSD Milk Fat %">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLYSDFatPercent" TextMode="Number" Text='<%# Eval("LYSDFatPercent").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LYSD Milk SNF %">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLYSDSNFPercent" Text='<%# Eval("LYSDSNFPercent").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LYSD Milk Fat ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLYSDFatKG" Text='<%# Eval("LYSDFatKG").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="LYSD Milk SNF ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblLYSDSNFKG" Text='<%# Eval("LYSDSNFKG").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--1. WB--%>
                                <asp:TemplateField HeaderText="WB Opening Balance ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWBOBal" Text='<%# Eval("WBOBal").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WB Manufactured ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWBManuf" Text='<%# Eval("WBManuf").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WB Received ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblButterqty" Text='<%# Eval("Butterqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WB Total ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblButterstock" Text='<%# Eval("Butterstock").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--2. SMP--%>
                                <asp:TemplateField HeaderText="SMP Opening Balance ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSMPBal" Text='<%# Eval("SMPBal").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SMP Manufactured ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSMPManuf" Text='<%# Eval("SMPManuf").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SMP Received ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkPowderqty" Text='<%# Eval("MilkPowderqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="SMP Total ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblMilkPowderstock" Text='<%# Eval("MilkPowderstock").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <%--3. WMP--%>
                                <asp:TemplateField HeaderText="WMP Opening Balance ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWMPBal" Text='<%# Eval("WMPBal").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WMP Manufactured ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWMPManuf" Text='<%# Eval("WMPManuf").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WMP Received ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWholeMilkPowderqty" Text='<%# Eval("WholeMilkPowderqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="WMP Total ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblWholeMilkPowderstock" Text='<%# Eval("WholeMilkPowderstock").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--4. Ghee--%>
                                <asp:TemplateField HeaderText="Ghee Verient ">
                                    <ItemTemplate>
                                        <asp:HiddenField runat="server" ID="hfGheeID" Value='<%# Eval("GheeID").ToString() %>'></asp:HiddenField>
                                        <asp:Label runat="server" ID="lblGheeVerient" Text='<%# Eval("GheeVerient").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ghee Opening Balance ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblGheeBal" Text='<%# Eval("GheeBal").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ghee Manufactured ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblGheeManuf" Text='<%# Eval("GheeManuf").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ghee Received ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblGheeqty" Text='<%# Eval("Gheeqty").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Ghee Total ">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblGheestock" Text='<%# Eval("Gheestock").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>



                                <asp:TemplateField HeaderText="Is Verifed">
                                    <ItemTemplate>
                                        <asp:Label runat="server"
                                            CssClass='<%# (Eval("IsVerifed").ToString()=="True")?" text-success text-gradient  ":" text-info text-gradient " %>'
                                            Text='<%# (Eval("IsVerifed").ToString()=="True")?"Verifed":"Pending" %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Is Approved">
                                    <ItemTemplate>
                                        <asp:Label runat="server"
                                            CssClass='<%# (Eval("IsApproved").ToString()=="True")?" text-success text-gradient ":"text-info text-gradient " %>'
                                            Text='<%# (Eval("IsApproved").ToString()=="True")?"Approved":"Pending" %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            CssClass='<%# (Convert.ToBoolean(Eval("IsApproved"))||Convert.ToBoolean(Eval("IsVerifed")) )?"btn btn-success btn-sm disabled":"btn btn-info btn-sm " %>'
                                            CommandArgument='<%# Eval("InflowId") %>'
                                            Enabled='<%# (Convert.ToBoolean(Eval("IsApproved"))||Convert.ToBoolean(Eval("IsVerifed")) )?false:true %>'
                                            CommandName="EditData">
                                            <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                                <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                            </svg>
                                        </asp:LinkButton>
                                        <asp:LinkButton runat="server"
                                            CssClass='<%# (Convert.ToBoolean(Eval("IsApproved"))||Convert.ToBoolean(Eval("IsVerifed")) )?"btn btn-danger btn-sm disabled":"btn btn-danger btn-sm " %>'
                                            CommandArgument='<%# Eval("InflowId") %>'
                                            Enabled='<%# (Convert.ToBoolean(Eval("IsApproved"))||Convert.ToBoolean(Eval("IsVerifed")) )?false:true %>'
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
        function calculatePercentages() {
            const qtyDispatched = document.getElementById("qtyDispatched").value;
            const fatPercent = document.getElementById("fatPercent").value;
            const snfPercent = document.getElementById("snfPercent").value;

            // Calculate Fat Kg
            const fatKg = (fatPercent / 100) * qtyDispatched;
            document.getElementById("fatKg").value = fatKg.toFixed(2);

            // Calculate SNF Kg
            const snfKg = (snfPercent / 100) * qtyDispatched;
            document.getElementById("snfKg").value = snfKg.toFixed(2);
        }
        function calculateLYSDPercentages() {
            const txtLYSDQty = document.getElementById("txtLYSDQty").value;
            const txtLYSDFat = document.getElementById("txtLYSDFatPercent").value;
            const txtLYSDSNF = document.getElementById("txtLYSDSNFPercent").value;

            // Calculate Fat Kg
            const fatKg = (txtLYSDFat / 100) * txtLYSDQty;
            document.getElementById("txtLYSDFatKG").value = fatKg.toFixed(2);

            // Calculate SNF Kg
            const snfKg = (txtLYSDSNF / 100) * txtLYSDQty;
            document.getElementById("txtLYSDSNFKG").value = snfKg.toFixed(2);
        }

        function GheeTotal() {
            var Balance = document.getElementById("Gheebalnc").value;
            var Manufacturer = document.getElementById("GheeManuf").value;
            var Received = document.getElementById("txtGheeQty").value;
            document.getElementById("txtGheeStock").value = GetTotal(Balance, Manufacturer, Received)
        }
        function WPTotal() {
            var Balance = document.getElementById("WMPblnc").value;
            var Manufacturer = document.getElementById("WMPManuf").value;
            var Received = document.getElementById("WholeMilkPowderQty").value;
            document.getElementById("WholeMilkPowderStock").value = GetTotal(Balance, Manufacturer, Received)
        }
        function SmpTotal() {
            var Balance = document.getElementById("MilkPowderBal").value;
            var Manufacturer = document.getElementById("MilkPowderManuf").value;
            var Received = document.getElementById("MilkPowderQty").value;
            document.getElementById("MilkPowderStock").value = GetTotal(Balance, Manufacturer, Received)
        }
        function WbTotal() {
            var Balance = document.getElementById("WBOpeningBln").value;
            var Manufacturer = document.getElementById("WbManufacturer").value;
            var Received = document.getElementById("WbQty").value;
            document.getElementById("Wbstock").value = GetTotal(Balance, Manufacturer, Received)
        }


        function GetTotal(bal, manf, Qty) {
            return (Number(bal) || 0) + (Number(manf) || 0) + (Number(Qty) || 0);
        }
    </script>

    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>
</asp:Content>

