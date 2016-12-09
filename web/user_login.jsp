<%--
  Created by IntelliJ IDEA.
  User: antonio
  Date: 07/12/16
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DAO.*, Model.*"%>
<html>
<head>
    <title>SeuImovel | Novo usuário</title>
    <link rel="stylesheet" type="text/css" href="css/template-style.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="wrapper" style="margin-top: 10px">
        <div class="login-div">
            <h1 class="main-title">Login</h1>
            <form class="bootstrap-form-horizontal">
                <div class="bootstrap-form-group">
                    <label for="username" class="bootstrap-control-label col-sm-2" style="color: #ffffff; font-size: medium">Login: </label>
                    <div class="col-sm-10">
                        <input name="email" id="username" class="text-input" type="text" required>
                    </div>
                </div>
                <div class="bootstrap-form-group">
                    <label for="password" class="bootstrap-control-label col-sm-2" style="color: #ffffff; font-size: medium">Senha: </label>
                    <div class="col-sm-10">
                        <input name="password" id="password" class="text-input" type="password" required>
                    </div>
                </div>
                <div class="bootstrap-form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <a href="user_login.jsp">
                            <button type="submit" class="btn search-btn">Fazer login</button>
                        </a>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-div">
            <h3 class="main-title">Ainda não está cadastrado?</h3>
            <h3 class="main-title">Faça o seu cadastro hoje mesmo!</h3>

            <a type="button" class="btn search-btn" href="user_create.jsp">Cadastrar-se</a>
        </div>
        <input type="hidden" name="userId">

        <jsp:useBean id="user" class="Model.User"/>
        <jsp:useBean id="userDAO" class="DAO.UserDAO"/>
        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            user.setEmail(email);
            user.setPassword(password);

            user = userDAO.login(user);
            if (user != null) {
               response.sendRedirect("index.jsp?name=" + user.getName() + "&email=" + user.getEmail());
            }
        %>
    </div>
</body>
</html>
