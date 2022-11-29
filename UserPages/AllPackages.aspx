<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/UserMasterPage.master" AutoEventWireup="true" CodeFile="AllPackages.aspx.cs" Inherits="UserPages_AllPackages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br /><br /><br />
    <h3 style="text-align:center;color:white;font-weight:600;font-size:22px">All Packages</h3>

    <div class="row" style="padding:0 80px;opacity:95%">
      <hr />
        
        <asp:Repeater ID="rptrAllPackages" runat="server">
        <ItemTemplate>
        <div class="col-sm-5 col-lg-4">
            
            <div class="thumbnail">              
              <img style="height:200px;width:350px;padding:5px 0;" src ="../PackageImages/<%# Eval("PID") %>/<%# Eval("ImageName") %><%# Eval("Extention") %>" alt="<%# Eval("ImageName") %>"/>
              <a href="ViewPackages.aspx?PID=<%# Eval ("PID") %>" style="text-decoration:none;">
                <div class="caption"> 
                   <div class="packDestination"><%# Eval ("DestinationName") %>  </div>
                   <div class="packName"> <%# Eval ("PName") %> </div>
                    <div class="packDetails"> <%# Eval ("Details") %> </div>
                    <div class="packDurationPerson"> <%# Eval ("Duration") %> <%# Eval ("Person") %></div>
                   <div class="packPrice"> <span class="packOgPrice" > <%# Eval ("PPrice","{0:0,00}") %> </span> <%# Eval ("PDisPrice","{0:c}") %> <span class="packPriceDiscount"> (<%# Eval("DiscAmount","{0:0,00}") %> off) </span></div>    
                </div>
                </a>
            </div>
        </div>
               
       </ItemTemplate>
       </asp:Repeater>
    </div><br /><br /><br /><br />

</asp:Content>

