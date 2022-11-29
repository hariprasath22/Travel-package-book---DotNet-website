<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHome.aspx.cs" Inherits="UserPages_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Home</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge"/>
    <link href="../css/Custome.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script src="http://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
        crossorigin="anonymous">   </script>

    <script type="text/javascript">

        $(document).ready(function myfunction() {
            $("#btnBookings").click(function myfunction() {
                window.location.href = "MyBookings.aspx";
            });
        });

    </script>

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
                        <li><a href="Profile.aspx">Your Profile</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tours<b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li> <a href ="AllPackages.aspx">All Packages</a></li>
                                <li role="separator" class ="divider "></li>
                                <li> <a href ="UserHome.aspx">Your Bookings</a></li>
                            </ul>
                        </li>
                        <li>
                            <button id="btnBookings" class="btn btn-primary navbar-btn " type="button">
                                 <span class="badge " id="pCount" runat="server"></span>
                            </button>
                        </li>
                        <li>
                            <asp:Button ID="btnLogin" CssClass="btn btn-default navbar-btn" runat="server" Text="Sign Out" OnClick="btnLogin_Click" />
                            <asp:Button ID="btnLogout" CssClass="btn btn-default navbar-btn" runat="server" Text="Sign Out" OnClick="btnLogout_Click" />
                        </li>
                    </ul>
                </div>

            </div>
        </div>
     </div>

            <div>
                <br /><br /><br />
                <asp:Label ID="lblSuccess" runat="server" Font-Bold="True" Font-Size="17px" ForeColor="#FFCC00" BackColor="white" BorderColor="#FFCC00" BorderStyle="Solid" BorderWidth="3px" CssClass="btn-lg"></asp:Label>
                <div class="YourBooking" style="padding: 0 25px">
                    <h2 style="color:black;font-weight:700;text-align:center">Your bookings</h2>
                    <div class="panel panel-default">
                            <asp:repeater ID="rptrBookingHistory" runat="server">
                            <HeaderTemplate>
                                <table class="table">
                                <thead>
                                    <tr>
                                    <th>Order Number</th>
                                    <th>User Name</th>
                                    <th>Destination</th>
                                    <th>Package Name</th>
                                    <th>Duration</th>
                                    <th>Package Category</th>
                                    <th>Package Inclusion</th>
                                    <th>Amount Paid</th>
                                    <th>Date of Purchase</th>
                                    <th>Contact Number</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr>
                                    <th><%# Eval("OrderNumber") %></th>
                                    <td><%# Eval("UserName") %></td>
                                    <td><%# Eval("Destination") %> </td>
                                    <td><%# Eval("PackageName") %></td>
                                    <td><%# Eval("Duration") %></td>
                                    <td><%# Eval("PackageCategory") %></td>
                                    <td><%# Eval("PackageInclusion") %></td>
                                    <td><%# Eval("AmountPaid") %></td>
                                    <td><%# Eval("DateOfPurchase") %></td>
                                    <td><%# Eval("MobileNumber") %></td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                </tbody>
                                </table>
                                </FooterTemplate>

                            </asp:repeater>
                    </div>
                </div>
            </div><br /><br /><br /><br />

    <!---Footer Content Start---->
        <div class="clear"></div>
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
