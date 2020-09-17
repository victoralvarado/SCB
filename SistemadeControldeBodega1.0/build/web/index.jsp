<%-- 
    * @Documento: index.
    * @Version: 1.0.
    * @Copyright: Sistema de Control de Bodega.
    * @Author Victor, Sarai, Jaylin, Berenice
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html class="fullscreen-bg">
    <head>
        <title>Login | SCB</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <!-- CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="fonts/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="others/style.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/demo.css">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
        <link rel="apple-touch-icon" sizes="76x76" href="multimedia/imagenes/Login/logoHerramienta.png">
        <link rel="icon" type="image/png" sizes="96x96" href="multimedia/imagenes/Login/logoHerramienta.png">
    </head>
    <body>
        <div id="wrapper" style="background: #40e0d0f0;">
            <div class="vertical-align-wrap">
                <div class="vertical-align-middle">
                    <div class="auth-box ">
                        <div class="left">
                            <div class="content">
                                <div class="header">
                                    <div class="logo text-center"><img style="width: 80px; height: 80px;" src="multimedia/imagenes/Login/logoHerramienta.png" alt="Logo"></div>
                                    <p class="lead"><b>Iniciar Sesi&oacute;n</b></p>
                                </div>
                                <form class="form-auth-small" action="procesoIngresarUsuario" method="POST">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label class="control-label sr-only">UserName</label>
                                            <span class="input-group-addon" style="background: #0bff00;"><i class="fa fa-user"></i></span>
                                            <input type="text" class="form-control" id="signin-userName" name="txtUserName" placeholder="UserName" autocomplete="off" autofocus required>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group">
                                            <label class="control-label sr-only">Password</label>
                                            <span class="input-group-addon" style="background: #0bff00;"><i class="fa fa-key"></i></span>
                                            <input type="password" class="form-control" id="signin-password" name="txtPassword" placeholder="Password" autocomplete="off" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-lg btn-block" name="btnIngresar"> <i class="lnr lnr-enter"></i> Acceder</button>
                                    <%--
                                    <button type="reset" class="btn btn-danger btn-lg btn-block"><i class="fa fa-eraser"></i> Limpiar</button>
                                    --%>
                                </form>
                            </div>
                        </div>
                        <div class="right">
                            <div class="overlay"></div>
                            <div class="content text">
                                <h1 class="heading" style="font-family: fantasy;">SISTEMA DE CONTROL DE BODEGA</h1>
                                <p></p>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>