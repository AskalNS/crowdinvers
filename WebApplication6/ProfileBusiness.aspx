<%@ Page Title="Мой профиль" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfileBusiness.aspx.cs" Inherits="WebApplication6.ProfileBusiness" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Мой профиль</h2>

        <!-- Форма для отображения и редактирования данных -->
        <div class="card shadow-sm p-4">
            <div class="form-group">
                <label for="txtOwnerFIO">ФИО владельца:</label>
                <asp:TextBox ID="txtOwnerFIO" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtOwnerMail">Электронная почта владельца:</label>
                <asp:TextBox ID="txtOwnerMail" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtOwnerIIN">ИИН владельца:</label>
                <asp:TextBox ID="txtOwnerIIN" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtOwnerNumber">Номер телефона владельца:</label>
                <asp:TextBox ID="txtOwnerNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtCompanyName">Название компании:</label>
                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtCompanyBIN">БИН компании:</label>
                <asp:TextBox ID="txtCompanyBIN" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtAddress">Адрес компании:</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtSector">Сектор деятельности:</label>
                <asp:TextBox ID="txtSector" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtAboutMe">О компании:</label>
                <asp:TextBox ID="txtAboutMe" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtDateOfBusinessStarted">Дата начала деятельности:</label>
                <asp:TextBox ID="txtDateOfBusinessStarted" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            </div>

            <!-- Кнопки для редактирования и сохранения -->
            <div class="text-center mt-4">
                <asp:Button ID="btnEdit" runat="server" Text="Редактировать" CssClass="btn btn-primary" OnClick="btnEdit_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Сохранить" CssClass="btn btn-success" OnClick="btnSave_Click" Visible="false" />
                <asp:Button ID="btnCancel" runat="server" Text="Отмена" CssClass="btn btn-secondary" OnClick="btnCancel_Click" Visible="false" />
            </div>
        </div>
    </div>
</asp:Content>