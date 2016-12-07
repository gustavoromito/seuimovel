<%--
  Created by IntelliJ IDEA.
  User: luisfelipeas5
  Date: 06/12/16
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DAO.*, Model.*, Test.*"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Buscar Imóvel</title>
    <link rel="stylesheet" type="text/css" href="css/template-style.css">
    <link rel="stylesheet" type="text/css" href="css/imovel.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
    <%@include file="header.html" %>

    <%
        ResidenceDAO residenceDao = new ResidenceDAO();
        ResidenceFilter filter = new ResidenceFilter();
        filter.setPrice(201, 201);
        List<Residence> residences = residenceDao.get(filter);

        for (Residence residence : residences) { %>
            <div>
                <p>Price <%=residence.getPrice()%></p>
                <p>Country <%=residence.getCountry()%></p>
            </div>
        <% }
    %>

</body>
</html>
