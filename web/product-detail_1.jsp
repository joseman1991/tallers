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
            <a href="index.jsp" class="s-text16">
                Home
                <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <a href="product.jsp" class="s-text16">
                Women
                <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <a href="#" class="s-text16">
                T-Shirt
                <i class="fa fa-angle-right m-l-8 m-r-9" aria-hidden="true"></i>
            </a>

            <span class="s-text17">
                <s:property value="item.nombre"/>
            </span>
        </div>
 <form action="eliproducto" method="post" >
        <!-- Product Detail -->
        <div class="container bgwhite p-t-35 p-b-80">
            <div class="flex-w flex-sb">
                <div class="w-size13 p-t-30 respon5">
                    <div class="wrap-slick3 flex-sb flex-w">
                        <div class="wrap-slick3-dots"></div>

                        <div class="slick3">


                            <div class="item-slick3" data-thumb="images/<s:property value="item.imagen"/>">
                                <div class="wrap-pic-w">
                                    <img src="images/<s:property value="item.imagen"/>" alt="IMG-PRODUCT">
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
               
                    <s:set name="mensaje"><s:property value="mensaje"/></s:set>
                    <s:if test="#mensaje!=''">
                        <div class="alert alert-success "   role="alert" id="nus">
                            <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                &times;
                            </a>
                            <strong>¡Éxito!</strong> <s:property value="mensaje"/>.
                        </div>
                    </s:if>
                    <input type="hidden" value="<s:property value="item.iditem"/>" name="iditem"/>
                    <div class="w-size14 p-t-30 respon5">
                        <h4 class="product-detail-name m-text16 p-b-13">
                         <s:property value="item.nombre"/>
                        </h4>

                        <span class="m-text17">
                            <s:property value="item.precio"/>               
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

                                        <input class="size8 m-text18 t-center num-product" type="number" name="stock" min="0" value="<s:property value="item.stock"/>">

                                        <button class="btn-num-product-up color1 flex-c-m size7 bg8 eff2">
                                            <i class="fs-12 fa fa-plus" aria-hidden="true"></i>
                                        </button>
                                    </div>

                                    <div class="btn-addcart-product-detail size9 trans-0-4 m-t-10 m-b-10">
                                        <!-- Button -->
                                        <button type="submit" class="flex-c-m sizefull bg1 bo-rad-23 hov1 s-text1 trans-0-4 btn btn-danger">
                                            Eliminar
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
                                <s:property value="item.descripcion"/>     
                              
                            </div>
                        </div>

                        <div class="wrap-dropdown-content bo7 p-t-15 p-b-14">
                            <h5 class="js-toggle-dropdown-content flex-sb-m cs-pointer m-text19 color0-hov trans-0-4">
                               Información Adcional
                                <i class="down-mark fs-12 color1 fa fa-minus dis-none" aria-hidden="true"></i>
                                <i class="up-mark fs-12 color1 fa fa-plus" aria-hidden="true"></i>
                            </h5>

                            <div class="dropdown-content dis-none p-t-15 p-b-23">
                            <s:property value="item.descripcion2"/>      
                              
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
            $('.block2-btn-addcart').each(function () {
                var nameProduct = $(this).parent().parent().parent().find('.block2-name').jsp();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to cart !", "success");
                });
            });

            $('.block2-btn-addwishlist').each(function () {
                var nameProduct = $(this).parent().parent().parent().find('.block2-name').jsp();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");
                });
            });

            $('.btn-addcart-product-detail').each(function () {
                var nameProduct = $('.product-detail-name').jsp();
                $(this).on('click', function () {
                    swal(nameProduct, "is added to wishlist !", "success");
                });
            });
        </script>

        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
