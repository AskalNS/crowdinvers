<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForInvestor.aspx.cs" Inherits="WebApplication6.OrderDetailsForInvestor" %>

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
                        <p><strong>Нысаналық сома:</strong> <%# Eval("TargetAmount") %></p>
                        <p><strong>Кәзіргі сома:</strong> <%# Eval("CurrentAmount") %></p>
                        <p><strong>Орындалу мерзімі:</strong> <%# Eval("DueDate", "{0:dd.MM.yyyy}") %></p>
                        <p><strong>Жоспар:</strong> <%# Eval("Plan") %></p>
                        <p><strong>Кесте:</strong> <%# Eval("content") %></p>
                    </ItemTemplate>
                </asp:FormView>

                <div style="display:flex; margin: 30px; ">
                    <div>
                                        <!-- Кнопка "Проконсультироваться" -->
                        <div class="mt-4">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#consultationModal">
                                Кеңес алу
                            </button>
                        </div>

                        <!-- Кнопка "Инвестировать" -->
                        <div class="mt-3">
                            <button type="button" class="btn btn-success" id="btnInvest">
                                Инвестиция жасау
                            </button>
                        </div>

                        <!-- Форма для заполнения карточных данных (скрыта по умолчанию) -->
                        <div id="investmentForm" class="mt-4" style="display: none;">
                            <h4>Карта деректерін енгізіңіз</h4>
                            
                                <div style="display:flex">
                                <div>
                                     <div class="mb-3">
                                         <label for="cardNumber" class="form-label">Номер карты</label>
                                         <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="1234 5678 9012 3456" required></asp:TextBox>
                                     </div>
                                     <div class="mb-3">
                                         <label for="expiryDate" class="form-label">Жарамдылық мерзімі</label>
                                         <asp:TextBox ID="expiryDate" runat="server" CssClass="form-control" placeholder="MM/YY" required></asp:TextBox>
                                     </div>
                                </div>

                                <div>
                                     <div class="mb-3" style="margin-left:40px;">
                                         <label for="cvv" class="form-label">CVV</label>
                                         <asp:TextBox ID="cvv" runat="server" CssClass="form-control" placeholder="123" required></asp:TextBox>
                                     </div>
                                     <div class="mb-3" style="margin-left:40px;">
                                         <label for="amount" class="form-label">Инвестиция сомасы</label>
                                         <asp:TextBox ID="amount" runat="server" CssClass="form-control" placeholder="Введите сумму" required></asp:TextBox>
                                     </div>
                                </div>
                            </div>



                             <asp:Button ID="btnSubmitInvestment" runat="server" Text="Инвестицияны растау" CssClass="btn btn-primary" OnClick="btnSubmitInvestment_Click" />
                   
                        </div>
                    </div>

                    <div style="margin-left:600px; margin-top: 45px; ">
                        
                        <!-- Кнопка "Назад к списку заказов" -->
                        <div class="mt-4">
                            <a href="https://localhost:44333/OrdersForInvestor.aspx" class="btn btn-dark">Тапсырыстар тізіміне оралу</a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Модальное окно для консультации -->
    <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="consultationModalLabel">Кеңес алу</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Бізге хабарласыңыз: <strong id="randomPhoneNumber"></strong></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Жабу</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Скрипты -->
    <script>
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
        document.getElementById('btnInvest').addEventListener('click', function () {
            const investmentForm = document.getElementById('investmentForm');
            if (investmentForm.style.display === 'none') {
                investmentForm.style.display = 'block';
            } else {
                investmentForm.style.display = 'none';
            }
        });
    </script>
</asp:Content>