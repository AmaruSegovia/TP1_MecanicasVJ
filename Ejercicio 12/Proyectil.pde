class Proyectil extends GameObject {
    private PVector velocidad;
    private PImage sprite;
    private PImage explosion;
    private float distancia;

    public Proyectil(PVector posicionInicial, PVector velocidadInicial) {
        this.posicion = posicionInicial.copy();
        this.velocidad = velocidadInicial.copy();
        this.sprite = loadImage("bomb.png");
        this.explosion = loadImage("explosion.png");
    }

    public void actualizar() {
        // Actualiza la posición del proyectil según su velocidad
        this.posicion.add(this.velocidad);
    }

    public void display() {
        if(distancia < 30){
        image(explosion,this.posicion.x , this.posicion.y,80,80);
        }else{
        image(sprite,this.posicion.x , this.posicion.y,55,55);
        }
    }

    public boolean colisionEnemigo() {
    distancia = this.posicion.dist(enemigo.getPosicion());
    return distancia < 3; 
  }

    public PVector getVelocidad() {
        return this.velocidad;
    }

    public void setVelocidad(PVector velocidad) {
        this.velocidad = velocidad;
    }
}
