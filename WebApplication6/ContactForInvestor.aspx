<%@ Page Title="Байланыс" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactForInvestor.aspx.cs" Inherits="WebApplication6.ContactForInvestor" %>

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
        <main aria-labelledby="title">
            <h2 id="title"><%: Title %></h2>
            <p>
                Сіздің сұрақтарыңызға жауап беруге және көмек көрсетуге дайынбыз. Төмендегі байланыс ақпараты арқылы бізге хабарласыңыз немесе тікелей хабарласу формасын толтырыңыз.
            </p>

            <!-- Контактная информация -->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title">Байланыс ақпараты</h4>
                            <address>
                                <strong>Мекен-жайы:</strong><br />
                                Қазақстан, Нұр-Сұлтан, Бейбітшілік көшесі, 10<br />
                                <strong>Телефон:</strong><br />
                                +7 (7172) 123-456<br />
                                <strong>Электрондық пошта:</strong><br />
                                <a href="mailto:info@businessplatform.kz">info@businessplatform.kz</a>
                            </address>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mb-4 shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title">Жұмыс уақыты</h4>
                            <p>
                                <strong>Дүйсенбі - Жұма:</strong> 09:00 - 18:00<br />
                                <strong>Сенбі:</strong> 10:00 - 15:00<br />
                                <strong>Жексенбі:</strong> Демалыс күні
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Форма обратной связи -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title">Хабарласу формасы</h4>
                            <form>
                                <div class="mb-3">
                                    <label for="name" class="form-label">Аты-жөніңіз</label>
                                    <input type="text" class="form-control" id="name" placeholder="Аты-жөніңізді енгізіңіз" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Электрондық пошта</label>
                                    <input type="email" class="form-control" id="email" placeholder="Электрондық поштаңызды енгізіңіз" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Телефон нөмірі</label>
                                    <input type="tel" class="form-control" id="phone" placeholder="Телефон нөміріңізді енгізіңіз">
                                </div>
                                <div class="mb-3">
                                    <label for="message" class="form-label">Хабарлама</label>
                                    <textarea class="form-control" id="message" rows="5" placeholder="Хабарламаңызды енгізіңіз" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-primary">Жіберу</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Дополнительная информация для новых пользователей -->
            <div class="row mt-4">
                <div class="col-md-12">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h4 class="card-title">Платформаны пайдалану туралы</h4>
                            <p>
                                Егер сіз біздің платформаны пайдаланбаған болсаңыз, біз сізге оны қалай бастау керектігін түсіндіреміз. Платформа арқылы сіз:
                            </p>
                            <ul>
                                <li>Инвестицияларды табысты басқаруға болады.</li>
                                <li>Жобаларды қаржыландыруға қатысуға болады.</li>
                                <li>Бизнесіңізді дамыту үшін жаңа мүмкіндіктерге қол жеткізе аласыз.</li>
                            </ul>
                            <p>
                                Кез-келген сұрақтар болса, бізге хабарласыңыз!
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Стили для улучшения внешнего вида -->
    <style>
        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
        }

        .form-control {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .btn-primary {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
        }
    </style>
</asp:Content>