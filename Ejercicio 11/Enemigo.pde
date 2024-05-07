class Enemigo extends GameObject implements IVisualizable
{
  private PImage sprite;
  private Vector vectorEnemigo;
  private Vector vectorEnemigoJugador;
  
  public Enemigo() {}

  /** Constructor parametrizado */
  public Enemigo(PVector posicion, int ancho, int alto)
  {
    this.posicion = posicion;
    this.ancho=ancho;
    this.alto=alto;
    this.sprite = loadImage("batidora.png");
    this.vectorEnemigoJugador =  new Vector();
  }
  
  public void display()
  {
    image(sprite, enemigo.getPosicion().x - sprite.width/4, enemigo.getPosicion().y - sprite.height/4,ancho+80,alto+80);
    
    vectorUnitarioDerecha();
    this.vectorEnemigo.display();
    detectarJugador();
  }
  
  public void vectorUnitarioDerecha()
  {
     this.vectorEnemigo = new Vector(enemigo.getPosicion(), new PVector(1,0));
  }
  public void vectorUnitarioIzquierda()
  {
     this.vectorEnemigo = new Vector(enemigo.getPosicion(), new PVector(-1,0));
  }
  
  public void vectorEnemigoJugador(GameObject jugador)
  {
    vectorEnemigoJugador.setOrigen(enemigo.getPosicion());
    vectorEnemigoJugador.setDestino(new PVector(1,0));
    vectorEnemigoJugador.setDestino(PVector.sub(jugador.getPosicion(),enemigo.getPosicion()).normalize());
    vectorEnemigoJugador.display();
  }
  
  public void detectarJugador()
  {
    float dotProducto = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
    println(dotProducto);
    textSize(20);
    fill(#ff6961);
    text("Resultado producto punto: "+ dotProducto,100,30);

    float anguloDeteccion = cos(radians(170));
    
    float anguloEntreVectores = round(anguloEntreVectores(vectorEnemigo,vectorEnemigoJugador));

    String anguloFormateado = nf(anguloEntreVectores); //Lo formateo con entero para que quede bonito
    text("Angulo: " + anguloFormateado +"°",80,170);
    
    if (dotProducto > anguloDeteccion)
  {
    fill(#ff6961);
    text("Detectado",100,50);
    //Proyectil
    dispararProyectil();
  }else
  {
    text("No detectado",100,50);
  }
  }
  
  private float anguloEntreVectores(Vector vector1, Vector vector2) {
  // Calcula el producto punto entre los dos vectores
  float productoPunto = PVector.dot(vector1.getDestino(), vector2.getDestino());
  
  // Calcula las magnitudes de los vectores
  float magnitudVector1 = vector1.getDestino().mag();
  float magnitudVector2 = vector2.getDestino().mag();
  
  // Calcula el coseno del ángulo entre los vectores
  float cosenoAngulo = productoPunto / (magnitudVector1 * magnitudVector2);
  
  // Aplica la función arcocoseno para obtener el ángulo en radianes
  float anguloRadianes = acos(cosenoAngulo);
  
  // Convierte el ángulo a grados si es necesario
  float anguloGrados = degrees(anguloRadianes);
  
  return anguloGrados;
  }
  
  private void dispararProyectil() {
        // Calcular la dirección hacia el jugador en el momento del disparo
        PVector direccionJugador = PVector.sub(jugador.getPosicion(), enemigo.getPosicion()).normalize();
        // Crear un nuevo proyectil y agregarlo a la lista de proyectiles
        Proyectil proyectil = new Proyectil(enemigo.getPosicion(), direccionJugador, 100, 100); // Ajusta el tamaño del proyectil según sea necesario
        //proyectil.display();
        proyectil.mover();
  }
}
