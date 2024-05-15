<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

        <title>IceCream</title>
    </head>
    <body>
        <style>
            * {
                background-image: url(vistas/1.png);
                background-repeat: no-repeat;
                background-size: cover;
                background-attachment: fixed;
            }

            .btn {
                color: black;
            }

            h5 {
                text-align: center;
            }

            .IngreseD {
                color: black;
            }

            label {
                color: black;
            }

            button {
                text-align: center;
            }
        </style>

        <br>
        <h5>Bienvenido al sistema de ventas de IceCream</h5><br>
        <div class="container center-block">
            <div class="row justify-content-center">
                <div class="card" style="width: 18rem;">
                    <img src="vistas/logo.png" alt=""/>
                    <div class="card-body">
                        <form action="Validar" method="POST">
                            <div class="form-group">
                                <label>Correo electrónico</label>
                                <input type="text" class="form-control" name="txtuser">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Contraseña</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="txtpass">
                            </div>
                            <div class="form-group form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <small class="form-text text-muted">Acepto terminos y condiciones</small>
                            </div>
                            <div class = "text-center">
                                <input type="submit" class="btn btn-dark btn-block" name="accion" value ="Ingresar">
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>
    </body>
</html>