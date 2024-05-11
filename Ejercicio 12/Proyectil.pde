class Proyectil extends GameObject {
    private PVector velocidad;
    private PImage sprite;

    public Proyectil(PVector posicionInicial, PVector velocidadInicial) {
        this.posicion = posicionInicial.copy();
        this.velocidad = velocidadInicial.copy();
        this.sprite = loadImage("proyectil.png");
    }

    public void actualizar() {
        // Actualiza la posición del proyectil según su velocidad
        this.posicion.add(this.velocidad);
    }

    public void display() {
        //ellipse(this.posicion.x, this.posicion.y, this.radio*2, this.radio*2);
        image(sprite,this.posicion.x , this.posicion.y,75,75);
    }

    public boolean fueraDePantalla() {
        // Verifica si el proyectil está fuera de la pantalla
        return (this.posicion.x < 0 || this.posicion.x > width || this.posicion.y < 0 || this.posicion.y > height);
    }
    public boolean colisionEnemigo() {
        // Verifica si el proyectil está fuera de la pantalla
        return this.posicion ==  enemigo.getPosicion();
    }

    public PVector getVelocidad() {
        return this.velocidad;
    }

    public void setVelocidad(PVector velocidad) {
        this.velocidad = velocidad;
    }
}
