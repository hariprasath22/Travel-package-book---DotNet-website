<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="UserPages_SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign In</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge"/>
    <link href="../css/Custome.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class ="bg" style="background-image:url('../ImgSlider/sign.jpg');">
    <form id="form1" runat="server">
        <div>
            <div class ="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse" >
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="Default.aspx"><span><img src="../icons/1.jpg" alt="PlanYourTrip" height="30" /></span>PlanYourTrip</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../Default.aspx">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="SignUp.aspx">Register</a></li>
                    </ul>
                </div>

            </div>
        </div>
     </div>

        <!-- Sign In Page Starts-->
        <div>
             <br /><br /><br />
        <div class ="container" style="color:white;text-align:center;">
            <div class ="form-horizontal ">
                <br /><br />
                <h2>Login</h2>
                <hr />

                <div class ="form-group" style="font-size:20px;text-align:center;">
                    <asp:Label ID="Label1" CssClass ="col-md-5 control-label " runat="server" Text="UserName"></asp:Label>
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" runat="server" CssClass ="text-danger " ErrorMessage="*please enter Username" ControlToValidate="txtUsername" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class ="form-group" style="font-size:20px;text-align:center;">
                    <asp:Label ID="Label2" CssClass ="col-md-5 control-label " runat="server" Text="Password"></asp:Label>
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="*the password field is required" ControlToValidate="txtPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class ="form-group" style="font-size:17px">
                    <div class ="col-md-2 "></div>
                    <div class ="col-md-8 ">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" CssClass ="control-label " runat="server" Text="Remember me"></asp:Label>
                    </div>
                </div>

                <div class ="form-group" style="font-size:17px">
                    <div class ="col-md-2 "></div>
                    <div class ="col-md-8 ">
                        <asp:Button ID="btnLogin" CssClass ="btn btn-success " runat="server" Text="Login&raquo;" OnClick="btnLogin_Click" />
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/UserPages/SignUp.aspx">Sign Up</asp:HyperLink>
                    </div>
                </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-8 ">
                        <asp:Label ID="lblError" CssClass ="text-danger " runat="server" ></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!-- Sign In Page Ends-->

        <!---Footer Content Start---->
        <footer class="footer-pos">
            <div class="container">
                <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p> 
                <p>&copy;2022 Plan My Trip.in &middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="../Default.aspx">Home&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    <a href ="#">About&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    <a href ="#">Packages</a>
                </p>
            </div>
        </footer>
        <!---Footer Content End---->
    </form>
</body>
</html>
