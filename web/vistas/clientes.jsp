<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import="com.modelo.Cliente" %>
<%@page import="com.modelo.ClienteDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clientes</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.min.css" />
    </head>
    <body>
        <%
            ClienteDAO clienteDAO = new ClienteDAO();
        %>

        <!-- Este div container-fluid envuelve la barra de menú y la tabla de DataTable -->
        <div class="container-fluid navbar-light bg-light">
            <%@include file="/template/menu.jsp"%>
            <hr>
            <div class="row align-items-start">
                <div class="col-9"><h1>Gestión de Clientes</h1></div>
                <div class="col-3 align-self-center">
                    <div class="d-grid gap-2">
                        <button type="button" class="btn btn-success btnAdd" data-bs-toggle="modal" data-bs-target="#exampleModal">Agregar</button>
                    </div>
                </div>
            </div>

            <hr>
            <div class="table-responsive">
                <table class="table table-striped" id="mydataTable">
                    <thead>
                    <th>Id</th>
                    <th>Cédula</th>
                    <th>Nombre</th>
                    <th>Número de Teléfono</th>
                    <th>Dirección</th>
                    <th>Razón</th>
                    <th>Acciones</th>
                    </thead>
                    <tbody>
                        <% ArrayList<Cliente> listaCliente = clienteDAO.mostrarClientes();
                for (Cliente elem : listaCliente) { %>
                        <tr>
                            <td class="id"><%= elem.getId() %></td>
                            <td class="dni"><%= elem.getDni() %></td>
                            <td class="nombre"><%= elem.getNombre() %></td>
                            <td class="telefono"><%= elem.getTelefono() %></td>
                            <td class="direccion"><%= elem.getDireccion()%></td>
                            <td class="razon"><%= elem.getRazon() %></td>
                            <td>
                                <button type="button" class="btn btn-dark btnEditar" data-bs-toggle="modal" data-bs-target="#exampleModal">Editar</button>
                                <button type="button" class="btn btn-danger btnEliminar" data-bs-toggle="modal" data-bs-target="#exampleModal">Eliminar</button>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>


        <!-- Button trigger modal -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Datos Cliente</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="${pageContext.servletContext.contextPath}/ClienteServlet" method="POST" role="form">
                            <div class="row">
                                <div class="col-6">
                                    <label>Id</label>
                                    <input type="number" name="txtId" class="form-control" id="txtId" value="1" readonly="true">
                                </div>
                                <div class="col-6">
                                    <label>Nombre</label>
                                    <input type="text" name="txtNombre" class="form-control" id="txtNombre">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Cédula</label>
                                    <input type="number" min="17" name="txtDni" class="form-control" id="txtDni">
                                </div>
                                <div class="col-6">
                                    <label>Teléfono</label>
                                    <input type="tel" min="17" name="txtTelefono" class="form-control" id="txtTelefono">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <label>Dirección</label>
                                    <input type="text" min="50" name="txtDireccion" class="form-control" id="txtDireccion">
                                </div>
                                <div class="col-6">
                                    <label>Razón</label>
                                    <input type="text" min="50" name="txtRazon" class="form-control" id="txtRazon">
                                </div>
                            </div><br>
                            <div class="row">
                                <div class="col-12">
                                    <button type="submit" name="btnGuardar" class="btn btn-success btnOcultar1">Guardar</button>
                                    <button type="submit" name="btnEditar" class="btn btn-dark btnOcultar">Editar</button>
                                    <button type="submit" name="btnEliminar" class="btn btn-danger btnOcultar">Eliminar</button>
                                    <button type="button" class="btn btn-info" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js" ></script>
        <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js" ></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.4.38/sweetalert2.all.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
        <%
        if (request.getAttribute("message") != null) {
        %>
        <script>
            $(document).ready(function () {
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: '<%= request.getAttribute("message") %>',
                    showConfirmButton: false,
                    timer: 3000
                });
            });
        </script>
        <%
        }
        %>
        <script>
            $(document).ready(function () {
                // Destruir la instancia existente de DataTable, si existe
                if ($.fn.DataTable.isDataTable('#mydataTable')) {
                    $('#mydataTable').DataTable().destroy();
                }
                // Inicializar DataTable con las opciones necesarias, cambiar el idioma de la tabla 
                $('#mydataTable').DataTable({
                    language: {
                        search: "Buscar clientes:",
                        paginate: {
                            first: "Primero",
                            last: "Último",
                            next: "Siguiente",
                            previous: "Anterior"
                        },
                        info: "Mostrando la página _PAGE_ de _PAGES_",
                        infoFiltered: "(filtrado de _MAX_ registros totales)",
                        lengthMenu: "Mostrar _MENU_ registros por página"
                    }
                });
            });

        </script>
        <script src="${pageContext.servletContext.contextPath}/js/cliente.js"></script>

    </body>
</html>
