<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TargetDetails.aspx.cs" Inherits="TargetDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            ADD Target
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Item <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" required="required">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="Milk" Value="Milk" />
                            <asp:ListItem Text="Product" Value="Product" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="date-picker" class="text-dark text-lg">Target Date</label>
                        <div class="col-md-10">
                            <input type="date" id="Txtdate" runat="server" class="form-control" required="required">
                            <script> document.getElementById('<%= Txtdate.ClientID%>').value = currentDate;</script>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <%--<button type="button" id="AddButton" class="Alert-Confirmation btn btn-outline-success btn-border  w-lg" onclick="document.getElementById('FS_Details').style.display = 'block'" runat="server">ADD</button>--%>
                    <asp:Button CssClass="Alert-Confirmation btn btn-outline-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnAdd" Text="Add" OnClick="BtnAdd_Click" />
                    <a href="TargetDetails.aspx" class="btn btn-outline-danger btn-border w-lg">Clear</a>
                </div>
            </div>

            <fieldset id="FS_Details" runat="server">
                <div class="row">
                    <div class="col-12">
                        <div class="table-responsive ps">
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
                                            <asp:HiddenField runat="server" ID="lblItemId" Value='<%# Eval("ItemId") %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Target">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTarget" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cumulative ">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtCumulative" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Absolute">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtAbsolute" Text="0"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Average Growth Percentage">
                                        <ItemTemplate>
                                            <asp:TextBox runat="server" CssClass="form-control" ID="txtPerc" Text="0"></asp:TextBox>
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
                    <div class="col-12 mt-4">
                        <div class="row justify-content-center">
                            <div class="col-md-5 text-center">
                                <asp:Button Text="Submit" class="mb-0 btn bg-gradient-success" runat="server" ID="BtnSubmit" OnClick="BtnSubmit_Click"/>
                                <%-- <button type="button" class="Alert-Save  mb-0 btn bg-gradient-success">Submit</button>--%>

                                <a href="TargetDetails.aspx" class=" mb-0 btn bg-gradient-warning">Clear</a>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>


</asp:Content>

