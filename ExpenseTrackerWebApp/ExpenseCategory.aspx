<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExpenseCategory.aspx.cs" Inherits="ExpenseTrackerWebApp.ExpenseCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="uname" runat="server">
    <asp:Label ID="lbl_Username" runat="server" Text="Label"></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="col-10 mx-auto px-3">
    <div class="mt-3">

        <div class="row justify-content-center mt-4 mb-5">

            <div class="col-8 px-3 mb-4 text-center">
              <h2>Expenses by Category</h2>
          </div>

          <div class="card col-8 px-3 mb-4">
              <div class="card-body justify-content-between align-items-center d-flex">
                <h5 class="card-title">Food</h5>         
                <asp:Label ID="food" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
            
          <div class="card col-8 px-3 mb-4">
              <div class="card-body justify-content-between align-items-center d-flex">
                <h5 class="card-title">Rent</h5>        
                <asp:Label ID="rent" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>

          <div class="card col-8 px-3 mb-4">
              <div class="card-body justify-content-between align-items-center d-flex">
                <h5 class="card-title">Travel</h5>        
                <asp:Label ID="travel" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
           
          <div class="card col-8 px-3 mb-4">
              <div class="card-body justify-content-between align-items-center d-flex">
                <h5 class="card-title">Entertainment</h5>        
                <asp:Label ID="ent" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>

          <div class="card col-8 px-3">
              <div class="card-body justify-content-between align-items-center d-flex">
                <h5 class="card-title">Misc</h5>       
                <asp:Label ID="misc" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
            </div>
          
      </div>
        </div>

</asp:Content>
