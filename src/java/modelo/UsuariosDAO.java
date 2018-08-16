/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;

/**
 *
 * @author Abigail
 */
public class UsuariosDAO extends ConexionPSQL {

    public int insertarUsuarios(Usuarios u) throws SQLException {
        int r;
        abrirConexion();
        sentencia = conexion.prepareStatement("INSERT INTO usuarios(\n"
                + "            nombreusuario, clave, nombre1, nombre2, apellidop, apellidon,correo,direccion,dni)\n"
                + "    VALUES (?, ?, ?, ?, ?, ?,?,?,?)");
        int i = 1;
        sentencia.setString(i++, u.getNombreusuario());
        sentencia.setString(i++, u.getClave());
        sentencia.setString(i++, u.getNombre1());
        sentencia.setString(i++, u.getNombre2());
        sentencia.setString(i++, u.getApellidop());
        sentencia.setString(i++, u.getApellidon());
        sentencia.setString(i++, u.getCorreo());
        sentencia.setString(i++, u.getDireccion());
        sentencia.setString(i++, u.getDni());
        r = sentencia.executeUpdate();
        cerrarConexion();
        return r;
    }

    public Usuarios obtenerUsusario(Usuarios user) throws SQLException {
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from usuarios where nombreusuario=? or correo=? and clave=?");
        sentencia.setString(1, user.getNombreusuario());
        sentencia.setString(2, user.getNombreusuario());
        sentencia.setString(3, user.getClave());
        resultado = sentencia.executeQuery();
        if (resultado.next()) {
            int i = 1;
            user.setNombreusuario(resultado.getString(i++));
            user.setClave(resultado.getString(i++));
            user.setNombre1(resultado.getString(i++));
            user.setNombre2(resultado.getString(i++));
            user.setApellidop(resultado.getString(i++));
            user.setApellidon(resultado.getString(i++));
            user.setCorreo(resultado.getString(i++));
            user.setImagen(resultado.getString(i++));
            user.setDireccion(resultado.getString(i++));
            user.setDni(resultado.getString(i++));
            user.setEstado("login");
        } else {
            user = null;
        }
        cerrarConexion();
        return user;
    }

    public Usuarios obtenerUsusario(String nombreusuario) throws SQLException {
        Usuarios user;
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from usuarios where nombreusuario=? ");
        sentencia.setString(1, nombreusuario);
        resultado = sentencia.executeQuery();
        if (resultado.next()) {
            user = new Usuarios();
            int i = 1;
            user.setNombreusuario(resultado.getString(i++));
            user.setClave(resultado.getString(i++));
            user.setNombre1(resultado.getString(i++));
            user.setNombre2(resultado.getString(i++));
            user.setApellidop(resultado.getString(i++));
            user.setApellidon(resultado.getString(i++));
            user.setCorreo(resultado.getString(i++));
            user.setDireccion(resultado.getString(i++));
            user.setDni(resultado.getString(i++));
            user.setImagen(resultado.getString(i++));
            user.setEstado("login");
        } else {
            user = null;
        }
        cerrarConexion();
        return user;
    }

}
