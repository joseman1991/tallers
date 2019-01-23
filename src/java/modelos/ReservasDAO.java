/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author JOSE-MA
 */
public class ReservasDAO extends ConexionMySQL {

    private List<Reservas> listReservas;
    private ArrayList<DetalleCompra> listDetalleCompra;

    public ReservasDAO() {
    }

    public ReservasDAO(List<Reservas> listReservas) {
        this.listReservas = listReservas;
    }

    public ReservasDAO(ArrayList<DetalleCompra> listDetalleCompra) {
        this.listDetalleCompra = listDetalleCompra;
    }

    public void insertar(Reservas re, List<DetalleCompra> lista, String ruta) throws SQLException, JRException, FileNotFoundException {
        abrirConexion();
        procedimiento = conexion.prepareCall("{call insertarReserva(?,?,?)}");
        procedimiento.setString(1, re.getNombreusuario());
        procedimiento.setDate(2, re.getFecha());
        procedimiento.setTime(3, re.getHora());
        resultado = procedimiento.executeQuery();
        if (resultado.next()) {
            re.setIdreserva(resultado.getInt(1));
        }

        sentencia = conexion.prepareStatement("INSERT INTO detallereservacion(\n"
                + "            idcompra, idtem, cantidad, precio, descuento, iva)\n"
                + "    VALUES (?, ?, ?, ?, ?, default)");
        for (int i = 0; i < lista.size(); i++) {
            DetalleCompra get = lista.get(i);

            int j = 1;
            if (get.getItem().getIdtipo() == 2) {
                sentencia.setLong(j++, re.getIdreserva());
                sentencia.setInt(j++, get.getIdtem());
                sentencia.setInt(j++, get.getCantidad());
                sentencia.setFloat(j++, get.getPrecio());
                sentencia.setFloat(j++, get.getDescuent());
                //  sentencia.setFloat(j++, get.getIva());
                sentencia.executeUpdate();
            }
        }
        procedimiento = conexion.prepareCall("{call actualizarTotal(?)}");
        procedimiento.setLong(1, re.getIdreserva());
        generarReporte(re.getIdreserva(), ruta, "reserva",2);
        procedimiento.executeUpdate();
        cerrarConexion();
    }

    public void insertar2(Reservas re, List<DetalleCompra> lista, String ruta) throws SQLException, JRException, FileNotFoundException {
        abrirConexion();
        procedimiento = conexion.prepareCall("{call insertarventa(?)}");
        procedimiento.setString(1, re.getNombreusuario());
        resultado = procedimiento.executeQuery();
        if (resultado.next()) {
            re.setIdreserva(resultado.getInt(1));
        }

        sentencia = conexion.prepareStatement("INSERT INTO detalleventa(\n"
                + "            idventa, idtem, cantidad, precio, descuento, iva)\n"
                + "    VALUES (?, ?, ?, ?, ?, default)");
        for (int i = 0; i < lista.size(); i++) {
            DetalleCompra get = lista.get(i);

            int j = 1;
            if (get.getItem().getIdtipo() == 1) {
                sentencia.setLong(j++, re.getIdreserva());
                sentencia.setInt(j++, get.getIdtem());
                sentencia.setInt(j++, get.getCantidad());
                sentencia.setFloat(j++, get.getPrecio());
                sentencia.setFloat(j++, get.getDescuent());
//                sentencia.setFloat(j++, get.getIva());
                sentencia.executeUpdate();
            }
        }
        procedimiento = conexion.prepareCall("{call actualizarTotal2(?)}");
        procedimiento.setLong(1, re.getIdreserva());
        procedimiento.executeUpdate();
        generarReporte(re.getIdreserva(), ruta, "factura", 1);
        cerrarConexion();
    }
    private JasperViewer jv;

