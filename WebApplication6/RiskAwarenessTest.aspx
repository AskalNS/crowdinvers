<%@ Page Title="Тәуекелдер туралы тест" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RiskAwarenessTest.aspx.cs" Inherits="WebApplication6.RiskAwarenessTest" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


      <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark"  style="margin-top: -20px;">
        <div class="container">
            <a class="navbar-brand" runat="server" href="~/">Басты бет</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Toggle navigation" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                <ul class="navbar-nav flex-grow-1">
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/RegisterBusiness.aspx">Инвестиция алу</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/RegisterInvestor.aspx">Инвестивия жасау</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/ContactDefault.aspx">Байланыс</a></li>
                    <li class="nav-item"><a class="nav-link" runat="server" href="~/Login.aspx">кіру</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Тәуекелдер туралы тест</h2>
        <p class="text-center mb-4">
            Бұл тест арқылы сіз платформаны пайдаланудың тәуекелдерін түсінгеніңізді растайсыз. Тестті дұрыс тапсыру үшін барлық сұрақтарға дұрыс жауап беруіңіз керек.
        </p>

        <!-- Форма с вопросами -->
        <div>
            <!-- Вопрос 1 -->
            <div class="mb-4">
                <h4>1. Платформа арқылы инвестициялау тәуекелсіз бе?</h4>
                <asp:RadioButtonList ID="q1" runat="server">
                    <asp:ListItem Text="Иә, инвестициялау тәуекелсіз." Value="0" />
                    <asp:ListItem Text="Жоқ, инвестициялау әрқашан тәуекелді." Value="1" />
                </asp:RadioButtonList>
            </div>

            <!-- Вопрос 2 -->
            <div class="mb-4">
                <h4>2. Платформа инвестициялардың нәтижесіне жауап береді ме?</h4>
                <asp:RadioButtonList ID="q2" runat="server">
                    <asp:ListItem Text="Иә, платформа нәтижелерге жауап береді." Value="0" />
                    <asp:ListItem Text="Жоқ, платформа нәтижелерге жауап бермейді." Value="1" />
                </asp:RadioButtonList>
            </div>

            <!-- Вопрос 3 -->
            <div class="mb-4">
                <h4>3. Инвестициялардың тәуекелін толық түсіну керек пе?</h4>
                <asp:RadioButtonList ID="q3" runat="server">
                    <asp:ListItem Text="Иә, инвестициялардың тәуекелін толық түсіну керек." Value="1" />
                    <asp:ListItem Text="Жоқ, тәуекелді түсіну қажет емес." Value="0" />
                </asp:RadioButtonList>
            </div>

            <!-- Вопрос 4 -->
            <div class="mb-4">
                <h4>4. Платформа жобалардың табыстылығын кепілдейді ме?</h4>
                <asp:RadioButtonList ID="q4" runat="server">
                    <asp:ListItem Text="Иә, платформа табыстылықты кепілдейді." Value="0" />
                    <asp:ListItem Text="Жоқ, платформа табыстылықты кепілдемейді." Value="1" />
                </asp:RadioButtonList>
            </div>

            <!-- Вопрос 5 -->
            <div class="mb-4">
                <h4>5. Платформа арқылы инвестициялау кезінде қандай тәуекелдер бар?</h4>
                <asp:RadioButtonList ID="q5" runat="server">
                    <asp:ListItem Text="Тәуекелдер жоқ." Value="0" />
                    <asp:ListItem Text="Инвестицияның толық немесе бөлікті жоғалуы мүмкін." Value="1" />
                </asp:RadioButtonList>
            </div>

            <!-- Кнопка для отправки -->
            <div class="text-center">
                <asp:Button ID="btnSubmit" runat="server" Text="Тестті аяқтау" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
            </div>

            <!-- Результат теста -->
            <div id="result" runat="server" class="mt-4 text-center" style="display: none;">
                <h4 id="resultText" runat="server"></h4>
            </div>
        </div>
    </div>
</asp:Content>