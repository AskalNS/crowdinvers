<%@ Page Title="Детали заказа" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForInvestor.aspx.cs" Inherits="WebApplication6.OrderDetailsForInvestor" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white">
                <h2 class="mb-0">Детали заказа</h2>
            </div>
            <div class="card-body">
                <asp:FormView ID="fvOrderDetails" runat="server">
                    <ItemTemplate>
                        <h4><%# Eval("Target") %></h4>
                        <p><strong>Описание:</strong> <%# Eval("Description") %></p>
                        <p><strong>Целевая сумма:</strong> <%# Eval("TargetAmount") %></p>
                        <p><strong>Кәзіргі сумма:</strong> <%# Eval("CurrentAmount") %></p>
                        <p><strong>Срок выполнения:</strong> <%# Eval("DueDate", "{0:dd.MM.yyyy}") %></p>
                        <p><strong>План:</strong> <%# Eval("Plan") %></p>
                        <p><strong>План:</strong> <%# Eval("content") %></p>
                    </ItemTemplate>
                </asp:FormView>

                <!-- Кнопка "Проконсультироваться" -->
                <div class="mt-4">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#consultationModal">
                        Проконсультироваться
                    </button>
                </div>

                <!-- Кнопка "Инвестировать" -->
                <div class="mt-3">
                    <button type="button" class="btn btn-success" id="btnInvest">
                        Инвестировать
                    </button>
                </div>

                <!-- Форма для заполнения карточных данных (скрыта по умолчанию) -->
                <div id="investmentForm" class="mt-4" style="display: none;">
                    <h4>Введите данные карты</h4>
                     <div class="mb-3">
                         <label for="cardNumber" class="form-label">Номер карты</label>
                         <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="1234 5678 9012 3456" required></asp:TextBox>
                     </div>
                     <div class="mb-3">
                         <label for="expiryDate" class="form-label">Срок действия</label>
                         <asp:TextBox ID="expiryDate" runat="server" CssClass="form-control" placeholder="MM/YY" required></asp:TextBox>
                     </div>
                     <div class="mb-3">
                         <label for="cvv" class="form-label">CVV</label>
                         <asp:TextBox ID="cvv" runat="server" CssClass="form-control" placeholder="123" required></asp:TextBox>
                     </div>
                     <div class="mb-3">
                         <label for="amount" class="form-label">Сумма инвестиции</label>
                         <asp:TextBox ID="amount" runat="server" CssClass="form-control" placeholder="Введите сумму" required></asp:TextBox>
                     </div>
                     <asp:Button ID="btnSubmitInvestment" runat="server" Text="Подтвердить инвестицию" CssClass="btn btn-primary" OnClick="btnSubmitInvestment_Click" />
                   
                </div>

                <!-- Кнопка "Назад к списку заказов" -->
                <div class="mt-4">
                    <a href="Orders.aspx" class="btn btn-dark">Назад к списку заказов</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Модальное окно для консультации -->
    <div class="modal fade" id="consultationModal" tabindex="-1" aria-labelledby="consultationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="consultationModalLabel">Консультация</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Свяжитесь с нами по номеру: <strong id="randomPhoneNumber"></strong></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
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