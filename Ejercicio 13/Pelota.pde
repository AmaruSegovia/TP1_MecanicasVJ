class Pelota extends GameObject {
  private PImage sprite;
  private Vector vectorPelota;
  private Vector vectorPelotaDireccion;
  private PVector gravedad;
  private PVector velocidad;

  private float diameter = 40; // Diámetro de la pelota
  private float maxSpeed = 10; // Velocidad máxima permitida

  public Pelota(PVector posicion, int ancho, int alto, PVector velocidad) {
    this.velocidad = velocidad;
    this.posicion = posicion;
    this.ancho = ancho;
    this.alto = alto;
    this.sprite = loadImage("pelota.png");
    this.vectorPelota = new Vector();
    this.vectorPelotaDireccion = new Vector();
    this.gravedad = new PVector(0, 0.1);
  }

  public void display() {
    imageMode(CENTER);
    image(sprite, posicion.x, posicion.y, ancho, alto);
    vectorUnitario();
    vectorPelotaDireccion();
  }

  public void vectorUnitario() {
    this.vectorPelota = new Vector(this.getPosicion(), new PVector(0, -1));
    vectorPelota.display();
  }

  public void vectorPelotaDireccion() {
    vectorPelotaDireccion.setOrigen(this.getPosicion());
    vectorPelotaDireccion.setDestino(PVector.sub(this.getPosicion(), dispensador.vectorDireccion.getDestino().copy().normalize()).normalize());
    vectorPelotaDireccion.display();
  }

  public void actualizar() {
    
    this.posicion.add(this.velocidad);
    
    float producto_punto =  2*PVector.dot(this.getVelocidad(),this.vectorPelota.getDestino());
    PVector punto = PVector.mult(this.vectorPelota.getDestino(),producto_punto);
    
    this.vectorPelotaDireccion.setDestino(PVector.sub(velocidad,punto).normalize());
    
    println(this.vectorPelota.getDestino());
    
    // Si la pelota alcanza los límites, aplicar reflexión
    if (this.posicion.x > width - diameter/2 || this.posicion.x < diameter/2) {
      // Reflejamos la velocidad horizontalmente
      this.velocidad.x -= 2 * producto_punto - vectorPelota.getDestino().x;
      // Limitamos la velocidad máxima
      this.velocidad.x = constrain(this.velocidad.x, -maxSpeed, maxSpeed);
      // Para que no se atasque :D
      this.posicion.x = constrain(this.posicion.x, diameter/2, width - diameter/2);
      
          this.vectorPelotaDireccion.setDestino(PVector.sub(velocidad,punto).normalize());
      
    }
    if (this.posicion.y > height - diameter/2 || this.posicion.y < diameter/2) {
      // Reflejamos la velocidad verticalmente
      this.velocidad.y -= 2 * producto_punto - vectorPelota.getDestino().y;
      // Limitamos la velocidad máxima
      this.velocidad.y = constrain(this.velocidad.y, -maxSpeed, maxSpeed);
      // Para que no se atasque :D
      this.posicion.y = constrain(this.posicion.y, diameter/2, height - diameter/2);
      
          this.vectorPelotaDireccion.setDestino(PVector.sub(velocidad,punto));
    }
    
  }

  public PVector getVelocidad() {
    return this.velocidad;
  }

  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
