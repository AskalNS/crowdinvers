<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForInvestor.aspx.cs" Inherits="WebApplication6.OrderDetailsForInvestor" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   

            <!-- Навигация -->
        <nav class="business-nav">
            <a runat="server" href="~/InvestorDefault.aspx" class="nav-brand">Басты бет</a>
            <div class="nav-links">
                <a runat="server" href="~/OrdersForInvestor.aspx" class="nav-link active">Инвестициялық жобалар</a>
                <a runat="server" href="~/MyInvestments.aspx" class="nav-link">Менің инвестицияларым</a>
                <a runat="server" href="~/ProfileInvestor.aspx" class="nav-link">Профиль</a>
                <a runat="server" href="~/ContactForInvestor.aspx" class="nav-link">Байланыс</a>
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

    <style>
          /* Навигация */
  .business-nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1.5rem 2rem;
      background: white;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
  }
  
  .nav-brand {
      font-weight: 700;
      font-size: 1.2rem;
      color: var(--primary);
      text-decoration: none;
  }
  
  .nav-links {
      display: flex;
      gap: 2rem;
  }
  
  .nav-link {
      color: var(--light-text);
      text-decoration: none;
      font-weight: 500;
      transition: color 0.2s;
  }
  
  .nav-link:hover, .nav-link.active {
      color: var(--primary);
  }
    </style>

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