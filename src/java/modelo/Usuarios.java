/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Abigail
 */
public class Usuarios {
    
private String    nombreusuario ;
 private String clave ;
 private String nombre1 ;
 private String nombre2 ;
 private String apellidop ;
 private String apellidon ;
 private String correo; 
 private String estado;
 private String imagen;
 private String direccion;
 private String dni;
 private String saludo;

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getApellidop() {
        return apellidop;
    }

    public void setApellidop(String apellidop) {
        this.apellidop = apellidop;
    }

    public String getApellidon() {
        return apellidon;
    }

    public void setApellidon(String apellidon) {
        this.apellidon = apellidon;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }
 
 public String getCompleto(){
     return String.format("%s %s %s %s ", nombre1,nombre2,apellidop,apellidon);
 }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getSaludo() {
        saludo="Hola, "+nombre1;
        return saludo;
    }

    public void setSaludo(String saludo) {
        this.saludo = saludo;
    }    
    
}
