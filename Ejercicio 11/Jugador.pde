class Jugador extends GameObject implements IVisualizable {
    private PImage sprite;

    public Jugador(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("jugador.png");
    }
  
    public void display() {
        image(sprite, posicion.x - sprite.width/4, posicion.y - sprite.height/4, ancho+80, alto+80);
    }
}
