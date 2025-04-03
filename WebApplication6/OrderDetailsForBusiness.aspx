<%@ Page Title="Тапсырыс сипаттамасы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForBusiness.aspx.cs" Inherits="WebApplication6.OrderDetailsForBusiness" %>

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
                <div class="mt-4">
                    <a href="https://localhost:44333/OrdersForBusiness.aspx" class="btn btn-dark">Тапсырыстар тізіміне оралу</a>
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