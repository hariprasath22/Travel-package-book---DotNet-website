<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> PlanYourTrip</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge"/>
    <link href="css/Custome.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>

    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnBookings").click(function myfunction() {
                window.location.href = "UserPages/MyBookings.aspx";
            });
        });

    </script>

</head>
<body class ="bg" style="background-image:url('../ImgSlider/Baner_7.jpg');">
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
                    <a class="navbar-brand" href="Default.aspx"><span><img src="icons/1.jpg" alt="Plan My Trip" height="30" /></span>PlanYourTrip</a>
                </div>

                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="Default.aspx">Home</a></li>
                        <li><a href="https://en.wikipedia.org/wiki/Tourism">About</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tours<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li> <a href ="UserPages/AllPackages.aspx">All Packages</a></li>
                            </ul>
                        </li>
                        <li>
                            <button id="btnBookings" class="btn btn-primary navbar-btn " type="button">
                                 <span class="badge " id="pCount" runat="server">0</span>
                            </button>
                        </li>
                        <li id="btnSignIn" runat="server"><a href="UserPages/SignIn.aspx">Login</a></li>
                        <li id="btnSignUp" runat="server"><a href="UserPages/SignUp.aspx">Register</a></li>
                        <li>
                            <asp:Button ID="btnLogout" CssClass="btn btn-default navbar-btn" runat="server" Text="Sign Out" OnClick="btnLogout_Click"/>
                        </li>
                    </ul>

                </div>
            </div>

        </div>
        <!---Footer Content Start---->
        <div class="clear"></div>
            <hr />
            <footer class="footer-pos">
                <div class="container">
                    <p class ="pull-right "><a href ="#">&nbsp; &nbsp; Back to top &nbsp; &nbsp;</a></p>
                    <p class ="pull-right "><a href="UserPages/SignIn.aspx"> Admin Login  </a></p>  
                    <p>&copy;PlanYourTrip &middot;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </p>
                </div>

            </footer>
        <!---Footer Content End---->
    </div>
    </form>
</body>
</html>
