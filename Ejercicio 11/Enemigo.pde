class Enemigo extends GameObject implements IVisualizable
{
  private PImage sprite;
  private Vector vectorEnemigo;
  private Vector vectorEnemigoJugador;
  private ArrayList<Proyectil> listaProyectiles;
  private float tiempoUltimoDisparo; 
  private float intervaloDisparo = 600; 
  private float amplitudMovimiento = 15; // Amplitud del movimiento vertical
  private float velocidadMovimiento = 0.002; // Velocidad del movimiento vertical
  private float tiempoInicioMovimiento; // Tiempo de inicio del movimiento vertical
  private float desplazamientoVertical;
  private int anguloGrados;
  public Enemigo() {}


  public Enemigo(PVector posicion, int ancho, int alto)
  {
    this.posicion = posicion;
    this.ancho=ancho;
    this.alto=alto;
    this.sprite = loadImage("enemigo.png");
    this.vectorEnemigo = new Vector();
    this.vectorEnemigoJugador =  new Vector();
    this.listaProyectiles = new ArrayList<Proyectil>();
  }
  
  public void display()
  {
    float tiempoTranscurrido = millis() - tiempoInicioMovimiento;
    desplazamientoVertical = amplitudMovimiento * sin(velocidadMovimiento * tiempoTranscurrido);

    imageMode(CENTER);
    image(sprite, enemigo.getPosicion().x, enemigo.getPosicion().y + desplazamientoVertical,ancho,alto);
    vectorUnitarioDerecha();
    this.vectorEnemigo.display();
    detectarJugador(jugador);
  }
  
  
  public void vectorUnitarioDerecha()
  {
     this.vectorEnemigo = new Vector(enemigo.getPosicion(), new PVector(1,0));
  }
  
  
  public void vectorEnemigoJugador(GameObject jugador)
  {
    vectorEnemigoJugador.setOrigen(enemigo.getPosicion());
    vectorEnemigoJugador.setDestino(PVector.sub(jugador.getPosicion(),enemigo.getPosicion()).normalize());
    vectorEnemigoJugador.display();
  }
  
  public void detectarJugador(GameObject jugador)
  {
    vectorEnemigoJugador(jugador);
    
    float dotProducto = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
    float anguloVectores = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
    
    println(dotProducto);
    textSize(20);
    fill(#ff6961);
    text("Angulo entre 2 Vectores: "+ anguloVectores,50,200);
    text("Producto Punto: "+ dotProducto,50,230);
    
    int angulo = 30;
    float anguloDeteccion = cos(radians(angulo));  //Radio de deteccion del enemigo
     anguloGrados = round(degrees(acos(anguloVectores))); //Lo hago solo para mostrar por pantalla
    
    if(dotProducto >= anguloDeteccion)
    {
        fill(#77dd77);
    }
    text("Rango de deteccion: " + angulo +"°",50,260);
    fill(#ff6961);
    text("Angulo: " + anguloGrados +"°",51,290);

    if (anguloVectores >= anguloDeteccion)
  {
    fill(#d53032);
    textSize(40);
    text(" ! ! ! ",enemigo.getPosicion().x-31,enemigo.getPosicion().y-40+desplazamientoVertical);
    //Disparar Proyectil
    dispararProyectil(6);
  }else
  {
    fill(#ffbd77);
    textSize(40);
    text(". . .",enemigo.getPosicion().x-21,enemigo.getPosicion().y-40+desplazamientoVertical);
  }
  }
  
   public void dispararProyectil( float velocidadProyectil) {
     
        float tiempoActual = millis(); // Obtiene el tiempo actual en milisegundos
        if (tiempoActual - tiempoUltimoDisparo > intervaloDisparo) {  
          //
        PVector direccion = new PVector(vectorEnemigoJugador.getDestino().x, vectorEnemigoJugador.getDestino().y);// Multiplica la dirección por la velocidad del proyectil para obtener el vector de velocidad
        direccion.mult(velocidadProyectil); // Multiplica la dirección por la velocidad del proyectil para obtener el vector de velocidad
        Proyectil proyectil = new Proyectil(enemigo.getPosicion(), direccion); // Crea un nuevo proyectil en la posición del enemigo con la velocidad calculada
        listaProyectiles.add(proyectil); // Agrega el proyectil a la lista de proyectiles
        tiempoUltimoDisparo = tiempoActual;// Actualiza el tiempo del último disparo
        println(tiempoUltimoDisparo);
    }
   }
   
   
   
}
