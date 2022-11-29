<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/UserMasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="UserPages_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <div class="container" style="color:white;font-size:20px;padding-top:50px;text-align:center">
            <h2 class="center">Your Profile </h2>
            <div class="row" style="padding-top:10px">
            <div class="col-s-12">
                <div class="form-group">
                    <label>User Name:
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" ></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorName" CssClass ="text-danger " runat="server" ErrorMessage="No Space or Speacial characters and between 8-25 character " ValidationExpression="^([a-zA-Z0-9]{8,25})*$" ControlToValidate="txtUserName" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </label>
                </div>
            </div>

             <div class="col-s-12">
                <div class="form-group">
                    <label>Password
                    <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" MaxLength="10"></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorPass" CssClass ="text-danger " runat="server" ErrorMessage="No Special characters and between 6-10 characters " ValidationExpression="^([\sa-zA-Z0-9]{6,10})*$" ControlToValidate="txtPass" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </label>
                </div>
            </div>

            <div class="col-s-12">
                <div class="form-group">
                    <label>Full Name
                    <asp:TextBox ID="txtFullName" CssClass="form-control" runat="server" ></asp:TextBox> 
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorFullName" CssClass ="text-danger " runat="server" ErrorMessage="No numbers,speacial characters and not longer than 35 letters " ValidationExpression="^([\sa-zA-Z]{3,35})*$" ControlToValidate="txtFullName" ForeColor="Red" Font-Size="X-Small"></asp:RegularExpressionValidator>
                    </label>
                </div>
            </div>

            <div class="col-s-12">
                <div class="form-group">
                    <label>Email
                    <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server" TextMode="Email" ></asp:TextBox> 
                    </label>
                </div>
            </div>

            <div class="col-s-12">
                <div class="form-group">
                    <asp:Button ID="btnUpdateProfile" CssClass ="btn btn-primary " runat="server" Text="UPDATE" OnClick="btnUpdateProfile_Click" />
                </div>
            </div><br />

            </div>
        </div>
    </div>

</asp:Content>

