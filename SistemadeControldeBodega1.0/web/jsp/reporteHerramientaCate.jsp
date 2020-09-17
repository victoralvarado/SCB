<%-- 
    * @Documento: reporteHerramienta.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page session="true" %>
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
        <link rel="apple-touch-icon" sizes="76x76" href="multimedia/imagenes/Login/logoHerramienta.png">
        <link rel="icon" type="image/png" sizes="96x96" href="multimedia/imagenes/Login/logoHerramienta.png">
        <%@page import="net.sf.jasperreports.engine.JasperRunManager" %>
        <%@page import="net.sf.jasperreports.*"%>
        <%@page import="java.util.*" %>
        <%@page import="java.io.File" %>
        <%@page import="java.sql.*" %>
        <%@page import="modelo.Conexion" %>
        <title>REPORTE</title>
    </head>
    <%
        HttpSession objSesion = request.getSession();
        if (objSesion.getAttribute("usuario") != null && objSesion.getAttribute("nivel") == "1" || objSesion.getAttribute("nivel") == "2") {
            Conexion cone = new Conexion();
            cone.conectar();
            File reporte = new File(application.getRealPath("reportes/rptHerramientaCat.jasper"));
            Map parametros = new HashMap();
            String user = request.getParameter("user");
            parametros.put("user", user);
            byte[] bytes = JasperRunManager.runReportToPdf(reporte.getPath(), parametros, cone.getCon());
            response.setContentType("application/pdf");
            response.setContentLength(bytes.length);
            ServletOutputStream outputstream = response.getOutputStream();
            outputstream.write(bytes, 0, bytes.length);
            outputstream.flush();
            outputstream.close();
            cone.desconectar();
        } else {
            out.print("<script>location.replace('../');</script>");
        }
    %>
</html>