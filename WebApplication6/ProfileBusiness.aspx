<%@ Page Title="Менің профилім" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileBusiness.aspx.cs" Inherits="WebApplication6.ProfileBusiness" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/BusinessDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/CreateOrder.aspx" class="nav-link">Жоба құру</a>
                <a runat="server" href="~/OrdersForBusiness.aspx" class="nav-link">Инвестициялар</a>
                <a runat="server" href="~/MyOrders.aspx" class="nav-link">Менің жобаларым</a>
                <a runat="server" href="~/ProfileBusiness.aspx" class="nav-link active">Профиль</a>
                <a runat="server" href="~/ContactForBusiness.aspx" class="nav-link">Қолдау</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2 class="text-center mb-4">Менің профилім</h2>

        <!-- Форма для отображения и редактирования данных -->
        <div class="card shadow-sm">
            <div class="card-body p-4">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mb-4">
                            <h5><i class="bi bi-person me-2"></i>Иесінің аты-жөні:</h5>
                            <asp:TextBox ID="txtOwnerFIO" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-envelope me-2"></i>Электрондық пошта:</h5>
                            <asp:TextBox ID="txtOwnerMail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-credit-card me-2"></i>Иесінің ЖСН:</h5>
                            <asp:TextBox ID="txtOwnerIIN" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-telephone me-2"></i>Телефон нөмірі:</h5>
                            <asp:TextBox ID="txtOwnerNumber" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group mb-4">
                            <h5><i class="bi bi-building me-2"></i>Компания атауы:</h5>
                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-file-text me-2"></i>Компанияның БСН:</h5>
                            <asp:TextBox ID="txtCompanyBIN" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-geo-alt me-2"></i>Компания мекен-жайы:</h5>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group mb-4">
                            <h5><i class="bi bi-briefcase me-2"></i>Қызмет саласы:</h5>
                            <asp:TextBox ID="txtSector" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group mb-4">
                    <h5><i class="bi bi-info-circle me-2"></i>Компания туралы:</h5>
                    <asp:TextBox ID="txtAboutMe" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>

                <div class="form-group mb-4">
                    <h5><i class="bi bi-calendar me-2"></i>Қызмет басталған күні:</h5>
                    <asp:TextBox ID="txtDateOfBusinessStarted" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </div>

                <!-- Кнопки для редактирования и сохранения -->
                <div class="text-center mt-4">
                    <asp:Button ID="btnEdit" runat="server" Text="Өңдеу" CssClass="btn btn-primary" OnClick="btnEdit_Click" />
                    <asp:Button ID="btnSave" runat="server" Text="Сақтау" CssClass="btn btn-success" OnClick="btnSave_Click" Visible="false" />
                    <asp:Button ID="btnCancel" runat="server" Text="Бас тарту" CssClass="btn btn-secondary" OnClick="btnCancel_Click" Visible="false" />
                </div>
            </div>
        </div>
    </div>

    <!-- Стили -->
    <style>
        :root {
            --primary: #2A5B7C;
            --secondary: #4D8BBA;
            --gray: #777777;
            --transition: all 0.3s ease;
        }
        
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

        .card {
            border: none;
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            padding: 100px;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        h5 {
            color: #333;
            font-weight: bold;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 0.5rem 0.75rem;
        }

        .btn {
            padding: 0.5rem 1.5rem;
            border-radius: 5px;
            font-weight: 500;
        }
    </style>
</asp:Content>