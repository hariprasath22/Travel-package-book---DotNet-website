<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDetails.aspx.cs" Inherits="AddDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container " style="color:white">
    <br /><br />
    <br /><br />
        <div class ="form-horizontal ">
        <h2>Add Package Details</h2>
        <hr />
            <div class ="form-group">
                <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="Package Details"></asp:Label>
                   
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtDetail" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDetailsName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Package Details" ControlToValidate="txtDetail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
            </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-4 ">
                        <asp:Button ID="btnAddDetails" CssClass ="btn btn-success " runat="server" Text="Add" OnClick="btnAddDetails_Click" /> 
                    </div>

                </div>
        </div>

    <h1>Package Details</h1>
    <hr />

        <div class="panel panel-default" style="color:black">
            <div class="panel-heading"> All Package Details</div>

            <asp:repeater ID="rptrDetail" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Package Details</th>
                    </tr>
                </thead>
            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                 <th><%# Eval("DetailID") %> </th>
                 <td><%# Eval("DetailName") %>   </td>
             </tr>
         </ItemTemplate>


         <FooterTemplate>
             </tbody>

              </table>
         </FooterTemplate>

     </asp:repeater>
   
    </div> <hr />

    </div>

</asp:Content>

