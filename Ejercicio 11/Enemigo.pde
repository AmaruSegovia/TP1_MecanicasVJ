class Enemigo extends GameObject implements IVisualizable
{
  private PImage sprite;
  private Vector vectorEnemigo;
  private Vector vectorEnemigoJugador;
  private ArrayList<Proyectil> listaProyectiles;
  private float tiempoUltimoDisparo; 
  private float intervaloDisparo = 600; 
   
  public Enemigo() {}


  public Enemigo(PVector posicion, int ancho, int alto)
  {
    this.posicion = posicion;
    this.ancho=ancho;
    this.alto=alto;
    this.sprite = loadImage("enemigo.png");
    this.vectorEnemigoJugador =  new Vector();
    this.listaProyectiles = new ArrayList<Proyectil>();
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
    text("Producto Punto: "+ dotProducto,100,50);

    float anguloDeteccion = cos(radians(30));
    //float anguloFake = degrees(PVector.angleBetween(vectorEnemigo.getDestino(),vectorEnemigoJugador.getDestino()));
    
    float anguloEntreVectores = round(anguloEntreVectores(vectorEnemigo,vectorEnemigoJugador));

    String anguloFormateado = nf(anguloEntreVectores); //Lo formateo con entero para que quede bonito
    text("Angulo: " + anguloFormateado +"°",101,90);
    fill(#77dd77);
    text("Rango de deteccion <= 30°",100,70);
    
    if (dotProducto > anguloDeteccion)
  {
    fill(#d53032);
    textSize(30);
    text("!  !  !",width/4-21,height/2-70);
    //Disparar Proyectil
    dispararProyectil(jugador, 5);
  }else
  {
    fill(#ffbd77);
    textSize(30);
    text(".  .  .",width/4-20,height/2-70);
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
  
   public void dispararProyectil(Jugador jugador, float velocidadProyectil) {
     
        float tiempoActual = millis(); // Obtiene el tiempo actual en milisegundos

    // Verifica si ha pasado suficiente tiempo desde el último disparo
    if (tiempoActual - tiempoUltimoDisparo > intervaloDisparo) {
        // Calcula el vector que apunta desde el enemigo hacia el jugador
        PVector direccion = PVector.sub(new PVector(jugador.getPosicion().x,jugador.getPosicion().y-50), this.posicion);
        direccion.normalize(); // Normaliza el vector para obtener una dirección

        // Multiplica la dirección por la velocidad del proyectil para obtener el vector de velocidad
        direccion.mult(velocidadProyectil);

        // Crea un nuevo proyectil en la posición del enemigo con la velocidad calculada
        Proyectil proyectil = new Proyectil(enemigo.getPosicion(), direccion);

        // Agrega el proyectil a la lista de proyectiles
        listaProyectiles.add(proyectil);

        // Actualiza el tiempo del último disparo
        tiempoUltimoDisparo = tiempoActual;
    }
   }
   
   
   
}
