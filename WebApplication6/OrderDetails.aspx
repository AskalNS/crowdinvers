﻿<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="WebApplication6.OrderDetails" %>

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
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/CreateOrder.aspx">Тапсырыс құру</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/OrdersForBusiness.aspx">Тапсырыстар</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/MyOrders.aspx">Менің тапсырыстарым</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ContactForBusiness.aspx">Байланыс</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white">
                <h2 class="mb-0">Тапсырыс сипаттамасы</h2>
            </div>
            <div class="card-body">
                <asp:FormView ID="fvOrderDetails" runat="server">
                    <ItemTemplate>
                        <h4><%# Eval("Target") %></h4>
                        <p><strong>Сипаттама:</strong> <%# Eval("Description") %></p>
                        <p><strong>Мақсаттық сома:</strong> <%# Eval("TargetAmount", "{0:C}") %></p>
                        <p><strong>Орындау мерзімі:</strong> <%# Eval("DueDate", "{0:dd.MM.yyyy}") %></p>
                        <p><strong>Жоспар:</strong> <%# Eval("Plan") %></p>
                         <p><strong>Кесте:</strong> <%# Eval("content") %></p>
                    </ItemTemplate>
                </asp:FormView>

            </div>

            <div style="margin:30px">
                                    <!-- Кнопка "Инвестировать" -->
                <div class="">
                    <asp:Button ID="btnInvest" runat="server" Text="Төлем жасау" CssClass="btn btn-success" OnClientClick="toggleInvestmentForm(); return false;" />
                </div>

                <!-- Форма для заполнения карточных данных (скрыта по умолчанию) -->
                <div id="investmentForm" class="mt-4" style="display: none;">
                    <h4>Карта деректерін енгізіңіз</h4>
                        <div class="mb-3">
                            <label for="cardNumber" class="form-label">Карта нөмірі</label>
                            <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="1234 5678 9012 3456" required></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="expiryDate" class="form-label">Жарамдылық мерзімі</label>
                            <asp:TextBox ID="expiryDate" runat="server" CssClass="form-control" placeholder="MM/YY" required></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="cvv" class="form-label">CVV</label>
                            <asp:TextBox ID="cvv" runat="server" CssClass="form-control" placeholder="123" required></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label for="amount" class="form-label">Инвестиция сомасы</label>
                            <asp:TextBox ID="amount" runat="server" CssClass="form-control" placeholder="Соманы енгізіңіз" required></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmitInvestment" runat="server" Text="Инвестицияны растау" CssClass="btn btn-primary" OnClick="btnSubmitInvestment_Click" />
   
                </div>


                <div class="mt-4">
                    <a href="https://localhost:44333/MyOrders.aspx" class="btn btn-dark">Тапсырыстар тізіміне оралу</a>
                </div>
            </div>
            

        </div>

    </div>

     <script>

     function toggleInvestmentForm() {
         const investmentForm = document.getElementById('investmentForm');
         if (investmentForm.style.display === 'none') {
             investmentForm.style.display = 'block';
         } else {
             investmentForm.style.display = 'none';
         }
     }

     // Генерация случайного номера телефона
     function generateRandomPhoneNumber() {
         const prefix = "+7";
         const randomNumber = Math.floor(1000000000 + Math.random() * 9000000000).toString();
         return prefix + randomNumber;
     }

     // Показ случайного номера в модальном окне
     document.getElementById('consultationModal').addEventListener('show.bs.modal', function () {
         document.getElementById('randomPhoneNumber').textContent = generateRandomPhoneNumber();
     });

     // Показ формы для инвестирования
         document.getElementById('btnRefill').addEventListener('click', function () {
         const investmentForm = document.getElementById('investmentForm');
         if (investmentForm.style.display === 'none') {
             investmentForm.style.display = 'block';
         } else {
             investmentForm.style.display = 'none';
         }
     });
     </script>
</asp:Content>