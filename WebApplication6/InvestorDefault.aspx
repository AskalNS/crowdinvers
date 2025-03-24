<%@ Page Title="Басты бет" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorDefault.aspx.cs" Inherits="WebApplication6.InvestorDefault" %>

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

    <!-- Основной контент -->
    <div class="container" style="margin-top: 40px;">

        <!-- Герой-секция -->
        <div class="hero-section text-center text-white py-5">
            <div class="container">
                <h1 class="display-4">Қайта қош келдіңіз!</h1>
                <p class="lead">Сіздің инвестициялық портфеліңізді басқаруды жалғастырыңыз.</p>
            </div>
        </div>

        <!-- Преимущества -->
        <div id="advantages" class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center mb-5">Біздің артықшылықтарымыз</h2>
                <div class="row">
                    <div class="col-md-4 text-center">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <i class="bi bi-graph-up display-4 text-primary"></i>
                                <h3 class="card-title mt-3">Жоғары кіріс</h3>
                                <p class="card-text">Біздің жобалар жоғары кіріс пен тұрақтылықты қамтамасыз етеді.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <i class="bi bi-shield-check display-4 text-primary"></i>
                                <h3 class="card-title mt-3">Сенімділік</h3>
                                <p class="card-text">Біздің жобалар мұқият тексеріледі және сенімділігі жоғары.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 text-center">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <i class="bi bi-people display-4 text-primary"></i>
                                <h3 class="card-title mt-3">Қолдау</h3>
                                <p class="card-text">Біздің команда сіздің кез-келген сұрақтарыңызға көмектесуге әрдайым дайын.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Активные инвестиции -->
        <div class="py-5">
            <div class="container">
                <h2 class="text-center mb-5">Белсенді инвестицияларыңыз</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">Жоба атауы</h3>
                                <p class="card-text">Инвестиция сомасы: $10,000</p>
                                <p class="card-text">Күтілетін кіріс: 15%</p>
                                <p class="card-text">Мерзімі: 12 ай</p>
                                <a href="/MyInvestments.aspx" class="btn btn-primary">Толығырақ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Отзывы -->
        <div class="py-5 bg-light">
            <div class="container">
                <h2 class="text-center mb-5">Инвесторлардың пікірлері</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <p class="card-text">"Керемет платформа! Барлығы анық және сенімді. Ұсынамын!"</p>
                                <footer class="blockquote-footer">Иван Иванов</footer>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <p class="card-text">"Инвестициялау өте оңай және тиімді. Нәтижелерге қуаныштымын."</p>
                                <footer class="blockquote-footer">Мария Петрова</footer>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <p class="card-text">"Үздік қызмет және көмекке әрдайым дайын команда."</p>
                                <footer class="blockquote-footer">Алексей Смирнов</footer>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Условия и правила платформы -->
        <div class="py-5">
            <div class="container">
                <h2 class="text-center mb-5">Платформаның шарттары мен ережелері</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">1. Жалпы ережелер</h3>
                                <p class="card-text">
                                    Crowdinvesting платформасы арқылы инвестициялау үшін төмендегі шарттар мен ережелер қолданылады. Платформаны пайдалану арқылы сіз осы шарттармен келісесіз.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">2. Тіркелу және аккаунт</h3>
                                <p class="card-text">
                                    Платформаны пайдалану үшін тіркелу қажет. Тіркелу кезінде сіз нақты және дәл ақпаратты көрсетуіңіз керек. Аккаунттың қауіпсіздігін қамтамасыз ету сіздің міндетіңіз.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">3. Инвестициялау шарттары</h3>
                                <p class="card-text">
                                    Инвестициялау үшін сізге ережелерге сәйкес қаржылық құралдарды салу қажет. Инвестициялардың тәуекелін толық түсінуіңіз керек. Платформа инвестициялық кеңес бермейді.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">4. Жобаларды таңдау</h3>
                                <p class="card-text">
                                    Сіз өзіңізге қызықты жобаларды таңдай аласыз. Жобалардың барлық ақпараты платформада көрсетілген.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">5. Комиссиялар және төлемдер</h3>
                                <p class="card-text">
                                    Платформа арнайы комиссиялар алады, олар инвестициялау процесінде қолданылады. Төлемдер туралы толық ақпаратты платформаның төлем бөлімінде таба аласыз.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">6. Қауіпсіздік және деректерді қорғау</h3>
                                <p class="card-text">
                                    Платформа сіздің жеке деректеріңізді қорғау үшін барлық қажетті шараларды қолданады. Деректердің бұзылуынан туындаған шығындар үшін платформа жауапкершілік алмайды.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">7. Жауапкершіліктерді шектеу</h3>
                                <p class="card-text">
                                    Платформа инвестициялардың нәтижесіне немесе жобалардың табыстылығына жауап бермейді. Барлық шешімдер сіздің тәуекелдік толеранттылығыңызға байланысты.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">8. Ережелерді өзгерту</h3>
                                <p class="card-text">
                                    Платформа осы шарттар мен ережелерді кез келген уақытта өзгерту құқығын сақтайды. Өзгерістер туралы хабарламалар платформа арқылы жіберіледі.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">9. Деректерді пайдалану</h3>
                                <p class="card-text">
                                    Платформа сіздің деректеріңізді тек қызметтерді жақсарту және заңды талаптарды орындау үшін пайдаланады. Деректерді үшінші тараптармен бөлісу тек сіздің келісіміңізбен жүзеге асырылады.
                                </p>
                            </div>
                        </div>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-body">
                                <h3 class="card-title">10. Байланыс</h3>
                                <p class="card-text">
                                    Кез-келген сұрақтар немесе қосымша ақпарат алу үшін біздің қолдау қызметіне хабарласыңыз. Байланыс деректері платформаның "Байланыс" бөлімінде көрсетілген.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Стили -->
    <style>
        .hero-section {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            padding: 100px 0;
        }

        .cta-section {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
            padding: 100px 0;
        }

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
        }

        .btn-primary {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
        }

        .btn-light {
            background: white;
            color: #6a11cb;
            border: none;
            transition: background 0.3s ease;
        }

        .btn-light:hover {
            background: #f8f9fa;
        }
    </style>
</asp:Content>