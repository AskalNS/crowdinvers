<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForBusiness.aspx.cs" Inherits="WebApplication6.OrderDetailsForBusiness" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/BusinessDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/CreateOrder.aspx" class="nav-link">Жоба құру</a>
                <a runat="server" href="~/OrdersForBusiness.aspx" class="nav-link active">Инвестициялар</a>
                <a runat="server" href="~/MyOrders.aspx" class="nav-link">Менің жобаларым</a>
                <a runat="server" href="~/ProfileBusiness.aspx" class="nav-link">Профиль</a>
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

        <div class="uploaded-documents mt-3">
            <div class="document-item">
                <i class="bi bi-file-earmark-text"></i>
                <a href="/Documents/Бизнес-жоспар.pdf" target="_blank">Бизнес-жоспар.pdf</a>
            </div>
        </div>

                    <div class="uploaded-documents mt-3">
            <div class="document-item">
                <i class="bi bi-file-earmark-text"></i>
                <a href="/Documents/Шаблон_к_бизнес-плану_2025.pdf" target="_blank">Бизнес-жоспарға_үлгі_2025.pdf</a>
            </div>
        </div>

                    <div class="uploaded-documents mt-3">
            <div class="document-item">
                <i class="bi bi-file-earmark-text"></i>
                <a href="/Documents/Бухгалтерлік баланс.pdf" target="_blank">Бухгалтерлік баланс.pdf</a>
            </div>
        </div>

                    <div class="uploaded-documents mt-3">
            <div class="document-item">
                <i class="bi bi-file-earmark-text"></i>
                <a href="/Documents/Қаржылық болжамдар.pdf" target="_blank">Қаржылық болжамдар.pdf</a>
            </div>
        </div>



            <div style="margin:30px">
                <div class="mt-4">
                    <a href="https://localhost:44333/OrdersForBusiness.aspx" class="btn btn-dark">Тапсырыстар тізіміне оралу</a>
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



    

        /* Құжаттар тізімі үшін стильдер */
.uploaded-documents {
    border-top: 1px solid #eee;
    padding-top: 5px;
}

.document-item {
    padding: 8px;
    margin-bottom: 0px;
    background: #f8f9fa;
    border-radius: 4px;
}

.document-item i {
    margin-right: 10px;
    color: #2A5B7C;
}

.document-item a {
    color: #2A5B7C;
    text-decoration: none;
}

.document-item a:hover {
    text-decoration: underline;
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