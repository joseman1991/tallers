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
import javax.mail.MessagingException;
import modelo.EnviarMensaje;
import modelo.Items;
import modelo.Usuarios;
import modelo.UsuariosDAO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Abigail
 */
public class UsuarioAction extends ActionSupport implements ModelDriven<Usuarios> {

    private Usuarios usuarios;
    private final UsuariosDAO udao;
    private String mensaje;
    private final List<Items> listaItems;
    private int cantidad;

    public UsuarioAction() {
        udao = new UsuariosDAO();
        usuarios = new Usuarios();
        listaItems = new ArrayList<>();
    }

    @Override
    public Usuarios getModel() {
        return usuarios;
    }

    public String insertar() {
        try {
            int r = udao.insertarUsuarios(usuarios);
            if (r > 0) {
                EnviarMensaje enviarMensaje = new EnviarMensaje();
                enviarMensaje.enviarConGMail(usuarios.getCorreo(), "Bienvenido a Beauty Spa Center", "Gracias por registrarte "
                        + " en nuestro spa,");
                mensaje = "Registro exitoso para el usuario "+usuarios.getNombreusuario();

                return SUCCESS;
            } else {
                mensaje = "ha ocurrido un error";
                System.out.println(mensaje);
                return ERROR;
            }
        } catch (SQLException | MessagingException e) {
            mensaje = "Ha ocurrido un error " + e.getMessage();
            System.out.println(mensaje);
            return ERROR;
        }

    }

    public String login() {
        try {
            Usuarios user = (Usuarios) ServletActionContext.getRequest().getSession().getAttribute("usuario");
            if (user != null) {
                ServletActionContext.getRequest().getSession().setAttribute("usuario", user);
                return SUCCESS;
            }
            usuarios = udao.obtenerUsusario(usuarios);

            if (usuarios != null) {
                ServletActionContext.getRequest().getSession().setAttribute("usuario", usuarios);
                ServletActionContext.getRequest().getSession().setAttribute("listaItems", listaItems);
                ServletActionContext.getRequest().getSession().setAttribute("cantidad", cantidad);
                ServletActionContext.getRequest().getSession().setAttribute("cantidadSer", 0);
                ServletActionContext.getRequest().getSession().setAttribute("elementos", 0);

                return "success";
            } else {
                usuarios = new Usuarios();
                usuarios.setEstado("No login");
                ServletActionContext.getRequest().getSession().setAttribute("usuario", usuarios);
                mensaje = "error ";
                return "error";
            }
        } catch (SQLException ex) {
            mensaje = ex.getMessage();
            return "error";
        }
    }

    public Usuarios getUsuarios() {
        return usuarios;
    }

    public void setUsuarios(Usuarios usuarios) {
        this.usuarios = usuarios;
    }

    public String getMensaje() {
        return mensaje;
    }

}
