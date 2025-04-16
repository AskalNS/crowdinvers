<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="WebApplication6.OrderDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/BusinessDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/CreateOrder.aspx" class="nav-link">Жоба құру</a>
                <a runat="server" href="~/OrdersForBusiness.aspx" class="nav-link">Инвестициялар</a>
                <a runat="server" href="~/MyOrders.aspx" class="nav-link active">Менің жобаларым</a>
                <a runat="server" href="~/ContactForBusiness.aspx" class="nav-link">Қолдау</a>
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
    <style>
    /* Добавьте эти переменные в начало стилей */
    :root {
        --primary: #2A5B7C;
        --secondary: #4D8BBA;
        --gray: #777777;
        --transition: all 0.3s ease;
    }
    
    /* Остальные ваши стили... */
    
    /* Навигация */
    .business-nav {
        background: white;
        box-shadow: 0 2px 15px rgba(0,0,0,0.05);
        padding: 1rem 0;
    }

    .business-nav .container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 2rem;
    }

    .nav-brand {
        font-weight: 700;
        font-size: 1.5rem;
        color: var(--primary);
        text-decoration: none;
    }

    .nav-links {
        display: flex;
        gap: 2rem;
    }

    .nav-link {
        color: var(--gray);
        text-decoration: none;
        font-weight: 500;
        transition: var(--transition);
        padding: 0.5rem 0;
        position: relative;
    }

    .nav-link:hover, .nav-link.active {
        color: var(--primary);
    }

    .nav-link.active:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 3px;
        background: var(--primary);
        border-radius: 3px;
    }
</style>

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