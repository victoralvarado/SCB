<%-- 
    * @Documento: error.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/sweet-alert.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <script src="../js/sweet-alert.min.js"></script>
        <link rel="apple-touch-icon" sizes="76x76" href="../multimedia/imagenes/Login/logoHerramienta.png">
        <link rel="icon" type="image/png" sizes="96x96" href="../multimedia/imagenes/Login/logoHerramienta.png">
        <title>Error</title>
    </head>
    <body>
        <a href="../">
            <div class="sweet-overlay hideSweetAlert" data-backdrop=”static”  style="background: #53aba2f0; opacity: 5.99; display: block;">
                <script type="text/javascript">
                    swal({
                        title: "Error!",
                        text: "Usuario y/o contraseña incorrecta!",
                        type: "error",
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Aceptar",
                        closeOnConfirm: false
                    },
                            function () {
                                window.location.href = "../";
                            });
                </script>
            </div>
        </a>
        <script src="../js/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>