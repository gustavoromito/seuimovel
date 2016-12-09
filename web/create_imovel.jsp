<%--
  Created by IntelliJ IDEA.
  User: antonio
  Date: 07/12/16
  Time: 22:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DAO.*, Model.*"%>
<%@ page import="Utils.Utils" %>
<html>
    <head>
        <title>SeuImovel | Novo Imóvel</title>
        <link rel="stylesheet" type="text/css" href="css/template-style.css">
        <link rel="stylesheet" type="text/css" href="css/login.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            var selectedLatLng;
            var map;
            var markers = [];
            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -23.533773, lng: -46.625290},
                    zoom: 8
                });
                map.addListener('click', function(e) {
                    placeMarkerAndPanTo(e.latLng, map);
                });
            }

            function setMapOnAll(map) {
                for (var i = 0; i < markers.length; i++) {
                    markers[i].setMap(map);
                }
            }

            function clearMarkers() {
                setMapOnAll(null);
            }

            function deleteMarkers() {
                clearMarkers();
                markers = [];
            }

            function placeMarkerAndPanTo(latLng, map) {
                deleteMarkers();
                selectedLatLng = latLng;
                var marker = new google.maps.Marker({
                    position: latLng,
                    map: map
                });
                $("#latitude").val(latLng.lat());
                $("#longitude").val(latLng.lng());
                markers.push(marker);
                map.panTo(latLng);
            }

        </script>
        <script async defer
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBzoOgR5EDgEOkkZd_D0aFZp7CyqxberXI&callback=initMap">
        </script>

        <%@include file="header.html" %>
        <style>
            html, body { height: 100%; margin: 0; padding: 0; }
            #map { height: 200px; }
            .login-div {
                background: #FFFFFF;
                border:none;
            }

            label {
                color: #000 !important;
            }

            .main-title {
                color: #000000;
            }
        </style>
        <jsp:useBean id="pictureDAO" class="DAO.PictureDAO" />
        <jsp:useBean id="saleTypeDAO" class="DAO.SaleTypeDAO" />
        <jsp:useBean id="residenceTypeDAO" class="DAO.ResidenceTypeDAO" />
        <jsp:useBean id="residenceDAO" class="DAO.ResidenceDAO" />
        <jsp:useBean id="residence" class="Model.Residence" />
        <div class="wrapper" style="margin-top: 10px">
            <div class="login-div" style="width: 920px">
                <h1 class="main-title">Cadastro de Imóvel</h1>
                <form class="bootstrap-form-horizontal" id="user_creation_form" action="create_imovel.jsp" method="post">
                    <div class="bootstrap-form-group">
                        <label for="saleType" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tipo de Venda: </label>
                        <div class="col-sm-9">
                            <select name="saleType" id="saleType">
                                <%
                                    List<SaleType> stypes = saleTypeDAO.getAll();
                                    for (SaleType stype : stypes) {
                                        %>
                                        <option value="<%=stype.getName()%>"><%=stype.getName()%></option>
                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="residenceType" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tipo de Imóvel: </label>
                        <div class="col-sm-9">
                            <select name="residenceType" id="residenceType">
                                <%
                                    List<ResidenceType> types = residenceTypeDAO.getAll();
                                    for (ResidenceType rType : types) {
                                %>
                                        <option value="<%=rType.getName()%>"><%=rType.getName()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="price" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Preço: </label>
                        <div class="col-sm-9">
                            <input name="price" id="price" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="address" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Endereço: </label>
                        <div class="col-sm-9">
                            <input name="address" id="address" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="number" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Número: </label>
                        <div class="col-sm-9">
                            <input name="number" id="number" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="neighbourhood" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Bairro: </label>
                        <div class="col-sm-9">
                            <input name="neighbourhood" id="neighbourhood" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="city" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Cidade: </label>
                        <div class="col-sm-9">
                            <input name="city" id="city" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="country" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">País: </label>
                        <div class="col-sm-9">
                            <input name="country" id="country" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <div id="map"></div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="beds" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Quartos: </label>
                        <div class="col-sm-9">
                            <input name="beds" id="beds" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="suites" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Suítes: </label>
                        <div class="col-sm-9">
                            <input name="suites" id="suites" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="baths" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Banheiros: </label>
                        <div class="col-sm-9">
                            <input name="baths" id="baths" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="parkspots" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Vagas </label>
                        <div class="col-sm-9">
                            <input name="parkspots" id="parkspots" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="squarefootage" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tamanho </label>
                        <div class="col-sm-9">
                            <input name="squarefootage" id="squarefootage" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="hightlighted" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Quer destaque? </label>
                        <div class="col-sm-9">
                            <input name="highlighted" id="hightlighted" class="text-input" type="checkbox">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="description" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Descrição: </label>
                        <div class="col-sm-9">
                            <textarea name="description" id="description" class="text-input"></textarea>
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="picture" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Imagem: </label>
                        <div class="col-sm-9">
                            <textarea name="picture" id="picture" class="text-input"></textarea>
                        </div>
                    </div>
                    <input name="latitude" type="hidden" id="latitude" value=""/>
                    <input name="longitude" type="hidden" id="longitude" value=""/>
                    <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button id="submitbutton" type="submit" class="btn search-btn">Criar</button>
                        </div>
                        <script>
                            function isValid() {
                                var message = null;
                                var PLEASE_MESSAGE = "Por favor, ";
                                var PLEASE_MESSAGE_INSERT = PLEASE_MESSAGE + "insira ";

                                var price = $('#price').val();
                                var address = $('#address').val();
                                var neighborhood = $('#neighbourhood').val();
                                var city = $('#city').val();
                                var country = $('#country').val();
                                var number = $('#number').val();
                                var description = $('#description').val();
                                var beds = $('#beds').val();
                                var bathrooms = $('#baths').val();
                                var picture = $('#picture').val();
                                var carSpots = $('#parkspots').val();

                                var lat = null;
                                var lng = null;
                                if(typeof selectedLatLng !== "undefined"){
                                    lat = selectedLatLng.lat();
                                    lng = selectedLatLng.lng();
                                }
                                if (!price) {
                                    message = PLEASE_MESSAGE_INSERT + "um preço maior que zero.";
                                } else if (!address) {
                                    message = PLEASE_MESSAGE_INSERT + "a Rua.";
                                } else if (!neighborhood) {
                                    message = PLEASE_MESSAGE_INSERT + "o Bairro.";
                                } else if (!city) {
                                    message = PLEASE_MESSAGE_INSERT + "a Cidade.";
                                } else if (!country) {
                                    message = PLEASE_MESSAGE_INSERT + "o País.";
                                } else if (!number) {
                                    message = PLEASE_MESSAGE_INSERT + "o Número.";
                                } else if (!description) {
                                    message = PLEASE_MESSAGE_INSERT + "a Descrição";
                                } else if (!beds) {
                                    message = PLEASE_MESSAGE_INSERT + "a quantidade de quartos.";
                                } else if (!bathrooms) {
                                    message = PLEASE_MESSAGE_INSERT + "o número de banheiros.";
                                } else if (!carSpots) {
                                    message = PLEASE_MESSAGE_INSERT + "o número de vagas para carros.";
                                } else if (!lat || !lng) {
                                    message = "Selecione o endereço no mapa."
                                } else if (!picture == null) {
                                    message = PLEASE_MESSAGE_INSERT + "ao menos uma imagem.";
                                }

                                if(message != null) {
                                    alert(message);
                                }
                                return message == null;
                            }

                            $('#user_creation_form').on('submit', function (e) {
                                return isValid();
                            });
                        </script>
                    </div>
                </form>

            </div>
        </div>


        <%
            double price = Utils.parseDouble(request, "price");
            String address = request.getParameter("address");
            String neighborhood = request.getParameter("neighbourhood");
            String city = request.getParameter("city");
            String country = request.getParameter("country");
            int number = Utils.parseInt(request, "number");
            String description = request.getParameter("description");
            int beds = Utils.parseInt(request, "beds");
            int bathrooms = Utils.parseInt(request, "baths");
            String picturePath = request.getParameter("picture");
            double squareFootage = Utils.parseDouble(request, "squarefootage");
            String highlightedString = request.getParameter("highlighted");
            boolean highlighted = false;
            if(highlightedString != null) {
                highlighted = request.getParameter("highlighted").equalsIgnoreCase("on");
            }
            int carSpots = Utils.parseInt(request, "parkspots");
            double lat = Utils.parseDouble(request, "latitude");
            double lng = Utils.parseDouble(request, "longitude");

            if(price != Utils.INVALID_DOUBLE_VALUE && address != null && neighborhood != null && description != null) {
                SaleType saleType = saleTypeDAO.get(request.getParameter("saleType"));
                residence.setSaleType(saleType);

                ResidenceType residenceType = residenceTypeDAO.get(request.getParameter("residenceType"));
                residence.setType(residenceType);

                residence.setPrice(price);
                residence.setAddress(address);
                residence.setNeighborhood(neighborhood);
                residence.setCity(city);
                residence.setCountry(country);
                residence.setNumber(number);
                residence.setDescription(description);
                residence.setBeds(beds);
                residence.setBathrooms(bathrooms);
                residence.setSquareFootage(squareFootage);
                residence.setHighlight(highlighted);

                Picture picture = pictureDAO.add(picturePath);
                residence.addPicture(picture);

                residence.setCarSpots(carSpots);
                residence.setLatitude(lat);
                residence.setLongitude(lng);

                residenceDAO.add(residence);
            }
        %>
    </body>
</html>
