<%@ Page Title="Вход" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication6.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark"  style="margin-top: -20px;">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/">Басты бет</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/RegisterBusiness.aspx">Инвестиция алу</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/RegisterInvestor.aspx">Инвестивия жасау</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ContactDefault.aspx">Байланыс</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Login.aspx">кіру</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div class ="container" style="margin-top: 40px;">

        <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-dark text-white text-center">
                    <h2 class="mb-0">Вход</h2>
                </div>
                <div class="card-body">
                    <!-- Поле для логина -->
                    <div class="mb-4">
                        <label for="txtLogin" class="form-label">Логин</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                            <asp:TextBox ID="txtLogin" runat="server" CssClass="form-control" placeholder="Введите логин"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvLogin" runat="server" ControlToValidate="txtLogin"
                            ErrorMessage="Введите логин" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Поле для пароля -->
                    <div class="mb-4">
                        <label for="txtPassword" class="form-label">Пароль</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Введите пароль"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Введите пароль" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Кнопка входа -->
                    <div class="d-grid gap-2">
                        <asp:Button ID="btnLogin" runat="server" Text="Войти" CssClass="btn btn-dark btn-lg" OnClick="btnLogin_Click" />
                    </div>

                    <!-- Сообщение об ошибке -->
                    <div class="mt-3 text-center">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



    </div>





    
    <style>
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            border-radius: 10px;
            overflow: hidden;
        }

        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            padding: 1.5rem;
        }

        .card-body {
            padding: 2rem;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .input-group {
            margin-bottom: 1rem;
        }

        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-right: none;
            min-width: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .form-control {
            border-left: none;
            padding: 0.75rem;
            border-radius: 0 5px 5px 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #6a11cb;
        }

        .btn-dark {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            transition: background 0.3s ease;
        }

        .btn-dark:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
        }

        .btn-lg {
            padding: 0.75rem 1.5rem;
            font-size: 1.25rem;
        }

        .text-danger {
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        .text-danger small {
            display: block;
            margin-top: 0.25rem;
        }

        @media (max-width: 768px) {
            .col-md-6 {
                margin-left: 0;
                margin-right: 0;
            }

            .btn-lg {
                width: 100% !important;
            }
        }
    </style>
</asp:Content>