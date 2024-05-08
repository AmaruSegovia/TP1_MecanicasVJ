class Jugador extends GameObject implements IVisualizable {
    private PImage sprite;

    public Jugador(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("jugador.png");
    }
  
    public void display() {
        imageMode(CENTER);
        image(sprite, posicion.x, posicion.y , ancho, alto);
    }
}
