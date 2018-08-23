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
public class ItemsDAO extends ConexionMySQL {

    private List<Items> listaItems;

    public ItemsDAO(List<Items> listaItems) {
        this.listaItems = listaItems;
    }

    public ItemsDAO() {
    }

    public int actualizarProducto(Items item) throws SQLException {
        int re = 0;
        abrirConexion();
        sentencia = conexion.prepareStatement("UPDATE items\n"
                + "   SET nombre=?, descripcion=?, descripcion2=?, precio=?,  stock=? "
                + " WHERE iditem=?");
        sentencia.setString(1, item.getNombre());
        sentencia.setString(2, item.getDescripcion());
        sentencia.setString(3, item.getDescripcion2());
        sentencia.setFloat(4, item.getPrecio());
        sentencia.setInt(5, item.getStock());
        sentencia.setInt(6, item.getIditem());
        re=sentencia.executeUpdate();
        cerrarConexion();
        return re;
    }

    public int eliminarProducto(Items item) throws SQLException {
        int re = 0;
        abrirConexion();
        sentencia = conexion.prepareStatement("delete from items WHERE iditem=?");        
        sentencia.setInt(1, item.getIditem());
        re=sentencia.executeUpdate();
        cerrarConexion();
        return re;
    }

    public void obtenerItems(int id) throws SQLException {
        listaItems.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from items where idtipo=? order by idcategorias");
        sentencia.setInt(1, id);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Items c = new Items();
            c.setIditem(resultado.getInt(1));
            c.setNombre(resultado.getString(2));
            c.setDescripcion(resultado.getString(3));
            c.setDescripcion2(resultado.getString(4));
            c.setPrecio(resultado.getFloat(5));
            c.setDescuento(resultado.getFloat(6));
            c.setIdtipo(resultado.getInt(7));
            c.setIdcategorias(resultado.getInt(8));
            c.setImagen(resultado.getString(9));
            c.setStock(resultado.getInt(10));
            c.setRate(resultado.getFloat(11));
            listaItems.add(c);
        }
        cerrarConexion();
    }

    public void obtenerItems(int id, String busca) throws SQLException {
        listaItems.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from items where idtipo=? and nombre like ? order by idcategorias");
        sentencia.setInt(1, id);
        sentencia.setString(2, busca + "%");
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Items c = new Items();
            c.setIditem(resultado.getInt(1));
            c.setNombre(resultado.getString(2));
            c.setDescripcion(resultado.getString(3));
            c.setDescripcion2(resultado.getString(4));
            c.setPrecio(resultado.getFloat(5));
            c.setDescuento(resultado.getFloat(6));
            c.setIdtipo(resultado.getInt(7));
            c.setIdcategorias(resultado.getInt(8));
            c.setImagen(resultado.getString(9));
            c.setStock(resultado.getInt(10));
            c.setRate(resultado.getFloat(11));
            listaItems.add(c);
        }
        cerrarConexion();
    }

    public void obtenerRelacionados(int id, int idc) throws SQLException {
        listaItems.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("SELECT * FROM items where idtipo=? and idcategorias=? ORDER BY random() LIMIT 3");
        sentencia.setInt(1, id);
        sentencia.setInt(2, idc);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Items c = new Items();
            c.setIditem(resultado.getInt(1));
            c.setNombre(resultado.getString(2));
            c.setDescripcion(resultado.getString(3));
            c.setDescripcion2(resultado.getString(4));
            c.setPrecio(resultado.getFloat(5));
            c.setDescuento(resultado.getFloat(6));
            c.setIdtipo(resultado.getInt(7));
            c.setIdcategorias(resultado.getInt(8));
            c.setImagen(resultado.getString(9));
            c.setStock(resultado.getInt(10));
            c.setRate(resultado.getFloat(11));
            listaItems.add(c);
        }
        cerrarConexion();
    }

    public Items obtenerItem(int idtem) throws SQLException {
        Items c = null;
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from items where iditem=? order by idcategorias");
        sentencia.setInt(1, idtem);
        resultado = sentencia.executeQuery();
        if (resultado.next()) {
            c = new Items();
            c.setIditem(resultado.getInt(1));
            c.setNombre(resultado.getString(2));
            c.setDescripcion(resultado.getString(3));
            c.setDescripcion2(resultado.getString(4));
            c.setPrecio(resultado.getFloat(5));
            c.setDescuento(resultado.getFloat(6));
            c.setIdtipo(resultado.getInt(7));
            c.setIdcategorias(resultado.getInt(8));
            Categorias ca = new CategoriasDAO().obtenerCategoria(resultado.getInt(8));
            c.setCategorias(ca);
            c.setImagen(resultado.getString(9));
            c.setStock(resultado.getInt(10));
            c.setRate(resultado.getFloat(11));
        }
        cerrarConexion();
        return c;
    }

}
