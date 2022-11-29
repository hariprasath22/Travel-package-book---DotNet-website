<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AddPerson.aspx.cs" Inherits="AdminPages_AddPersonaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class ="container " style="color:white">
    <br /><br />
    <br /><br />
        <div class ="form-horizontal ">
        <h2>Add Package Category</h2>
        <hr />
            <div class ="form-group">
                <asp:Label ID="Label1" CssClass ="col-md-2 control-label " runat="server" Text="Package Category"></asp:Label>
                   
                    <div class ="col-md-3 ">
                        <asp:TextBox ID="txtPerson" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPersonName" runat="server" CssClass ="text-danger " ErrorMessage="*plz Enter Package Category" ControlToValidate="txtPerson" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
            </div>

                <div class ="form-group">
                    <div class ="col-md-2 "> </div>
                    <div class ="col-md-4 ">
                        <asp:Button ID="btnAddPerson" CssClass ="btn btn-success " runat="server" Text="Add" OnClick="btnAddPerson_Click" /> 
                    </div>

                </div>
        </div>

    <h1>Package Category</h1>
    <hr />

        <div class="panel panel-default" style="color:black">
            <div class="panel-heading"> All Package Category</div>

            <asp:repeater ID="rptrPerson" runat="server">

         <HeaderTemplate>
             <table class="table">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Package Category</th>
                    </tr>
                </thead>
            <tbody>
         </HeaderTemplate>


         <ItemTemplate>
             <tr>
                 <th><%# Eval("PersonID") %> </th>
                 <td><%# Eval("PersonName") %>   </td>
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

