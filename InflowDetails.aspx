<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InflowDetails.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
        .catchy-title {
            font-size: 24px;
            font-weight: bold;
            color: #06048a;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .large-text {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }

        .catchy-title {
            font-size: 18px; /* increase font size */
            font-weight: bold; /* make it bold */
            color: #06048a; /* change the text color */
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2); /* add a subtle shadow */
        }

        .card {
            margin: 10px; /* add some margin around each card */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* add a subtle shadow */
            border-radius: 10px; /* add some border radius to make it more rounded */
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
     <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card text-center">
        <div class="card-header catchy-title">
            Sanchi Details
        </div>

        <div class="card-body">
            <div class="row justify-content-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="col-md-2 control-label">Date</label>
                        <div class="col-md-10">
                           <asp:TextBox TextMode="Date" Id="Txtdate" runat="server" class="form-control" required="required"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="row text-center mb-2">
                        <h2 class="card-title catchy-title">Milk Details</h2>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="custom-label">
                                    Quantity Dispatched (in KG)
                                </label>
                               <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="qtyDispatched" CssClass="form-control" placeholder="Enter Quantity Dispatched" oninput="calculatePercentages()" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="custom-label">
                                    Fat (in KG)
                                </label>
                                 <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="fatKg" CssClass="form-control" placeholder="Enter Fat" oninput="calculatePercentages()" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label class="custom-label">
                                    SNF (in KG)
                                </label>
                               <asp:TextBox runat="server" ClientIDMode="Static" TextMode="number" ID="snfKg" CssClass="form-control" placeholder="Enter SNF" oninput="calculatePercentages()"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label catchy-title">
                                    Fat %
                                </label>
                                 <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control"  ID="fatPercent"  placeholder=" Fat %" ></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label catchy-title">
                                    SNF %
                                </label>
                                   <asp:TextBox runat="server" ClientIDMode="Static"   CssClass="form-control"  ID="snfPercent"  placeholder="SNF %" ></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card bg-white mt-3">
                <div class="card-body">
                    <div class="row text-center mb-2">
                        <h5 class="card-title catchy-title">White Butter</h5>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label">
                                    Quantity Dispatched (in KG)
                                </label>
                              <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control"  ID="WbQty" placeholder="Enter Quantity Dispatched" ></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label">
                                    In Stock (in KG)
                                </label>
                                  <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control"  ID="Wbstock" placeholder="Enter Stock" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card bg-white mt-3">
                <div class="card-body">
                    <div class="row text-center mb-2">
                        <h5 class="card-title catchy-title">Skimmed Milk Powder</h5>
                    </div>
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label">
                                    Quantity Dispatched (in KG)
                                </label>
                              <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control"  ID="MilkPowderQty" placeholder="Enter Quantity Dispatched" />
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="custom-label">
                                    In Stock (in KG)
                                </label>
                                <asp:TextBox runat="server" ClientIDMode="Static" CssClass="form-control"  ID="MilkPowderStock" placeholder="Enter Stock" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:Button Text="Submit" runat="server" CssClass=" btn btn-outline-success btn-border  w-lg" ID="btnSubmit" OnClick="btnSubmit_Click" />
                    
                    <a href="InflowDetails.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                </div>
            </div>

        </div>
    </div>
    <script>
        function calculatePercentages() {
            const qtyDispatched = document.getElementById("qtyDispatched").value;
            const fatKg = document.getElementById("fatKg").value;
            const snfKg = document.getElementById("snfKg").value;

            // Calculate Fat %
            const fatPercent = (fatKg / qtyDispatched) * 100;
           
            document.getElementById("fatPercent").value = fatPercent.toFixed(2) ;

            // Calculate SNF %
            const snfPercent = (snfKg / qtyDispatched) * 100;
            document.getElementById("snfPercent").value = snfPercent.toFixed(2);
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</asp:Content>

