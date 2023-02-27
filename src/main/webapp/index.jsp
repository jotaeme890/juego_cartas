<%@page import="modelos.Carta"%>
<%@page import="modelos.Mazo"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Juego de Cartas</title>
    </head>

    <body>
        <% 
            // CREAMOS NADA MAS ABRIR EL MAZO Y LA CARTA
            Mazo mazo = new Mazo();
            Carta carta = mazo.extrae();
            // NO QUIERO TENER UNA SESION GUARDADA DE ANTES, POR SI ACASO
            if(!session.isNew()){
                session.removeAttribute("mazo");
            }
            // SE LO PASAREMOS A LA SIGUIENTE PAGINA
            session.setAttribute("mazo", mazo);
            session.setAttribute("carta1", carta);

            int enJuego;
        %>

        <div class="contenedorPrincipal">

            <div class="contenedorJuego">
                <div></div>

                <div>
                    <form method="POST" action="juego.jsp">
                        <div id="formulario">
                            <label for="nombre">Nombre: </label>
                            <input type="text" name="nombre" placeholder="Ingrese su nombre" required>
                            <label for="dinero">Dinero de apuesta: </label>
                            <input type="number" name="dinero" min="10" max="500" placeholder="0" required>
                            <input type="hidden" name="enjuego" value="0">
                            <input id="jugar" type="submit" value="JUGAR">
                        </div>                        
                    </form>
                </div>

                <div></div>
            </div>

            <div class="contenedorReglas">
                <p id="tituloReglas">SOBRE EL JUEGO:</p>
                <p class="textoReglas">
                    Bienvenido al clásico juego de mayor o menor, tendrás que intentar adivinar, si la siguiente carta es mayor, menor o igual a la que tienes. Si aciertas, recibirás 5 monedas, si no las perderás.
                    ¡SUERTE!
                </p>
            </div>
        </div>
    </body>

</html>
