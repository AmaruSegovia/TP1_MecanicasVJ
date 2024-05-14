class Pelota extends GameObject {
  private PImage sprite;
  private Vector vectorPelota;
  private Vector vectorPelotaDireccion;
  private PVector gravedad;
  private PVector velocidad;
  private PVector n; // Normal al plano de reflexión
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
    this.n = new PVector(1, -1); // Normalizamos la normal al plano
  }

  public void display() {
    imageMode(CENTER);
    image(sprite, posicion.x, posicion.y, ancho, alto);
    vectorUnitarioAbajo();
    vectorPelotaDireccion(dispensador.vectorDireccion);
  }

  public void vectorUnitarioAbajo() {
    this.vectorPelota = new Vector(this.getPosicion(), new PVector(0, 1));
    vectorPelota.display();
  }

  public void vectorPelotaDireccion(Vector vectorDireccion) {
    vectorPelotaDireccion.setOrigen(this.getPosicion());
    vectorPelotaDireccion.setDestino(PVector.sub(this.getPosicion(), dispensador.getPosicion()).normalize());
    vectorPelotaDireccion.display();
  }

  public void actualizar() {
    // Aumentar la magnitud de la gravedad exponencialmente
    gravedad.y += 0.01 * gravedad.mag(); // Aumento exponencial

    // Aplicar gravedad
    this.velocidad.add(gravedad);

    // Actualizar la posición del proyectil según su velocidad
    this.posicion.add(this.velocidad);

    // Calcular el producto punto entre la velocidad y la normal al plano de reflexión
    float producto_punto = PVector.dot(this.velocidad, this.n);

    // Si la pelota alcanza los límites de la pantalla, aplicar reflexión
    if (this.posicion.x > width - diameter/2 || this.posicion.x < diameter/2) {
      // Reflejar la velocidad horizontalmente
      this.velocidad.x -= 2 * producto_punto * this.n.x;
      // Limitar la velocidad máxima
      this.velocidad.x = constrain(this.velocidad.x, -maxSpeed, maxSpeed);
      // Ajustar la posición para evitar que quede atascada en el borde
      this.posicion.x = constrain(this.posicion.x, diameter/2, width - diameter/2);
    }
    if (this.posicion.y > height - diameter/2 || this.posicion.y < diameter/2) {
      // Reflejar la velocidad verticalmente
      this.velocidad.y -= 2 * producto_punto * this.n.y;
      // Limitar la velocidad máxima
      this.velocidad.y = constrain(this.velocidad.y, -maxSpeed, maxSpeed);
      // Ajustar la posición para evitar que quede atascada en el borde
      this.posicion.y = constrain(this.posicion.y, diameter/2, height - diameter/2);
    }
    
  }

  public PVector getVelocidad() {
    return this.velocidad;
  }

  public void setVelocidad(PVector velocidad) {
    this.velocidad = velocidad;
  }
}
