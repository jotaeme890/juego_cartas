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
            String nombre = (String)session.getAttribute("nombre");
            System.out.print(nombre);

            int comp = Integer.parseInt(request.getParameter("comp"));
            // COGEMOS EL MAZO
            Mazo mazo = (Mazo)session.getAttribute("mazo");
            // COGEMOS LAS CARTAS QUE NOS PASAN DE juego.jsp
            Carta c1 = (Carta)session.getAttribute("carta1");
            Carta c2 = null;
            // PARA DAR EL MENSAJE QUE SE DARA EN LA VENTANA
            String mensaje = "";
            // PARA COMPROBAR SI EL MAZO ESTA VACIO
            boolean mazoVacio = true;
            if(mazo.tamano() != 0){
                c2 = mazo.extrae();
            } else{
                mazoVacio = false;
                mensaje = "<h2 id='nombre'> TE HAS QUEDADO SIN CARTAS </h2>";
            }
            
            Boolean esCero = true;
            // COGEMOS EL MONEDERO
            int monedero = (int)session.getAttribute("monedero");
            if(monedero == 0){
                esCero = false;
                mensaje = "<h2 id='nombre'> TE HAS QUEDADO SIN MONEDAS </h2>";
            }
            // COMPROBAMOS SI HA ACERTADO O NO
            if(mazoVacio){
                if(c2.compareTo(c1) == comp && esCero){
                    // SE LE AÑADEN 5 MONEDAS
                    monedero += 5;
                    mensaje = "<h2 id='nombre'> ENHORABUENA, HAS GANADO 5 MONEDAS </h2>";
                } else if (c2.compareTo(c1) != comp && esCero){
                    // PIERDE 5 MONEDAS
                    monedero -= 5;
                    mensaje = "<h2 id='nombre'> LO SIENTO, HAS PERDIDO 5 MONEDAS</h2>";
                }
            }
            out.print(mensaje);
            // PARA PODER PASAR DESPUES EL MONEDERO MOD
            session.setAttribute("monedero",monedero);
        %>

        <div class="centro full vertical">
            <div class="mesa centro horizontal">
                <p><%out.print(c1);%></p>
                <% if(mazoVacio){%>
                    <p><%out.print(c2);%></p>
                <%}%>
            </div>

            <div class="centro horizontal ancho">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <%
                // LA CARTA A COMPARAR SER LA SIGUIENTE EN SER COMPARADA
                c1 = c2;
                session.setAttribute("carta1", c1);
                %>
                <div class="comparador">
                    <div class="fila">
                        <%
                        // SI TIENE 0 MONEDAS O HA GASTADO TODA LA BARAJA, NO PUEDE VOLVER A JUGAR
                        if(esCero && mazoVacio){
                        %>
                            <form method="POST" action="juego.jsp?enjuego=1&nombre=<%=nombre%>">
                                <button type="submit">Seguir</button>
                            </form>
                        <%}%>
                        <div></div>
                        <div></div>
                        <form method="POST" action="index.jsp">
                            <button type="submit">Salir</button>
                        </form>
                    </div>
                </div>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </body>
</html>