<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ExpenseTrackerWebApp.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }
        form {
            border: 3px solid #f1f1f1;
            border-radius:8px;
        }
        input[type=text], input[type=password] {
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
        .lgnbtn {
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

    <form id="form1" runat="server" class="frmalg">

        <div class="container">
            <center>
                <p style="letter-spacing: 0.05rem; font-size:35px; display:flex; justify-content:center;">
                    <img src="assets/smart-wallet.png" style="margin-right:12px" alt="Logo" width="35" height="35"/>
                    Expense Tracker
                 </p>
                <p style="font-size:20px; letter-spacing: 0.05rem;">Sign into your account</p>
            </center>
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblUsername" style="letter-spacing: 0.05rem;" runat="server" Font-Bold="True" Font-Names="Arial" Text="Username :"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </b></label>
            <asp:RequiredFieldValidator ID="rq_username" runat="server" ControlToValidate="txt_Username" ErrorMessage="username required !" ForeColor="Red"></asp:RequiredFieldValidator>
            <label for="uname"><b>&nbsp;</b></label><asp:TextBox runat="server" ID="txt_Username" placeholder="Enter Username"></asp:TextBox>
            <br />
            <br />
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblPassword" style="letter-spacing: 0.05rem;" runat="server" Font-Bold="True" Font-Names="Arial" Text="Password :"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="rq_password" runat="server" ControlToValidate="txt_Password" ErrorMessage="password required !" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;</b></label><asp:TextBox runat="server" ID="txt_Password" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button runat="server" ID="btn_Login" CssClass="lgnbtn" Text="Login" OnClick="btn_Login_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:HyperLink ID="hl_Register" runat="server" ForeColor="#0000CC" NavigateUrl="~/register.aspx">Register here !</asp:HyperLink>
            <br />
            <br />
            <br />
            <label for="psw"><b>
            <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Names="Arial" ForeColor="Red" Text="wrong username or password !"></asp:Label>
           
            </b></label>
        </div>
    </form>
    
</body>
</html>
