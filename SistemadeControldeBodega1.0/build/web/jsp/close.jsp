<%-- 
    * @Documento: close.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Saliendo... | SCB</title>
    </head>
    <%@page session="true" %>
    <%
        HttpSession obSesion = request.getSession();
        obSesion.invalidate();
        out.print("<script>location.replace('../');</script>");
    %>
    <body style="background: #676a6d;">
    </body>
</html>