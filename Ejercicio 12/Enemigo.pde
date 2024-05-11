class Enemigo extends GameObject {
    private PImage casa;
    private PImage casaDestruida;
    int destruirCasa;

    public Enemigo(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.casa = loadImage("casa.png");
        this.casaDestruida = loadImage("casadestruida.png");
    }

    public void display() {
        if (destruirCasa < 600) {
            imageMode(CENTER);
            image(casa, posicion.x, posicion.y, ancho, alto);
        } else {
            imageMode(CENTER);
            image(casaDestruida, posicion.x, posicion.y, ancho, alto); 
        }
    }

    public void aumentarContador() {
        destruirCasa++;
        println(destruirCasa);
    }
}
