/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author JOSE
 */
public class ImagenesDAO extends ConexionMySQL {

    private final List<Imagenes> listaImagenes;

    public ImagenesDAO(List<Imagenes> listaImagenes) {
        this.listaImagenes = listaImagenes;
    }

    public void obtenerImagenes(int iditem) throws SQLException {
        listaImagenes.clear();
        abrirConexion();
        sentencia= conexion.prepareStatement("select * from imagenes where iditem=?");
        sentencia.setInt(1, iditem);
        resultado=sentencia.executeQuery();
        while (resultado.next()) {            
            Imagenes img= new Imagenes();
            img.setIdimagen(resultado.getInt(1));
            img.setNombre(resultado.getString(2));
            img.setIditem(resultado.getInt(3));
            listaImagenes.add(img);
        }
        cerrarConexion();
    }

}
