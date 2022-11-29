<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddDuration.aspx.cs" Inherits="AdminPages_Duration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class ="container " style="color:white">
    <br /><br />
    <br /><br />
        <div class ="form-horizontal ">
        <h2>Add Duration</h2>
        <hr />
            <div class ="form-group">
                <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="DurationName"></asp:Label>
                   
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtDuration" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDurationName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Duration name" ControlToValidate="txtDuration" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
            </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-4 ">
                        <asp:Button ID="btnAddDuration" CssClass ="btn btn-success " runat="server" Text="Add" OnClick="btnAddDuration_Click" /> 
                    </div>

                </div>
        </div>

        <h1>Duration</h1>
        <hr />

        <div class="panel panel-default" style="color:black">
            <div class="panel-heading"> All Duration</div>

            <asp:repeater ID="rptrDuration" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Duration</th>
                    </tr>
                </thead>
            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                 <th><%# Eval("DurationID") %> </th>
                 <td><%# Eval("DurationName") %>   </td>
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

