/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladors;

import com.opensymphony.xwork2.ActionSupport;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.Categorias;
import modelos.CategoriasDAO;
import modelos.Items;
import modelos.ItemsDAO;

/**
 *
 * @author JOSE
 */
public class CategoriasAction extends ActionSupport {

    private String mensaje;
    private int page;
    private final List<Categorias> listaCategorias;
    private final List<Items> listaItems;

    
    
    public CategoriasAction() {
        listaCategorias = new ArrayList<>();
        listaItems = new ArrayList<>();
    }
    

    public String obtenerCategorias() {
        try { 
            CategoriasDAO c = new CategoriasDAO(listaCategorias);
            c.obtenerCategoria();
            ItemsDAO i = new ItemsDAO(listaItems);
            i.obtenerItems(2);
            return SUCCESS;
        } catch (SQLException ex) {
            mensaje = ex.getMessage();
            return "error";
        }
    } 

    public String obtenerProductos() {
        try { 
            ItemsDAO i = new ItemsDAO(listaItems);
            i.obtenerItems(1);           
            return SUCCESS;
        } catch (SQLException ex) {
            mensaje = ex.getMessage();
            return "error";
        }
    }

    public List<Categorias> getListaCategorias() {
        return listaCategorias;
    }

    public String getMensaje() {
        return mensaje;
    }

    public List<Items> getListaItems() {
        return listaItems;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
    
    
    
    

}
