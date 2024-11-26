<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Intern_task_1.Registration" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha384-RXrRjbO2yyD7fiPAXpBfEuAbG6W0dJHEqRVrKnB6u6FhPqTwI1POWCOeBeEct5Aa" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />

    <link href="StyleSheet1.css" rel="stylesheet" />

    <style>
        html, body {
            margin: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
            background-color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px;
        }
        a:hover{
            text-decoration:none;
             cursor: pointer;
        }
        .container {
            max-width: 100%;
            padding-left: 20rem;
        }

        .registration-container {
            display: flex;
            justify-content: center;
            align-items: stretch;
            background-color: white;
            padding: 50px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            transition: 0.3s;
            width: 80%;
        }

        .registration-form {
            flex: 1 1 50%;
            padding: 20px;
            max-width: 50%;
        }

        .image-section {
            flex: 1 1 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            transition: 0.3s;
        }

            .image-section img {
                width: 110%;
                height: auto;
                object-fit: cover;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            .image-section:hover img {
                transform: scale(1.05);
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.4);
            }

        .form-control {
            transition: border-color 0.3s, background-color 0.3s;
        }

            .form-control:hover {
                border-color: #007bff;
                background-color: #f0f8ff;
            }


        .form-control, .btn {
            margin-bottom: 15px;
            transition: 0.3s;
        }

            .btn:hover {
                transform: scale(1.05);
            }

        @media (max-width: 768px) {
            .registration-container {
                flex-direction: column;
            }

            .registration-form, .image-section {
                flex: 1 1 100%;
                margin: 0;
            }

            .image-section {
                margin-top: 20px;
            }
        }

        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: 0.3s;
            padding: 20px;
        }

            .card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
            }
    </style>
</head >
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="registration-container">
                <div class="card registration-form">
                   <h2 class="text-center">  <a href="regadmin.aspx"> <i class="fas fa-user fa-lg me-3"></i></a> Register Here</h2>
                    <asp:Label ID="lblError" runat="server" ForeColor="#ff9933" CssClass="Message"></asp:Label>
                    <%--<span><i class="fas fa-user fa-lg me-3 fa-fw"></i></span>--%>
                    <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="Enter your name" AutoComplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameValidator" runat="server" ControlToValidate="TxtName" ErrorMessage="Name is required." CssClass="text-danger" Display="Dynamic" />
                    <%--<span><i class="fas fa-envelope fa-lg me-3 fa-fw"></i></span>--%>
                    <asp:TextBox ID="TxtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" AutoComplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Email is required." CssClass="text-danger" Display="Dynamic" />
                    <%--<span><i class="fas fa-lock fa-lg me-3 fa-fw"></i></span>--%>
                    <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>

                    <asp:TextBox ID="TxtMobile" runat="server" CssClass="form-control" placeholder="Enter your mobile number" AutoComplete="off"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="MobileValidator" runat="server" ControlToValidate="TxtMobile" ErrorMessage="Mobile number is required." CssClass="text-danger" Display="Dynamic" />

                    <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="form-control">
                        <asp:ListItem Value="" Text="Select Gender"></asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Others</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="GenderValidator" runat="server" ControlToValidate="GenderDropDownList" InitialValue="" ErrorMessage="Gender selection is required." CssClass="text-danger" Display="Dynamic" />

                  <%--  <div class="form-check">
                        <asp:RadioButton ID="UserRadioButton" runat="server" GroupName="usertype" CssClass="form-check-input" />
                        <label class="form-check-label">User</label>
                    </div>
                    <div class="form-check">
                        <asp:RadioButton ID="AdminRadioButton" runat="server" GroupName="usertype" CssClass="form-check-input" />
                        <label class="form-check-label">Admin</label>
                    </div>--%>

<%--                    <div class="form-check">
                        <asp:Label runat="server" ForeColor="Red" ID="lblmessage"></asp:Label>
                        <asp:FileUpload runat="server" ID="fuPdf" CssClass="form-control" Accept=".pdf" />
                    </div>--%>

                    <div class="form-group text-center">
                        <asp:Button ID="btnSave" runat="server" Text="Register" CssClass="btn btn-success" OnClick="btnSave_Click" ValidationGroup="RegisterGroup" />
                    </div>

                    <div class="form-group text-center">
                        <a href="Login.aspx" class="btn btn-link">Already have an account? Login here</a>
                    </div>
                </div>

                <div class="image-section">
                   <a href="regadmin.aspx"> <img src="https://img.freepik.com/premium-vector/illustration-vector-graphic-cartoon-character-online-registration_516790-1805.jpg?semt=ais_hybrid" alt="Registration Image" /></a>
                </div>
            </div>

            <section>
                <asp:GridView runat="server" ID="gvspdb" AutoGenerateColumns="true" ShowHeaderWhenEmpty="true" CssClass="d-none"></asp:GridView>
            </section>

            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="RegisterGroup" CssClass="text-danger" />
        </div>
    </form>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
