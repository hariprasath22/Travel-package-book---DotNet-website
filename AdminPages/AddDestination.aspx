<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDestination.aspx.cs" Inherits="AdminPages_AddDestination" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container" style="color:white">
    <br /><br />
    <br /><br />
        <div class ="form-horizontal">
        <h2>Add Destination</h2>
        <hr />
            <div class ="form-group">
                <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="DestinationName"></asp:Label>
                   
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtDestination" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDestinationName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Destination name" ControlToValidate="txtDestination" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
            </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-4 ">
                        <asp:Button ID="btnAddDestination" CssClass ="btn btn-success " runat="server" Text="Add" OnClick="btnAddDestination_Click" /> 
                    </div>

                </div>
        </div>

        <h1>Destination</h1>
        <hr />

        <div class="panel panel-default" style="color:Black">
            <div class="panel-heading"> All Package Destination</div>

            <asp:repeater ID="rptrDestination" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Destination</th>
                    </tr>
                </thead>
            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                 <th><%# Eval("DestinationID") %> </th>
                 <td><%# Eval("DestinationName") %>   </td>
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

