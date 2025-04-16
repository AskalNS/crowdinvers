<%@ Page Title="Инвестор порталы" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InvestorDefault.aspx.cs" Inherits="WebApplication6.InvestorDefault" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/InvestorDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/OrdersForInvestor.aspx" class="nav-link">Инвестициялық жобалар</a>
                 <a runat="server" href="~/MyInvestments.aspx" class="nav-link">Менің инвестицияларым</a>
                 <a runat="server" href="~/ProfileInvestor.aspx" class="nav-link">Профиль</a>
                 <a runat="server" href="~/ContactForInvestor.aspx" class="nav-link">Байланыс</a>
            </div>
        </div>
    </nav>

    <!-- Основной контент -->
    <div class="container">
        <!-- Приветственная секция -->
        <section class="welcome-section" style="color: white !important;">
            <div class="container" style="color: white !important;">
                <div class="welcome-content" style="color: white !important;">
                    <h1 style="color: white !important;">
                        Қайырлы күн, <asp:Label ID="lblUserName" runat="server" Text="Инвестор" />!
                    </h1>
                    <p class="subtitle" style="color: white !important;">Сіздің инвестициялық портфеліңіздің қазіргі жағдайы</p>
            
                    <div class="stats-grid" style="color: white !important;">
                        <div class="stat-card" style="color: white !important;">
                            <div class="stat-value" style="color: white !important;">
                                <p class="text-muted" id="textInvestment" runat="server" style="color: white !important;"></p>
                            </div>
                            <div class="stat-label" style="color: white !important;">Жалпы инвестиция</div>
                        </div>
                        <div class="stat-card" style="color: white !important;">
                            <div class="stat-value" style="color: white !important;">
                                <p class="text-muted" id="textCount" runat="server" style="color: white !important;"></p>
                            </div>
                            <div class="stat-label" style="color: white !important;">Белсенді жобалар</div>
                        </div>
                        <div class="stat-card" style="color: white !important;">
                            <div class="stat-value" style="color: white !important;">
                                <p class="text-muted" id="txtProfit" runat="server" style="color: white !important;"></p>
                            </div>
                            <div class="stat-label" style="color: white !important;">Орташа кіріс</div>
                        </div>
                        <div class="stat-card" style="color: white !important;">
                            <div class="stat-value" style="color: white !important;">
                                <p class="text-muted" id="txtProfitSumm" runat="server" style="color: white !important;"></p>
                            </div>
                            <div class="stat-label" style="color: white !important;">Жалпы кіріс</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Рекомендуемые проекты -->
        <section class="featured-projects">
            <div class="container">
                <div class="section-header">
                    <h2>Ұсынылатын жобалар</h2>
                    <a runat="server" href="~/OrdersForInvestor.aspx" class="view-all">Барлығын қарау</a>
                </div>
                
                <div class="projects-grid">
                    <asp:Repeater ID="rptFeaturedProjects" runat="server">
                        <ItemTemplate>
                            <div class="project-card">
                                <div class="project-badge"><%# Eval("Category") %></div>
                                <div class="project-image" style="background-image: url('<%# Eval("ImageUrl") %>')"></div>
                                <div class="project-content">
                                    <h3><%# Eval("Title") %></h3>
                                    <div class="project-meta">
                                        <span><i class="bi bi-currency-dollar"></i> <%# Eval("TargetAmount", "{0:C}") %></span>
                                        <span><i class="bi bi-graph-up"></i> <%# Eval("ReturnRate") %>% кіріс</span>
                                    </div>
                                    <div class="progress-container">
                                        <div class="progress-bar">
                                            <div class="progress-fill" style="width: <%# Eval("Progress") %>%"></div>
                                        </div>
                                        <div class="progress-text"><%# Eval("Progress") %>% жиналды</div>
                                    </div>
                                    <a href='<%# "ProjectDetails.aspx?id=" + Eval("Id") %>' class="btn-invest">Инвестициялау</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </section>

        <!-- Активные инвестиции -->
        <section class="active-investments">
            <div class="container">
                <div class="section-header">
                    <h2>Сіздің инвестицияларыңыз</h2>
                    <a runat="server" href="~/MyInvestments.aspx" class="view-all">Портфельді қарау</a>
                </div>
                
                <div class="investments-list">
                    <asp:Repeater ID="rptActiveInvestments" runat="server">
                        <ItemTemplate>
                            <div class="investment-card">
                                <div class="investment-header">
                                    <h3><%# Eval("ProjectTitle") %></h3>
                                    <span class="investment-status <%# (DateTime)Eval("EndDate") %>">
                                        <%# (DateTime)Eval("EndDate") %>
                                    </span>
                                </div>
                                <div class="investment-details">
                                    <div class="detail">
                                        <span class="label">Инвестиция сомасы:</span>
                                        <span class="value"><%# Eval("Amount", "{0:C}") %></span>
                                    </div>
                                    <div class="detail">
                                        <span class="label">Күтілетін кіріс:</span>
                                        <span class="value"><%# Eval("ExpectedReturn") %>%</span>
                                    </div>
                                    <div class="detail">
                                        <span class="label">Мерзімі:</span>
                                        <span class="value"><%# Eval("EndDate", "{0:dd.MM.yyyy}") %></span>
                                    </div>
                                </div>
                                <div class="investment-actions">
                                    <a href='<%# "ProjectDetails.aspx?id=" + Eval("ProjectId") %>' class="btn-details">Толығырақ</a>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                    <div class="empty-state" id="emptyInvestments" runat="server" visible="false">
                        <i class="bi bi-wallet2"></i>
                        <h3>Инвестициялар табылмады</h3>
                        <p>Сіз әлі жобаларға инвестиция салған жоқсыз. Алғашқы инвестицияңызды жасау үшін жобалар тізіміне өтіңіз.</p>
                        <a runat="server" href="~/OrdersForInvestor.aspx" class="btn-primary">Жобаларды қарау</a>
                    </div>
                </div>
            </div>
        </section>

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
        :root {
            --primary: #2A5B7C;
            --primary-dark: #3a0ca3;
            --accent: #f72585;
            --success: #4cc9f0;
            --warning: #f8961e;
            --danger: #ef233c;
            --dark: #212529;
            --light: #f8f9fa;
            --gray: #6c757d;
            --light-gray: #e9ecef;
            --border-radius: 12px;
            --box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            --transition: all 0.3s ease;
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

        /* Основной контейнер */
        .investor-dashboard {
            background: var(--light);
            min-height: calc(100vh - 76px);
        }

        /* Приветственная секция */
        .welcome-section {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 3rem 0;
        }

        .welcome-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .welcome-section h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .welcome-section .subtitle {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 2rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.5rem;
            margin-top: 2rem;
        }

        .stat-card {
            background: rgba(255,255,255,0.1);
            border-radius: var(--border-radius);
            padding: 1.5rem;
            backdrop-filter: blur(5px);
            transition: var(--transition);
        }

        .stat-card:hover {
            transform: translateY(-5px);
            background: rgba(255,255,255,0.2);
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .stat-label {
            font-size: 0.9rem;
            opacity: 0.8;
        }

        /* Секции */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .section-header h2 {
            font-size: 2rem;
            font-weight: 600;
            color: var(--dark);
        }

        .view-all {
            color: var(--primary);
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .view-all:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        /* Карточки проектов */
        .featured-projects {
            padding: 4rem 0;
        }

        .projects-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
        }

        .project-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            transition: var(--transition);
        }

        .project-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .project-badge {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: var(--primary);
            color: white;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
            z-index: 1;
        }

        .project-image {
            height: 180px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .project-content {
            padding: 1.5rem;
        }

        .project-content h3 {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .project-meta {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
            font-size: 0.9rem;
            color: var(--gray);
        }

        .project-meta i {
            margin-right: 0.5rem;
        }

        .progress-container {
            margin: 1.5rem 0;
        }

        .progress-bar {
            height: 8px;
            background: var(--light-gray);
            border-radius: 4px;
            overflow: hidden;
            margin-bottom: 0.5rem;
        }

        .progress-fill {
            height: 100%;
            background: linear-gradient(90deg, var(--primary), var(--success));
            border-radius: 4px;
        }

        .progress-text {
            font-size: 0.8rem;
            color: var(--gray);
            text-align: right;
        }

        .btn-invest {
            display: block;
            width: 100%;
            background: var(--primary);
            color: white;
            text-align: center;
            padding: 0.75rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-invest:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* Активные инвестиции */
        .active-investments {
            padding: 2rem 0 4rem;
            background: white;
        }

        .investments-list {
            display: grid;
            gap: 1.5rem;
        }

        .investment-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            transition: var(--transition);
        }

        .investment-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .investment-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .investment-header h3 {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--dark);
            margin: 0;
        }

        .investment-status {
            font-size: 0.8rem;
            font-weight: 500;
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
        }

        .status-active {
            background: var(--success);
            color: white;
        }

        .status-completed {
            background: var(--primary);
            color: white;
        }

        .status-warning {
            background: var(--warning);
            color: white;
        }

        .investment-details {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .detail {
            display: flex;
            flex-direction: column;
        }

        .label {
            font-size: 0.8rem;
            color: var(--gray);
            margin-bottom: 0.25rem;
        }

        .value {
            font-weight: 600;
            color: var(--dark);
        }

        .investment-actions {
            text-align: right;
        }

        .btn-details {
            background: white;
            color: var(--primary);
            border: 1px solid var(--primary);
            padding: 0.5rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-details:hover {
            background: var(--primary);
            color: white;
        }

        /* Как начать */
        .how-to-start {
            padding: 4rem 0;
            background: var(--light);
        }

        .how-to-start h2 {
            text-align: center;
            margin-bottom: 3rem;
            font-size: 2rem;
            color: var(--dark);
        }

        .steps {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            max-width: 1000px;
            margin: 0 auto;
        }

        .step {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            text-align: center;
            transition: var(--transition);
        }

        .step:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0,0,0,0.15);
        }

        .step-number {
            width: 40px;
            height: 40px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.25rem;
            font-weight: 700;
            margin: 0 auto 1rem;
        }

        .step-content h3 {
            font-size: 1.25rem;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .step-content p {
            color: var(--gray);
            font-size: 0.9rem;
            line-height: 1.5;
        }

        /* Пустое состояние */
        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
        }

        .empty-state i {
            font-size: 3rem;
            color: var(--light-gray);
            margin-bottom: 1.5rem;
        }

        .empty-state h3 {
            font-size: 1.5rem;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .empty-state p {
            color: var(--gray);
            max-width: 500px;
            margin: 0 auto 2rem;
            line-height: 1.6;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(67, 97, 238, 0.3);
            color: white;
        }

        /* Адаптивность */
        @media (max-width: 992px) {
            .welcome-section h1 {
                font-size: 2rem;
            }
            
            .section-header h2 {
                font-size: 1.75rem;
            }
        }

        @media (max-width: 768px) {
            .investor-nav .container {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }
            
            .projects-grid {
                grid-template-columns: 1fr;
            }
            
            .investment-details {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 576px) {
            .welcome-section h1 {
                font-size: 1.8rem;
            }
            
            .stats-grid {
                grid-template-columns: 1fr 1fr;
            }
            
            .steps {
                grid-template-columns: 1fr;
            }
            
            .investment-details {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</asp:Content>