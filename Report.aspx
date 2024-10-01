<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <div class="card-header pb-0 px-3 d-flex">
            <h6 class="col mb-0">Demand/ Sale/ Manufacturing Details</h6>
            <div class="col text-end">
                <button id="ExcelBtn" class="btn bg-gradient-info" onclick="exportToExcel()" type="button">Export Excel</button>
            </div>
        </div>
        <div class="card-body p-5">
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
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Demand">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblDemand" Text='<%# Eval("Demand") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sales">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSales" Text='<%# Eval("Sales") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Manufacturing">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblManufacturing" Text='<%# Eval("Manufacturing") %>'></asp:Label>

                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                        <%--<table class="table table-bordered text-center">
                     <thead>
                         <tr class="nowrap">
                             <th>Sr. No</th>
                             <th>Item Name</th>
                             <th>Quantity</th>
                             <th>Advanced Card</th>

                         </tr>
                     </thead>
                     <tbody id="TblBody">
                         <tr>
                             <td>1.</td>
                             <td>Standard 500ML</td>
                             <td>
                                 <input type="text" class="form-control" placeholder=" 0" /></td>
                             <td>
                                 <input type="text" class="form-control" placeholder=" 0" disabled /></td>
                         </tr>
                         <tr></tr>
                     </tbody>

                 </table>--%>
                    </div>
                </div>

            </div>

        </div>
    </div>
    <script>
        function exportToExcel() {

            // Get the GridView element
            var gridView = document.getElementById('<%= grdItems.ClientID%>');

            // Initialize CSV string with header
            var csv = 'data:text/csv;charset=utf-8,';
            csv += Array.from(gridView.querySelectorAll('th')).map(th => th.innerText).join(',') + '\n';

            // Iterate through rows
            gridView.querySelectorAll('tr').forEach(row => {
                // Iterate through cells
                csv += Array.from(row.querySelectorAll('td')).map(td => td.innerText).join(',') + '\n';
            });

            // Create a download link and trigger download
            var encodedUri = encodeURI(csv);
            var link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'grdItems.csv');
            document.body.appendChild(link);
            link.click();


        }
    </script>
</asp:Content>

