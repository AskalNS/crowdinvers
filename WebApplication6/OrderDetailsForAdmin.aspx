<%@ Page Title="Детали заказа" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetailsForAdmin.aspx.cs" Inherits="WebApplication6.OrderDetailsForAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white">
                <h2 class="mb-0">Заказ туралы</h2>
            </div>
            <div class="card-body">
                <asp:FormView ID="fvOrderDetails" runat="server">
                    <ItemTemplate>
                        <h4><%# Eval("Target") %></h4>
                        <p><strong>Описание:</strong> <%# Eval("Description") %></p>
                        <p><strong>Целевая сумма:</strong> <%# Eval("TargetAmount", "{0:C}") %></p>
                        <p><strong>Срок выполнения:</strong> <%# Eval("DueDate", "{0:dd.MM.yyyy}") %></p>
                        <p><strong>План:</strong> <%# Eval("Plan") %></p>
                    </ItemTemplate>
                </asp:FormView>



                <br />
                <br />

                    <!-- График платежа -->
                    <div>
                        <label for="txtAboutMe" class="form-label">Төлем графигын жасау</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-file-earmark-text"></i></span>
                            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" 
                                style="width: 950px !important; max-width: 950px !important; min-width: 950px !important;" 
                                Rows="10">
                    Компания: [Название компании]
                    ИИН / БИН: [ИИН / БИН компании]
                    Қаржыландыру сомасы: [Сумма финансирования]
                    Төлем мерзімі: [Общий срок выплаты]

                    Төлемдер кестесі:
                    [Дата 1] - [Дата 2] : [Сумма 1] 

                    Қосымша шарттар:
                    Айыппұл мөлшерлемесі – 2% (кешіктіру болған жағдайда)
                    [Дополнительные условия, если есть]

                    Админ: [ФИО администратора]
                    Байланыс: [Контакты администратора]
                            </asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="rfvPlan" runat="server" ControlToValidate="txtContent"
                            ErrorMessage="Компания туралы айтыңыз" CssClass="text-danger small"></asp:RequiredFieldValidator>
                    </div>



                <div style="margin-top:0px; display:flex">

                    
                  <!-- Кнопка регистрации -->
                  <div class="row">
                      <div class="col-md-12 text-center">
                          <asp:Button ID="btnDeny" runat="server" Text="Бас тарту" CssClass="btn btn-dark btn-lg w-150" OnClick="btnDeny_Click" />
                      </div>
                  </div>
                  <!-- Кнопка регистрации -->
                  <div class="row" style="margin-left:30px;">
                      <div class="col-md-12 text-center">
                          <asp:Button ID="btnAccept" runat="server" Text="Растау" CssClass="btn btn-dark btn-lg w-150" OnClick="btnAccept_Click" />
                      </div>
                  </div>

                </div>

                <br />
                <br />
                <br />
                <!-- Кнопка "Назад к списку заказов" -->
                <div class="mt-4">
                    <a href="Orders.aspx" class="btn btn-dark">Артқа қайту</a>
                </div>
            </div>
        </div>
    </div>


</asp:Content>