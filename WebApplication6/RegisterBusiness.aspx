﻿<%@ Page Title="Бизнесті тіркеу" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterBusiness.aspx.cs" Inherits="WebApplication6.RegisterBusiness" %>

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
      <div class="card shadow-sm">
          <div class="card-header bg-dark text-white text-center">
              <h2 class="mb-0">Бизнесті тіркеу</h2>
          </div>
          <div class="card-body">
              <div class="row">
                  <!-- Первый столбец -->
                  <div class="col-md-6">
                      <!-- ФИО владельца -->
                      <div class="mb-4">
                          <label for="txtOwnerFIO" class="form-label">Иесінің толық аты-жөні</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                              <asp:TextBox ID="txtOwnerFIO" runat="server" CssClass="form-control" placeholder="Иесінің аты-жөні"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvOwnerFIO" runat="server" ControlToValidate="txtOwnerFIO"
                              ErrorMessage="Иесінің аты-жөнін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- ИИН владельца -->
                      <div class="mb-4">
                          <label for="txtOwnerIIN" class="form-label">Иесінің ЖСН (ИИН)</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-card-text"></i></span>
                              <asp:TextBox ID="txtOwnerIIN" runat="server" CssClass="form-control" placeholder="Иесінің ЖСН-і"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvOwnerIIN" runat="server" ControlToValidate="txtOwnerIIN"
                              ErrorMessage="Иесінің ЖСН-ін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Телефон владельца -->
                      <div class="mb-4">
                          <label for="txtOwnerNumber" class="form-label">Иесінің телефон нөмірі</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                              <asp:TextBox ID="txtOwnerNumber" runat="server" CssClass="form-control" placeholder="Иесінің телефон нөмірі"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvOwnerNumber" runat="server" ControlToValidate="txtOwnerNumber"
                              ErrorMessage="Иесінің телефон нөмірін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Название компании -->
                      <div class="mb-4">
                          <label for="txtCompanyName" class="form-label">Компания атауы</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-building"></i></span>
                              <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Компания атауы"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="txtCompanyName"
                              ErrorMessage="Компания атауын енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Пароль -->
                      <div class="mb-4">
                          <label for="txtPassword" class="form-label">Құпия сөз</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                              <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Құпия сөзді енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                              ErrorMessage="Құпия сөзді енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Подтверждение пароля -->
                      <div class="mb-4">
                          <label for="txtConfirmPassword" class="form-label">Құпия сөзді растау</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                              <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Құпия сөзді қайта енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" ControlToValidate="txtConfirmPassword"
                              ErrorMessage="Құпия сөзді қайта енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                          <asp:CompareValidator ID="cvPassword" runat="server" ControlToValidate="txtConfirmPassword"
                              ControlToCompare="txtPassword" ErrorMessage="Құпия сөздер сәйкес келмейді" CssClass="text-danger small"></asp:CompareValidator>
                      </div>
                  </div>

                  <!-- Второй столбец -->
                  <div class="col-md-6">
                      <!-- БИН компании -->
                      <div class="mb-4">
                          <label for="txtCompanyBIN" class="form-label">Компания БИН</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-file-earmark-text"></i></span>
                              <asp:TextBox ID="txtCompanyBIN" runat="server" CssClass="form-control" placeholder="Компания БИН"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvCompanyBIN" runat="server" ControlToValidate="txtCompanyBIN"
                              ErrorMessage="Компания БИН-ін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Адрес компании -->
                      <div class="mb-4">
                          <label for="txtAddress" class="form-label">Мекен-жайы</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-geo-alt-fill"></i></span>
                              <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Мекен-жайы"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                              ErrorMessage="Мекен-жайын енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Сектор бизнеса -->
                      <div class="mb-4">
                          <label for="txtSector" class="form-label">Бизнес секторы</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-briefcase-fill"></i></span>
                              <asp:TextBox ID="txtSector" runat="server" CssClass="form-control" placeholder="Бизнес секторы"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvSector" runat="server" ControlToValidate="txtSector"
                              ErrorMessage="Бизнес секторын енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Дата начала бизнеса -->
                      <div class="mb-4">
                          <label for="txtDateOfBusinessStarted" class="form-label">Бизнес басталған күні</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                              <asp:TextBox ID="txtDateOfBusinessStarted" runat="server" CssClass="form-control" TextMode="Date" placeholder="Бизнес басталған күні"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvDateOfBusinessStarted" runat="server" ControlToValidate="txtDateOfBusinessStarted"
                              ErrorMessage="Бизнес басталған күнін енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                                                                  <!-- Email -->
                      <div class="mb-4">
                          <label for="txtMail" class="form-label">Электрондық пошта</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-envelope-fill"></i></span>
                              <asp:TextBox ID="txtMail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Электрондық поштаңызды енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvMail" runat="server" ControlToValidate="txtMail"
                              ErrorMessage="Электрондық поштаңызды енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="revMail" runat="server" ControlToValidate="txtMail"
                              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                              ErrorMessage="Электрондық поштаңызды дұрыс енгізіңіз" CssClass="text-danger small"></asp:RegularExpressionValidator>
                      </div>

                      <div class="mb-4">
                            <label class="form-label">Компания фотоларын жүктеу (4 фото)</label>
    
                            <!-- Контейнер для загрузки файлов -->
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
                                <asp:HiddenField ID="PhotoIndex" runat="server" Value="0" />
        
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


                     <!-- О себе -->
                 <div>
                     <label for="txtAboutMe" class="form-label">Компания туралы айтыңыз</label>
                     <div class="input-group">
                         <span class="input-group-text"><i class="bi bi-file-earmark-text"></i></span>
                         <asp:TextBox ID="txtAboutMe" runat="server" CssClass="form-control" TextMode="MultiLine" style="width: 650px   !important; max-width: 650px !important; min-width: 650px !important;" Rows="6"  placeholder="Компания туралы айтыңыз"></asp:TextBox>

                     </div>
                     <asp:RequiredFieldValidator ID="rfvPlan" runat="server" ControlToValidate="txtAboutMe"
                         ErrorMessage="Компания туралы айтыңыз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                 </div>
                  <asp:Button ID="btnRedirect" runat="server" CssClass="btn btn-blue btn-lg w-30" Text="Үлгі көру" PostBackUrl="~/AboutMeExamples.aspx" style="margin-top:-40px; margin-bottom:20px"/>


                  <a href="https://localhost:44333/PlatformAgreement.aspx" style="margin-top:-10px;">Келесісім шарт</a>.
                  
                  <div style="margin-top:-10px; margin-bottom:40px">
                     <div class="input-group">
                         <span class="">Келісім шартты оқып шықтым және келісемін___</span>
                        <asp:CheckBox ID="chkAgreemm" runat="server" style="width:80px"/>
                     </div>
                 </div>
                  


              <!-- Кнопка регистрации -->
              <div class="row">
                  <div class="col-md-12 text-center">
                      <asp:Button ID="btnRegister" runat="server" Text="Тіркелу" CssClass="btn btn-dark btn-lg w-50" OnClick="btnRegister_Click" />
                  </div>
              </div>

              <!-- Сообщение об ошибке или успехе -->
              <div class="row mt-3">
                  <div class="col-md-12 text-center">
                      <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                  </div>
              </div>
          </div>
      </div>
  </div>


    </div>



  

    <style>
        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .card {
            border-radius: 10px;
            overflow: hidden;
        }

        .card-header {
            font-size: 1.5rem;
            font-weight: bold;
            padding: 1.5rem;
        }

        .card-body {
            padding: 2rem;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .input-group {
            margin-bottom: 1rem;
        }

        .input-group-text {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-right: none;
        }

        .form-control {
            border-left: none;
            padding: 0.75rem;
            border-radius: 0 5px 5px 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #6a11cb;
        }

        .btn-dark {
            background: linear-gradient(45deg, #6a11cb, #2575fc);
            border: none;
            transition: background 0.3s ease;
        }

        .btn-dark:hover {
            background: linear-gradient(45deg, #2575fc, #6a11cb);
        }

        .btn-lg {
            padding: 0.75rem 1.5rem;
            font-size: 1.25rem;
        }

        .text-danger {
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        .text-danger small {
            display: block;
            margin-top: 0.25rem;
        }

        @media (max-width: 768px) {
            .col-md-6 {
                margin-left: 0;
                margin-right: 0;
            }

            .btn-lg {
                width: 100% !important;
            }
        }

                /* Стили для загрузки файлов */
        .file-upload-container {
            background-color: #f8f9fa;
            border: 1px dashed #ced4da !important;
            transition: all 0.3s ease;
        }

        .file-upload-container:hover {
            border-color: #6a11cb !important;
            background-color: #f0f5ff;
        }

        /* Стили для превью фотографий */
        .photo-preview .card {
            border-radius: 8px;
            overflow: hidden;
            transition: transform 0.2s;
        }

        .photo-preview .card:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .photo-preview .card-body {
            padding: 0.5rem;
        }

        /* Иконка камеры */
        .bi-camera-fill {
            font-size: 1.2rem;
        }
    </style>
</asp:Content>