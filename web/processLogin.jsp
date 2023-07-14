<%-- 
    Document   : processLogin
    Created on : Jul 10, 2023, 10:08:30 PM
    Author     : inighozy
--%>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if (username.equals("admin") && password.equals("admin")){
        response.sendRedirect("dashboardLab.jsp");
        return;
        }
        response.sendRedirect("login.jsp");
    %>