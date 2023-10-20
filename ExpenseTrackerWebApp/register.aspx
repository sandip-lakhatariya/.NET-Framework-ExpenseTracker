<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ExpenseTrackerWebApp.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
            border-radius:8px;
        }
        input[type=text], input[type=password], input[type=email] {
            font-size:18px;
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
            letter-spacing: 0.1rem;
        }
        button:hover {
            opacity: 0.8;
        }
        .rgnbtn {
            background-color: dodgerblue;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 50%;
            border-radius:3px;
        }
        .container {
            padding: 16px;
            width: 469px;
        }
        span.psw {
            float: right;
            padding-top: 16px;
        }
        /* Change styles for span and cancel button on extra small screens */
        @media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }
            .cnbtn {
                width: 100%;
            }
        }
        .frmalg {
            margin: auto;
            width: 40%;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server" class="frmalg">
        <div class="container">
            <center>
                <p style="letter-spacing: 0.05rem; font-size:35px; display:flex; justify-content:center;">
                    <img src="assets/smart-wallet.png" style="margin-right:12px" alt="Logo" width="35" height="35"/>
                    Expense Tracker
                 </p>
                <p style="font-size:20px; letter-spacing: 0.05rem;">Register yourself here</p>
            </center>
            <asp:Label ID="lbl_ErrorUsername" style="letter-spacing: 0.05rem;" runat="server" ForeColor="#FF3300" Text="username is already taken !"></asp:Label>
            <br />
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblUsername" runat="server" Font-Bold="True" Font-Names="Arial" Text="Username :"></asp:Label>
            </b></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label for="uname"><b>
            <label for="psw">
            <asp:RequiredFieldValidator ID="rq_username" style="letter-spacing: 0.05rem;" runat="server" ControlToValidate="txt_Username" ErrorMessage="username required !" ForeColor="Red"></asp:RequiredFieldValidator>
            </label>
            &nbsp;</b></label><asp:TextBox runat="server" ID="txt_Username" placeholder="Enter Username"></asp:TextBox>
            <br />
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblEmail" runat="server" style="letter-spacing: 0.05rem;" Font-Bold="True" Font-Names="Arial" Text="Email :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rq_email" runat="server" ControlToValidate="txt_Email" ErrorMessage="email required !" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:TextBox runat="server" ID="txt_Email" TextMode="Email" placeholder="Enter Username"></asp:TextBox>
            </b></label>
            <br />
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblPassword" runat="server" Font-Bold="True" Font-Names="Arial" Text="Password :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rq_password" runat="server" ControlToValidate="txt_Password" ErrorMessage="password required !" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</b></label><asp:TextBox runat="server" ID="txt_Password" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button runat="server" ID="btn_Register" CssClass="rgnbtn" Text="Register" OnClick="btn_Register_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hl_Login" runat="server" ForeColor="#0000CC" NavigateUrl="~/login.aspx">Login here !</asp:HyperLink>
            <br />
        </div>
    </form>
</body>
</html>
