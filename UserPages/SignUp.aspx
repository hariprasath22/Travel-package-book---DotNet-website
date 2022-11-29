<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="UserPages_SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

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
                    <a class="navbar-brand" href="Default.aspx"><span><img src="../icons/1.jpg" alt="Plan My Trip" height="30" /></span>PlanYourTrip</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="../Default.aspx">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="SignIn.aspx">Login</a></li>
                        <li class="active"><a href="SignUp.aspx">Register</a></li>
                    </ul>
                </div>

            </div>
        </div>

        </div>
        <!-- Sign Up Page Starts-->
        
        <div>
         <br /><br />
        <div class="container" style="color:white">
            <h2 class="center">Register</h2>
        <div class="center-page">
            <label class="col-s-12">User Name:</label>
            <div class="col-s-12">
            <asp:TextBox ID="txtUname" runat="server" Class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" CssClass ="text-danger " runat="server" ErrorMessage="No Space or Speacial characters and between 8-25 character " ValidationExpression="^([a-zA-Z0-9]{8,25})*$" ControlToValidate="txtUname" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
            </div>


            <label class="col-s-12">Password:</label>
            <div class="col-s-12">
            <asp:TextBox ID="txtPass" runat="server" TextMode="Password" Class="form-control" MaxLength="10" placeholder="Enter Your password"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="No Special characters and between 6-10 characters " ValidationExpression="^([\sa-zA-Z0-9]{6,10})*$" ControlToValidate="txtPass" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
            </div>


            <label class="col-s-12">Confirm Password:</label>
            <div class="col-s-12">
            <asp:TextBox ID="txtCPass" runat="server" TextMode="Password" Class="form-control" MaxLength="10" placeholder="Enter Your Confirm password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidatorPass" CssClass ="text-danger " ForeColor="Red" Font-Size="X-Small" runat="server" ErrorMessage="Does not match the password" ControlToCompare="txtPass" ControlToValidate="txtCPass"></asp:CompareValidator>
            </div>

            <label class="col-s-12">Your Full Name:</label>
            <div class="col-s-12">
            <asp:TextBox ID="txtName" runat="server" Class="form-control" placeholder="Enter Your Name"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorFullName" CssClass ="text-danger " runat="server" ErrorMessage="No numbers,speacial characters and not longer than 35 letters " ValidationExpression="^([\sa-zA-Z]{3,35})*$" ControlToValidate="txtName" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
            </div>


            <label class="col-s-12">Email:</label>
            <div class="col-s-12">
            <asp:TextBox ID="txtEmail" runat="server" Class="form-control" placeholder="Enter Your Email" TextMode="Email"></asp:TextBox>
            </div>

            <label class="col-s-12"></label>
            <div class="col-s-12">
                 <asp:Button ID="txtsignup" Class="btn btn-success" runat="server" Text="SignUp" OnClick="txtsignup_Click" />
            
                 <asp:Label ID="lblMsg" runat="server"></asp:Label>
            
            </div>
        
        </div>
        </div>
    </div>
        <!-- Sign Up Page ends-->

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
