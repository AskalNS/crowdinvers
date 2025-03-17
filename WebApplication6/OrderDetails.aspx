<%@ Page Title="Детали заказа" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="WebApplication6.OrderDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-5">
        <div class="card shadow-sm">
            <div class="card-header bg-dark text-white">
                <h2 class="mb-0">Детали заказа</h2>
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
                <div class="mt-4">
                    <a href="Orders.aspx" class="btn btn-dark">Назад к списку заказов</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>