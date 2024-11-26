<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Intern_task_1.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha384-RXrRjbO2yyD7fiPAXpBfEuAbG6W0dJHEqRVrKnB6u6FhPqTwI1POWCOeBeEct5Aa" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" />
    <!-- Link to Bootstrap Icons -->

    <style>
        body {
            min-height: 100vh;
            font-family: "Poppins", sans-serif;
            background-color: #f8f9fa;
        }

        .container-fluid.h-custom {
            padding-top: 50px;
        }

        .card {
            margin: 50px auto;
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

            .card:hover {
                transform: translateY(-5px);
            }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }




        #forgotPasswordForm {
            display: none;
        }

        .container-forgot-password {
            margin-top: 10rem;
            display: flex;
            justify-content: center;
            align-content: center;
        }


        .h-custom {
            padding-top: 50px;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .login-button {
            width: 100%;
        }

        .input-container {
            position: relative;
            margin-bottom: 20px;
        }

            .input-container i {
                position: absolute;
                left: 10px;
                top: 50%;
                transform: translateY(-50%);
                color: black;
            }

            .input-container input {
                padding-left: 30px;
            }

        .form-control::placeholder {
            color: black;
            opacity: 1;
        }

        .btn-custom {
            background-color: #007bff;
            color: white;
            transition: background-color 0.3s ease;
            margin-left: 10px;
        }

            .btn-custom:hover {
                background-color: #0056b3;
            }

        .panel-heading {
            background-color: #007bff;
            color: white;
        }

        .panel-body {
            padding: 30px;
        }

        @media (max-width: 768px) {
            .col-md-8 {
                margin-top: 20px;
            }

            .input-group {
                display: flex;
                align-items: center;
            }
        }

        .img-hover-effect {
            transition: transform 0.3s ease;
        }

            .img-hover-effect:hover {
                transform: scale(1.05);
            }

    </style>

</head>
<body>
    <form id="form1" runat="server" method="post">
       
        <section class="vh-100">
            <div class="container-fluid h-custom">
                <div class="row d-flex justify-content-center align-items-center h-100">
                  
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1" style="margin-top: 0; margin-left: -20px;">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
                            class="img-fluid img-hover-effect" alt="Sample image" />
                    </div>

                   
                    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
                        
                        <div id="loginForm">
                            <div class="card">
                                <div class="card-body">
                                    <asp:Label runat="server" ID="lblmessage" CssClass="text-danger d-block mt-1"></asp:Label>
                                    <h2 class="text-dark text-center mb-3">Login</h2>
                                    <div class="form-group input-container">
                                        <i class="bi bi-person"></i>
                                        <asp:TextBox ID="TxtName" runat="server" CssClass="form-control" placeholder="Enter your username" AutoComplete="off"></asp:TextBox>
                                    </div>
                                    <div class="form-group input-container">
                                        <i class="bi bi-lock"></i>
                                        <asp:TextBox ID="TxtPass" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6">
                                            <asp:CheckBox runat="server" ID="checkbox" />
                                            <label for="checkbox">Remember Me</label>
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <a href="javascript:void(0);" class="text-center" onclick="showForgotPassword()">Forgot Password?</a>
                                        </div>
                                    </div>

                                    <div class="form-group container-fluid d-flex justify-content-between">
                                        <!-- Flex container for button alignment -->
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-custom login-button" OnClick="btnLogin_Click" />
                                    </div>
                                    <a href="Registration.aspx" class="d-block text-center mt-3">Don't have an account? Register Here</a>

                                </div>
                            </div>
                        </div>

                        <!-- Forgot Password Form -->
                        <div id="forgotPasswordForm">
                            <div class="card container-forgot-password">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading text-center">
                                                    <h3 class="panel-title">Retrieve Password</h3>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="form-group">
                                                        <label for="txtemail">Email:</label>
                                                        <div class="input-group">
                                                            <span class="input-group-addon" style="background-color: #007bff; color: white;">@</span>
                                                            <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" placeholder="Enter your email"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Label ID="Lblmsg" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <asp:Button runat="server" ID="btnsubmit" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" />
                                                        <asp:Button runat="server" ID="btngoback" Text="Go Back" CssClass="btn btn-primary" OnClick="btngoback_Click" OnClientClick="showLoginForm(); return false;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </form>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function showForgotPassword() {
            document.getElementById('loginForm').style.display = 'none';
            document.getElementById('forgotPasswordForm').style.display = 'block';
        }

        function showLoginForm() {
            document.getElementById('forgotPasswordForm').style.display = 'none';
            document.getElementById('loginForm').style.display = 'block';
        }
    </script>
</body>
</html>
