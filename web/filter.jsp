<%--
  Created by IntelliJ IDEA.
  User: luisfelipeas5
  Date: 06/12/16
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Filtra</title>
        <link rel="stylesheet" type="text/css" href="css/template-style.css">
        <link rel="stylesheet" type="text/css" href="css/imovel.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
    <%@include file="header.html" %>

        <div>
            <h1>Filtros</h1>

            <form action="list.jsp">

                <div>
                    <input name="price-lower" type="number" pattern="^\d+(\.|\,)\d{2}$" min="0" class="filter-input" placeholder="Menor preço" id="price-lower" /> <br>
                    <input name="price-biggest" type="number" pattern="^\d+(\.|\,)\d{2}$" min="0" class="filter-input" placeholder="Maior preço" id="price-biggest" /> <br>

                    <input name="country" class="filter-input" placeholder="País" id="country" />  <br>
                    <input name="city" class="filter-input" placeholder="Cidade" id="city" />  <br>
                    <input name="neighborhood" class="filter-input" placeholder="Bairro" id="neighborhood" />  <br>

                    <input name="beds-count" class="filter-input" placeholder="Número de quartos" id="beds-count" />  <br>
                </div>

                <input type="submit">

            </form>

        </div>
    </body>
</html>
