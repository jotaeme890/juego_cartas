package modelos;

public class Carta implements Comparable<Carta>{
    public static final String[] palos={"Oros", "Copas", "Espadas", "Bastos"};
    public static final String[] numerosYFiguras={"Uno, Dos, Tres, Cuatro, Cinco, Seis, Siete, Sota, Caballo, Rey"};
    private int codigo;
    public Carta(int cod){
        this.codigo = cod;
    }

    int getCodigo(){
        return this.codigo;
    }

    String getPalo(){
        return Carta.palos[(int)(this.codigo/10)];
    }

    String getNumeroAsString(){
        return Carta.numerosYFiguras[(int)(this.codigo%10)];
    }

    int getNumeroAsInt(){
        return (int)(this.codigo%10);
    }

    @Override
    public int compareTo(Carta o) {
        int c1 = this.getNumeroAsInt();
        int c2 = o.getNumeroAsInt();
        // YA QUE LA CARTA 12 SI LA DIVIDIDES PARA COGER SU NUMERO DA 0
        if(c1 == 0){
            c1 = 10;
        }
        if(c2 == 0){
            c2 = 10;
        }

        if(c1 > c2){
            return 1;
        }else if(c1 < c2){
            return -1;
        } else{
            return 0;
        }
    }

    @Override
    public String toString(){
        return String.format("<div class=\"carta\"><img src=\"assets/image/%02d.png\"></div>", this.getCodigo());
    }
}
