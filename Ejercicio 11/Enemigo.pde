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
    enemigo.vectorEnemigoJugador(jugador);
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
    vectorEnemigoJugador.setDestino(PVector.sub(jugador.getPosicion(),enemigo.getPosicion()).normalize());
    vectorEnemigoJugador.display();
  }
  
  public void detectarJugador()
  {
    float dotProducto = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
    float anguloVectores = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
    
    println(dotProducto);
    textSize(20);
    fill(#ff6961);
    text("Producto Punto: "+ dotProducto,100,320);
    text("Angulo entre 2 Vectores: "+ anguloVectores,100,300);

    int angulo = 30;
    float anguloDeteccion = cos(radians(angulo));  //Radio de deteccion del enemigo
    
    int anguloGrados = round(degrees(acos(anguloVectores))); //Lo hago solo para mostrar por pantalla
    if(anguloGrados <= 30)
    {
        fill(#77dd77);
    }
    text("Rango de deteccion: " + angulo +"°",100,340);
    fill(#ff6961);
    text("Angulo: " + anguloGrados +"°",101,360);

    if (anguloVectores >= anguloDeteccion)
  {
    fill(#d53032);
    textSize(40);
    text("!  !  !",width/4-31,height/2-70);
    //Disparar Proyectil
    dispararProyectil(jugador, 5);
  }else
  {
    fill(#ffbd77);
    textSize(40);
    text(".  .  .",width/4-29,height/2-70);
  }
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
        
        println(tiempoUltimoDisparo);
    }
   }
   
   
   
}
