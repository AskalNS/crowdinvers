﻿<%@ Page Title="Тапсырыстар" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrdersForAdmin.aspx.cs" Inherits="WebApplication6.OrdersForAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class ="container" style="margin-top: 40px;">

            <div class="container mt-5">
        <h2 class="text-center mb-4">Тапсырыстар</h2>
        <asp:Repeater ID="rptOrders" runat="server" OnItemCommand="rptOrders_ItemCommand">
            <ItemTemplate>
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Target") %></h5>
                        <p class="card-text"><%# Eval("Description") %></p>
                        <p class="card-text"><strong>Нысаналы сома:</strong> <%# Eval("TargetAmount", "{0:C}") %></p>
                        <p class="card-text"><strong>Жиналған сома:</strong> <%# Eval("CurrentAmount", "{0:C}") %></p>
                        <p class="card-text"><strong>Орындау мерзімі:</strong> <%# Eval("DueDate", "{0:dd.MM.yyyy}") %></p>
                        
                        <!-- Прогресс-бар -->
                        <div class="progress mb-3" style="height: 10px; width: 50%;">
                            <div class="progress-bar bg-success" role="progressbar" 
                                 style='width: <%# GetProgressPercentage((int)Eval("CurrentAmount"), (int)Eval("TargetAmount")) %>%;' 
                                 aria-valuenow='<%# Eval("CurrentAmount") %>' 
                                 aria-valuemin="0" 
                                 aria-valuemax='<%# Eval("TargetAmount") %>'>
                            </div>
                        </div>

                        <asp:Button ID="btnViewDetails" runat="server" CssClass="btn btn-dark" Text="Толығырақ" CommandName="ViewDetails" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>


    </div>










        <style>
            .card {
                border: none;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }

            .card-title {
                font-size: 1.5rem;
                font-weight: bold;
                color: #333;
            }

            .card-text {
                font-size: 1rem;
                color: #555;
            }

            .progress {
                height: 10px; /* Уменьшена высота прогресс-бара */
                border-radius: 10px;
                background-color: #e9ecef;
            }

            .progress-bar {
                border-radius: 10px;
                background: linear-gradient(45deg, #28a745, #218838);
            }

            .btn-dark {
                background: linear-gradient(45deg, #6a11cb, #2575fc);
                border: none;
                transition: background 0.3s ease;
            }

            .btn-dark:hover {
                background: linear-gradient(45deg, #2575fc, #6a11cb);
            }

            .container {
                max-width: 1200px;
            }
        </style>
    </div>
</asp:Content>