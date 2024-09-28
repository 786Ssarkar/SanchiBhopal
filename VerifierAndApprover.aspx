<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VerifierAndApprover.aspx.cs" Inherits="VerifierAndApprover" %>

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
    <fieldset>
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
                                    <table class="table table-bordered text-center">
                                        <thead>
                                            <tr>
                                                <th rowspan="2">Name of Unit
                                                </th>
                                                <th colspan="3">Milk</th>
                                                <th colspan="2">White Butter</th>
                                                <th colspan="2">Skimmed Milk Powder</th>
                                                <th rowspan="2">Action</th>
                                            </tr>
                                            <tr>
                                                <th>Quantity</th>
                                                <th>Fat %</th>
                                                <th>SNF %</th>
                                                <th>Quantity</th>
                                                <th>Stock</th>
                                                <th>Quantity</th>
                                                <th>Stock</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>BMC Bhopal</td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 166390" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 5.9%" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 8.15%" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <button type="button" class="Alert-Verify">
                                                        <i class="fas fa-check"></i>Verify
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Ashta</td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 8749" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 4.59%" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 8.09%" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <button type="button"  class="Alert-Verify">
                                                        <i class="fas fa-check"></i>Verify
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Narsinghgarh</td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 621" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 5.56" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 8.51" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <input type="text" class="form-control" placeholder=" 0" /></td>
                                                <td>
                                                    <button type="button" class="Alert-Verify">
                                                        <i class="fas fa-check"></i>Verify
                                                    </button>
                                                </td>
                                            </tr>
                                            <tr></tr>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>

</asp:Content>

