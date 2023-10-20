<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="ExpenseTrackerWebApp.dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="uname" runat="server">
    <asp:Label ID="lbl_Username" runat="server" Text="Label"></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class ="col-10 mx-auto px-3">
    <div class="mt-3">

        <div class="row justify-content-center">
            <div class="col-10">
                <asp:Button ID="btn_AddNewExpense" CssClass=" btn w-100 btn-primary" runat="server" Text="Add New Expense" OnClick="btnAddNewExpense_Click" />
            </div>
            
        </div>

        <div class="row justify-content-center mt-4 ">
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Current Month's Total</h5>         
                <asp:Label ID="lbl_DataCMT" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
            
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Last Month's Total</h5>        
                <asp:Label ID="lbl_DataLMT" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
        </div>

        <div class="row justify-content-center mt-4">
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Daily Average Of Current Month</h5>        
                <asp:Label ID="lbl_DataCDA" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
           
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Daily Average Of Last Month</h5>        
                <asp:Label ID="lbl_DataLDA" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
        </div>

         <div class="row justify-content-center mt-4">
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Highest Expense Category</h5>       
                <asp:Label ID="lbl_DataHC" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
           
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Lowest Expense Category</h5>       
                <asp:Label ID="lbl_DataLC" CssClass="card-text" runat="server" Text="Travel"></asp:Label>
              </div>
          </div>
        </div>

        <div class="row justify-content-center mt-4 mb-5">
          <div class="card col-5 px-3 mx-3">
              <div class="card-body">
                <h5 class="card-title">Total Till Now</h5>       
                <asp:Label ID="lbl_DataTotal" CssClass="card-text" runat="server" Text="Label"></asp:Label>
              </div>
          </div>
        </div>
      </div>
    </div>

</asp:Content>
