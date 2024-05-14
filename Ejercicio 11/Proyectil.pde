class Proyectil extends GameObject implements IVisualizable {
    private PVector velocidad;
    private PImage sprite;

    public Proyectil(PVector posicionInicial, PVector velocidadInicial) {
        this.posicion = posicionInicial.copy();
        this.velocidad = velocidadInicial.copy();
        this.sprite = loadImage("proyectil.png");
    }


    public void display() {
        
        image(sprite,this.posicion.x , this.posicion.y,75,75);
    }
    
        public void actualizar() {
        // Actualiza la posición del proyectil según su velocidad
        this.posicion.add(this.velocidad);
    }

    public boolean colisionJugador() {
    float distancia = this.posicion.dist(jugador.getPosicion());
    return distancia < 50; 
  }

    public boolean colisionPantalla() {
        // Verifica si el proyectil está fuera de la pantalla
        return (this.posicion.x < 0 || this.posicion.x > width || this.posicion.y < 0 || this.posicion.y > height);
    }

    public PVector getVelocidad() {
        return this.velocidad;
    }

    public void setVelocidad(PVector velocidad) {
        this.velocidad = velocidad;
    }
}
