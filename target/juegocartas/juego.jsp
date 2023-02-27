<%@page import="modelos.Mazo"%>
<%@page import="modelos.Carta"%>
<!DOCTYPE html>
<html lang="en">
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
            int enJuego = Integer.parseInt(request.getParameter("enjuego"));

            // INICIALIZAMOS LOS VALORES
            String nombre ="";
            int monedero=0;
            Mazo mazo = null;
            Carta c1=null;
            int comp;
            // PARA SABER SI ES LA PRIMERA VEZ QUE ENTRA
            if(enJuego == 0){
                nombre = request.getParameter("nombre");
                enJuego = 1;
                monedero = Integer.parseInt(request.getParameter("dinero"));
                session.setAttribute("monedero",monedero);
                // mazo Y c1 CREADAS EN index.jsp CON CARTA QUE SALDRA EN PANTALLA Y EL MAZO DDE 40 CARTAS
                mazo = (Mazo)session.getAttribute("mazo");
                // ASI MOSTRAREMOS LA CARTA
                c1 = (Carta)session.getAttribute("carta1");
            } else{
                nombre= request.getParameter("nombre");
                c1 = (Carta)session.getAttribute("carta1");
                mazo = (Mazo)session.getAttribute("mazo");
                monedero = (int)session.getAttribute("monedero");
            }
            session.setAttribute("nombre",nombre);
        %>

        <h2 id="nombre"><% out.print(nombre + ", tienes " + monedero + " monedas");%></h2>
        <div class="centro full vertical">
            <div class="mesa centro horizontal">
                <p><%out.print(c1);%></p>
                <div class="carta"><img src="assets/image/reverso.png"></div>
            </div>

            <div class="centro horizontal ancho">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <div class="comparador">
                    <form method="POST" action="comparacion.jsp?&enjuego=1">
                        <button type="submit" value="-1" name="comp">Menor</button>
                        <button type="submit" value="1" name="comp">Mayor</button>
                        <button type="submit" value="0" name="comp">Igual</button>
                    </form>
                </div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </body>
</html>