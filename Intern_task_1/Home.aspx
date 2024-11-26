<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Intern_task_1.Home" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #icon{
            height:25px;
            width:25px;
            margin-top:10px;
            margin-right:20px;
        }
        :root {
            /*background color for light theme*/
            --background-color:white;
            --text-color: #212121;
            --card-background:#f5f2f2;
            --card-text-color: #000000;
            --navbar-background: white;
            --navbar-text-color: #000000;
        }

        .dark-theme {
            /*Dark theme css*/
            --background-color: #212121;
            --text-color: #e0e0e0;
            --card-background: #1e1e1e;
            --card-text-color: #e0e0e0;
            --navbar-background: black;
            --navbar-text-color: #e0e0e0;
        }

        body {
            background-color: var(--background-color);
            color: var(--navbar-background);
            transition: background-color 2s, color 2s;
        }

        .navbar {
            background-color: var(--navbar-background);
            color: var(--navbar-text-color);
        }

            .navbar a, .navbar .nav-link {
                color: var(--navbar-text-color);
            }

        .card {
            background-color: var(--card-background);
            color: var(--card-text-color);
        }

            .card a {
                color: var(--card-text-color);
            }

        .btn-primary {
            background-color: #007bff; 
            border-color: #007bff;
        }

        .btn-info {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">
        <!-- Navbar -->
        <nav id="navbar" class="navbar navbar-expand-lg navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">My Website</a>
                <a class="nav-link active" aria-current="page" href="#">Home</a>

                <ul class="navbar-nav ms-auto">
                    <li>
                        <img src="Image/moon.png" id="icon" />
                    </li>
                    <li>
                        <asp:Button ID="SignupButton" runat="server" Text="Sign Up" OnClick="SignupButton_Click" CssClass="btn btn-primary m-1" />
                    </li>
                    <li>
                        <asp:Button ID="SigninButton" runat="server" Text="Login" OnClick="SigninButton_Click" CssClass="btn btn-primary m-1" />
                    </li>
                </ul>

            </div>
        </nav>

        <div class="container text-center mt-5">
    <%--<h1>Welcome to My Website</h1>--%>


            <div class="row mt-4">

                <div class="col-md-4">
                    <div class="card">
                        <img src="https://img-c.udemycdn.com/course/750x422/4715176_8391.jpg" class="card-img-top" alt="Languages" height="250px" width="250px">
                        <div class="card-body">
                            <h5 class="card-title">Languages I Use</h5>
                            <p class="card-text">C#, JavaScript, CSS, SQL</p>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card">
                        <img src="https://www.bootstrapdash.com/blog/wp-content/uploads/2017/08/ASP.NET-with-Core-Bootstrap-scaled-1.jpg" class="card-img-top" alt="Technologies" height="225" width="250" />
                        <div class="card-body">
                            <h5 class="card-title">Technologies & Frameworks</h5>
                            <p class="card-text">ASP.NET is used for backend, Bootstrap is used for front end.</p>
                        </div>
                    </div>
                </div>


                <div class="col-md-4">
                    <div class="card">
                        <img src="https://www.atatus.com/glossary/content/images/size/w960/2021/07/CRUD.jpeg" class="card-img-top" alt="Projects" height="225px" width="250px" />
                        <div class="card-body">
                            <h5 class="card-title">Project Details</h5>
                            <p class="card-text">Registration page with user role login and performing crud oprations</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script>

        var icon = document.getElementById("icon");
        icon.onclick = function () {
            document.body.classList.toggle("dark-theme");
            if (document.body.classList.contains("dark-theme")) {
                icon.src = "Image/sun.png";

            } else {
                icon.src = "Image/moon.png"
            }
        }

    </script>
</body>
</html>