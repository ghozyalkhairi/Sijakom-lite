<%-- 
    Document   : index
    Created on : Jul 10, 2023, 9:06:05 AM
    Author     : inighozy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJAKOM-Lite</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap');
            
            .root{
                margin: 0 auto;
                padding: 0;
                box-sizing: border-box;    
                font-family: 'Poppins', sans-serif;
            }
            .container{
                width: 85%;
                margin: auto;
            }
            .content{
                margin-bottom: 16px;
                background-color: #3A42B3;
                padding: 16px;
            }
            .spacer{
                background-color: white;
                padding: 4px;
            }
            .headerText{
                font-weight: bold;
                color: #2557BA;
                text-align: center;
                padding-top: 8px;
            }
            .subHeaderText{
                font-weight: 500;
                text-align: center;
            }
            .table{
                width: 100%;
                text-align: left;
                border: 1px solid gray;
            }
            .button{
                padding: 8px 14px;
                color: white;
                border:none;
                cursor: pointer;
                border-radius: 20px;
                text-decoration: none;
            }
            .red{
                background-color: #C92626;
            }
            .blue{
                background-color: #3A42B3;
            }
            .green{
                background-color: #40BA39;
            }
            footer p {
                text-align: center
            }
            .logo {
                width: 90px;
                height: 90px;
                align-self: center;
            }
            header {
                width: 100%;
                display: flex;
                flex-direction: column;
            }
            .image {
                max-width: 100%;
                margin: 20px 0;
            }
        </style>
    </head>
    <body class="root">
        <%@page import="java.sql.*" %>
        <% 
            try {
                String URLdb = "jdbc:mysql://localhost/uascall_ghozydb";
                String usernameDB = "uascall_ghozy";
                String passwordDB = "bCtpP2TYVqtY";
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(URLdb, usernameDB, passwordDB);
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM labkomputer";
                ResultSet result = statement.executeQuery(query);
                
                %>
            <div class="container">
            <header>
            <img src="logo.png" alt="Logo UMP" class="logo">
            <h1 class="headerText">SIJAKOM Lite</h1>    
            <h2 class="subHeaderText">
                Sistem Informasi Jadwal Laboratorium Komputer
            </h2>
            </header>
            <div class="content">
                <div class="spacer">
            <table class="table">
                <thead>
                    <tr>
                        <th>
                            Nama Ruangan
                        </th>
                        <th>
                            Nama Asisten
                        </th>
                        <th>
                            Jumlah Komputer
                        </th>
                    </tr>
                </thead>
                <tbody>
                    
                <%
                while(result.next()){
                %>
                    <tr>
                        <td>
                            <% out.println(result.getString("name")); %>
                        </td>
                        <td>
                            <% out.println(result.getString("assistant")); %>
                        </td>
                        <td>
                            <% out.println(result.getInt("computers")); %>
                        </td>
                    </tr>               
                <%
            }
                result.close();
                statement.close();
                connection.close();
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>
            </tbody> 
            </table>
            </div>
        </div>
            <a href="login.jsp">
            <button class="button green">
                Login
            </button>               
            </a>
        </div>
            <img src="ump.jpg" alt="Logo UMP" class="image">
            <footer>
                <p class="text-center text-md">
                Coded by Ghozy Alkhairi
                </p>
            </footer>
    </body>
</html>
