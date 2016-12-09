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
        <div class="wrapper" style="margin-top: 10px">
            <div class="login-div" style="width: 920px">
                <h1 class="main-title">Cadastro de Imóvel</h1>
                <form class="bootstrap-form-horizontal" id="user_creation_form" action="user_create.jsp" method="post">
                    <div class="bootstrap-form-group">
                        <label for="salesType" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tipo de Venda: </label>
                        <div class="col-sm-9">
                            <select id="salesType">
                                <%
                                    SaleTypeDAO stypeDao = new SaleTypeDAO();
                                    List<SaleType> stypes = stypeDao .getAll();
                                    for (SaleType stype : stypes) {
                                        %>
                                        <option><%=stype.getName()%></option>
                                        <%
                                    }
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="residenceType" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tipo de Imóvel: </label>
                        <div class="col-sm-9">
                            <select id="residenceType">
                                <%
                                    ResidenceTypeDAO typeDao = new ResidenceTypeDAO();
                                    List<ResidenceType> types = typeDao.getAll();
                                    for (ResidenceType rType : types) {
                                %>
                                <option><%=rType.getName()%></option>
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
                        <label for="neightbourhood" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Bairro: </label>
                        <div class="col-sm-9">
                            <input id="neightbourhood" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="city" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Cidade: </label>
                        <div class="col-sm-9">
                            <input id="city" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="country" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">País: </label>
                        <div class="col-sm-9">
                            <input id="country" class="text-input" type="text">
                        </div>
                    </div>
                    <div id="map"></div>
                    <div class="bootstrap-form-group">
                        <label for="beds" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Quartos: </label>
                        <div class="col-sm-9">
                            <input id="beds" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="suites" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Suítes: </label>
                        <div class="col-sm-9">
                            <input id="suites" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="baths" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Banheiros: </label>
                        <div class="col-sm-9">
                            <input id="baths" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="parkspots" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Nº de Vagas </label>
                        <div class="col-sm-9">
                            <input id="parkspots" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="squarefootage" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Tamanho </label>
                        <div class="col-sm-9">
                            <input id="squarefootage" class="text-input" type="text">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="hightlighted" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Quer destaque? </label>
                        <div class="col-sm-9">
                            <input id="hightlighted" class="text-input" type="checkbox">
                        </div>
                    </div>
                    <div class="bootstrap-form-group">
                        <label for="description" class="bootstrap-control-label col-sm-3" style="color: #ffffff; font-size: medium">Descrição: </label>
                        <div class="col-sm-9">
                            <textarea id="description" class="text-input"></textarea>
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

            </div>
        </div>
    </body>
</html>
