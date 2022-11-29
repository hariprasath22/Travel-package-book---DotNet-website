<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/UserMasterPage.master" AutoEventWireup="true" CodeFile="ViewPackages.aspx.cs" Inherits="UserPages_ViewPackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br /><br />
    <button id="btnBooking" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnBooking_ServerClick" type="button">
                        Booking <span id="BookingBadge" runat="server" class="badge">0</span>
    </button>
    <br />
    <div style="padding-top:50px">
         <div id="divSuccess" runat="server" class="alert alert-success alert-dismissible fade in h4">
             <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
             <strong>Success! </strong>Package successfully added to Booking. <a href="MyBookings.aspx">View Bookings</a>
         </div>
         <div class="col-md-6">
            <div style="max-width:600px" class="thumbnail">
                
                             <%--   for proImage slider--%>

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    <li data-target="#carousel-example-generic" data-slide-to="4"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">

      <asp:repeater ID="rptrImage" runat="server">
          <ItemTemplate>
    <div class="item <%# GetActiveImgClass(Container.ItemIndex) %>">
      <img style="height:350px;width:600px;" src="../PackageImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" >
    </div>
          </ItemTemplate>
    </asp:repeater>


  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

              <%--  for proimage slider ending--%>

            </div>
        </div>

        <div class="col-md-5">
            <asp:Repeater ID="rptrPackageDetails" runat="server">
            <ItemTemplate>

            <div class="divDet1" style="color:red">
                <h1 class="packNameView"><%# Eval("PName") %> </h1>
                <span class="packOgPriceView">Rs.<%#Eval("PPrice","{0:c}") %></span><span class="packPriceDiscountView">Off Rs.<%# string.Format("{0}",Convert.ToInt64(Eval("PPrice"))-Convert.ToInt64(Eval("PDisPrice"))) %></span><p class="packPriceView">Rs. <%#Eval("PDisPrice","{0:c}") %></p>
            </div>

            <div class="divDet1">
                <asp:button ID="btnBookNow" CssClass="mainButton" runat="server" text="BOOK NOW" OnClick="btnBookNow_Click" />
            </div>

            <div class="divDet1" style="color:white">
                <h5 class="h5size"> Destination</h5>
                <p>   <%#Eval("DestinationName") %> </p>
            
                <h5 class="h5size"> Package Details</h5>
                <p>   <%#Eval("Details") %> </p>
            
                <h5 class="h5size"> Package Category</h5>
                <p> <%#Eval("Person") %></p>
            
                <h5 class="h5size"> Duration</h5>
                <p> <%#Eval("Duration") %></p>

                <h5 class="h5size"> Tour Details</h5>
                <p> <%#Eval("PDescription") %></p>
            </div><br /><br /><br /><br />

            </ItemTemplate>
            </asp:Repeater>

        </div>
    </div>
</asp:Content>

