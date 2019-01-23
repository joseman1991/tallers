/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 *
 * @author JOSE
 */
public class Reservas implements Serializable{

    private long idreserva;
    private String detalle;
    private String nombreusuario;
    private String correo;
    private Date fecha;
    private Time hora;
    private float total;

    public Reservas() {
        idreserva = 0;
        detalle = "";
        nombreusuario = "";
        correo = "";
        fecha = new Date(10);
        hora = new Time(100);
        total = 0;
    }

    private String f;
    private String h;

    public long getIdreserva() {
        return idreserva;
    }

    public void setIdreserva(long idreserva) {
        this.idreserva = idreserva;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public String getFechas() {
        return fecha.toString();
    }

    public String getFechahora() {
        SimpleDateFormat f = new SimpleDateFormat("EEEE, dd MMMM yyyy");
        String s = f.format(fecha);

        return s;
    }

//    public void setFecha(Date fecha) {
//        this.fecha = fecha;
//    }  
    public void setFecha(String fecha) {
        this.fecha = Date.valueOf(fecha);
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public Time getHora() {
        return hora;
    }

    public String getF() {
        return f;
    }

    public void setF(String f) {
        this.f = f;
    }

    public String getH() {
        return h;
    }

    public void setH(String h) {
        this.h = h;
    }

//    public void setHora(Time hora) {
//        this.hora = hora;
//    }
    public void setHora(String hora) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("hh:mm");
            long ms = sdf.parse(hora).getTime();
            this.hora = new Time(ms);
        } catch (ParseException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

}
