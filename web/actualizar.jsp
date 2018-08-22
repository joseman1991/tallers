<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Actualizar</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="images/icons/favicon.png"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/themify/themify-icons.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/elegant-font/html-css/style.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>
    <body class="animsition">

        <!-- Header -->
        <jsp:include page="header.jsp"/>
         <s:set name="us" value="usuarios"/>
        <!-- Title Page -->
        <section class="bg-title-page p-t-40 p-b-50 flex-col-c-m" style="background-image: url(images/heading-pages-06.jpg);">
            <h2 class="l-text2 t-center">
                Actuallizar  
            </h2>
        </section>

        <!-- content page -->
        <section class="bgwhite p-t-66 p-b-60">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 p-b-30">
                        <div class="p-r-20 p-r-0-lg">
                            <img class="img-fluid" src="images/banner-14.jpg" />
                        </div>
                    </div>

                    <div class="col-md-6 p-b-30">
                        <form class="leave-comment" action="actualizar" id="form-registro">

                            <h4 class="m-text26 p-b-36 p-t-15">
                                Actualizar Datos >
                            </h4>
                            <s:set name="mensaje"><s:property value="mensaje"/></s:set>
                            <s:if test="#mensaje!=''">
                                <div class="alert alert-success "   role="alert" id="nus">
                                    <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                        &times;
                                    </a>
                                    <strong>¡Éxito!</strong> Datos de usuario actualizado.
                                </div>
                            </s:if>
                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" value="<s:property value="#user.nombreusuario"/>" name="nombreusuario" placeholder="nombre de usuario" id="nu" readonly="">
                            </div>
                            <div class="alert alert-danger collapse"   role="alert" id="nus">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>
                            
                             

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="nombre1" value="<s:property value="#user.nombre1"/>" placeholder="Primer nombre" id="pn">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="pns">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="nombre2" value="<s:property value="#user.nombre2"/>" placeholder="segundo nombre" id="sn">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="sns">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="apellidop" value="<s:property value="#user.apellidop"/>" placeholder="primer apellido" id="ap">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="aps">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="apellidon" value="<s:property value="#user.apellidon"/>" placeholder="segundo apellido" id="am">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="ams">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>


                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="correo" value="<s:property value="#user.correo"/>" placeholder="correo" id="corre">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="correos">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" value="<s:property value="#user.direccion"/>" name="direccion" placeholder="direccin" id="dir">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="dirs">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="bo4 of-hidden size15 m-b-20">
                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="dni" value="<s:property value="#user.dni"/>" placeholder="cédula" id="ced">
                            </div>
                            <div class="alert alert-danger collapse"  role="alert" id="ceds">
                                <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                    &times;
                                </a>
                                <strong>¡Cuidado!</strong> Es muy importante que leas este mensaje de alerta.
                            </div>

                            <div class="w-size25">
                                <!-- Button -->
                                <button type="button" class="flex-c-m size2 bg1 bo-rad-23 hov1 m-text3 trans-0-4" id="boto">
                                    Actualizar datos
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>


        <!-- Footer -->
        <footer class="bg6 p-t-45 p-b-43 p-l-45 p-r-45">
            <jsp:include page="fotter.jsp"/>           
        </footer>



        <!-- Back to top -->
        <div class="btn-back-to-top bg0-hov" id="myBtn">
            <span class="symbol-btn-back-to-top">
                <i class="fa fa-angle-double-up" aria-hidden="true"></i>
            </span>
        </div>

        <!-- Container Selection -->
        <div id="dropDownSelect1"></div>
        <div id="dropDownSelect2"></div>



        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/bootstrap/js/popper.js"></script>
        <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/select2/select2.min.js"></script>
        <script type="text/javascript">
            $(".selection-1").select2({
                minimumResultsForSearch: 20,
                dropdownParent: $('#dropDownSelect1')
            });

            $(".selection-2").select2({
                minimumResultsForSearch: 20,
                dropdownParent: $('#dropDownSelect2')
            });
        </script>
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/validar_1.js"></script>
    </body>
</html>
