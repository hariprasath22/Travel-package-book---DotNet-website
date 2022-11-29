<%@ Page Title="" Language="C#" MasterPageFile="~/UserPages/UserMasterPage.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="UserPages_Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:HiddenField ID="hdBookingAmount" runat="server" />
    <asp:HiddenField ID="hdBookingDiscount" runat="server" />
    <asp:HiddenField ID="hdTotalPayed" runat="server" />

    <br /><br />
    <div class ="bg" style="height:1200px;">
    <div style="padding: 0 200px ">
        <button id="btnBooking" runat="server" class="btn btn-primary navbar-btn pull-right" onserverclick="btnBooking_ServerClick" type="button">
                        Booking <span id="BookingBadge" runat="server" class="badge">0</span>
    </button>
    <br />
        <div class="col-md-8">
             <div class="form-horizontal" style="color:white">
                <h3 style="font-weight:600">PAYMENT DETAILS</h3>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="control-label" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="text-danger" runat="server" ErrorMessage="No Number or Special Character, Must be 3-25 characters !" ValidationExpression="^([\sa-zA-Z]{3,25})*$" ControlToValidate="txtName"></asp:RegularExpressionValidator>
                </div>

                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAdd" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="text-danger" runat="server" ErrorMessage="Must be 8-250 characters !" ValidationExpression="^([\sa-zA-Z0-9,\/&:#]{8,250})*$" ControlToValidate="txtAddress"></asp:RegularExpressionValidator>
                 </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="control-label" Text="Pin Code"></asp:Label>
                    <asp:TextBox ID="txtPinCode"  MaxLength="6" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPin" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPinCode"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" runat="server" ErrorMessage="Must be 6 Digit !" ValidationExpression="^([0-9]{6})*$" ControlToValidate="txtPinCode"></asp:RegularExpressionValidator>
                </div>

                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="control-label" Text="Mobile Number"></asp:Label>
                    <asp:TextBox ID="txtMobile"  MaxLength="10" TextMode="Phone" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMobile" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="text-danger" runat="server" ErrorMessage="Must be 10 Digit !" ValidationExpression="^([0-9]{10})*$" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                </div>
            </div>    
        <asp:Repeater ID="rptrPayPackages" runat="server">
        <ItemTemplate>
            
        </ItemTemplate>
        </asp:Repeater>

        <div>
            <asp:GridView ID="gvProducts" runat="server" CssClass="col-md-12"  AutoGenerateColumns="false" Visible="true" CellPadding="6"
             ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            <Columns>
                <asp:BoundField DataField="PID" HeaderText="Product ID" />
                <asp:BoundField DataField="PName" HeaderText="Product Name" />
                <asp:BoundField DataField="Qty" HeaderText="Quantity" />
            </Columns>
            </asp:GridView> 
        </div>
            <br /><br /><br /><br />
        <div class="col-md-12" style="border:5px dashed white" runat="server" id="divPriceDetails" >
             <div style="border-bottom: 1px solid #eaeaec;">
                <h3 style="font-weight:600">PRICE DETAILS</h3>
                 <hr />
                <div style="color:white">
                    <h4>Package Total Amount :
                    <span class="float-right" id="spanPTotal" runat="server"></span></h4>
                </div>
                <div style="color:white">
                    <h4>Discount Amount :
                    <span class="float-right" id="spanDisTotal" runat="server"></span></h4>
                </div>
            </div>
            
            <div>
                <div class="packPriceView" style="color:white">
                    <h4>Booking Total Amount :
                    <span class="float-right" style="font-weight:600;" id="spanBookTotal" runat="server"></span></h4>
                </div>
            </div>
        </div>
                
        <br /><br />
        <div class="col-md-7" style="color:white">
            <br />
            <h4 style="font-weight:600">PAYMENT MODE</h4>
            <hr />
            <ul class="nav nav-tabs" style="color:white">
                <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#cards" style="color:black;font-weight:600;font-size:18px">CREDIT/DEBIT CARDS</a></li>
            </ul>
             <div class="tab-content" height="15px" style="color:white">
                <div id="cards" class="tab-pane fade">
                    <h4>Enter Your Account number</h4>
                    <p><asp:TextBox ID="txtAcc"  MaxLength="16" CssClass="form-control" runat="server" TextMode="Phone"></asp:TextBox></p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorAcc" runat="server" ErrorMessage="Account Number is required" ControlToValidate="txtAcc"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" CssClass="text-danger" runat="server" ErrorMessage="Must be 16 Digit !" ValidationExpression="^([0-9]{16})*$" ControlToValidate="txtAcc"></asp:RegularExpressionValidator>

                    <h4>Enter Expiry Date</h4>
                    <p><asp:TextBox ID="txtEDate"  CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox></p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEDate" ></asp:RequiredFieldValidator>

                    <h4>Enter CVV</h4>
                    <p><asp:TextBox ID="txtCvv" MaxLength="3" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox></p>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCvv" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCvv"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" CssClass="text-danger" runat="server" ErrorMessage="Must be 3 Digit !" ValidationExpression="^([0-9]{3})*$" ControlToValidate="txtCvv"></asp:RegularExpressionValidator>

                    <asp:Button ID="btnPay" OnClick="btnPay_Click" runat="server" Text="Pay" BorderColor="White" BackColor="White" ForeColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Size="20px" />
                <br /><br /><br /><br />
                </div>
            </div>

        </div>

    </div>
    </div>
    </div>

</asp:Content>

