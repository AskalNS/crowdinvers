<%@ Page Title="Заказ құру" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateOrder.aspx.cs" Inherits="WebApplication6.CreateOrder" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Навигация -->
    <nav class="business-nav">
        <div class="container">
            <a runat="server" href="~/BusinessDefault.aspx" class="nav-brand">CrowdInvest</a>
            <div class="nav-links">
                <a runat="server" href="~/CreateOrder.aspx" class="nav-link active">Жоба құру</a>
                <a runat="server" href="~/OrdersForBusiness.aspx" class="nav-link">Инвестициялар</a>
                <a runat="server" href="~/MyOrders.aspx" class="nav-link">Менің жобаларым</a>
                <a runat="server" href="~/ContactForBusiness.aspx" class="nav-link">Қолдау</a>
            </div>
        </div>
    </nav>

    <div class="container create-order-container">
        <div class="create-order-header">
            <h1>Жаңа жобаны құру</h1>
            <p class="subtitle">Инвесторларды тарту үшін жобаңызды толық сипаттаңыз</p>
        </div>

        <div class="create-order-card">
            <div class="order-form">
                <!-- Основная информация -->
                <div class="form-section">
                    <h2 class="section-title">Негізгі ақпарат</h2>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtTarget" class="form-label">Жоба атауы</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-bullseye"></i>
                                    <asp:TextBox ID="txtTarget" runat="server" CssClass="form-control" placeholder="Жобаңыздың атауын енгізіңіз"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvTarget" runat="server" ControlToValidate="txtTarget"
                                    ErrorMessage="Жоба атауын енгізіңіз" CssClass="error-message"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtTargetAmount" class="form-label">Қажетті қаржы сомасы</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-currency-tenge"></i>

                                    <asp:TextBox ID="txtTargetAmount" runat="server" CssClass="form-control" placeholder="Қажетті соманы енгізіңіз"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvTargetAmount" runat="server" ControlToValidate="txtTargetAmount"
                                    ErrorMessage="Қаржы сомасын енгізіңіз" CssClass="error-message"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="txtDueDate" class="form-label">Жоба мерзімі</label>
                                <div class="input-with-icon">
                                    <i class="bi bi-calendar-check"></i>
                                    <asp:TextBox ID="txtDueDate" runat="server" CssClass="form-control" TextMode="Date" placeholder="Мерзімін таңдаңыз"></asp:TextBox>
                                </div>
                                <asp:RequiredFieldValidator ID="rfvDueDate" runat="server" ControlToValidate="txtDueDate"
                                    ErrorMessage="Мерзімін енгізіңіз" CssClass="error-message"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                         <!-- Контейнер для загрузки файлов -->
                           <div style="width:400px">
                               <label class="form-label">Компания фотоларын жүктеу (4 фото)</label>
                                 <div class="file-upload-container border rounded p-3 mb-3">
                                     <div class="input-group">
                                         <span class="input-group-text bg-light">
                                             <i class="bi bi-camera-fill text-primary"></i>
                                         </span>
                                         <asp:FileUpload ID="FileUploadControl" runat="server" 
                                             CssClass="form-control" 
                                             AllowMultiple="true"
                                             aria-label="Фото жүктеу" />
                                     </div>
  
                                     <!-- Кнопка загрузки -->
                                     <div class="text-center mt-3">
                                         <asp:Button ID="UploadButton" runat="server" 
                                             Text="Жүктеу" 
                                             CssClass="btn btn-outline-primary" 
                                             OnClick="UploadButton_Click" CausesValidation="false" />
                                     </div>
  
                                     <!-- Статус загрузки -->
                                     <asp:Label ID="StatusLabel" runat="server" 
                                         CssClass="d-block text-center mt-2 small text-muted" />
                                 </div>

                                <!-- Галерея загруженных фото -->
    <div class="uploaded-photos row g-2 mt-2" id="photoGallery" runat="server">
        <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
  
        <!-- Здесь будут отображаться превью загруженных фото -->
        <div class="col-3 photo-preview" id="photoPreview1" runat="server" visible="false">
            <div class="card h-100">
                <div class="card-body p-2 text-center">
                    <i class="bi bi-image text-muted" style="font-size: 2rem;"></i>
                    <asp:HyperLink ID="PhotoLink1" runat="server" 
                        CssClass="d-block small text-truncate" 
                        Target="_blank" />
                </div>
            </div>
        </div>
  
        <div class="col-3 photo-preview" id="photoPreview2" runat="server" visible="false">
            <div class="card h-100">
                <div class="card-body p-2 text-center">
                    <i class="bi bi-image text-muted" style="font-size: 2rem;"></i>
                    <asp:HyperLink ID="PhotoLink2" runat="server" 
                        CssClass="d-block small text-truncate" 
                        Target="_blank" />
                </div>
            </div>
        </div>
  
        <div class="col-3 photo-preview" id="photoPreview3" runat="server" visible="false">
            <div class="card h-100">
                <div class="card-body p-2 text-center">
                    <i class="bi bi-image text-muted" style="font-size: 2rem;"></i>
                    <asp:HyperLink ID="PhotoLink3" runat="server" 
                        CssClass="d-block small text-truncate" 
                        Target="_blank" />
                </div>
            </div>
        </div>
  
        <div class="col-3 photo-preview" id="photoPreview4" runat="server" visible="false">
            <div class="card h-100">
                <div class="card-body p-2 text-center">
                    <i class="bi bi-image text-muted" style="font-size: 2rem;"></i>
                    <asp:HyperLink ID="PhotoLink4" runat="server" 
                        CssClass="d-block small text-truncate" 
                        Target="_blank" />
                </div>
            </div>
        </div>
    </div>



                           </div>
                    </div>
                </div>
                <asp:HiddenField ID="PhotoIndex" runat="server" Value="0" />



                <!-- Описание проекта -->
                <div class="form-section">
                    <h2 class="section-title">Жоба сипаттамасы</h2>
                    <div class="form-group">
                        <label for="txtDescription" class="form-label">Толық сипаттама</label>
                        <div class="input-with-icon">
                            <i class="bi bi-card-text"></i>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" 
                                TextMode="MultiLine" Rows="6" 
                                placeholder="Жобаңыздың мақсаты мен мәнін сипаттаңыз" style="width: 950px   !important; max-width: 950px !important; min-width: 950px !important;"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvDescription" runat="server" ControlToValidate="txtDescription"
                            ErrorMessage="Сипаттаманы енгізіңіз" CssClass="error-message"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <!-- План проекта -->
                <div class="form-section">
                    <h2 class="section-title">Жоба жоспары</h2>
                    <div class="form-group">
                        <label for="txtPlan" class="form-label">Іске асыру жоспары</label>
                        <div class="input-with-icon">
                            <i class="bi bi-file-earmark-text"></i>
                            <asp:TextBox ID="txtPlan" runat="server" CssClass="form-control" 
                                TextMode="MultiLine" Rows="6" 
                                placeholder="Жобаны қалай жүзеге асыратыныңызды сипаттаңыз" style="width: 950px   !important; max-width: 950px !important; min-width: 950px !important;"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPlan" runat="server" ControlToValidate="txtPlan"
                            ErrorMessage="Жоспарды енгізіңіз" CssClass="error-message"></asp:RequiredFieldValidator>
                    </div>
                </div>










                <!-- Кнопка отправки -->
                <div class="form-actions">
                    <asp:Button ID="btnCreateOrder" runat="server" Text="Жобаны құру" 
                        CssClass="submit-btn" OnClick="btnCreateOrder_Click" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="form-message"></asp:Label>
                </div>
            </div>
        </div>
    </div>

    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a0ca3;
            --accent: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
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
        .create-order-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        /* Заголовок */
        .create-order-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .create-order-header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .create-order-header .subtitle {
            font-size: 1.2rem;
            color: var(--gray);
            max-width: 700px;
            margin: 0 auto;
        }

        /* Карточка формы */
        .create-order-card {
            background: white;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            overflow: hidden;
            padding: 2.5rem;
        }

        /* Секции формы */
        .form-section {
            margin-bottom: 3rem;
        }

        .section-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 1.5rem;
            padding-bottom: 0.75rem;
            border-bottom: 2px solid var(--light-gray);
        }

        /* Форма */
        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-label {
            display: block;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.75rem;
        }

        .input-with-icon {
            position: relative;
        }

        .input-with-icon i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--gray);
            font-size: 1.2rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 3rem;
            border: 1px solid var(--light-gray);
            border-radius: var(--border-radius);
            font-size: 1rem;
            transition: var(--transition);
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
            outline: none;
        }

        textarea.form-control {
            min-height: 150px;
            resize: vertical;
            padding-left: 3rem;
        }

        /* Загрузка файлов */
        .file-upload-box {
            border: 2px dashed var(--light-gray);
            border-radius: var(--border-radius);
            padding: 2rem;
            text-align: center;
            transition: var(--transition);
        }

        .file-upload-box:hover {
            border-color: var(--primary);
            background: rgba(67, 97, 238, 0.05);
        }

        .upload-area {
            margin-bottom: 1.5rem;
        }

        .upload-area i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .upload-area p {
            color: var(--gray);
            margin-bottom: 0;
        }

        .file-input {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            top: 0;
            left: 0;
            cursor: pointer;
        }

        .upload-actions {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 1rem;
        }

        .upload-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.5rem 1.5rem;
            border-radius: 6px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
        }

        .upload-btn:hover {
            background: var(--primary-dark);
        }

        .status-text {
            font-size: 0.9rem;
            color: var(--gray);
        }

        /* Галерея фото */
        .photo-gallery {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 1.5rem;
        }

        .photo-preview {
            position: relative;
            border-radius: var(--border-radius);
            overflow: hidden;
        }

        .photo-thumbnail {
            position: relative;
            padding-top: 100%; /* Квадратное соотношение */
            background: var(--light-gray);
        }

        .thumbnail-img {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .photo-overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: var(--transition);
        }

        .photo-preview:hover .photo-overlay {
            opacity: 1;
        }

        .view-link {
            color: white;
            font-size: 1.5rem;
        }

        /* Кнопка отправки */
        .form-actions {
            text-align: center;
            margin-top: 3rem;
        }

        .submit-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 1rem 3rem;
            border-radius: var(--border-radius);
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            box-shadow: 0 4px 15px rgba(67, 97, 238, 0.3);
        }

        .submit-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(67, 97, 238, 0.4);
        }

        /* Сообщения */
        .error-message {
            display: block;
            color: var(--accent);
            font-size: 0.9rem;
            margin-top: 0.5rem;
        }

        .form-message {
            display: block;
            margin-top: 1rem;
            font-size: 1rem;
        }

        /* Адаптивность */
        @media (max-width: 992px) {
            .create-order-header h1 {
                font-size: 2rem;
            }
            
            .create-order-header .subtitle {
                font-size: 1.1rem;
            }
        }

        @media (max-width: 768px) {
            .business-nav .container {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }
            
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 1rem;
            }
            
            .create-order-container {
                padding: 0 1rem;
            }
            
            .create-order-card {
                padding: 1.5rem;
            }
            
            .photo-gallery {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .create-order-header h1 {
                font-size: 1.8rem;
            }
            
            .section-title {
                font-size: 1.3rem;
            }
            
            .photo-gallery {
                grid-template-columns: 1fr;
            }
            
            .submit-btn {
                width: 100%;
                padding: 1rem;
            }
        }
    </style>

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</asp:Content>