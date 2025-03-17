<%@ Page Title="Заказ құру" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="WebApplication6.CreateOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

         <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark"  style="margin-top: -20px;">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/BusinessDefault.aspx">Басты бет</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/CreateOrder.aspx">тапсырыс құру</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/OrdersForBusiness.aspx">Тапсырыстар</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/MyOrders.aspx">Менің тапсырыстарым</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ContactForBusiness.aspx">Байланыс</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div class ="container" style="margin-top: 40px;">
        

    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white text-center">
                <h2 class="mb-0">Заказ құру</h2>
            </div>
            <div class="card-body">
                <div class="row">
                    <!-- Первый столбец -->
                    <div class="col-md-6">
                        <!-- Целевая сумма -->
                        <div class="mb-4">
                            <label for="txtTargetAmount" class="form-label">Мақсаттық сома</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                                <asp:TextBox ID="txtTargetAmount" runat="server" CssClass="form-control" placeholder="Мақсаттық соманы енгізіңіз"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvTargetAmount" runat="server" ControlToValidate="txtTargetAmount"
                                ErrorMessage="Мақсаттық соманы енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Цель -->
                        <div class="mb-4">
                            <label for="txtTarget" class="form-label">Қысқаша сипаттама</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-bullseye"></i></span>
                                <asp:TextBox ID="txtTarget" runat="server" CssClass="form-control" placeholder="Мақсатты енгізіңіз"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvTarget" runat="server" ControlToValidate="txtTarget"
                                ErrorMessage="Мақсатты енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        </div>  

                        <!-- Срок выполнения -->
                        <div class="mb-4">
                            <label for="txtDueDate" class="form-label">Мерзімі</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-calendar-check"></i></span>
                                <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="Мерзімін енгізіңіз"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvDueDate" runat="server" ControlToValidate="txtDueDate"
                                ErrorMessage="Мерзімін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <!-- Второй столбец -->
                    <div class="col-md-6">
                        <!-- Описание -->
                        <div class="mb-4">
                            <label for="txtDescription" class="form-label">Сипаттама</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-card-text"></i></span>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control wide-textarea" TextMode="MultiLine" Rows="6" placeholder="Сипаттаманы енгізіңіз"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                                ErrorMessage="Сипаттаманы енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        </div>

                        <!-- План -->
                        <div class="mb-4">
                            <label for="txtPlan" class="form-label">Жоспар</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-file-earmark-text"></i></span>
                                <asp:TextBox ID="txtPlan" runat="server" CssClass="form-control wide-textarea" TextMode="MultiLine" Rows="6" placeholder="Жоспарды енгізіңіз"></asp:TextBox>
                            </div>
                            <asp:RequiredFieldValidator ID="rfvPlan" runat="server" ControlToValidate="txtPlan"
                                ErrorMessage="Жоспарды енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>

                <!-- Кнопка создания заказа -->
                <div class="row">
                    <div class="col-md-12 text-center">
                        <asp:Button ID="btnCreateOrder" runat="server" Text="Заказ құру" CssClass="btn btn-dark btn-lg w-50" OnClick="btnCreateOrder_Click" />
                    </div>
                </div>

                <!-- Сообщение об ошибке или успехе -->
                <div class="row mt-3">
                    <div class="col-md-12 text-center">
                        <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>







    <style>
        .container {
            max-width: 1200px; /* Увеличена максимальная ширина контейнера */
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
            min-width: 40px; /* Фиксированная ширина для иконки */
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

        textarea.form-control.wide-textarea {
            resize: vertical; /* Позволяет пользователю изменять высоту текстового поля */
            min-height: 150px; /* Минимальная высота текстового поля */
            width: 600px; /* Фиксированная ширина текстового поля */
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

            textarea.form-control.wide-textarea {
                width: 100%; /* На мобильных устройствах ширина 100% */
            }
        }
    </style>
</asp:Content>