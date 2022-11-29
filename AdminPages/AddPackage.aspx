<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddPackage.aspx.cs" Inherits="AdminPages_AddPackage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container" style="color:white">
       <div class ="form-horizontal">
           <br /><br />
           <br /><br />
           <h2>Add Package</h2>
           <hr />

           <div class ="form-group">
               <asp:Label ID="Label1" runat="server" CssClass ="col-md-2 control-label" Text="Package Name"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPackageName" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label2" runat="server" CssClass ="col-md-2 control-label" Text="Destination"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlDestination" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label3" runat="server" CssClass ="col-md-2 control-label" Text="Duration"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlDuration" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label11" runat="server" CssClass ="col-md-2 control-label" Text="Package Category"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlPerson" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label4" runat="server" CssClass ="col-md-2 control-label" Text="Package Details"></asp:Label>
               <div class ="col-md-3">
                   <asp:DropDownList ID="ddlDetail" CssClass ="form-control" runat="server"></asp:DropDownList>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label5" runat="server" CssClass ="col-md-2 control-label" Text=" Price"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label6" runat="server" CssClass ="col-md-2 control-label" Text="Discount Price"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtDiscountPrice" CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label7" runat="server" CssClass ="col-md-2 control-label" Text="Description"></asp:Label>
               <div class ="col-md-3">
                   <asp:TextBox ID="txtDescription" TextMode ="MultiLine"  CssClass ="form-control" runat="server"></asp:TextBox>
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label8" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg01" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label9" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg02" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label10" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fuImg03" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label12" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fulImg04" CssClass ="form-control" runat="server" />
               </div>
           </div>

           <div class ="form-group">
               <asp:Label ID="Label13" runat="server" CssClass ="col-md-2 control-label" Text="Upload Image"></asp:Label>
               <div class ="col-md-3">
                   <asp:FileUpload ID="fulImg05" CssClass ="form-control" runat="server" />
               </div>
           </div>

         
           <div class ="form-group">
               <div class ="col-md-2 "> </div>
                    <div class ="col-md-6 ">
                        <asp:Button ID="btnAdd" CssClass ="btn btn-success " runat="server" Text="ADD Package" OnClick="btnAdd_Click" />
                    </div>
            </div>

       </div>

       </div>

</asp:Content>

