<%@ Page Title="Басты бет" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BusinessDefault.aspx.cs" Inherits="WebApplication6.BusinessDefault" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Улучшенная навигация -->
    <nav class="business-nav navbar-expand-lg">
        <div class="container">
            <a runat="server" href="~/BusinessDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/BusinessDefault.aspx" class="nav-link active">Басты бет</a>
                <a runat="server" href="~/CreateOrder.aspx" class="nav-link">Жоба құру</a>
                <a runat="server" href="~/OrdersForBusiness.aspx" class="nav-link">Инвестициялар</a>
                <a runat="server" href="~/MyOrders.aspx" class="nav-link">Менің жобаларым</a>
                <a runat="server" href="~/ProfileBusiness.aspx" class="nav-link">Профиль</a>
                <a runat="server" href="~/ContactForBusiness.aspx" class="nav-link">Қолдау</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <!-- Герой-секция -->
        <section class="hero-section">
            <div class="hero-content">
                <h1>Жобаларыңызды қаржыландырыңыз</h1>
                <p class="lead">Көпшілік инвестициясы арқылы бизнесіңізді дамытудың жаңа мүмкіндігі</p>
                <a runat="server" href="~/CreateOrder.aspx" class="btn btn-primary">Жобаны бастау</a>
            </div>
            <div class="hero-image">
                <img src="/images/Logo.jpg" alt="Көпшілік инвестициясы" style="width: 300px; height:auto">
            </div>
        </section>

        <!-- Как это работает -->
        <section class="how-it-works">
            <h2>Жобаны қалай қаржыландыруға болады?</h2>
            <div class="steps">
                <div class="step">
                    <div class="step-number">1</div>
                    <h3>Жобаны жасау</h3>
                    <p>Жобаңыздың сипаттамасын, мақсатын және қажетті қаржы көлемін көрсетіңіз</p>
                </div>
                <div class="step">
                    <div class="step-number">2</div>
                    <h3>Модерация</h3>
                    <p>Біздің команда жобаңызды тексеріп, 24 сағат ішінде жариялайды</p>
                </div>
                <div class="step">
                    <div class="step-number">3</div>
                    <h3>Инвестицияларды жинау</h3>
                    <p>Инвесторлар жобаңызға қаржы сала бастайды</p>
                </div>
                <div class="step">
                    <div class="step-number">4</div>
                    <h3>Қаржыны алу</h3>
                    <p>Мақсатқа жеткенде, қаржы сіздің шотыңызға аударылады</p>
                </div>
            </div>
        </section>

        <!-- Преимущества -->
        <section class="benefits">
            <h2>Біздің платформаны неге таңдау керек?</h2>
            <div class="benefits-grid">
                <div class="benefit-card">
                    <i class="bi bi-coin"></i>
                    <h3>Төмен комиссия</h3>
                    <p>Тек 5% жеткізілген қаржыдан - жоба сәтсіз болса, төлемейсіз</p>
                </div>
                <div class="benefit-card">
                    <i class="bi bi-people-fill"></i>
                    <h3>Кең аудитория</h3>
                    <p>10,000+ белсенді инвесторлардың қауымдастығы</p>
                </div>
                <div class="benefit-card">
                    <i class="bi bi-shield-check"></i>
                    <h3>Қауіпсіздік</h3>
                    <p>Барлық төлемдер қорғалған және сертификатталған</p>
                </div>
                <div class="benefit-card">
                    <i class="bi bi-graph-up"></i>
                    <h3>Аналитика</h3>
                    <p>Жобаның барлық статистикасына қол жетімділік</p>
                </div>
            </div>
        </section>

        <!-- Успешные проекты -->
        <section class="success-projects">
            <h2>Табысты жобалар</h2>
            <div class="projects-slider">
                <div class="project-card">
                    <div class="project-image" style="background-image: url('/images/Etno.jpg')"></div>
                    <div class="project-info">
                        <h3>Ұлттық киімдер бренді</h3>
                        <p>95% қаржыландырылды</p>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 95%"></div>
                        </div>
                    </div>
                </div>
                <div class="project-card">
                    <div class="project-image" style="background-image: url('/images/textil.png')"></div>
                    <div class="project-info">
                        <h3>Эко-өнімдер дүкені</h3>
                        <p>90% қаржыландырылды</p>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 900%"></div>
                        </div>
                    </div>
                </div>
                <div class="project-card">
                    <div class="project-image" style="background-image: url('/images/It.png')"></div>
                    <div class="project-info">
                        <h3>IT-стартап</h3>
                        <p>80% қаржыландырылды</p>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 80%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CTA секция -->
        <section class="cta-section">
            <h2>Өз жобаңызды қазір бастаңыз</h2>
            <p>Бірнеше қарапайым қадамдар арқылы инвестицияларды жинауды бастаңыз</p>
            <div class="cta-buttons">
                <a runat="server" href="~/CreateOrder.aspx" class="btn btn-primary">Жоба құру</a>
                <a runat="server" href="~/ContactForBusiness.aspx" class="btn btn-outline">Көмек керек</a>
            </div>
        </section>
    </div>

    <!-- Стили -->
    <style>
        :root {
            --primary: #2A5B7C;
            --secondary: #3f37c9;
            --accent: #f72585;
            --dark: #212529;
            --light: #f8f9fa;
        }

        /* Навигация */
        .business-nav {
            background: white;
            box-shadow: 0 2px 15px rgba(0,0,0,0.1);
            padding: 1rem 0;
        }

        .business-nav .container {
            display: flex;
            justify-content: space-between;
            align-items: center;
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
            color: var(--dark);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
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

        /* Герой секция */
        .hero-section {
            display: flex;
            align-items: center;
            padding: 4rem 0;
            gap: 3rem;
        }

        .hero-content {
            flex: 1;
        }

        .hero-image {
            flex: 1;
            text-align: center;
        }

        .hero-image img {
            max-width: 100%;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        .hero-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero-section .lead {
            font-size: 1.2rem;
            color: #6c757d;
            margin-bottom: 2rem;
            max-width: 80%;
        }

        /* Как это работает */
        .how-it-works {
            padding: 4rem 0;
            background: var(--light);
            border-radius: 16px;
            margin: 3rem 0;
        }

        .how-it-works h2 {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2rem;
            color: var(--dark);
        }

        .steps {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .step {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
            transition: transform 0.3s;
        }

        .step:hover {
            transform: translateY(-10px);
        }

        .step-number {
            width: 50px;
            height: 50px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: 700;
            margin: 0 auto 1.5rem;
        }

        .step h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        /* Преимущества */
        .benefits {
            padding: 4rem 0;
        }

        .benefits h2 {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2rem;
            color: var(--dark);
        }

        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .benefit-card {
            background: white;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            text-align: center;
            transition: all 0.3s;
        }

        .benefit-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }

        .benefit-card i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1.5rem;
        }

        .benefit-card h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        /* Успешные проекты */
        .success-projects {
            padding: 4rem 0;
            background: var(--light);
            border-radius: 16px;
            margin: 3rem 0;
        }

        .success-projects h2 {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2rem;
            color: var(--dark);
        }

        .projects-slider {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
        }

        .project-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: all 0.3s;
        }

        .project-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
        }

        .project-image {
            height: 200px;
            background-size: cover;
            background-position: center;
        }

        .project-info {
            padding: 1.5rem;
        }

        .project-info h3 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }

        .project-info p {
            color: var(--primary);
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .progress-bar {
            height: 8px;
            background: #e9ecef;
            border-radius: 4px;
            overflow: hidden;
        }

        .progress-fill {
            height: 100%;
            background: var(--primary);
            border-radius: 4px;
        }

        /* CTA секция */
        .cta-section {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            padding: 4rem 2rem;
            border-radius: 16px;
            text-align: center;
            margin: 3rem 0;
        }

        .cta-section h2 {
            font-size: 2rem;
            margin-bottom: 1.5rem;
        }

        .cta-section p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.9;
        }

        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 2rem;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
        }

        .btn-primary {
            background: white;
            color: var(--primary);
        }

        .btn-primary:hover {
            background: #f8f9fa;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn-outline {
            background: transparent;
            color: white;
            border: 2px solid white;
        }

        .btn-outline:hover {
            background: rgba(255,255,255,0.1);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        /* Адаптивность */
        @media (max-width: 992px) {
            .hero-section {
                flex-direction: column;
                text-align: center;
            }

            .hero-section .lead {
                max-width: 100%;
            }

            .hero-image {
                margin-top: 2rem;
            }
        }

        @media (max-width: 768px) {
            .business-nav .container {
                flex-direction: column;
                gap: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</asp:Content>