    private void generarReporte(long codf, String ruta, String tipo, int t) throws JRException, FileNotFoundException {

        File archivo = new File(ruta + "/" + tipo + ".jasper");
        JasperReport report = (JasperReport) JRLoader.loadObject(archivo);
        Map parametro = new HashMap();
        parametro.put("codfact", codf);
        parametro.put("ruc", "1207372002");
        parametro.put("Direccion", "San lorenzo");
        JasperPrint jp = JasperFillManager.fillReport(report, parametro, conexion);
        jv = new JasperViewer(jp, false);
        jv.setTitle("Reportes de factura");

        //jv.setVisible(true);
        JRPdfExporter exporter = new JRPdfExporter();
        exporter.setParameter(JRExporterParameter.JASPER_PRINT, jp);
        if (t == 1) {
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(ruta + "/ventas/" + codf + ".pdf")); // your output goes here
        } else {
            exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, new FileOutputStream(ruta + "/servicios/" + codf + ".pdf")); // your output goes here

        }
        System.out.println("Archivo: " + ruta + codf + ".pdf");
        exporter.exportReport();

    }

    
    public boolean isReserva(Reservas reserva) throws SQLException{
        boolean b= false;
        abrirConexion();
        procedimiento= conexion.prepareCall("{call isReserva(?,?)}");
        procedimiento.setDate(1, reserva.getFecha());
        procedimiento.setTime(2, reserva.getHora());
        resultado=procedimiento.executeQuery();
        if(resultado.next()){
            b= resultado.getBoolean(1);
        }
        cerrarConexion();
        return b;
    }
    
    public void obtenerReservas(String nombreusuario) throws SQLException {
        listReservas.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from reservaciones where nombreusuario=? order by fecha desc, hora desc;");
        sentencia.setString(1, nombreusuario);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Reservas re = new Reservas();
            re.setIdreserva(resultado.getLong(1));
            re.setNombreusuario(resultado.getString(2));
            re.setFecha(resultado.getString(3));
            re.setHora(resultado.getString(4));
            re.setTotal(resultado.getFloat(5));
            re.setDetalle("Reservacion " + re.getFechas() + "- " + re.getHora());
            listReservas.add(re);
        }
        cerrarConexion();
    }

    public void obtenerCompras(String nombreusuario) throws SQLException {
        listReservas.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from ventas where nombreusuario=? order by fecha desc;");
        sentencia.setString(1, nombreusuario);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Reservas re = new Reservas();
            re.setIdreserva(resultado.getLong(1));
            re.setNombreusuario(resultado.getString(2));
            re.setFecha(resultado.getString(3));
            re.setTotal(resultado.getFloat(4));
            re.setDetalle("Compras " + re.getFechas());
            listReservas.add(re);
        }
        cerrarConexion();
    }

    public Reservas obtenerReserva(long idreserva) throws SQLException {
        Reservas re = null;
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from reservaciones where idreserva=?");
        sentencia.setLong(1, idreserva);
        resultado = sentencia.executeQuery();
        if (resultado.next()) {
            re = new Reservas();
            re.setIdreserva(resultado.getLong(1));
            re.setNombreusuario(resultado.getString(2));
            re.setFecha(resultado.getString(3));
            re.setHora(resultado.getString(4));
            re.setTotal(resultado.getFloat(5));
            re.setDetalle("Reservacion " + re.getFechas() + " - " + re.getHora());
        }
        listDetalleCompra.clear();
        sentencia = conexion.prepareStatement("select * from detallereservacion where idcompra = ?;");
        sentencia.setLong(1, idreserva);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            DetalleCompra dt = new DetalleCompra();
            dt.setIdcompra(resultado.getLong(1));
            Items item = new ItemsDAO().obtenerItem(resultado.getInt(2));
            dt.setItem(item);
            dt.setCantidad(resultado.getInt(3));
            dt.setPrecio(resultado.getFloat(4));
            dt.setDescuent(resultado.getFloat(5));
            dt.setIva(resultado.getFloat(6));
            listDetalleCompra.add(dt);
        }

        cerrarConexion();
        return re;
    }

    public Reservas obtenerCompra(long idreserva) throws SQLException {
        Reservas re = null;
        abrirConexion();
        sentencia = conexion.prepareStatement("select * from ventas where idventa=?");
        sentencia.setLong(1, idreserva);
        resultado = sentencia.executeQuery();
        if (resultado.next()) {
            re = new Reservas();
            re.setIdreserva(resultado.getLong(1));
            re.setNombreusuario(resultado.getString(2));
            re.setFecha(resultado.getString(3));
            re.setTotal(resultado.getFloat(4));
            re.setDetalle("Compra numero " + re.getIdreserva() + ", de la fecha: " + re.getFechas());
        }
        listDetalleCompra.clear();
        sentencia = conexion.prepareStatement("select * from detalleventa where idventa = ?");
        sentencia.setLong(1, idreserva);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            DetalleCompra dt = new DetalleCompra();
            dt.setIdcompra(resultado.getLong(1));
            Items item = new ItemsDAO().obtenerItem(resultado.getInt(2));
            dt.setItem(item);
            dt.setCantidad(resultado.getInt(3));
            dt.setPrecio(resultado.getFloat(4));
            dt.setDescuent(resultado.getFloat(5));
            dt.setIva(resultado.getFloat(6));
            listDetalleCompra.add(dt);
        }

        cerrarConexion();
        return re;
    }

}
