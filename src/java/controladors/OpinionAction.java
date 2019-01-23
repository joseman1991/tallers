/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladors;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelos.Opinion;
import modelos.OpinionDAO;

/**
 *
 * @author JOSE
 */
public class OpinionAction extends ActionSupport implements ModelDriven<Opinion> {

    private List<Opinion> listOpiniones;

    private String mensaje;
    private Opinion opinion;
    private final OpinionDAO odao;
    private int producto;

    
    
    public OpinionAction() {
        opinion= new Opinion();
        this.listOpiniones = new ArrayList<>();
        odao = new OpinionDAO(this.listOpiniones);
    }

    public String insertar() {
        try {
            System.out.println(opinion.getNombreusuario());
            odao.insertarOpinion(opinion);
            odao.obtenerLista(opinion.getIdproducto());
            producto=opinion.getIdproducto();
            return SUCCESS;
        } catch (SQLException e) {
            mensaje = e.getMessage();
            return ERROR;
        }
    }

    @Override
    public Opinion getModel() {
        return opinion;
    }

    public Opinion getOpinion() {
        return opinion;
    }

    public void setOpinion(Opinion opinion) {
        this.opinion = opinion;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public List<Opinion> getListOpiniones() {
        return listOpiniones;
    }

    public void setListOpiniones(List<Opinion> listOpiniones) {
        this.listOpiniones = listOpiniones;
    }

    public int getProducto() {
        return producto;
    }

    public void setProducto(int producto) {
        this.producto = producto;
    }

}
