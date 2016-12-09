<%@ page import="Model.SaleType" %>
<%@ page import="java.util.List" %>
<%@ page import="Model.ResidenceType" %>
<%@ page import="Model.ResidenceFilter" %>
<%@ page import="Model.Residence "%>
<%@ page import="Utils.Utils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" xmlns:jsp="http://java.sun.com/JSP/Page">
<head>
    <meta charset="UTF-8">
    <title>Template</title>
    <link rel="stylesheet" type="text/css" href="css/template-style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
</head>
<body>
    <nav>
        <div class="wrapper" style="height: 100%;">
            <div id="user-icon-container">
                <img class="profile-icon" src="images/profile-icon.png">
                <a class="btn action-btn">Entrar</a>
            </div>
            <img class="logo" src="images/home-icon.png">
        </div>
    </nav>
    <style>
        #search-text {
            float: left;
            width: calc(100% - 150px);
        }

        .search-btn {
            float: right;
        }


        .clearfix:before,
        .clearfix:after {
            content: " ";
            display: table;
        }
        .clearfix:after {
            clear: both;
        }
        #content-container {
            width: 100%;
            margin-top: 10px;
        }
        #filter-container {
            width: 295px;
            background: #eaeaea;
            height: auto;
            padding: 5px 10px;
            display: inline-block;
            float: left;
            border-radius:10px;
            -webkit-box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
            -moz-box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
            box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
        }

        #filter-container h3 {
            margin: 0;
            color: #636363;
            text-align: center;
        }

        #search-results-container {
            width: calc(100% - 300px);
            padding: 5px 10px;
            height: 200px;
            display: inline-block;
            border-radius:10px;
        }

        .search-result {
            width: 100%;
            height: 200px;
            background: #fff;
            margin-bottom: 25px;
            -webkit-box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
            -moz-box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
            box-shadow: 0px 4px 17px 2px rgba(217,217,217,1);
            border-radius: 5px;
            overflow: hidden;
        }

        .search-result .image-container {
            display: inline-block;
            float: left;
            position: relative;
        }

        .search-result .image-container .price-container {
            position: absolute;
            bottom: 0;
            left:0;
            height: 70px;
            background: linear-gradient(rgba(0,0,0,0.15), #000);
            width: 100%;
            color: #FFFFFF;
            padding: 5px 10px;
        }

        .search-result .image-container .price-container h2,
        .search-result .image-container .price-container p{
            margin:0;
        }

        .search-result img {
            height: 200px;
            width: 200px;
        }

        .search-result .description_container {
            display: inline-block;
            float: right;
            width: calc(100% - 200px);
            padding: 5px 10px 5px 10px;
        }

        .search-result h2 {
            margin: 0;
        }
    </style>
    <div class="wrapper">
        <div id="search-input-container" class="clearfix">
            <input style="margin: 10px auto; display: block;" name="search-text" type="text" class="text-input" placeholder="Busque por um bairro" id="search-text">
            <button id="search-btn" class="btn search-btn" style="margin-top: 10px;">
                Buscar
            </button>
            <script>
                $(document).ready(function() {
                    $("#search-btn").click(function() {
                        window.location.href = "search.jsp?search=" + $("#search-text").val();
                    });
                });
            </script>
        </div>

        <jsp:useBean id="saleTypeDao" class="DAO.SaleTypeDAO"/>
        <jsp:useBean id="residenceTypeDao" class="DAO.ResidenceTypeDAO"/>
        <jsp:useBean id="residenceDao" class="DAO.ResidenceDAO"/>
        <jsp:useBean id="filter" class="Model.ResidenceFilter"/>

        <div id="content-container">
            <div id="filter-container">
                <div class="content">
                    <h3>FILTROS</h3>
                    <form action="search.jsp">
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
                                Endereço: <br>
                                <input name="country" class="filter-input" placeholder="País" id="country" />  <br>
                                <input name="city" class="filter-input" placeholder="Cidade" id="city" />  <br>
                                <input name="neighborhood" class="filter-input" placeholder="Bairro" id="neighborhood" />  <br>
                                <input name="address" class="filter-input" placeholder="Rua" id="address" />  <br>
                            </p>

                            <p>
                                Características <br>
                                <input name="beds" class="filter-input" type="number" min="0" placeholder="Número de quartos" id="beds" />  <br>
                                <input name="bathrooms" class="filter-input" type="number" min="0" placeholder="Número de banheiros" id="bathrooms" />  <br>
                                <input name="suites" class="filter-input" type="number" min="0" placeholder="Suítes" id="suites" />  <br>
                                <input name="car-spots" class="filter-input" type="number" min="0" placeholder="Vagas para carros" id="car-spots" />  <br>
                            </p>

                        </div>

                        <button type="submit" class="btn search-btn" style="margin-top: 10px;">
                            Filtrar
                        </button>

                    </form>
                </div>
            </div>

            <div id="search-results-container">
                <% //Filter configuration
                    int saleTypeId = Utils.parseInt(request, "sale-type");
                    filter.setSaleTypeId(saleTypeId);

                    int residenceTypeId = Utils.parseInt(request, "residence-type");
                    filter.setResidenceTypeId(residenceTypeId);

                    double priceLower = Utils.parseDouble(request, "price-lower");
                    double priceBiggest = Utils.parseDouble(request, "price-biggest");
                    filter.setPrice(priceLower, priceBiggest);

                    String country = request.getParameter("country");
                    filter.setCountry(country);
                    String city = request.getParameter("city");
                    filter.setCity(city);
                    String neighborhood = request.getParameter("neighborhood");
                    if (neighborhood == null) {
                        neighborhood = request.getParameter("search");
                    }
                    filter.setNeighborhood(neighborhood);
                    String address = request.getParameter("address");
                    filter.setAddress(address);

                    int bedsCount = Utils.parseInt(request, "beds");
                    filter.setBedsCount(bedsCount);
                    int bathrooms = Utils.parseInt(request, "bathrooms");
                    filter.setBathroomsCount(bathrooms);
                    int suites = Utils.parseInt(request, "suites");
                    filter.setSuitesCount(suites);
                    int carSpots = Utils.parseInt(request, "carSpots");
                    filter.setCarSpotsCount(carSpots);
                %>

                <%
                    List<Residence> residences = residenceDao.get(filter);
                    for (Residence residence : residences) { %>
                        <div class="search-result" style="position: relative">
                            <%
                                if (residence.isHighlighted()) {%>
                            <img src="images/ic_highlight.png" style="position: absolute; top: 0; left: 0; width: 100px; height: auto; z-index: 999">
                                <%}
                            %>

                            <div class="image-container">
                                <img src="<%=residence.getPicture(0).getPath()%>">
                                <div class="price-container">
                                    <p>Preço</p>
                                    <h2><%=Utils.parseMoney(residence.getPrice())%></h2>
                                </div>
                            </div>
                            <div class="description_container">
                                <h2><%=residence.getAddressFull()%></h2>
                                <p style="max-height: 85px; margin: 0; overflow: hidden"> <%=residence.getDescription()%> </p>
                            </div>
                            <a href="imovel.jsp?id=<%=residence.getId()%>">
                                <button class="btn search-btn" style="float: right; font-size: 12px; padding: 7px 10px; margin: 0 10px 10px 15px">
                                    Ver Mais
                                </button>
                            </a>
                        </div>
                <% } %>
            </div>

        </div>
    </div>

</body>
</html>
