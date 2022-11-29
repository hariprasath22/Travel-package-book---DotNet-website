<%@ Page Title="" Language="C#" MasterPageFile="~/AdminPages/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditPackage.aspx.cs" Inherits="AdminPages_EditPackage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<br />
<br />
    <div class="container " style="color:white">
    <h2>Update/Delete Package</h2>
    <hr />
    </div>
<div class="container" style="color:white">
    <div class="row">
         <div class ="col-md-6"> 

         <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label>Enter ID:</label>
                    <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtID_TextChanged"></asp:TextBox> 
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label>Enter Name:</label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" AutoPostBack="true" OnTextChanged="txtName_TextChanged"></asp:TextBox> 
                </div>
            </div>



             <div class="col-md-6">
                <div class="form-group">
                    <label>Enter Package Name:</label>
                    <asp:TextBox ID="txtUpdatePackageName" CssClass="form-control" runat="server" AutoPostBack="true"></asp:TextBox> 
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Enter Price:</label>
                    <asp:TextBox ID="txtUpdatePrice" CssClass="form-control" runat="server" AutoPostBack="true"></asp:TextBox> 
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Enter Discount Price:</label>
                    <asp:TextBox ID="txtUpdateDisPrice" CssClass="form-control" runat="server" AutoPostBack="true"></asp:TextBox> 
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Choose Destination:</label>
                    <asp:DropDownList ID="ddlUpdateDestination" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Choose Duration:</label>
                    <asp:DropDownList ID="ddlUpdateDuration" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Choose Package Detail:</label>
                    <asp:DropDownList ID="ddlUpdateDetail" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                </div>
            </div>

             <div class="col-md-6">
                <div class="form-group">
                    <label>Choose Package Category:</label>
                    <asp:DropDownList ID="ddlUpdatePerson" CssClass="form-control" runat="server" AutoPostBack="true" ></asp:DropDownList>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="form-group">
                    <label>Enter Description:</label>
                    <asp:TextBox ID="txtUpdateDescription" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
         
                <div class="form-group">
                    <asp:Button ID="btnUpdatePackage" CssClass ="btn btn-primary " runat="server" Text="UPDATE" OnClick="btnUpdatePackage_Click" />
                </div>

                <div class="form-group">
                    <asp:Button ID="btnDeletePackage" CssClass ="btn btn-primary " runat="server" Text="DELETE" OnClick="btnDeletePackage_Click" />
                </div>
            </div>
        
         </div>    
          </div>    
          <div class="col-md-12" style="color:black">
          
             <div class="row">
                <div class="col-md-12">
                <h4 class="alert-info text-center"> All Packages</h4>
                <br />
                 <asp:TextBox ID="txtFilterGrid1Record" style="border:2px solid blue" CssClass="form-control" runat="server" placeholder="Search Package...." onkeyup="Search_Gridview(this)"></asp:TextBox>
                <hr />
                   <div class="table table-responsive">
                       <asp:GridView ID="GridView1" CssClass="table table-condensed table-hover" runat="server" EmptyDataText="Record not found...">
                       </asp:GridView>
                   </div>
                </div>
             </div>
          </div>

 </div>

 </div>

<script type="text/javascript">
     function Search_Gridview(strKey) {
         var strData = strKey.value.toLowerCase().split(" ");
         var tblData = document.getElementById("<%=GridView1.ClientID %>");
         var rowData;
         for (var i = 1; i < tblData.rows.length; i++) {
             rowData = tblData.rows[i].innerHTML;
             var styleDisplay = 'none';
             for (var j = 0; j < strData.length; j++) {
                 if (rowData.toLowerCase().indexOf(strData[j]) >= 0)
                     styleDisplay = '';
                 else {
                     styleDisplay = 'none';
                     break;
                 }
             }
             tblData.rows[i].style.display = styleDisplay;
         }
     }  
</script>

</asp:Content>

