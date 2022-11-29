<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="AdminPages_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br /><br /><br /><br />
    <div class="container " style="color:white">
        <h2>Welcome Admin!</h2>
        <hr />
        <div style="padding-left:100px;font-size:17px;text-decoration:none;">
        <button><a href="AddDestination.aspx">Add Destination</a></button><br /><br />
        <button><a href="AddDuration.aspx">Add Duration</a></button><br /><br />
        <button><a href="AddDetails.aspx">Add Package Details</a></button><br /><br />
        <button><a href="AddPerson.aspx">Add Package Category</a></button><br /><br />
        <button><a href="AddPackage.aspx">Add Package</a></button><br /><br />
        <button><a href="EditPackage.aspx">Edit Package</a></button><br /><br /><br />
        </div>
    </div>

</asp:Content>

