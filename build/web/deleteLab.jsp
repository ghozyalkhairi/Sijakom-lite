<%-- 
    Document   : deleteLab
    Created on : Jul 10, 2023, 12:05:48 PM
    Author     : inighozy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    
    try {
     String URLdb = "jdbc:mysql://localhost/uascall_ghozydb";
     String usernameDB = "uascall_ghozy";
     String passwordDB = "bCtpP2TYVqtY";
     Class.forName("com.mysql.jdbc.Driver");
     Connection connection = DriverManager.getConnection(URLdb, usernameDB, passwordDB);
     Statement statement = connection.createStatement();
     
     String query = "DELETE FROM labkomputer WHERE id=" + id;
     statement.executeUpdate(query);
     response.sendRedirect("index.jsp");
     
    } catch (Exception e) {
     out.println(e.getMessage());
    }
    %>