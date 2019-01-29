<%@taglib prefix="s" uri="/struts-tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Product Detail</title>
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





        <!-- breadcrumb -->
        <div class="bread-crumb bgwhite flex-w p-l-52 p-r-15 p-t-30 p-l-15-sm">
            

            <span class="s-text17">
                Ingresar un nuevo producto 
            </span>
             
        </div>
        <form action="insertProducto" enctype="multipart/form-data" method="post" >
           <s:set name="mensaje"><s:property value="mensaje"/></s:set>
            <s:if test="#mensaje!=''">
                <div class="alert alert-success "   role="alert" id="nus">
                    <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                        &times;
                    </a>
                    <strong>¡Éxito!</strong> <s:property value="mensaje"/>.
                </div>
            </s:if>
            <input type="hidden" name="iditem" value="0">
            <input type="hidden" name="idtipo" value="0">
            <input type="hidden" name="descuento" value="0">
            <input type="hidden" name="iva" value="12">
            <input type="hidden" name="rate" value="12">
            <input type="hidden" name="imagen" value="img">
            <input type="hidden" name="nombreusuario" value="<s:property value="#user.nombreusuario"/>">
            <!-- Product Detail -->
            <h1 class="text-center">Ingresa un nuevo producto</h1>
            <div class="container bgwhite p-t-35 p-b-80">
                <div class="flex-w flex-sb">
                    <div class="w-size13 p-t-30 respon5">
                        <div class="wrap-slick3 flex-sb flex-w">
                            <div class="wrap-slick3-dots"></div>

                            <div class="slick3">


                                <div class="item-slick3 imgAt" data-thumb="images/imagen_no_disponible.jpg" >
                                    <div class="wrap-pic-w">
                                        <img src="images/imagen_no_disponible.jpg" alt="IMG-PRODUCT" id="im">
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="input-group-btn">
                                <span class="btn btn-dark">
                                    Examinar&hellip; <input type="file" style="display: none; " name="imagenes" accept="image/png, image/jpeg" id="imputImg">
                                </span>
                            </label>
                            <input type="text" class="form-control" readonly id="imga">
                        </div><br>
                       

                    </div>




                    <div class="w-size14 p-t-30 respon5">
                        <h3>Categorias</h3>
                        <h4 class="product-detail-name m-text16 p-b-13">
                            <select class="form-control border border-dark" name="idcategorias">
                                <s:iterator value="listaCategorias">
                                    <option value="<s:property value="categorias"/>"><s:property value="descripcion"/></option>
                                </s:iterator>
                            </select>
                        </h4>

                        <h4 class="product-detail-name m-text16 p-b-13">
                            <input type="text" class="form-control border border-dark"   name="nombre" placeholder="nombre de producto"/>
                        </h4>

                        <span class="m-text17" >
                            <input class="form-control border border-dark" type="text"  name="precio" placeholder="precio">                   
                        </span>

                        <p class="s-text8 p-t-10">
                            <s:property value="item.descripcion"/>
                        </p>

                        <!--  -->
                        <div class="p-t-33 p-b-60">


                            <div class="flex-r-m flex-w p-t-10">
                                <div class="w-size16 flex-m flex-w">
                                    <div class="flex-w bo5 of-hidden m-r-22 m-t-10 m-b-10">
                                        <button class="btn-num-product-down color1 flex-c-m size7 bg8 eff2">
                                            <i class="fs-12 fa fa-minus" aria-hidden="true"></i>
                                        </button>

                                        <input class="size8 m-text18 t-center num-product" type="number" name="stock" min="1" value="1"/>

                                        <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                            <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                    </div>

                                    <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
                                        <!-- Button -->
                                        <button type="submit" class=" btn btn-dark">
                                            Registrar
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!--  -->
                        <div class="wrap-dropdown-content bo6 p-t-15 p-b-14 active-dropdown-content">
                            <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                                Description
                                <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                                <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                            </h5>

                            <div class="dropdown-content dis-none p-t-15 p-b-23">
                                <textarea  class="form-control" rows="10" cols="1" name="descripcion"><s:property value="item.descripcion"/></textarea>
                            </div>
                        </div>

                        <div class="wrap-dropdown-content bo7 p-t-15 p-b-14 active-dropdown-content">
                            <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                                Información Adcional
                                <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                                <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                            </h5>

                            <div class="dropdown-content dis-none p-t-15 p-b-23">
                                <textarea  class="form-control" rows="10" cols="1" name="descripcion2"><s:property value="item.descripcion2"/></textarea>
                            </div>
                        </div>                     
                    </div>

                </div>




            </div>
        </form>
        <!-- Relate Product -->


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
        <script type="text/javascript" src="js/file.js"></script>
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
        <script type="text/javascript" src="vendor/slick/slick.min.js"></script>
        <script type="text/javascript" src="js/slick-custom.js"></script>
        <!--===============================================================================================-->
        <script type="text/javascript" src="vendor/sweetalert/sweetalert.min.js"></script>
        <script type="text/javascript">


        </script>

        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
