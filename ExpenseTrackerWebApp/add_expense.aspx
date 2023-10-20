<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="add_expense.aspx.cs" Inherits="ExpenseTrackerWebApp.add_expense" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="uname" runat="server">
    <asp:Label ID="lbl_Username" runat="server" Text="Label"></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div ID="AddExpense" class="col-8 mx-auto my-3 p-3">
    <div class="row g-3">
        <h3>Add New Expense</h3>

      <div class="col-md-6">
        <label for="inputTitle" class="form-label">Title</label>
          <asp:TextBox ID="inputTitle" CssClass="form-control" runat="server"></asp:TextBox>
      </div>

      <div class="col-md-6">
        <label for="inputAmout" class="form-label">Amout</label>
        <asp:TextBox ID="inputAmout" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>

      </div>

      <div class="col-md-6">
        <label for="inputCategory" class="form-label">Category</label>
          <asp:DropDownList ID="inputCategory" CssClass="form-select" runat="server">
            <asp:ListItem Selected="True">Food</asp:ListItem>
              <asp:ListItem>Rent</asp:ListItem>
              <asp:ListItem>Travel</asp:ListItem>
              <asp:ListItem>Entertainment</asp:ListItem>
              <asp:ListItem>Misc</asp:ListItem>
          </asp:DropDownList>
   
      </div>

      <div class="col-md-6">
        <label for="inputDate" class="form-label">Date</label>
          <asp:TextBox ID="inputDate" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
      </div>
      <div class="col-12">
          <asp:Button ID="btnAddExpense" CssClass=" btn btn-primary float-end mt-3" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: 1.25rem; --bs-btn-font-size: 1.2rem;" runat="server" Text="Button" OnClick="btnAddExpense_Click" />
      </div>
        
        </div>
        </div>
</asp:Content>