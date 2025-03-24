<%@ Page Title="Мой профиль" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileInvestorView.aspx.cs" Inherits="WebApplication6.ProfileInvestorView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Навигация -->
    <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark" style="margin-top: -20px;">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/InvestorDefault.aspx">Басты бет</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/OrdersForInvestor.aspx">Инвестициялық жобалар</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/MyInvestments.aspx">Менің инвестицияларым</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ProfileInvestor.aspx">Профиль</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ContactForInvestor.aspx">Байланыс</a></li>
                </ul>
            </div>
        </div>
    </nav>


    <div class="container mt-4">
        <!-- Заголовок страницы -->
        <h2 class="text-center mb-4">Мой профиль</h2>

        <!-- Основной блок профиля -->
        <div class="card shadow-sm">
            <div class="card-body">
                <!-- Заголовок профиля -->
                <div class="text-center mb-4">

                    <h3 class="mt-3" id="lblFio" runat="server"></h3>
                    <p class="text-muted" id="lblMail" runat="server"></p>
                </div>

                <!-- Информация о профиле -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-card-text me-2"></i>ИИН</h5>
                            <p class="text-muted" id="lblIin" runat="server"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-telephone me-2"></i>Номер телефона</h5>
                            <p class="text-muted" id="lblPhoneNumber" runat="server"></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-geo-alt me-2"></i>Адрес</h5>
                            <p class="text-muted" id="lblAddress" runat="server"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-calendar me-2"></i>Дата регистрации</h5>
                            <p class="text-muted" id="lblCreatedAt" runat="server"></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card shadow-sm">
            <div class="card-body">
               <div style="display:flex">
                    <h5><i class="bi bi-telephone me-2"></i>Баланс: </h5>
                   <asp:Literal ID="litBalance" runat="server"></asp:Literal>
                </div>

                  <!-- Кнопка "Инвестировать" -->
                <div class="mt-3">
                    <asp:Button ID="btnInvest" runat="server" Text="Ақшаны шешу" CssClass="btn btn-success" OnClientClick="toggleInvestmentForm(); return false;" />
                </div>

                <!-- Форма для заполнения карточных данных (скрыта по умолчанию) -->
                <div id="investmentForm" class="mt-4" style="display: none;">
                    <h4>Введите данные карты</h4>
                    <div class="mb-3">
                        <label for="cardNumber" class="form-label">Номер карты</label>
                        <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="1234 5678 9012 3456" required></asp:TextBox>
                    </div>
                     <div class="mb-3">
                         <label for="txtAmount" class="form-label">Сумма снятия</label>
                         <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" placeholder="0" required></asp:TextBox>
                     </div>
                    <asp:Button ID="btnSubmitInvestment" runat="server" Text="Растау" CssClass="btn btn-primary" OnClick="btnSubmitInvestment_Click" />
     
                </div>
               
            </div>
        </div>

    </div>

    <!-- Стили для улучшения внешнего вида -->
    <style>
        .profile-icon {
            background-color: #0d6efd; /* Цвет иконки */
        }

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h5 {
            color: #333;
            font-weight: bold;
        }

        .text-muted {
            color: #6c757d !important;
        }
    </style>

     <!-- Скрипты -->
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
     document.getElementById('btnInvesting').addEventListener('click', function () {
         const investmentForm = document.getElementById('investmentForm');
         if (investmentForm.style.display === 'none') {
             investmentForm.style.display = 'block';
         } else {
             investmentForm.style.display = 'none';
         }
     });
 </script>
</asp:Content>