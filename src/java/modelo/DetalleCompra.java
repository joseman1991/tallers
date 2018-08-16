/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;

/**
 *
 * @author JOSE
 */
public class DetalleCompra implements Serializable {

    private long idcompra;
    private int idtem;
    private Items item;
    private int cantidad;
    private float precio;
    private float descuent;
    private float iva;

    public long getIdcompra() {
        return idcompra;
    }

    public void setIdcompra(long idcompra) {
        this.idcompra = idcompra;
    }

    public int getIdtem() {
        idtem = item.getIditem();
        return idtem;
    }

    public void setIdtem(int idtem) {
        this.idtem = idtem;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        precio = item.getPrecio();
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public float getDescuent() {
        descuent = item.getDescuento();
        return descuent;
    }

    public void setDescuent(float descuent) {
        this.descuent = descuent;
    }

    public float getIva() {
        iva = item.getIva();
        return iva;
    }

    public void setIva(float iva) {
        this.iva = iva;
    }

    public Items getItem() {
        return item;
    }

    public void setItem(Items item) {
        this.item = item;
    }

}
