<!DOCTYPE html>
<html lang="en"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:h="http://java.sun.com/jsf/html"
    xmlns:ui="http://java.sun.com/jsf/facelets">
    <h:head>
        <meta charset="UTF-8" />
        <title>Template</title>
        <link rel="stylesheet" type="text/css" href="css/template-style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </h:head>
    <h:body>
        <%@include file="header.html" %>

        <div class="wrapper" style="padding-top: 100px;">
            <style>
                .clearfix:before,
                .clearfix:after {
                     content: " ";
                     display: table;
                 }
                .clearfix:after {
                     clear: both;
                 }
            </style>
            <script>
                $(document).ready(function () {
                   $(".search-btn").click(function () {
                       window.location.href = "search.jsp?search=" + $("#search-text").val();
                   });
                });

            </script>
            <div class="clearfix" style="width: 640px; margin: auto;">
                <input style="margin: 10px auto; width: 75%; display: inline-block; float: left;" name="search-text" type="text" class="text-input" placeholder="Busque por um bairro" id="search-text" />
                <button class="btn search-btn" style="display: inline-block; float: left; margin: 10px;">
                    Buscar
                </button>
            </div>
        </div>
    </h:body>
</html>