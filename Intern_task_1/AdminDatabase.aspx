<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDatabase.aspx.cs" Inherits="Intern_task_1.AdminDatabase" EnableEventValidation="false" %>

<!DOCTYPE html>
<%--<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="cache-control" content="proxy-revalidate" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Database</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <link href="StyleSheet1.css" rel="stylesheet" />
    <script type="text/javascript">
        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);
        window.onunload = function () { null };

        function launchModal() {
            var modal = new bootstrap.Modal(document.getElementById('adminDetailsModal'));
            modal.show();
        }
    </script>
    <style>
        #gvspdb {
            margin-top: 20px;
        }

        .custom-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .btn {
            margin: 5px;
        }

        body {
            padding: 0;
            margin: 0;
        }

        #navbar {
            background-color: #4f4e4e;
            margin-top: 10px;
        }

        #btnExcel {
            margin-left: 2rem;
            margin: auto;
        }

        .custom-footer {
            background-color: #f8f9fa;
            text-align: center;
            border-top: 2px solid #ddd;
        }

        .table > tfoot {
            display: table-header-group;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg t" id="navbar" style="margin-top: 10px;">
            <a class="navbar-brand text-light ms-3" href="#">Admin Database</a>

            <div class="ms-auto">
                <div class="navbar ms-auto" id="navbarNav">

                    <asp:Button ID="btnPDF" runat="server" Text="Export To PDF" OnClick="btnPDF_Click" Width="120" CssClass="btn btn-secondary p-2 " />
                    <asp:Button ID="btnExcel" runat="server" Text="Export To Excel  " OnClick="btnExcel_Click" Width="120" CssClass="btn btn-secondary p-2 " />

                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger p-2 " />

                    <br />
                </div>
            </div>

        </nav>

        <%--Import Excel File
        <asp:Label runat="server" ID="Label1" ForeColor="Green" Visible="false"></asp:Label>
        <div style="text-align: right">
            <asp:Button Text="Export own Details" runat="server" ID="Button1" OnClick="btnOwnDetails_Click" CssClass="btn btn-secondary m-1" />

        </div>--%>




<%--
            <asp:FileUpload runat="server" ID="fileUploadExcel" Accept=".xls,.xlsx" />
            <asp:Button runat="server" ID="btnUpload" OnClick="btnUpload_Click" Text="Import Excel" />
        </div>--%>

<%--<h2 class="text-center">Admin Database</h2>--%>
<%--            <asp:GridView runat="server" ID="gvspdb2" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
        <div class="container-fluid col-md-12">
            <asp:GridView ID="gvspdb" runat="server" AutoGenerateColumns="False" CssClass="table"
                OnRowDeleting="gvspdb_RowDeleting" OnRowEditing="gvspdb_RowEditing" OnRowCancelingEdit="gvspdb_RowCancelingEdit"
                OnRowUpdating="gvspdb_RowUpdating" DataKeyNames="ID" OnRowCommand="gvspdb_RowCommand"
                ShowFooter="False" OnRowDataBound="gvspdb_RowDataBound" Width="100%">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("NAME") %>' ID="name" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNameFooter" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("EMAIL") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("EMAIL") %>' ID="email" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtEmailFooter" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("PASSWORD") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("PASSWORD") %>' ID="password" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtPasswordFooter" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("MOBILE") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("MOBILE") %>' ID="mobile" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtMobileFooter" CssClass="form-control" Placeholder="Mobile"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("GENDER") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlGenderEdit" CssClass="form-control" SelectedValue='<%# Bind("GENDER") %>'>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlGenderFooter" CssClass="form-control">
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="UserType">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("USERTYPE") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlUserTypeEdit" SelectedValue='<%# Bind("USERTYPE") %>' CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlUserTypeFooter" CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="User" Value="User"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgUser" runat="server" ImageUrl='<%# GetImageUrl(Convert.ToInt32(Eval("ID"))) %>' Width="100" Height="100" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="fuImage" CssClass="form-control" />
                            <asp:HiddenField runat="server" ID="hfImagePath" Value='<%# Eval("IMG") != DBNull.Value ? Convert.ToBase64String((byte[])Eval("IMG")) : string.Empty %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload runat="server" ID="txtImageFooter" CssClass="form-control" Accept=".jpg" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PDF">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlPdf" runat="server" NavigateUrl='<%# Eval("PDF_PATH") %>' Text="View PDF" Target="_blank"
                                Visible='<%# !string.IsNullOrEmpty(Eval("PDF_PATH").ToString()) %>'></asp:HyperLink>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="pdfupload" CssClass="form-control" Accept=".pdf" />
                            <asp:HiddenField ID="hfPdfPath" runat="server" Value='<%# Eval("PDF_PATH") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload runat="server" ID="PdfUploadFooter" CssClass="form-control" Accept=".pdf" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <FooterTemplate>
                            <asp:Button runat="server" ID="btnInsert" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="ButtonEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-secondary m-1" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button ID="ButtonUpdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary m-1" />
                            <asp:Button ID="ButtonCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger m-1" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="ButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger m-1" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
            </asp:GridView>



        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>--%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="cache-control" content="no-store" />
    <meta http-equiv="cache-control" content="must-revalidate" />
    <meta http-equiv="cache-control" content="proxy-revalidate" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Admin Database</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="StyleSheet1.css" rel="stylesheet" />
    <script type="text/javascript">
        function disableBackButton() {
            window.history.forward();
        }
        setTimeout("disableBackButton()", 0);
        window.onunload = function () { null };
    </script>
    <style>
        .custom-image {
            width: 100px;
            height: 100px;
            object-fit: cover;
        }

        .btn {
            margin: 5px;
        }

        body {
            padding: 0;
            margin: 0;
        }

        #navbar {
            background-color: #4f4e4e;
            margin-top: 10px;
        }

        #btnExcel {
            margin-left: 2rem;
            margin: auto;
        }

        #btnuser {
            border-radius: 50%;
            width: 50px;
            height: 50px;
            border: 2px solid white;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg t" id="navbar" style="margin-top: 10px;">
            <a class="navbar-brand text-light ms-3" href="#">Admin Database</a>

            <div class="ms-auto">
                <div class="navbar ms-auto" id="navbarNav">

                    <asp:Button ID="btnPDF" runat="server" Text="Export To PDF" OnClick="btnPDF_Click" Width="120" CssClass="btn btn-secondary p-2 " />
                    <asp:Button ID="btnExcel" runat="server" Text="Export To Excel  " OnClick="btnExcel_Click" Width="120" CssClass="btn btn-secondary p-2 " />

                    <asp:Button ID="btnLogout" runat="server" Text="Logout" OnClick="btnLogout_Click" CssClass="btn btn-danger p-2 " />
                    <asp:ImageButton ID="btnuser" runat="server" AlternateText="Go to Admin page" CssClass="m-1"  OnClick="btnuser_Click1" ImageUrl="~/Image/1.jpg" />
                <%--    <asp:Image ID="imgUser" runat="server" ImageUrl='<%# "Handler1.ashx?id=" + Session["USERID"] %>' CssClass="user-image" />--%>

                    <br />
                </div>
            </div>

        </nav>

        <%--Import Excel File--%>
        <asp:Label runat="server" ID="Label1" ForeColor="Green" Visible="false"></asp:Label>
        <div style="text-align: right">
            <asp:Button Text="Export own Details" runat="server" ID="Button1" OnClick="btnOwnDetails_Click" CssClass="btn btn-secondary m-1" />


        </div>
        <div class="container-fluid col-md-12">
            <%--<h2 class="text-center">Admin Database</h2>--%>
            <asp:GridView runat="server" ID="gvspdb2"></asp:GridView>
            <asp:GridView ID="gvspdb" runat="server" AutoGenerateColumns="False" CssClass="table table-stripped"
                OnRowDeleting="gvspdb_RowDeleting" OnRowEditing="gvspdb_RowEditing" OnRowCancelingEdit="gvspdb_RowCancelingEdit"
                OnRowUpdating="gvspdb_RowUpdating" DataKeyNames="ID" OnRowCommand="gvspdb_RowCommand" ShowFooter="False" RowStyle-BackColor="#A1DCF2" AlternatingRowStyle-BackColor="White" HeaderStyle-BackColor="#3AC0F2" OnRowDataBound="gvspdb_RowDataBound" Width="100%">
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" />


                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("NAME") %>' ID="name" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtNameFooter" CssClass="form-control" Placeholder="Name"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("EMAIL") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("EMAIL") %>' ID="email" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtEmailFooter" CssClass="form-control" Placeholder="Email"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Password">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("PASSWORD") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("PASSWORD") %>' ID="password" CssClass="form-control" Style="overflow: hidden"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtPasswordFooter" CssClass="form-control" Placeholder="Password"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Mobile">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("MOBILE") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" Text='<%# Bind("MOBILE") %>' ID="mobile" CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox runat="server" ID="txtMobileFooter" CssClass="form-control" Placeholder="Mobile"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Gender">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("GENDER") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlGenderEdit" CssClass="form-control" SelectedValue='<%# Bind("GENDER") %>'>
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlGenderFooter" CssClass="form-control">
                                <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User Type">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Eval("USERTYPE") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList runat="server" ID="ddlUserTypeEdit" SelectedValue='<%# Bind("USERTYPE") %>' CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="User" Value="User"></asp:ListItem>

                            </asp:DropDownList>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList runat="server" ID="ddlUserTypeFooter" CssClass="form-control">
                                <asp:ListItem Text="Admin" Value="Admin"></asp:ListItem>
                                <asp:ListItem Text="User" Value="User"></asp:ListItem>

                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image">
                        <HeaderStyle Width="150px" />
                        <ItemStyle Width="150px" />
                        <ItemTemplate>
                            <asp:Image ID="imgUser" runat="server" ImageUrl='<%# GetImageUrl(Convert.ToInt32(Eval("ID"))) %>' Width="100" Height="100" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="fuImage" CssClass="form-control" />
                            <%--<asp:HiddenField runat="server" ID="hfImagePath" Value='<%# GetImageUrl(Convert.ToInt32(Eval("ID"))) %>' />--%>
                            <asp:HiddenField runat="server" ID="hfImagePath" Value='<%# Eval("IMG") != DBNull.Value ? Convert.ToBase64String((byte[])Eval("IMG")) : string.Empty %>' />


                        </EditItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PDF">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlPdf" runat="server" NavigateUrl='<%# Eval("PDF_PATH") %>' Text="View PDF" Target="_blank"
                                Visible='<%# !string.IsNullOrEmpty(Eval("PDF_PATH").ToString()) %>'></asp:HyperLink>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload runat="server" ID="pdfupload" CssClass="form-control" Accept=".pdf" />
                            <asp:HiddenField ID="hfPdfPath" runat="server" Value='<%# Eval("PDF_PATH") %>' />
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:FileUpload runat="server" ID="PdfUploadFooter" CssClass="form-control" Accept=".pdf" />
                        </FooterTemplate>
                    </asp:TemplateField>

<%--                    <asp:TemplateField HeaderText="Actions">
                        <FooterTemplate>
                            <asp:Button runat="server" ID="btnInsert" CssClass="btn btn-success" CommandName="Insert" Text="Insert" />
                        </FooterTemplate>
                    </asp:TemplateField>--%>

                    <asp:CommandField ShowDeleteButton="true"
                        ControlStyle-CssClass="btn btn-secondary m-1"
                        HeaderText="Delete"
                        ButtonType="Link">
                        <ControlStyle CssClass="btn btn-secondary m-1"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ShowEditButton="true"
                        ControlStyle-CssClass="btn btn-secondary m-1"
                        HeaderText="Edit"
                        ButtonType="Link">

                        <ControlStyle CssClass="btn btn-secondary m-1"></ControlStyle>
                    </asp:CommandField>

                </Columns>

            </asp:GridView>

        </div>


    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
