class Proyectil extends GameObject implements IVisualizable, IMovable {
    private PVector direccion;
    private float velocidad;
    private PImage sprite;
    
    public Proyectil() {}
      
    public Proyectil(PVector posicion, PVector direccion, int ancho, int alto) {
        this.posicion = posicion;
        this.direccion = direccion;
        this.velocidad = 8; // Ajusta la velocidad según sea necesario
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("proyectil.png");
    }

    public void display() {
        image(sprite, posicion.x, posicion.y, ancho, alto);
    }
    
    public void mover() {
        println("Moviendo proyectil");
        println("Posicion: "+this.posicion);
        println("Direccion: "+this.direccion);

        this.posicion.add(PVector.mult(this.direccion, this.velocidad));
    }
}
