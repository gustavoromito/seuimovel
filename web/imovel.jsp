<%--
  Created by IntelliJ IDEA.
  User: gustavoromito
  Date: 12/4/16
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="DAO.*, Model.*"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
    String residence_id_parameter = request.getParameter("id");
    Residence residence = null;
    if (residence_id_parameter != null) {
        ResidenceDAO dao = new ResidenceDAO();
        residence = dao.findById(Long.valueOf(residence_id_parameter));
    }
%>

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

<%@include file="header.html" %>

<%
    List<Picture> residencePictures = new ArrayList<Picture>(residence.getResidencePictures());
    int length = residencePictures.size();
%>
<script>
    <%--var owner_mail = <%=residence.getResponsibleUser().getEmail()%>--%>
    var owner_mail = "email@email.com";
    $(document).ready(function() {
        var total_images = <%=length%>;
        var count = <%=length%>;
        $("#next-pic-arrow").click(function () {
            if (count <= total_images && count > 1) {
                $("._" + count).animate({ left: 600 }, 500, function() {});
                count--;
            }
        });

        $("#previous-pic-arrow").click(function () {
            if (count != total_images) {
                count++;
                $("._" + count).animate({ left: 0 }, 500, function() {});
            }
        });

        $(".interested-btn").click(function() {
            $("#contact-div .content").append("<h3 style='text-align: center'>" +
                "Você pode contatar o dono deste imóvel atráves do email:<br>" +
                "<strong>" + owner_mail + "</strong>" +
                "</h3>");
            $(this).remove();
        });
    });
</script>
<div class="wrapper">
    <div id="imovel-info">
        <div class="content">
            <div id="image-container">
                <%
                    if (length == 0) {
                        %><img class="imovel_pic _0" src="images/default-image.png"><%
                    } else {
                        for (int i = 0; i < length; i++) {
                            %>
                            <img class="imovel_pic _1" src="http://www.365flats.com/cp/pages/uploads/2.jpg">
                            <%
                        }
                    }
                %>
                <div id="next-pic-arrow" class="arrow"></div>
                <div id="previous-pic-arrow" class="arrow"></div>
            </div>

            <div id="info">
                <h3>Descrição</h3>
                <p><%=(residence.getDescription() == null) ? "Nenhuma descrição" : residence.getDescription()%></p>
                <h3>Informações</h3>
                <div>
                    <h4 class="info_title">Tamanho: </h4><p class="info_desc" style="display: inline-block;"><%=residence.getSquareFootage()%>m2</p>
                </div>
                <div>
                    <h4 class="info_title">Quartos: </h4>
                    <%
                        for (int i = 0; i < residence.getBeds(); i++) {
                            %>
                            <img class="info_desc" src="images/bed-icon.png">
                            <%
                        }
                    %>
                    <h4 class="info_title">Suítes: </h4>
                    <%
                        for (int i = 0; i < residence.getSuites(); i++) {
                            %>
                            <img class="info_desc" src="images/bed-icon.png">
                            <%
                        }
                    %>
                </div>
                <div>
                    <h4 class="info_title">Banheiros: </h4>
                    <%
                        for (int i = 0; i < residence.getBathrooms(); i++) {
                            %>
                            <img class="info_desc" src="images/bath-icon.png">
                            <%
                        }
                    %>
                </div>
                <div>
                    <h4 class="info_title">Vagas: </h4>
                    <img class="info_desc" src="images/parking-icon.png">
                </div>

            </div>
        </div>
    </div>

    <div id="contact-div">
        <div id="price_div">
            <h1><%=residence.getFormattedPrice()%></h1>
        </div>
        <div class="content">
            <div>
                <iframe src="//www.google.com/maps/embed/v1/place?q=-23.635839,-46.656299
                    &zoom=17
                    &key=AIzaSyBzoOgR5EDgEOkkZd_D0aFZp7CyqxberXI" frameborder="0">
                </iframe>
            </div>
            <h4><%=residence.getAddressFull()%></h4>
            <button class="btn search-btn interested-btn" style="margin-bottom: 20px;">
                Estou Interessado
            </button>
        </div>
    </div>
</div>

</body>
</html>
