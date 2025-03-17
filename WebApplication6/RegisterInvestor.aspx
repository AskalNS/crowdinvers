<%@ Page Title="Инвесторды тіркеу" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegisterInvestor.aspx.cs" Inherits="WebApplication6.RegisterInvestor" %>

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
              <h2 class="mb-0">Инвестор ретінде тіркелу</h2>
          </div>
          <div class="card-body">
              <div class="row">
                  <!-- Первый столбец -->
                  <div class="col-md-6">
                      <!-- ФИО -->
                      <div class="mb-4">
                          <label for="txtFio" class="form-label">Толық аты-жөні</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                              <asp:TextBox ID="txtFio" runat="server" CssClass="form-control" placeholder="Аты-жөніңізді енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvFio" runat="server" ControlToValidate="txtFio"
                              ErrorMessage="Толық аты-жөніңізді енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- ИИН -->
                      <div class="mb-4">
                          <label for="txtIin" class="form-label">ЖСН (ИИН)</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-card-text"></i></span>
                              <asp:TextBox ID="txtIin" runat="server" CssClass="form-control" placeholder="ЖСН-іңізді енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvIin" runat="server" ControlToValidate="txtIin"
                              ErrorMessage="ЖСН-іңізді енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>

                      <!-- Телефон -->
                      <div class="mb-4">
                          <label for="txtPhone" class="form-label">Телефон нөмірі</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-telephone-fill"></i></span>
                              <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Телефон нөміріңізді енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone"
                              ErrorMessage="Телефон нөміріңізді енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                      </div>
                  </div>

                  <!-- Второй столбец -->
                  <div class="col-md-6">
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

                      <!-- Адрес -->
                      <div class="mb-4">
                          <label for="txtAddress" class="form-label">Мекен-жайы</label>
                          <div class="input-group">
                              <span class="input-group-text"><i class="bi bi-geo-alt-fill"></i></span>
                              <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Мекен-жайыңызды енгізіңіз"></asp:TextBox>
                          </div>
                          <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress"
                              ErrorMessage="Мекен-жайыңызды енгізіңіз" CssClass="text-danger small"></asp:RequiredFieldValidator>
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
    </style>
</asp:Content>