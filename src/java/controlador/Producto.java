/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;
import modelo.Imagenes;
import modelo.ImagenesDAO;
import modelo.Items;
import modelo.ItemsDAO;
import modelo.Opinion;
import modelo.OpinionDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author JOSE
 */
public class Producto extends ActionSupport implements ModelDriven<Items> {

    private final HttpSession session;

    private List<Opinion> listOpiniones;
    private final OpinionDAO odao;
    private int page;
    private Items item;
    private final List<Imagenes> listaImagenes;
    private final ImagenesDAO imgdao;
    private final ItemsDAO idao;
    private String mensaje;
    private String busqueda;
    private int producto;
    private final List<Items> listaProductos;

    public Producto() {
        item = new Items();
        listaProductos = new ArrayList<>();
        idao = new ItemsDAO(listaProductos);
        listaImagenes = new ArrayList<>();
        imgdao = new ImagenesDAO(listaImagenes);
        listOpiniones = new ArrayList<>();
        odao = new OpinionDAO(listOpiniones);
        page = 1;
        mensaje = "";
        session = ServletActionContext.getRequest().getSession();
    }

    public String obtenerProducto() {
        try {
            item = idao.obtenerItem(producto);
            idao.obtenerRelacionados(1, item.getIdcategorias());
            imgdao.obtenerImagenes(producto);
            odao.obtenerLista(producto);
            return SUCCESS;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            mensaje = e.getMessage();
            return ERROR;
        }
    }

    public String buscar() {
        try {
            item = idao.obtenerItem(producto);
            idao.obtenerItems(1, busqueda);
            imgdao.obtenerImagenes(producto);
            odao.obtenerLista(producto);
            return SUCCESS;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            mensaje = e.getMessage();
            return ERROR;
        }
    }

    public String obtenerLista() {
        try {
            item = idao.obtenerItem(producto);
            idao.obtenerItems(1, "");
            imgdao.obtenerImagenes(producto);
            session.setAttribute("lista", listaProductos);
            return SUCCESS;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            mensaje = e.getMessage();
            return ERROR;
        }
    }

    @Override
    public Items getModel() {
        return item;
    }

    public Items getItem() {
        return item;
    }

    public void setItem(Items item) {
        this.item = item;
    }

    public String getMensaje() {
        return mensaje;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

    public List<Imagenes> getListaImagenes() {
        return listaImagenes;
    }

    public List<Items> getListaProductos() {
        return listaProductos;
    }

    public List<Opinion> getListOpiniones() {
        return listOpiniones;
    }

    public void setListOpiniones(List<Opinion> listOpiniones) {
        this.listOpiniones = listOpiniones;
    }

    public String getBusqueda() {
        return busqueda;
    }

    public void setBusqueda(String busqueda) {
        this.busqueda = busqueda;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

}
