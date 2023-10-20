<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="history.aspx.cs" Inherits="ExpenseTrackerWebApp.history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="uname" runat="server">
    <asp:Label ID="lbl_Username" runat="server" Text="Label"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="col-6 mx-auto my-3 p-3">

        <div class="row g-3">
            <div class="col-md-5 d-flex align-items-center">
                <label for="FromDate" class="form-label me-3">From:</label>
                <asp:TextBox ID="FromDate" CssClass="form-control" runat="server" TextMode="Date" required></asp:TextBox>
            </div>

            <div class="col-md-5 d-flex align-items-center">
                <label for="inputAmout" class="form-label me-3">To:</label>
                <asp:TextBox ID="ToDate" CssClass="form-control" runat="server" TextMode="Date" required></asp:TextBox>
            </div>

            <div class="col-md-2">
                <asp:Button ID="customDate" CssClass=" btn btn-primary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1.25rem; --bs-btn-font-size: 1.2rem;" runat="server" Text="Get" OnClick="btnShowHistory_Click" />
            </div>
        </div>

    </div>

    <asp:Panel ID="NotFound" runat="server">
        <h2 class="text-center">Expense Not Found</h2>
    </asp:Panel>

    <div id="DivToPrint" runat="server">
        <asp:GridView class=" mx-auto my-5" Width="900px" ID="ExpenseView" runat="server" CellPadding="6" ForeColor="#333333" BorderColor="#212529" BorderStyle="Solid" BorderWidth="3px" GridLines="None" OnSelectedIndexChanged="ExpenseView_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="#F8F9FA" ForeColor="#333333" />
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#212529" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E2E3E5" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
    </div>

        <div class="col-8 mx-auto my-3">

            <div class="row">
                <div class="col-md-12 d-flex justify-content-end align-items-center">
                    <label for="FromDate" class="form-label me-3">Download All Expenses:</label>
                    <asp:Button ID="Export" CssClass=" btn btn-outline-secondary" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1.25rem; --bs-btn-font-size: 1.2rem;" runat="server" Text="Download" OnClick="Export_Click" />
                </div>
            </div>

        </div>

</asp:Content>

