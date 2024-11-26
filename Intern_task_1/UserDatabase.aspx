<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserDatabase.aspx.cs" Inherits="Intern_task_1.UserDatabase" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="cache-control" content="no-store" />
<meta http-equiv="cache-control" content="must-revalidate" />
<meta http-equiv="cache-control" content="proxy-revalidate" />
    <title>User Page</title>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script>
        function launchModal() {
            var modal = new bootstrap.Modal(document.getElementById('mymodal'));
            modal.show();
        }

        function launchModal2() {
            var mrModal = new bootstrap.Modal(document.getElementById('mymodel'));
            mrModal.show();
        }
    </script>
    <script src="JavaScript.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link href="StyleSheet1.css" rel="stylesheet" />
    <style>
        .container {
            margin-top: 20px;
        }
        .modal-header, .modal-footer {
            background-color: #f8f9fa;
        }
        .modal-body {
            padding: 20px;
        }
        .table {
            width: 100%;
              
        }
        .text-center {
            text-align: center;
        }
        .modal-content {
            padding: 20px;
        }
   /*     #gvspdb{
            display:grid;

        }*/

    </style>
</head>
<body>
    <form id="form1" runat="server">
                <nav class="navbar navbar-expand-lg navbar-light bg-dark ">
          <a class="nav-link active text-light mx-2" aria-current="page" href="Home.aspx">Home</a>
                    <div class="d-flex ms-auto">
           <div class="text-center">
    <asp:Button Text="LOGOUT" ID="btnlogout" runat="server" CssClass="btn btn-secondary btn-custom mx-2" OnClick="btnlogout_Click" />
 </div>

        </div>
        </nav>
        <div class="container-fluid ms-auto">
            <h2 class="text-center">User Details</h2>
            <asp:GridView AutoGenerateColumns="true" runat="server" ID="gvspdb" CssClass="table table-bordered" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Visible="true">
            <%--    <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:BoundField DataField="NAME" HeaderText="Name" />
                    <asp:BoundField DataField="EMAIL" HeaderText="Email" />
                    <asp:BoundField DataField="PASSWORD" HeaderText="Password" />
                    <asp:BoundField DataField="MOBILE" HeaderText="Phone Number" />
                    <asp:BoundField DataField="GENDER" HeaderText="Gender" />
                    <asp:BoundField DataField="USERTYPE" HeaderText="User Type" />
                </Columns>--%>

                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />

            </asp:GridView>

            <div class="mt-4 text-center">
                <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-secondary btn-custom" OnClick="EditButton_Click" />
                <asp:Button ID="ChangePasswordButton" runat="server" Text="Change Password" CssClass="btn btn-secondary btn-custom" OnClick="ChangePasswordButton_Click" />&nbsp; &nbsp;
                <asp:Button ID="btnPdfExport" runat="server" Text="Export to Pdf" CssClass="btn btn-primary" OnClick="btnPdfExport_Click" />
            </div>

            <!-- Edit Details Modal -->
            <div class="modal fade" id="mymodal" tabindex="-1" aria-labelledby="editDetailsModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editDetailsModalLabel">Edit Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="txtName" class="form-label">Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtEmail" class="form-label">Email</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtMobile" class="form-label">Mobile</label>
                                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="GenderDropDownList" class="form-label">Gender</label>
                                <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Male" Value="Male" />
                                    <asp:ListItem Text="Female" Value="Female" />
                                    <asp:ListItem Text="Others" Value="Others" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Text="Save changes" OnClick="btnEdit_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Change Password Modal -->
            <div class="modal fade" id="mymodel" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="changePasswordModalLabel">Change Password</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div class="mb-3">
                                <label for="txtNamepass" class="form-label">Name</label>
                                <asp:TextBox ID="txtNamepass" runat="server" CssClass="form-control" />
                            </div>
                            <div class="mb-3">
                                <label for="txtoldpass" class="form-label">Old Password</label>
                                <asp:TextBox ID="txtoldpass" runat="server" CssClass="form-control" TextMode="Password" />
                            </div>
                            <div class="mb-3">
                                <label for="txtnewPass" class="form-label">New Password</label>
                                <asp:TextBox ID="txtnewPass" runat="server" CssClass="form-control" TextMode="Password" />
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="savePasswordButton" runat="server" Text="Save Password" CssClass="btn btn-primary" OnClick="savePasswordButton_Click" />
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>

         
           
        </div>
    </form>
</body>
</html>
