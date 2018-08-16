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
public class CategoriasDAO extends ConexionPSQL{
    private List<Categorias> listaCategorias;

    public CategoriasDAO(List<Categorias> listaCategorias) {
        this.listaCategorias = listaCategorias;
    }

    public CategoriasDAO() {
        
    }

    public void obtenerCategoria() throws SQLException{
        listaCategorias.clear();
        abrirConexion();
        sentencia= conexion.prepareStatement("select * from categorias");
        resultado=sentencia.executeQuery();
        while(resultado.next()){
            Categorias c= new Categorias();
            c.setCategorias(resultado.getInt(1));
            c.setDescripcion(resultado.getString(2));
            c.setImagen(resultado.getString(3));
            listaCategorias.add(c);
        }        
        cerrarConexion();
    }
    
    public Categorias obtenerCategoria(int idcate) throws SQLException{
       Categorias c=null;
        abrirConexion();
        sentencia= conexion.prepareStatement("select * from categorias where idcategorias=?");
        sentencia.setInt(1, idcate);
        resultado=sentencia.executeQuery();
        while(resultado.next()){
            c= new Categorias();
            c.setCategorias(resultado.getInt(1));
            c.setDescripcion(resultado.getString(2));
            c.setImagen(resultado.getString(3));
        }        
        cerrarConexion();
        return c;
    }
    
    
    
}
