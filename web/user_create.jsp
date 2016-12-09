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
            <div class="login-div" style="width: 920px">
                <h1 class="main-title">Cadastro de usuário</h1>
                <form class="bootstrap-form-horizontal" id="user_creation_form" action="user_create.jsp" method="post">
                    <div class="bootstrap-form-group">
                        <label for="firstname" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Primeiro nome: </label>
                        <div class="col-sm-9">
                            <input name="user_firstname" id="firstname" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="lastname" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Último nome: </label>
                        <div class="col-sm-9">
                            <input name="user_lastname" id="lastname" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="email" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Email: </label>
                        <div class="col-sm-9">
                            <input name="user_email" id="email" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="password" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Senha: </label>
                        <div class="col-sm-9">
                            <input name="user_password" id="password" class="text-input" type="password">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="passwordcopy" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Recuperar senha: </label>
                        <div class="col-sm-9">
                            <input id="passwordcopy" class="text-input" type="password">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button id="submitbutton" type="submit" class="btn search-btn">Criar</button>
                        </div>
                        <script>
                            $('#user_creation_form').on('submit', function (e) {
                                if ($('#password').val() != $('#passwordcopy').val()) {
                                    $('#passwordcopy').addClass('error-field');
                                    alert('As senhas não conferem!');
                                    return false;
                                }
                            });
                        </script>
                    </div>
                </form>

                <jsp:useBean id="userDAO" class="DAO.UserDAO" />

                <%  String userFirstName = request.getParameter("user_firstname");
                    String userLastName = request.getParameter("user_lastname");
                    String userEmail = request.getParameter("user_email");
                    String userPassword = request.getParameter("user_password");

                    if (userEmail != null && userLastName != null && userFirstName != null && userPassword != null) {
                        User user = new User();
                        user.setEmail(userEmail);
                        user.setPassword(userPassword);
                        user.setLastName(userLastName);
                        user.setName(userFirstName);
                        System.out.println(user.getEmail() + " " + user.getPassword() + " " + user.getLastName() + " " + user.getName());
                        userDAO.add(user);
                    }
                %>

            </div>
        </div>
    </body>
</html>
