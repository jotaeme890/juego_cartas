package modelos;
import java.util.ArrayList;
import java.util.Collections;
public class Mazo {
    private ArrayList<Carta> mazo;
    public Mazo(){
        this.init();
        this.barajar();
    }
    // PARA AÑADIR 40 CARTAS A LA BARAJA
    private void init(){
        mazo = new ArrayList<Carta>();
        for(int i = 1; i <= 40;i++)
            mazo.add(new Carta(i));
    }
    // PARA BARAJAR EL MAZO
    public void barajar(){
        Collections.shuffle(mazo);
    }
    // ASI COGEMOS 1 CARTA Y LA ELIMINAREMOS DE LA COLECCION
    public Carta extrae(){
        return mazo.remove(0);
    }

    public int tamano(){
        return this.mazo.size();
    }
}
