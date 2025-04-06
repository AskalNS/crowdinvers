<%@ Page Title="Менің инвестицияларым" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyInvestments.aspx.cs" Inherits="WebApplication6.MyInvestments" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="business-orders-container">
        <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/InvestorDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/OrdersForInvestor.aspx" class="nav-link">Инвестициялық жобалар</a>
                 <a runat="server" href="~/MyInvestments.aspx" class="nav-link active">Менің инвестицияларым</a>
                 <a runat="server" href="~/ProfileInvestor.aspx" class="nav-link">Профиль</a>
                 <a runat="server" href="~/ContactForInvestor.aspx" class="nav-link">Байланыс</a>
            </div>
        </div>
    </nav>


        <!-- Основной контент -->
        <main class="orders-content">
            <h1 class="page-title">Менің инвестицияларым</h1>
            
            <div class="orders-grid">
                <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand">
                    <ItemTemplate>
                        <div class="order-card">
                            <!-- Изображение -->
                            <div class="order-image" style="background-image: url('<%# Eval("Url1") %>')">
                                <div class="image-overlay"></div>
                            </div>
                            
                            <!-- Контент -->
                            <div class="order-details">
                                <div class="order-header">
                                    <h3><%# Eval("Target") %></h3>
                                    <div class="order-meta">
                                        <span class="date"><%# Eval("DueDate", "{0:dd.MM.yyyy}") %></span>
                                    </div>
                                </div>
                                
                                <p class="order-description"><%# Eval("Description") %></p>
                                
                                <div class="order-progress">
                                    <div class="progress-text">
                                        <span class="current"><%# Eval("CurrentAmount", "{0:C}") %></span>
                                        <span class="target"><%# Eval("TargetAmount", "{0:C}") %></span>
                                    </div>
                                    <div class="progress-track">
                                        <div class="progress-fill" style="width: <%# GetProgressPercentage((int)Eval("CurrentAmount"), (int)Eval("TargetAmount")) %>%"></div>
                                    </div>
                                </div>
                                
                                <div class="order-meta-details">
                                    <div class="meta-item">
                                        <span class="meta-label">Нысаналы сома:</span>
                                        <span class="meta-value"><%# Eval("TargetAmount", "{0:C}") %></span>
                                    </div>
                                    <div class="meta-item">
                                        <span class="meta-label">Жиналған сома:</span>
                                        <span class="meta-value"><%# Eval("CurrentAmount", "{0:C}") %></span>
                                    </div>
                                </div>
                                
                                <asp:Button ID="btnViewDetails" runat="server" CssClass="order-button" Text="Толығырақ" 
                                    CommandName="ViewDetails" CommandArgument='<%# Eval("Id") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </main>
    </div>

    <style>
        /* Общие стили */
        :root {
            --primary: #2A5B7C;
            --secondary: #4D8BBA;
            --accent: #FF7D33;
            --text: #333333;
            --light-text: #777777;
            --border: #E0E0E0;
            --background: #F9F9F9;
        }
        
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            color: var(--text);
            background-color: white;
            margin: 0;
            padding: 0;
            line-height: 1.5;
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
        /* Основной контент */
        .orders-content {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }
        
        .page-title {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 2rem;
            text-align: center;
        }
        
        /* Сетка карточек */
        .orders-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 2rem;
        }
        
        /* Карточка */
        .order-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .order-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        }
        
        /* Изображение */
        .order-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }
        
        .image-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 60px;
            background: linear-gradient(to top, rgba(0,0,0,0.3), transparent);
        }
        
        /* Детали заказа */
        .order-details {
            padding: 1.5rem;
        }
        
        .order-header {
            margin-bottom: 1rem;
        }
        
        .order-header h3 {
            font-size: 1.25rem;
            font-weight: 600;
            margin: 0;
            color: var(--text);
        }
        
        .order-meta {
            display: flex;
            align-items: center;
            margin-top: 0.5rem;
            font-size: 0.9rem;
            color: var(--light-text);
        }
        
        .order-description {
            color: var(--light-text);
            margin: 1rem 0;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        
        /* Мета-данные */
        .order-meta-details {
            margin: 1.5rem 0;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }
        
        .meta-item {
            display: flex;
            flex-direction: column;
        }
        
        .meta-label {
            font-size: 0.85rem;
            color: var(--light-text);
        }
        
        .meta-value {
            font-weight: 600;
            color: var(--text);
        }
        
        /* Прогресс бар */
        .order-progress {
            margin: 1.5rem 0;
        }
        
        .progress-text {
            display: flex;
            justify-content: space-between;
            font-size: 0.95rem;
            margin-bottom: 0.5rem;
        }
        
        .current {
            font-weight: 600;
            color: var(--primary);
        }
        
        .target {
            color: var(--light-text);
        }
        
        .progress-track {
            height: 6px;
            background: var(--border);
            border-radius: 3px;
            overflow: hidden;
        }
        
        .progress-fill {
            height: 100%;
            background: var(--primary);
            border-radius: 3px;
        }
        
        /* Кнопка */
        .order-button {
            width: 100%;
            padding: 0.75rem;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
        }
        
        .order-button:hover {
            background: var(--secondary);
        }
        
        /* Адаптивность */
        @media (max-width: 768px) {
            .business-nav {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }
            
            .nav-links {
                gap: 1rem;
            }
            
            .orders-content {
                padding: 0 1rem;
            }
            
            .orders-grid {
                grid-template-columns: 1fr;
            }
            
            .order-meta-details {
                grid-template-columns: 1fr;
            }
        }
    </style>

    <!-- Шрифт Inter -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</asp:Content>