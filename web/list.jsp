<%--
  Created by IntelliJ IDEA.
  User: luisfelipeas5
  Date: 06/12/16
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Model.Residence, java.util.List "%>
<%@ page import="Utils.Utils" %>
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

    <jsp:useBean id="residenceDao" class="DAO.ResidenceDAO"/>
    <jsp:useBean id="filter" class="Model.ResidenceFilter"/>

    <%
        double priceLower = Utils.parseDouble(request, "price-lower");
        double priceBiggest = Utils.parseDouble(request, "price-biggest");
        filter.setPrice(priceLower, priceBiggest);

        String country = request.getParameter("country");
        filter.setCountry(country);
        String city = request.getParameter("city");
        filter.setCity(city);
        String neighborhood = request.getParameter("neighborhood");
        filter.setNeighborhood(neighborhood);

        int bedsCount = Utils.parseInt(request, "beds-count");
        filter.setBedsCount(bedsCount);
    %>

    <%
        List<Residence> residences = residenceDao.get(filter);
        for (Residence residence : residences) { %>
            <div>
                <p>
                    Price: <%=residence.getPrice()%> <br>
                    Country: <%=residence.getCountry()%> <br>
                    City: <%=residence.getCity()%> <br>
                    Neighborhood: <%=residence.getNeighborhood()%> <br>
                    Bathrooms: <%=residence.getBathrooms()%> <br>
                </p>
            </div>
        <% }
    %>
</body>
</html>
