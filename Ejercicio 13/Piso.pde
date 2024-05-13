class Piso extends GameObject {
    private PImage sprite;

    public Piso(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("piso.png");
    }
  
    public void display() {
        imageMode(CENTER);
        image(sprite, posicion.x, posicion.y , ancho, alto);
    }
}
