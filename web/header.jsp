<!DOCTYPE html>
<html lang="en"
      xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://java.sun.com/jsf/html">
<h:body>
    <nav>
        <div class="wrapper" style="height: 100%;">
            <div id="user-icon-container">
                <img class="profile-icon" src="images/profile-icon.png" />
                <%
                    String name = request.getParameter("name");
                    if (name == null) { %>
                        <a  href="user_login.jsp" class="btn action-btn">Entrar</a>
                    <%} else { %>
                        <a class="btn action-btn"><%=name%></a>
                    <%}
                %>
            </div>
            <img class="logo" src="images/home-icon.png" />
        </div>
    </nav>
</h:body>
</html>