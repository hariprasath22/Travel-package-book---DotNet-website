<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/UserMasterPage.master" AutoEventWireup="true" CodeFile="MyBookings.aspx.cs" Inherits="UserPages_MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<br /><br /><br />
    <button id="btnBooking" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnBooking_ServerClick" type="button">
                        Booking <span id="BookingBadge" runat="server" class="badge">0</span>
    </button>
    <br />
<div style="padding-top: 50px;">

    <div class="col-md-9">
        <h4 class="packNameViewBooking" runat="server" id="h4Noitems" style="text-align:center"></h4>
        <asp:Repeater ID="rptrBuyPackages" runat="server" OnItemCommand="rptrBuyPackages_ItemCommand">
        <ItemTemplate>
        <%--Show Booking details start--%>
        <div class="media" style="border:1px solid black;background-color:white;opacity:95%">
            <div class="media-left">
                <a href="ViewPackages.aspx?PID=<%# Eval("PID") %>" target="_blank">
                    <img class="media-object" width="150px" height="100px" src="../PackageImages/<%# Eval("PID") %>/<%# Eval("Name") %><%# Eval("Extention") %>" alt="<%# Eval("Name") %>" />
                </a>
            </div>

            <div class="media-body">
                <h4 class="media-heading packNameViewBooking"><%# Eval("PName") %></h4>
                <%--<p class="packNameView"><%#Eval("DestinationName") %></p>--%>
                <span class="packPriceView"><%#Eval("PDisPrice","{0:c}") %></span>
                <span class="packOgPriceView"><%#Eval("PPrice","{0:c}") %></span><br />
                <%--<span class="packDetails"> <%# Eval ("Details") %> </span><br />
                <span class="packDurationPerson"> <%# Eval ("Duration") %> <%# Eval ("Person") %></span>--%>
                <p>
                    <asp:button CommandArgument='<%#Eval("BookingID")%>' CommandName="Remove" ID="btnRemoveNow" CssClass="RemoveButton" runat="server" text="REMOVE PACKAGE" />
                </p>
            </div>

        </div>
        </ItemTemplate>
        </asp:Repeater>
        <%--Show Booking details Ends--%>
    </div>

    <div class="col-md-3"  runat="server" id="divAmountSect" style="background-color:white;opacity:90%">
        <%--Show Booking Price details Starts--%>
        <h5>Price Details</h5>

        <div>
            <label>Package Total</label>
            <span class="pull-right priceGray" runat="server" id="spanPackageTotal"></span>
        </div>

        <div>
            <label>Booking Total</label>
            <span class="pull-right priceGreen" runat="server" id="spanDiscountTotal" ></span>
        </div>

        <%--Show Booking Price details Ends--%>

        <div>s
            <div class="packPriceView">
                <label>Booking Discount</label>
                <span class="pull-right" runat="server" id="spanBookingsTotal"></span>
            </div>

            <div>
                <asp:button ID="btnBuy" CssClass="buyNowbtn" runat="server" text="BUY PACKAGE" OnClick="btnBuy_Click" />
            </div>

        </div>

    </div>

</div><br /><br /><br /><br />

</asp:Content>

