<%@ Page Title="Мой профиль" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileInvestorView.aspx.cs" Inherits="WebApplication6.ProfileInvestorView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

               <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/InvestorDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/OrdersForInvestor.aspx" class="nav-link">Инвестициялық жобалар</a>
                 <a runat="server" href="~/MyInvestments.aspx" class="nav-link">Менің инвестицияларым</a>
                 <a runat="server" href="~/ProfileInvestor.aspx" class="nav-link active">Профиль</a>
                 <a runat="server" href="~/ContactForInvestor.aspx" class="nav-link">Байланыс</a>
            </div>
        </div>
    </nav>


    <div class="container mt-4">
        <!-- Заголовок страницы -->
        <h2 class="text-center mb-4">Менің профилім</h2>

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
                            <h5><i class="bi bi-card-text me-2"></i>ЖСН</h5>
                            <p class="text-muted" id="lblIin" runat="server"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-telephone me-2"></i>Телефон нөмірі</h5>
                            <p class="text-muted" id="lblPhoneNumber" runat="server"></p>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-geo-alt me-2"></i>Мекен-жайы</h5>
                            <p class="text-muted" id="lblAddress" runat="server"></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-4">
                            <h5><i class="bi bi-calendar me-2"></i>Тіркелген күні</h5>
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
                    <h4>Карта деректерін енгізіңіз</h4>
                    <div class="mb-3">
                        <label for="cardNumber" class="form-label">Карта нөмірі</label>
                        <asp:TextBox ID="cardNumber" runat="server" CssClass="form-control" placeholder="1234 5678 9012 3456" required></asp:TextBox>
                    </div>
                     <div class="mb-3">
                         <label for="txtAmount" class="form-label">Алу сомасы</label>
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