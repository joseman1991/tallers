/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.io.FileNotFoundException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import modelo.DetalleCompra;
import modelo.EnviarMensaje; 
import modelo.Items;
import modelo.ItemsDAO;
import modelo.Reservas;
import modelo.ReservasDAO;
import modelo.Usuarios;
import modelo.UsuariosDAO;
import net.sf.jasperreports.engine.JRException;
import org.apache.struts2.ServletActionContext;

/** 
 *
 * @author JOSE
 */
public class Carrito extends ActionSupport implements ModelDriven<Items> {

    private final HttpSession session;
    private List<DetalleCompra> listaItems;
    private Items items;
    private String JSonItems;
    private int cantidad;
    private int cantidadItem;
    private int cantidadSer;
    private int car;
    private int elementos;

    private final Gson JSonParser;

    private boolean esReserva;
    private boolean esRepetido;
    private boolean esStock;
    private final String ruta;

    public Carrito() {
        JSonParser = new Gson();
        items = new Items();
        session = ServletActionContext.getRequest().getSession();
        esReserva = true;
        this.ruta = session.getServletContext().getRealPath("/reports");
    }

    @Override
    public String execute() throws Exception {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        cantidad = (int) session.getAttribute("cantidad");
        cantidadSer = (int) session.getAttribute("cantidadSer");
        elementos = (int) session.getAttribute("elementos");
        session.setAttribute("listaItems2", null);
        session.setAttribute("reserva2", null);
        return SUCCESS;
    }

    public String add_to_cart() {
        esRepetido = false;
        try {
            listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
            if (listaItems != null) {
                if (items.getIdtipo() == 2) {
                    Reservas re = (Reservas) session.getAttribute("reserva");
                    if (re == null) {
                        esReserva = false;
                        return SUCCESS;
                    }
                }
                ItemsDAO idao = new ItemsDAO();
                items = idao.obtenerItem(items.getIditem());
                JSonItems = JSonParser.toJson(items);
                cantidad = 0;
                elementos = 0;
                cantidadSer = 0;
                boolean isIs = true;
                DetalleCompra dti = new DetalleCompra();
                for (int i = 0; i < listaItems.size(); i++) {
                    DetalleCompra listaItem = listaItems.get(i);
                    if (listaItem.getIdtem() == items.getIditem()) {
                        isIs = false;
                        if (items.getIdtipo() == 2) {
                            listaItems.remove(i);
                            esRepetido = true;
                            break;
                        } else {
                            if (items.getStock() >= listaItem.getCantidad() + 1) {
                                dti = listaItems.get(i);
                                dti.setCantidad(listaItem.getCantidad() + 1);
                                listaItems.set(i, dti);
                                esStock = true;
                            } else {
                                esStock = false;
                            }
                            esRepetido = true;
                        }
                    }
                }
                if (isIs) {
                    if (items.getIdtipo() == 1) {
                        if (items.getStock() >= 1) {
                            dti.setCantidad(1);
                            dti.setItem(items);
                            listaItems.add(dti);
                            esStock = true;
                        } else {
                            esStock = false;
                        }
                    } else {
                        dti.setCantidad(1);
                        dti.setItem(items);
                        listaItems.add(dti);
                    }
                }
                for (int i = 0; i < listaItems.size(); i++) {
                    DetalleCompra listaItem = listaItems.get(i);
                    if (listaItem.getItem().getIdtipo() == 1) {
                        if (items.getIditem() == listaItem.getIdtem()) {
                            cantidadItem = listaItem.getCantidad();
                        }
                        elementos++;
                        cantidad += listaItems.get(i).getCantidad();
                    } else {
                        cantidadSer++;
                    }
                }
                car = listaItems.size();
                session.setAttribute("listaItems", listaItems);
                session.setAttribute("cantidad", cantidad);
                session.setAttribute("elementos", elementos);
                session.setAttribute("cantidadSer", cantidadSer);
            }
            return SUCCESS;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return ERROR;
        }
    }

    public String add_to_car() {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        cantidad = 0;
        for (int i = 0; i < listaItems.size(); i++) {
            if (listaItems.get(i).getIdtem() == items.getIditem()) {
                listaItems.get(i).setCantidad(items.getStock());
            }
            cantidad += listaItems.get(i).getCantidad();
        }
        cantidadSer = (int) session.getAttribute("cantidadSer");
        elementos = (int) session.getAttribute("elementos");
        session.setAttribute("cantidad", cantidad);
        session.setAttribute("elementos", elementos);
        session.setAttribute("cantidadSer", cantidadSer);
        return SUCCESS;
    }

