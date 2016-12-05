<%--
  Created by IntelliJ IDEA.
  User: gustavoromito
  Date: 12/4/16
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, DAO.*, Model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SeuImovel | </title>
    <link rel="stylesheet" type="text/css" href="css/template-style.css">
    <link rel="stylesheet" type="text/css" href="css/imovel.css">
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
<%
    ResidenceDAO dao = new ResidenceDAO();
    List<Residence> residences = dao.findAll();

    for (Residence residence : residences) { %>
        <p><%residence.getAddress();%></p>
    <% }
%>
<script>
    $(document).ready(function() {
        var total_images = 4;
        var count = 4;
        $("#next-pic-arrow").click(function () {
            if (count <= total_images && count > 1) {
                $("._" + count).animate({ left: 600 }, 500, function() {
                    // Animation complete.
                });
                count--;
            }
        });

        $("#previous-pic-arrow").click(function () {
            if (count != total_images) {
                count++;
                $("._" + count).animate({ left: 0 }, 500, function() {
                    // Animation complete.
                });
            }
        });
    });
</script>
<div class="wrapper">
    <div id="imovel-info">
        <div class="content">
            <div id="image-container">
                <img class="imovel_pic _1" src="http://www.365flats.com/cp/pages/uploads/2.jpg">
                <img class="imovel_pic _2" src="http://www.myfurnishedapartment.ca/wp-content/uploads/background/1357717580.jpg">
                <img class="imovel_pic _3" src="http://www.hotelartsbarcelona.com/sites/www.hotelartsbarcelona.com/files/media-images/accommodation/the-presidential-penthouse-luxury-presidential-suite-living-room-1139.jpg">
                <img class="imovel_pic _4" src="http://cdn.freshome.com/wp-content/uploads/2008/03/apartment.jpg">
                <div id="next-pic-arrow" class="arrow"></div>
                <div id="previous-pic-arrow" class="arrow"></div>
            </div>

            <div id="info">
                <h3>Descrição</h3>
                <p>"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore
                    et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                    aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum
                    dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
                    officia deserunt mollit anim id est laborum."</p>
                <h3>Informações</h3>
                <div>
                    <h4 class="info_title">Tamanho: </h4><p class="info_desc" style="display: inline-block;">XXm2</p>
                </div>
                <div>
                    <h4 class="info_title">Quartos: </h4>
                    <img class="info_desc" src="images/bed-icon.png">
                    <img class="info_desc" src="images/bed-icon.png">
                    <img class="info_desc" src="images/bed-icon.png">
                    <img class="info_desc" src="images/bed-icon.png">

                    <h4 class="info_title">Suítes: </h4>
                    <img class="info_desc" src="images/bed-icon.png">
                    <img class="info_desc" src="images/bed-icon.png">
                </div>
                <div>
                    <h4 class="info_title">Banheiros: </h4>
                    <img class="info_desc" src="images/bath-icon.png">
                    <img class="info_desc" src="images/bath-icon.png">
                    <img class="info_desc" src="images/bath-icon.png">
                    <img class="info_desc" src="images/bath-icon.png">
                </div>
                <div>
                    <h4 class="info_title">Vagas: </h4>
                    <img class="info_desc" src="images/parking-icon.png">
                    <img class="info_desc" src="images/parking-icon.png">
                </div>

            </div>
        </div>
    </div>

    <div id="contact-div">
        <div id="price_div">
            <h1>R$ 2.400.000,00</h1>
        </div>
        <div class="content">
            <div>
                <h6 style="height: 200px; text-align: center; background: #33cc36; margin: 0;"> MAPA </h6>
            </div>
            <h4>Avenida Paulista, 205 - Bela Vista, São paulo - SP</h4>
            <button class="btn search-btn" style="margin-bottom: 20px;">
                Estou Interessado
            </button>
        </div>
    </div>
</div>

</body>
</html>
