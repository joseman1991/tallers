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
import modelo.DetalleCompra;
import modelo.Reservas;
import modelo.ReservasDAO;
import org.apache.struts2.ServletActionContext;

public class ReservaAction extends ActionSupport implements ModelDriven<Reservas> {

    private final HttpSession session;
    private List<DetalleCompra> listaItems;
    private Reservas reservas;
    private String mensaje;
    private List<Reservas> lista;
    ArrayList<DetalleCompra> listaDetalleCompra;
    private boolean reservado;

    public ReservaAction() {
        reservas = new Reservas();
        session = ServletActionContext.getRequest().getSession();
    }

    public String reservar() {
        session.setAttribute("reserva", reservas);
        return SUCCESS;
    }

    public String eliminar() {
        listaItems = (List<DetalleCompra>) session.getAttribute("listaItems");
        reservas = null;
        session.setAttribute("reserva", reservas);
        if (listaItems != null) {
            for (int i = 0; i < listaItems.size(); i++) {
                DetalleCompra get = listaItems.get(i);
                System.out.println(get.getItem().getIdtipo());
                if (get.getItem().getIdtipo() == 2) {
                    listaItems.remove(i);
                }
            }
        }
        session.setAttribute("listaItems", listaItems);
        session.setAttribute("cantidadSer", 0);
        return SUCCESS;
    }

    public String comprobarReserva() {
        try {
            ReservasDAO rdao = new ReservasDAO();
            reservas.setFecha(reservas.getF());
            reservas.setHora(reservas.getH());
            System.out.println(reservas.getFecha());
            System.out.println(reservas.getHora());
            reservado = rdao.isReserva(reservas);
            System.out.println(reservado);
        } catch (SQLException e) {
            mensaje = e.getMessage();
        }
        return SUCCESS;
    }

    public String lista() {
        lista = new ArrayList<>();
        ReservasDAO rdao = new ReservasDAO(lista);
        try {
            rdao.obtenerReservas(reservas.getNombreusuario());
        } catch (SQLException e) {
            mensaje = e.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    public String lista2() {
        lista = new ArrayList<>();
        ReservasDAO rdao = new ReservasDAO(lista);
        try {
            rdao.obtenerCompras(reservas.getNombreusuario());
        } catch (SQLException e) {
            mensaje = e.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    public String ListDetalle() {
        listaDetalleCompra = new ArrayList<>();
        ReservasDAO rdao = new ReservasDAO(listaDetalleCompra);
        try {
            reservas = rdao.obtenerReserva(reservas.getIdreserva());
            session.setAttribute("listaItems2", listaDetalleCompra);
            session.setAttribute("reserva2", reservas);
            session.setAttribute("insert", 0);
        } catch (SQLException e) {
            mensaje = e.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    public String ListDetalle2() {
        listaDetalleCompra = new ArrayList<>();
        ReservasDAO rdao = new ReservasDAO(listaDetalleCompra);
        try {
            reservas = rdao.obtenerCompra(reservas.getIdreserva());
            session.setAttribute("listaItems2", listaDetalleCompra);
            session.setAttribute("reserva2", reservas);
            session.setAttribute("insert", 0);
        } catch (SQLException e) {
            mensaje = e.getMessage();
            return ERROR;
        }
        return SUCCESS;
    }

    @Override
    public Reservas getModel() {
        return reservas;
    }

    public void setReservas(Reservas reservas) {
        this.reservas = reservas;
    }

    public String getMensaje() {
        return mensaje;
    }

    public List<Reservas> getLista() {
        return lista;
    }

    public boolean isReservado() {
        return reservado;
    }

}
