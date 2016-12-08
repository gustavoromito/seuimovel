<%@ page import="Model.SaleType" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ResidenceType" %>
<%@ page import="Model.ResidenceFilter" %><%--
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
        <title>Filtro</title>
        <link rel="stylesheet" type="text/css" href="css/template-style.css">
        <link rel="stylesheet" type="text/css" href="css/imovel.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
        <%@include file="header.html" %>

        <jsp:useBean id="saleTypeDao" class="DAO.SaleTypeDAO"/>
        <jsp:useBean id="residenceTypeDao" class="DAO.ResidenceTypeDAO"/>

        <div>
            <h1>Filtros</h1>

            <form action="list.jsp">

                <div>
                    <p>
                        Disponível para:
                        <select name="sale-type" title="Disponível para:">
                            <option value="<%=ResidenceFilter.INVALID_INT_VALUE%>"></option>
                            <%
                                List<SaleType> saleTypes = saleTypeDao.getAll();
                                for (SaleType saleType : saleTypes) { %>
                                <option value="<%=saleType.getId()%>">
                                    <%=saleType.getName()%>
                                </option>
                            <%}%>
                        </select>
                    </p>

                    <p>
                        Tipo de Residencia:
                        <select name="residence-type" title="Tipo de Residência:">
                            <option value="<%=ResidenceFilter.INVALID_INT_VALUE%>"></option>
                            <%
                                List<ResidenceType> residenceTypes = residenceTypeDao.getAll();
                                for (ResidenceType residenceType : residenceTypes) { %>
                            <option value="<%=residenceType.getId()%>">
                                <%=residenceType.getName()%>
                            </option>
                            <%}%>
                        </select>
                    </p>

                    <p>
                        Preço <br>
                        <input name="price-lower" type="number" pattern="^\d+(\.|\,)\d{2}$" min="0" class="filter-input" placeholder="Menor preço" id="price-lower" /> <br>
                        <input name="price-biggest" type="number" pattern="^\d+(\.|\,)\d{2}$" min="0" class="filter-input" placeholder="Maior preço" id="price-biggest" /> <br>
                    </p>

                    <p>
                        Endereço <br>
                        <input name="country" class="filter-input" placeholder="País" id="country" />  <br>
                        <input name="city" class="filter-input" placeholder="Cidade" id="city" />  <br>
                        <input name="neighborhood" class="filter-input" placeholder="Bairro" id="neighborhood" />  <br>
                    </p>

                    <p>
                        Características <br>
                        <input name="beds" class="filter-input" type="number" min="0" placeholder="Número de quartos" id="beds" />  <br>
                        <input name="bathrooms" class="filter-input" type="number" min="0" placeholder="Número de banheiros" id="bathrooms" />  <br>
                        <input name="suites" class="filter-input" type="number" min="0" placeholder="Suítes" id="suites" />  <br>
                        <input name="car-spots" class="filter-input" type="number" min="0" placeholder="Vagas para carros" id="car-spots" />  <br>
                    </p>

                </div>

                <input type="submit">

            </form>

        </div>
    </body>
</html>
