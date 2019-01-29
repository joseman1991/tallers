/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author JOSE
 */
public class ImagenesDAO extends ConexionMySQL {

    private final List<Imagenes> listaImagenes;

    public ImagenesDAO() {
        listaImagenes = new ArrayList<>();
    }

    public ImagenesDAO(List<Imagenes> listaImagenes) {
        this.listaImagenes = listaImagenes;
    }

    public void obtenerImagenes(int iditem) throws SQLException, IOException {
        listaImagenes.clear();
        abrirConexion();
        sentencia = conexion.prepareStatement("select idimagen, nombre,iditem ,tipo from imagenes where iditem=?");
        sentencia.setInt(1, iditem);
        resultado = sentencia.executeQuery();
        while (resultado.next()) {
            Imagenes image = new Imagenes();
            image.setIdimagen(resultado.getInt(1));
            String ruta = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/");
            image.setNombre(resultado.getString(2));
            ruta += "images" + File.separator + image.getNombre();
            File img = new File(ruta);
            if (!img.exists()) {
                sentencia = conexion.prepareStatement("select archivo from imagenes where idimagen=?");
                sentencia.setInt(1, image.getIdimagen());
                ResultSet rs = sentencia.executeQuery();
                if (rs.next()) {
                    InputStream is = rs.getBinaryStream(1);
                    BufferedImage foto = ImageIO.read(is);
                    String extension = "";
                    switch (resultado.getString(4)) {
                        case "image/png":
                            extension = "png";
                            break;

                        case "image/jpg":
                            extension = "jpg";
                            break;

                        case "image/jpeg":
                            extension = "jpeg";
                            break;
                    }
                    ImageIO.write(foto, extension, img);
                    System.out.println(ruta);
                    System.out.println(extension);
                }
            }
            image.setIditem(resultado.getInt(3));
            listaImagenes.add(image);
        }
        cerrarConexion();
    }
    
    
    
    
    

    public int insertarImagenes(Items item, Connection conexion) throws SQLException, IOException {
        int res = 0;

        sentencia = conexion.prepareStatement("insert into imagenes values (default,?,?,?,?)");
        
        if(item.getImagenes()!=null)
        for (int i = 0; i < item.getImages().length; i++) {
            String nombre = item.getIditem() + "_" + (i + 1);
            switch (item.getImagenesContentType()[i]) {
                case "image/png":
                    nombre += ".png";
                    break;

                case "image/jpg":
                    nombre += ".jpg";
                    break;

                case "image/jpeg":
                    nombre += ".jpeg";
                    break;
            }
            sentencia.setString(1, nombre);
            sentencia.setString(2, item.getImagenesContentType()[i]);
            sentencia.setBinaryStream(3, item.getImages()[i], item.getLongitudByte()[i]);
            sentencia.setInt(4, item.getIditem());
            res = sentencia.executeUpdate();
        }
        
        return res;
    }

}
