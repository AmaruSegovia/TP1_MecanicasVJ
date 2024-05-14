class Jugador extends GameObject implements IVisualizable {
    private PImage sprite;
    private PImage spriteQuemado;

    public Jugador(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("jugador.png");
        this.spriteQuemado = loadImage("jugadorQuemado.png");
    }
  
    public void display() {
        imageMode(CENTER);
        image(sprite, posicion.x, posicion.y , ancho, alto);
    }
    
    public void displayQuemado()
    {
     imageMode(CENTER);
     image(spriteQuemado, posicion.x, posicion.y , ancho, alto);
    }
}
