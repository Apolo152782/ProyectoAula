package com.controlador;

import com.modelo.Cliente;
import com.modelo.ClienteDAO;
import com.modelo.Productos;
import com.modelo.ProductosDAO;
import com.modelo.Venta;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;


@WebServlet(name = "VentaServlet", urlPatterns = {"/VentaServlet"})
public class VentaServlet extends HttpServlet {
    
    Cliente c = new Cliente();
    ClienteDAO cdao = new ClienteDAO();
    Productos p = new Productos();
    ProductosDAO pdao = new ProductosDAO();
   
    Venta v  = new Venta();
    List<Venta>Lista=new ArrayList<>();
    
    
    int item;
    int cod;
    String descripcion;
    double precio;
    int cant;
    double subtotal;
    double totalpagar;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion =request.getParameter("accion");
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            
            switch (accion) {
                case "BuscarCliente":
                    String dni = request.getParameter("codigoCliente");
                    c.setDni(0);
                    c =cdao.buscar(dni);
                    request.setAttribute("c", c);
                    break;
                case "BuscarProducto":   
                    String codigo =request.getParameter("codigoproducto");
                    p=pdao.ListarCodigo(codigo);
                    request.setAttribute("producto", p);
                    request.setAttribute("lista", Lista);

                    break;
                case"Agregar" :
                    totalpagar = 0.0;
                    item = item+1;
                    cod=p.getCodigo();
                    descripcion=request.getParameter("nombreproducto");
                    precio=Double.parseDouble(request.getParameter("precio"));
                    cant=Integer.parseInt(request.getParameter("cantidad"));
                    subtotal=precio*cant;
                    v=new Venta();
                    v.setItem(item);
                    v.setCodproducto(cod);
                    v.setDescripcionP(descripcion);
                    v.setPrecio(precio);
                    v.setCantidad(cant);
                    v.setSubtotal(subtotal);
                    Lista.add(v);
                    
                    for (int i = 0; i < Lista.size(); i++) {
                        totalpagar=totalpagar+Lista.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("lista", Lista);
                    
                    break;
                    
                default:
                    request.getRequestDispatcher("/vistas/RegistrarVentas.jsp").forward(request, response);
            }
            
            request.getRequestDispatcher("/vistas/RegistrarVentas.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error " + e.getLocalizedMessage());
        }
    }

      
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
