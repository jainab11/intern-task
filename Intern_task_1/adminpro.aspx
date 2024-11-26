<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpro.aspx.cs" Inherits="Intern_task_1.adminpro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Profile</title>
    <style>
        .profile-container {
            text-align: center;
            padding: 20px;
        }

        .profile-image {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }

        .profile-details {
            margin-top: 20px;
            font-family: Arial, sans-serif;
        }

        .profile-details p {
            margin: 5px 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="profile-container">
            <asp:Image ID="imgProfile" runat="server" CssClass="profile-image" />
            <div class="profile-details">
                <p><strong>Name:</strong> <asp:Label ID="lblName" runat="server"></asp:Label></p>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                <p><strong>Mobile:</strong> <asp:Label ID="lblMobile" runat="server"></asp:Label></p>
                <p><strong>Gender:</strong> <asp:Label ID="lblGender" runat="server"></asp:Label></p>
                <p><strong>User Type:</strong> <asp:Label ID="lblUserType" runat="server"></asp:Label></p>
            </div>
            <asp:Button runat="server" ID="btnback" Text="Go Back" CssClass="btn btn-primary mt-3" OnClick="btnback_Click" />
        </div>
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>

