<%-- 
    Document   : createLab
    Created on : Jul 10, 2023, 11:30:12 AM
    Author     : inighozy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIJAKOM Lite</title>
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
            .button{
                font-size: 14px;
                padding: 6px 14px;
                color: white;
                border:none;
                cursor: pointer;
                border-radius: 20px;
            }
            .subHeaderText{
                font-weight: 500;
                text-align: center;
            }
            .red{
                background-color: #C92626;
            }
            .blue{
                background-color: #3A42B3;
            }
            .green{
                background-color: #40BA39;
                color: white;
            }
            .input{
                width: 98%;
                padding: 6px;
            }
            .full{
                margin-top: 12px;
                width: 100%;
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
        </style>
    </head>
    <body class="root">
        <div class="container">
            <header>
            <img src="logo.png" alt="Logo UMP" class="logo">
            <h1 class="headerText">
                SIJAKOM Lite
            </h1>                
            </header>
            <h2 class="subHeaderText">
                Tambah ruangan lab
            </h2>
            <div class="content">
                <form action="" method="post">
                <div class="spacer">
                    <label>
                        Nama Ruangan <br>
                        <input type="text" name="name" id="name" class="input"/>
                    </label> <br>
                    <label>
                        Nama Asisten <br>
                        <input type="text" name="assistant" id="assistant" class="input"/>
                    </label> <br>
                    <label>
                        Jumlah Komputer <br>
                        <input type="number" name="computers" id="computers" class="input"/>
                    </label>
                    <input type="submit" name="createLab" class="button green full">
                </div>
                </form>
            </div>
            <a href="dashboardLab.jsp">
            <button class="button blue">
                Kembali ke dashboard
            </button>               
            </a>
            <footer>
                <p class="text-center text-md">
                Coded by Ghozy Alkhairi
                </p>
            </footer>
        </div>
    </body>
    <%@page import="java.sql.*" %>
    <%@page import="javax.swing.*" %>
    <% 
        String name = request.getParameter("name");
        String assistant = request.getParameter("assistant");
        String computers = request.getParameter("computers");
        
        if (name != null && assistant != null && computers != null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/uascall_ghozydb",
                "uascall_ghozy",
                "bCtpP2TYVqtY"
                );
                String query ="INSERT INTO labkomputer VALUES(?, ?, ?, ?)";
                PreparedStatement statement = connection.prepareStatement(query);
                
                int randomNum = (int) (Math.random() * (99-1) + 1);
                
                statement.setInt(1, randomNum   );
                statement.setString(2, name);
                statement.setString(3, assistant);
                statement.setString(4, computers);
                int updatedQuery = statement.executeUpdate();
                if (updatedQuery != 0) { response.sendRedirect("dashboardLab.jsp"); };
               
        } catch (Exception e) {
                out.println(e.getMessage());
        }
        }
        %>
</html>
