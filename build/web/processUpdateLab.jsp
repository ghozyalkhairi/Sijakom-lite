<%-- 
    Document   : processUpdateLab
    Created on : Jul 10, 2023, 9:36:00 PM
    Author     : inighozy
--%>

<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String assistant = request.getParameter("assistant");
    String computers = request.getParameter("computers");
    
    if (id != null){
        try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost/uascall_ghozydb",
                "uascall_ghozy",
                "bCtpP2TYVqtY"
                );
                
                String query = "UPDATE labkomputer SET id=?, name=?, assistant=?, computers=? WHERE id=" + id + "";
                PreparedStatement statement = connection.prepareStatement(query);
                
                statement.setString(1, id);
                statement.setString(2, name);
                statement.setString(3, assistant);
                statement.setString(4, computers);
                
                int i = statement.executeUpdate();
                if (i != 0) { response.sendRedirect("dashboardLab.jsp");
                 }
    } catch (Exception e) {
        out.println(e.getMessage());
    }
    }
    %>