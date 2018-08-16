/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function  validar(control, text, condicion) {

    if (condicion) {
        control.removeClass("alert-success");
        control.addClass("alert-success");
        control.html(text);
        control.show('fade');
        setTimeout(function () {
            control.hide('fade');
        }, 3000);
        return true;
    }
    return false;
}

function  validarPass(e) {
    var strongRegex = new RegExp("^(?=.{8,})(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*\\W).*$", "g");
    return strongRegex.test(e);
}

function valCorreo(e) {
    var regex = /[\w-\.]{2,}@([\w-]{2,}\.)*([\w-]{2,}\.)[\w-]{2,4}/;
    if (!regex.test(e.val().trim())) {
        return false;
    }
    return true;
}
$(document).ready(function () {

    var nombreUsuario = $('#nu');
    var nus = $('#nus');
    var clave1 = $('#c1');
    var c1s = $('#c1s');
    var clave2 = $('#c');
    var cs = $('#cs');
    var pn = $('#pn');
    var pns = $('#pns');

    var sn = $('#sn');
    var sns = $('#sns');

    var ap = $('#ap');
    var aps = $('#aps');

    var am = $('#am');
    var ams = $('#ams');

    var corre = $('#corre');
    var correo = $('#correos');
 
    var dni = $('#ced');
    var dnis = $('#ceds');
 
    var dir = $('#dir');
    var dirs = $('#dirs');
    var boto = $('#boto');




    boto.click(function () {
        if (validar(nus, "<strong>¡Error!,</strong> Nombre usuario no puede ser menor a 5 caracteres", nombreUsuario.val().length < 5))
            return;
        if (validar(nus, "<strong>¡Error!,</strong> Nombre usuario no puede quedar en blanco", nombreUsuario.val().length === 0))
            return;
        if (validar(nus, "<strong>¡Error!,</strong> Nombre usuario no puede ser mayor a 16 caracteres", nombreUsuario.val().length > 16))
            return;

        if (validar(c1s, "<strong>¡Error!,</strong> Clave no puede quedar en blanco", clave1.val().length === 0))
            return;

        if (validar(c1s, "<strong>¡Error!,</strong> Clave no puede ser menor a 8 caracteres", clave1.val().length < 8))
            return;

        if (validar(c1s, "<strong>¡Error!,</strong> Clave no puede ser mayor a 16 caracteres", clave1.val().length > 16))
            return;
        if (validar(c1s, "<strong>¡Error!,</strong> Debe contener un al menos un numero,una letra mayúscula, una minuscula, y un símbolo", !validarPass(clave1.val())))
            return;


        if (validar(cs, "<strong>¡Error!,</strong> Clave de confitmacion no coincide", clave1.val() !== clave2.val()))
            return;

        if (validar(pns, "<strong>¡Error!,</strong> Primer Nombre no puede quedar en blanco", pn.val().length === 0))
            return;
        if (validar(sns, "<strong>¡Error!,</strong> Segundo Nombre no puede quedar en blanco", sn.val().length === 0))
            return;
        if (validar(aps, "<strong>¡Error!,</strong> Apellido paterno no puede quedar en blanco", ap.val().length === 0))
            return;
        if (validar(ams, "<strong>¡Error!,</strong> Apellido materno no puede quedar en blanco", am.val().length === 0))
            return;
        if (validar(correo, "<strong>¡Error!,</strong> Correo electrónico no puede quedar en blanco", corre.val().length === 0))
            return;
        
        if (validar(dnis, "<strong>¡Error!,</strong> Cedula no puede quedar en blanco", dni.val().length === 0))
            return;
        
        if (validar(dirs, "<strong>¡Error!,</strong> DIreccion no puede quedar en blanco", dir.val().length === 0))
            return;
        
        if (validar(dnis, "<strong>¡Error!,</strong> Cedula no puede contener letras o simbolos", !($.isNumeric( dni.val()))))
            return;
        
        if (validar(dnis, "<strong>¡Error!,</strong> Cedula no puede ser menor a 10", dni.val().length < 10))
            return;
         if (validar(dnis, "<strong>¡Error!,</strong> Cedula no puede ser mayor a 10", dni.val().length > 10))
            return;
        
        
        
        if (validar(correo, "<strong>¡Error!,</strong> Correo electrónico no válido", !valCorreo(corre)))
            return;
        
        $("#form-registro").submit();

    });


});