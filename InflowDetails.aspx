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
                    <asp:DropDownList CssClass="form-select" ID="DddlUnit" runat="server" >
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
                                                <asp:TextBox runat="server" ClientIDMode="Static" TextMode="Date" ID="txtLYSDDate" CssClass="form-control" placeholder="Enter  LYSD Date"></asp:TextBox>
                                                <script>
                                                    document.getElementById('<%= txtLYSDDate.ClientID%>').value = currentDate.toISOString().substring(0, 10);</script>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD Qty (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="txtLYSDQty" CssClass="form-control" placeholder="Enter  LYSD Quantity" oninput="calculateLYSDPercentages()" ></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    LYSD Fat %
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtLYSDFatPercent" placeholder="Enter LYSD Fat %" oninput="calculateLYSDPercentages()" TextMode="number" ></asp:TextBox>

                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    LYSD SNF %
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtLYSDSNFPercent" placeholder="Enter LYSD SNF %" oninput="calculateLYSDPercentages()" TextMode="number" ></asp:TextBox>
                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD  Fat (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" ReadOnly="true" ID="txtLYSDFatKG" CssClass="form-control" placeholder="Fat "></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    LYSD   SNF (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" ReadOnly="true" ID="txtLYSDSNFKG" CssClass="form-control" placeholder="SNF"></asp:TextBox>
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
                                                <asp:TextBox TextMode="Date" ID="Txtdate" runat="server" class="form-control" ></asp:TextBox>
                                                <script>currentDate.setFullYear(currentDate.getFullYear() + 1);
                                                    document.getElementById('<%= Txtdate.ClientID%>').value = currentDate.toISOString().substring(0, 10);</script>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    Received Quantity (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="qtyDispatched" CssClass="form-control" placeholder="Enter  Received Quantity" oninput="calculatePercentages()" ></asp:TextBox>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    Fat %
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" TextMode="number" ID="fatPercent" placeholder="Enter Fat %" oninput="calculatePercentages()"></asp:TextBox>

                                            </div>

                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label catchy-title">
                                                    SNF %
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="snfPercent" placeholder="Enter SNF %" oninput="calculatePercentages()" TextMode="number" ></asp:TextBox>
                                            </div>

                                        </div>


                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    Fat (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" ReadOnly="true" ID="fatKg" CssClass="form-control" placeholder="Fat "></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="col-lg-4 col-md-6">
                                            <div class="form-group">
                                                <label class="custom-label">
                                                    SNF (in KG)
                                                </label>
                                                <asp:TextBox runat="server" ClientIDMode="Static" ReadOnly="true" ID="snfKg" CssClass="form-control" placeholder="SNF"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class=" catchy-title">White Butter</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received in KG
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="WbQty" placeholder="Enter Received Quantity"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            In Stock (in KG)
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="Wbstock" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Skimmed Milk Powder</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received in KG
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderQty" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            In Stock (in KG)
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="MilkPowderStock" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Whole Milk Powder</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received in KG
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="WholeMilkPowderQty" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            In Stock (in KG)
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="WholeMilkPowderStock" placeholder="Enter Stock" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-white mt-3">
                        <div class="card-body">
                            <div class="row text-center mb-2">
                                <h5 class="catchy-title">Ghee</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Received in KG
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtGheeQty" placeholder="Enter Received Quantity" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            In Stock (in KG)
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtGheeStock" placeholder="Enter Stock" />
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
                                <h5 class=" catchy-title">Target Details</h5>
                            </div>
                            <div class="row align-items-end">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Target Date 
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" TextMode="Date" ID="TargetDate" CssClass="form-control" placeholder="Enter Target Date"></asp:TextBox>
                                        <script>
        document.getElementById('<%=TargetDate.ClientID%>').value = currentDate.toISOString().substring(0, 10);</script>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Target Milk
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtTargetmilk" placeholder="Enter Target Milk" />
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label class="custom-label">
                                            Milk Cumulative
                                        </label>
                                        <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control" ID="txtMilkCumulative" placeholder="Enter Milk Cumulative" />
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
                            <asp:Button Text="Submit" runat="server" CssClass=" btn btn-outline-success btn-border  w-lg" ID="btnSubmit" OnClick="btnSubmit_Click" />

                            <a href="InflowDetails.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                        </div>
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
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>