    public List<DetalleCompra> getListaItems() {
        return listaItems;
    }

    @Override
    public Items getModel() {
        return items;
    }

    public String eliminarArt() {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        cantidad = 0;
        for (int i = 0; i < listaItems.size(); i++) {
            if (listaItems.get(i).getIdtem() == items.getIditem()) {
                listaItems.remove(i);
                break;
            }
        }

        for (int i = 0; i < listaItems.size(); i++) {
            cantidad += listaItems.get(i).getCantidad();
        }
        cantidadSer = (int) session.getAttribute("cantidadSer");
        elementos = listaItems.size();

        session.setAttribute("cantidad", cantidad);
        session.setAttribute("elementos", elementos);
        session.setAttribute("cantidadSer", cantidadSer);
        return SUCCESS;
    }

    public Items getItems() {
        return items;
    }

    public void setItems(Items items) {
        this.items = items;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getCar() {
        return car;
    }

    public boolean isEsReserva() {
        return esReserva;
    }

    public String insertar() {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        Reservas reservas = (Reservas) session.getAttribute("reserva");
        Usuarios user = (Usuarios) ServletActionContext.getRequest().getSession().getAttribute("usuario");
        ReservasDAO re = new ReservasDAO();
        try {
            reservas.setCorreo(user.getCorreo());

            re.insertar(reservas, listaItems, ruta);
            List<DetalleCompra> li = new ArrayList<>(listaItems);
            session.setAttribute("listaItems2", li);
            session.setAttribute("reserva2", reservas);
            session.setAttribute("insert", 1);
            for (int i = 0; i < listaItems.size(); i++) {
                DetalleCompra get = listaItems.get(i);
                if (get.getItem().getIdtipo() == 2) {
                    listaItems.subList(i, listaItems.size()).clear();
                }
            }
            EnviarMensaje enviarMensaje = new EnviarMensaje();
            Usuarios u = new UsuariosDAO().obtenerUsusario(reservas.getNombreusuario());
            enviarMensaje.enviarConGMail(u.getCorreo(), "Reservación Realizada", "Se ha generado "
                    + " una nueva factura");
            cantidad = (int) session.getAttribute("cantidad");
            session.setAttribute("listaItems", listaItems);
            session.setAttribute("cantidadSer", 0);
            session.setAttribute("reserva", null);
            session.setAttribute("cantidad", cantidad);

        } catch (SQLException | MessagingException | JRException | FileNotFoundException ex) {
            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
            mensaje = ex.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    public String insertar2() {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        Reservas reservas = new Reservas();
        Usuarios user = (Usuarios) ServletActionContext.getRequest().getSession().getAttribute("usuario");
        reservas.setNombreusuario(user.getNombreusuario());
        reservas.setCorreo(user.getCorreo());
        ReservasDAO re = new ReservasDAO();
        try {

            re.insertar2(reservas, listaItems, ruta);
            List<DetalleCompra> li = new ArrayList<>(listaItems);
            session.setAttribute("listaItems2", li);
            session.setAttribute("reserva2", reservas);
            session.setAttribute("insert", 1);
            for (int i = 0; i < listaItems.size(); i++) {
                DetalleCompra get = listaItems.get(i);
                if (get.getItem().getIdtipo() == 1) {
                    listaItems.subList(i, listaItems.size()).clear();
                }
            }
            EnviarMensaje enviarMensaje = new EnviarMensaje();
            Usuarios u = new UsuariosDAO().obtenerUsusario(reservas.getNombreusuario());
            enviarMensaje.enviarConGMail(u.getCorreo(), "Haz realizado la compra con éxito", "Se ha generado "
                    + " una nueva factura");
            cantidad = (int) session.getAttribute("cantidadSer");
            session.setAttribute("listaItems", listaItems);
            session.setAttribute("cantidadSer", cantidad);
            session.setAttribute("cantidad", 0);
            session.setAttribute("elementos", 0);
        } catch (SQLException | MessagingException | JRException | FileNotFoundException ex) {
            Logger.getLogger(Carrito.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex.getMessage());
            mensaje = ex.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    public String getJSonItems() {
        return JSonItems;
    }

    public boolean isEsRepetido() {
        return esRepetido;
    }

    private String mensaje;

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public int getCantidadSer() {
        return cantidadSer;
    }

    public int getElementos() {
        return elementos;
    }

    public int getCantidadItem() {
        return cantidadItem;
    }

    public boolean isEsStock() {
        return esStock;
    }

}
