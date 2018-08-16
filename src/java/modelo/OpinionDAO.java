/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author JOSE
 */
public class OpinionDAO extends ConexionPSQL {

    private  List<Opinion> listOpiniones;

    public OpinionDAO(List<Opinion> listOpiniones) {
        this.listOpiniones = listOpiniones;
    }

    public OpinionDAO() {
        
    }
    
    

    public int insertarOpinion(Opinion opinion) throws SQLException {
        abrirConexion();
        procedimiento = conexion.prepareCall("{call add_opinion(?,?,?,?)}");
        procedimiento.setString(1, opinion.getOpinion());
        procedimiento.setString(2, opinion.getNombreusuario());
        procedimiento.setInt(3, opinion.getClasificacion());
        procedimiento.setInt(4, opinion.getIdproducto());
        int re = procedimiento.executeUpdate();
        cerrarConexion();
        return re;
    }

    public void obtenerLista(int idprodicto) throws SQLException {
        abrirConexion();
        listOpiniones.clear();
        sentencia = conexion.prepareCall("select * from opiniones where idproducto=?");
        sentencia.setInt(1, idprodicto);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Opinion op = new Opinion();
            op.setIdopinion(resultado.getInt(1));
            op.setOpinion(resultado.getString(2));
            op.setNombreusuario(resultado.getString(3));
            op.setUsuario(new UsuariosDAO().obtenerUsusario(op.getNombreusuario()));
            op.setIdproducto(resultado.getInt(4));
            op.setFecha(resultado.getDate(5));
            op.setClasificacion(resultado.getInt(6));
            listOpiniones.add(op);
        }
        cerrarConexion();
    }

}
