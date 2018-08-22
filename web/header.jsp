<%-- 
    Document   : header
    Created on : 16-ago-2018, 8:38:31
    Author     : JOSE
--%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <s:set name="user" value="#session['usuario']"/>
    <s:set name="lista" value="#session['lista']"/>
    <s:set name="carro" value="#session['listaItems']"/>
    <s:set name="cant" value="#session['cantidad']"/>
    <body>
        <s:url action="Bienvenido" var="index"/>
        <s:url action="tienda" var="pro" >
            <s:param name="page">1</s:param>
        </s:url>
        <s:url action="act" var="actu" includeParams="none">
            <s:param name="">
                <s:property value="#user.nombreusuario"/>
            </s:param>
        </s:url>


        <header class="header1">
            <!-- Header desktop -->
            <div class="container-menu-header">
                <div class="topbar">
                    <div class="topbar-social">
                        <a target="new_tab" href="https://fb.com" class="topbar-social-item fa fa-facebook"></a>
                        <a target="new_tab" href="https://instagram.com" class="topbar-social-item fa fa-instagram"></a>
                        <a target="new_tab" href="https://pinterest.com" class="topbar-social-item fa fa-pinterest-p"></a>
                        <a target="new_tab" href="https://snapchat.com" class="topbar-social-item fa fa-snapchat-ghost"></a>
                        <a target="new_tab" href="https://youtube.com" class="topbar-social-item fa fa-youtube-play"></a>
                    </div>



                    <div class="topbar-child2">
                        <span class="topbar-email">
                            <s:property value="#user.correo"/> 
                        </span>

                        <div class="topbar-language rs1-select2">
                            <select class="selection-1" name="time">
                                <option>USD</option>							 
                            </select>
                        </div>
                    </div>
                </div>

                <div class="wrap_header">

                    <!-- Logo -->

                    <a href="<s:property value="#index"/>" class="logo">
                        <img src="images/icons/logo.png" alt="IMG-LOGO">
                    </a>

                    <!-- Menu -->
                    <div class="wrap_menu">
                        <nav class="menu">
                            <ul class="main_menu">
                                <li>
                                    <a href="<s:property value="#index"/>">Inicio</a>

                                </li>

                                <li>
                                    <a href="<s:property value="#pro"/>">Tienda</a>
                                </li>

                                <li class="sale-noti">
                                    <a href="product.jsp">Ventas</a>
                                </li>

                                <s:if test="#user!=null">

                                    <li>
                                        <a href=" <s:property value="#actu"/>">Actualizar Datos</a>
                                    </li>
                                </s:if>


                                <li>
                                    <a href="about.jsp">Acerca de</a>
                                </li>

                                <li>
                                    <a href="contact.jsp">Contactos</a>
                                </li>
                            </ul>
                        </nav>
                    </div>


                    <!-- Header Icon -->
                    <div class="header-icons">

                        <s:property value="#user.saludo"/> 
                        <span class="linedivide1"></span>
                        <div class="header-wrapicon2">

                            <img src="images/icons/icon-header-01.png" class="header-icon1 js-show-header-dropdown" alt="ICON">                            
                            <!-- Header cart noti -->
                            <div class="header-cart header-dropdown">
                                <s:if test="#user==null">
                                    <div class="col-md-12 p-b-30">
                                        <form class="leave-comment" action="Inicio" method="post">
                                            <h4 class="m-text26 p-b-36 p-t-15">
                                                Iniciar Sesión
                                            </h4>

                                            <div class="bo4 of-hidden size15 m-b-20">
                                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="nombreusuario" placeholder="correo o nombre de usuario">
                                            </div>

                                            <div class="bo4 of-hidden size15 m-b-20">
                                                <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="clave" placeholder="Contraseña">
                                            </div>
                                            <div bo4 of-hidden size15 m-b-20>
                                                <span>¿No tienes cuenta aún?<a href="registro.jsp" class="text-primary">Registrate</a></span>
                                            </div><br>
                                            <div class="w-size25">
                                                <!-- Button -->
                                                <button type="submit" class="flex-c-m size1 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                                                    Iniciar sesión
                                                </button>
                                                <input type="hidden" value="1" class="redireccion" name="pagina"/>
                                            </div>
                                        </form>
                                    </div>
                                </s:if>
                                <s:else>
                                    <span><a href="logout.jsp" class="text-primary">Cerrar sessión</a></span>
                                </s:else>
                            </div>
                        </div>

                        <span class="linedivide1"></span>

                        <div class="header-wrapicon2">
                            <img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
                            <span class="header-icons-noti cart"><s:property value="#cant"/></span>
                            <!-- Header cart noti -->
                            <div class="header-cart header-dropdown">
                                <ul class="header-cart-wrapitem">                                    
                                    <s:iterator value="#carro" var="c">
                                        <li class="header-cart-item">
                                            <div class="header-cart-item-img">
                                                <img src="images/<s:property value="item.imagen"/>" alt="IMG">
                                            </div>

                                            <div class="header-cart-item-txt">
                                                <a href="#" class="header-cart-item-name">
                                                    <s:property value="item.nombre"/>
                                                </a>

                                                <span class="header-cart-item-info">
                                                    <s:property value="cantidad"/>
                                                    x  <s:property value="precio"/>
                                                </span>
                                            </div>
                                        </li>
                                    </s:iterator>
                                </ul>

                                <div class="header-cart-total">
                                    Total: $75.00
                                </div>

                                <div class="header-cart-buttons">
                                    <div class="header-cart-wrapbtn">
                                        <!-- Button -->
                                        <a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                            Ver el Carrito
                                        </a>
                                    </div>

                                    <div class="header-cart-wrapbtn">
                                        <!-- Button -->
                                        <a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                            Comprar
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Header Mobile -->
            <div class="wrap_header_mobile">
                <!-- Logo moblie -->
                <a href="index.jsp" class="logo-mobile">
                    <img src="images/icons/logo.png" alt="IMG-LOGO">
                </a>


                <!-- Button show menu -->
                <div class="btn-show-menu">
                    <!-- Header Icon mobile -->

                    <s:if test='!(#msg.equals(""))'>
                        <div class="alert alert-danger "   role="alert" id="nbs">
                            <a id="linkClose" href="#" class="close" data-dismiss="alert" aria-label="Close">
                                &times;
                            </a>
                            <strong>¡Error! </strong> <s:property value="mensaje"/>.

                        </div>
                    </s:if>
                    <div class="header-icons-mobile">
                        <s:if test="#user!=null">
                            <s:property value="#user.saludo"/>
                        </s:if>
                        <div class="header-wrapicon2">

                            <img src="images/icons/icon-header-01.png" class="header-icon1 js-show-header-dropdown" alt="ICON">                            
                            <!-- Header cart noti -->
                            <div class="header-cart header-dropdown">
                                <s:if test="#user==null">
                                    <div class="col-md-12 p-b-30">
                                        <form class="leave-comment" action="Inicio" method="post">
                                            <h4 class="m-text26 p-b-36 p-t-15">
                                                Iniciar Sesión
                                            </h4>
                                            <div class="bo4 of-hidden size15 m-b-20">
                                                <input class="sizefull s-text7 p-l-22 p-r-22" type="text" name="nombreusuario" placeholder="correo o nombre de usuario" required="">
                                            </div>

                                            <div class="bo4 of-hidden size15 m-b-20">
                                                <input class="sizefull s-text7 p-l-22 p-r-22" type="password" name="clave" placeholder="Contraseña" required="">
                                            </div>
                                            <div bo4 of-hidden size15 m-b-20>
                                                <span>¿No tienes cuenta aún?<a href="registro.jsp" class="text-primary">Registrate</a></span>
                                            </div><br>
                                            <div class="w-size25">
                                                <!-- Button -->
                                                <button type="submit" class="flex-c-m size1 bg1 bo-rad-23 hov1 m-text3 trans-0-4">
                                                    Iniciar sesión
                                                </button>
                                                <input type="hidden" value="1" class="redireccion"  name="pagina"/>
                                            </div>
                                        </form>
                                    </div>
                                </s:if>
                                <s:else>
                                    <span><a href="logout.jsp" class="text-primary">Cerrar sessión</a></span>
                                </s:else>
                            </div>
                        </div>

                        <span class="linedivide2"></span>

                        <div class="header-wrapicon2">
                            <img src="images/icons/icon-header-02.png" class="header-icon1 js-show-header-dropdown" alt="ICON">
                            <span class="header-icons-noti cart" ><s:property value="#cant"/></span>

                            <!-- Header cart noti -->
                            <div class="header-cart header-dropdown">
                                <ul class="header-cart-wrapitem">
                                    <s:iterator value="#carro" var="c">
                                        <li class="header-cart-item">
                                            <div class="header-cart-item-img">
                                                <img src="images/<s:property value="item.imagen"/>" alt="IMG">
                                            </div>

                                            <div class="header-cart-item-txt">
                                                <a href="#" class="header-cart-item-name">
                                                    <s:property value="item.nombre"/>
                                                </a>

                                                <span class="header-cart-item-info">
                                                    <s:property value="cantidad"/>
                                                    x  <s:property value="precio"/>
                                                </span>
                                            </div>
                                        </li>
                                    </s:iterator>

                                </ul>

                                <div class="header-cart-total">
                                    Total: $75.00
                                </div>

                                <div class="header-cart-buttons">
                                    <div class="header-cart-wrapbtn">
                                        <!-- Button -->
                                        <a href="cart.jsp" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                            Ver carrito
                                        </a>
                                    </div>

                                    <div class="header-cart-wrapbtn">
                                        <!-- Button -->
                                        <a href="#" class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4">
                                            Comprar
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="btn-show-menu-mobile hamburger hamburger--squeeze">
                        <span class="hamburger-box">
                            <span class="hamburger-inner"></span>
                        </span>
                    </div>
                </div>
            </div>

            <!-- Menu Mobile -->
            <div class="wrap-side-menu" >
                <nav class="side-menu">
                    <ul class="main-menu">
                        <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">

                        </li>

                        <li class="item-topbar-mobile p-l-20 p-t-8 p-b-8">
                            <div class="topbar-child2-mobile">
                                <span class="topbar-email">
                                    <s:property value="#user.correo"/> 
                                </span>

                                <div class="topbar-language rs1-select2">
                                    <select class="selection-1" name="time">
                                        <option>USD</option>                                        
                                    </select>
                                </div>
                            </div>
                        </li>

                        <li class="item-topbar-mobile p-l-10">
                            <div class="topbar-social-mobile">
                                <a target="new_tab" href="https://fb.com" class="topbar-social-item fa fa-facebook"></a>
                                <a target="new_tab" href="https://instagram.com" class="topbar-social-item fa fa-instagram"></a>
                                <a target="new_tab" href="https://pinterest.com" class="topbar-social-item fa fa-pinterest-p"></a>
                                <a target="new_tab" href="https://snapchat.com" class="topbar-social-item fa fa-snapchat-ghost"></a>
                                <a target="new_tab" href="https://youtube.com" class="topbar-social-item fa fa-youtube-play"></a>
                            </div>
                        </li>

                        <li class="item-menu-mobile">
                            <a href="index.jsp">Inicio</a>                           

                        </li>

                        <li class="item-menu-mobile">
                            <a href="product.jsp">Tienda</a>
                        </li>

                        <li class="item-menu-mobile">
                            <a href="product.jsp">Ventas</a>
                        </li>

                        <li class="item-menu-mobile">
                            <a href="cart.jsp">Reportes</a>
                        </li>



                        <li class="item-menu-mobile">
                            <a href="about.jsp">Acerca de</a>
                        </li>

                        <li class="item-menu-mobile">
                            <a href="contact.jsp">Contactos</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </header>
    </body>
</html>
