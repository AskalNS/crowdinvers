<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication6._Default" %>

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


    <div class ="container" style="margin-top: 40px;">
            <div class="container mt-5">

        <!-- Секция с проектами -->
        <div class="row mt-4">
            <div class="col-md-12">
                <h2 class="text-center mb-4">Инвестиция жинап жатқан жобалар</h2>
                <div class="row">
                    <!-- Проект 1: Производство продуктов питания -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/ondiris.png" class="card-img-top" alt="Тамақ өндірісі">
                            <div class="card-body">
                                <h5 class="card-title">Тамақ өндірісі</h5>
                                <p class="card-text text-muted">
                                    Органикалық өнімдерді өндіру және оларды ұлттық нарыққа шығару. Фермерлердің өнімдерін қабылдау және оларды сапалы түрде өңдеу.
                                </p>
                                <a href="#" class="btn btn-dark">Толығырақ</a>
                            </div>
                        </div>
                    </div>
                    <!-- Проект 2: Текстильное производство -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/textil.png" class="card-img-top" alt="Текстиль өндірісі">
                            <div class="card-body">
                                <h5 class="card-title">Текстиль өндірісі</h5>
                                <p class="card-text text-muted">
                                    Ұлттық киімдер мен коверлерді шығару. Қазақстандық жүн мен мақтаны пайдалана отырып, сапалы материалдар өндіру.
                                </p>
                                <a href="#" class="btn btn-dark">Толығырақ</a>
                            </div>
                        </div>
                    </div>
                    <!-- Проект 3: Производство медицинских товаров -->
                    <div class="col-md-4">
                        <div class="card">
                            <img src="/images/medical.jpg" class="card-img-top" alt="Медициналық тауарлар өндірісі">
                            <div class="card-body">
                                <h5 class="card-title">Медициналық тауарлар өндірісі</h5>
                                <p class="card-text text-muted">
                                    Медициналық маскалар, перчаткалар және басқа да қорғаныс құралдарын шығару. Дәрі-дәрмектердің ортақ қажеттілігін қамтамасыз ету.
                                </p>
                                <a href="#" class="btn btn-dark">Толығырақ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Секция "О платформе" и "Наши преимущества" -->
        <div class="row mt-5">
            <div class="col-md-6">
                <h2>Платформа туралы</h2>
                <p class="text-muted">
                    CrawdlInvest-инвестициялық мүмкіндіктерді талдауға және бақылауға арналған платформа. 
                    Мы предоставляем инструменты для глубокого анализа рынка и принятия обоснованных решений.
                </p>
            </div>
            <div class="col-md-6">
                <h2>Біздің артықшылықтарымыз</h2>
                <ul class="list-unstyled">
                    <li class="text-muted">Нақты уақыттағы нақты деректер</li>
                    <li class="text-muted">Талдау және болжау құралдары</li>
                    <li class="text-muted">Қауіпсіздік және құпиялылық</li>
                </ul>
            </div>
        </div>

        <!-- Секция с отзывами -->
        <div class="row mt-5">
            <div class="col-md-12">
                <h2 class="text-center mb-4">Пайдаланушылардың пікірлері</h2>
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text text-muted">"CrawdlInvest платформасы арқылы мен инвестициялық мүмкіндіктерді тез таба аламын. Талдау құралдары өте ыңғайлы!"</p>
                                <h5 class="card-title">- Айгүл С.</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text text-muted">"Платформаның қауіпсіздігі мен құпиялылығы менің сенімімді толық қамтамасыз етеді. Керемет қызмет!"</p>
                                <h5 class="card-title">- Бауыржан Т.</h5>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <p class="card-text text-muted">"Инвестициялық шешімдер қабылдау өте оңай болды. Рекомендую барлық жаңадан бастағандарға!"</p>
                                <h5 class="card-title">- Дамир К.</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Секция с FAQ -->
        <div class="row mt-5">
            <div class="col-md-12">
                <h2 class="text-center mb-4">Жиі қойылатын сұрақтар</h2>
                <div class="accordion" id="faqAccordion">
                    <div class="card">
                        <div class="card-header" id="headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    Платформаны қалай пайдалануға болады?
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#faqAccordion">
                            <div class="card-body">
                                Платформаны пайдалану үшін тіркелу және кіру қажет. Тіркелгеннен кейін сіз инвестициялық мүмкіндіктерді талдауға және бақылауға болады.
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Платформа қандай төлем әдістерін қолдайды?
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#faqAccordion">
                            <div class="card-body">
                                Біз негізгі төлем әдістерін қолдаймыз: кредит карталары, электрондық әмияндар және банктік аударымдар.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Секция с кнопками "Начать сейчас" -->
        <div class="row mt-5">
            <div class="col-md-12 text-center">
                <h2>Дәл қазір бастаңыз</h2>
                <a href="/Register" class="btn btn-dark btn-lg">Тіркелу</a>
                <a href="/Login" class="btn btn-outline-dark btn-lg">Кіру</a>
            </div>
        </div>

        <!-- Секция с социальными сетями -->
        <div class="row mt-5">
            <div class="col-md-12 text-center">
                <h2>Біздің әлеуметтік желілердегі беттеріміз</h2>
                <a href="#" class="btn btn-primary"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="btn btn-info"><i class="fab fa-twitter"></i></a>
                <a href="#" class="btn btn-danger"><i class="fab fa-instagram"></i></a>
                <a href="#" class="btn btn-primary"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>
    </div>

    <!-- Футер -->
    <footer class="bg-dark text-white mt-5">
        <div class="container py-4">
            <div class="row">
                <div class="col-md-4">
                    <h5>Байланыс ақпараты</h5>
                    <p>Email: info@crawdlinvest.com</p>
                    <p>Телефон: +7 777 123 4567</p>
                </div>
                <div class="col-md-4">
                    <h5>Пайдалы сілтемелер</h5>
                    <ul class="list-unstyled">
                        <li><a href="#" class="text-white">Қолдану шарттары</a></li>
                        <li><a href="#" class="text-white">Құпиялылық саясаты</a></li>
                        <li><a href="#" class="text-white">Жиі қойылатын сұрақтар</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Біздің әлеуметтік желілер</h5>
                    <a href="#" class="text-white"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </footer>

    </div>


    <!-- Стили -->
    <style>
        .card-img-top {
            height: 240px;
        }

        .btn-lg {
            margin: 8px;
        }

        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .btn-dark {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-outline-dark {
            border: 2px solid #6a11cb;
            color: #6a11cb;
            transition: background 0.3s ease, color 0.3s ease;
        }

        .btn-outline-dark:hover {
            background: #6a11cb;
            color: white;
        }

        .parallax {
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            height: 300px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
    </style>
</asp:Content>