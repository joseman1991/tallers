/*
 * To change this license header; choose License Headers in Project Properties.
 * To change this template file; choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.Serializable;

/**
 *
 * @author JOSE
 */
public class Items implements Serializable {

    private int iditem;
    private int stock;
    private String nombre;
    private String nombreusuario;
    private String descripcion;
    private String descripcion2;
    private float precio;
    private float descuento;
    private int idtipo;
    private int idcategorias;
    private  Categorias categorias;
    private float iva;
    private float rate;
    private String imagen;
    private File[] imagenes;
    private String[] imagenesFileName;
    private String[] imagenesContentType;
    private FileInputStream[] images;
    private long[] longitudByte;

    public Items() {
        nombre = "";
        descripcion = "";
        descripcion2 = "";
        imagen = "";
        categorias = new Categorias();
    }

    public void setCategorias(Categorias categorias) {
        this.categorias = categorias;
    }

    public FileInputStream[] getImages() {

        if (imagenes != null) {
            try {
                images = new FileInputStream[imagenes.length];
                for (int i = 0; i < imagenes.length; i++) {
                    File img = imagenes[i];
                    images[i] = new FileInputStream(img);
                }
            } catch (FileNotFoundException e) {
                System.out.println(e.getMessage());
            }
        }
        return images;
    }

    public int getIditem() {
        return iditem;
    }

    public String getNombreusuario() {
        return nombreusuario;
    }

    public void setNombreusuario(String nombreusuario) {
        this.nombreusuario = nombreusuario;
    }

    
    
    
    public void setIditem(int iditem) {
        this.iditem = iditem;
    }
    
      public void setIditem(String iditem) {
        this.iditem = Integer.parseInt(iditem);
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getDescripcion2() {
        return descripcion2;
    }

    public void setDescripcion2(String descripcion2) {
        this.descripcion2 = descripcion2;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public long[] getLongitudByte() {
        if (imagenes != null) {
            longitudByte = new long[imagenes.length];
            for (int i = 0; i < imagenes.length; i++) {
                File imagene = imagenes[i];
                longitudByte[i] = imagene.length();
            }
        }
        return longitudByte;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public int getIdtipo() {
        return idtipo;
    }

    public void setIdtipo(int idtipo) {
        this.idtipo = idtipo;
    }

    public int getIdcategorias() {
        return idcategorias;
    }

    public void setIdcategorias(int idcategorias) {
        this.idcategorias = idcategorias;
    }

    public float getIva() {
        return iva;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getRate() {
        return rate;
    }

    public void setRate(float rate) {
        this.rate = rate;
    }

    public float getRate2() {
        return (float) Math.ceil(rate);
    }

    public Categorias getCategorias() {
        return categorias;
    }

    public String[] getImagenesContentType() {
        return imagenesContentType;
    }

    public void setImagenesContentType(String[] imagenesContentType) {
        this.imagenesContentType = imagenesContentType;
    }

    public String getDesc() {
        float f = precio * descuento / 100;
        return String.format("%.2f", f);
    }

    public File[] getImagenes() {
        return imagenes;
    }

    public void setImagenes(File[] imagenes) {
        this.imagenes = imagenes;
    }

    public String[] getImagenesFileName() {
        return imagenesFileName;
    }

    public void setImagenesFileName(String[] imagenesFileName) {
        this.imagenesFileName = imagenesFileName;
    }

}
