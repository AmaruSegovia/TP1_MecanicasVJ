class Tanque extends GameObject {
    private PImage cuerpoTanque;
    private PImage cabezaTanque;
    private Vector vectorTanque;
    private Vector vectorTanqueObjetivo;
    
    private ArrayList<Proyectil> listaProyectiles;
    private float tiempoUltimoDisparo; 
    private float intervaloDisparo = 700; 
    private float  magnitud;

    public Tanque(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.cuerpoTanque = loadImage("cuerpotanque.png");
        this.cabezaTanque = loadImage("cabezatanque.png");
        this.vectorTanque = new Vector();
        this.vectorTanqueObjetivo =  new Vector();
        this.listaProyectiles = new ArrayList<Proyectil>();
    }
    public Tanque()
    {}
  
    public void display() {
        imageMode(CENTER);
        image(cuerpoTanque, posicion.x, posicion.y , ancho, alto);

        vectorUnitarioArriba();
        vectorTanqueObjetivo(enemigo);
        detectarObjetivo();
    }
    public void vectorUnitarioArriba()
    {
     this.vectorTanque = new Vector(tanque.getPosicion(), new PVector(0,-1));
     vectorTanque.display();
    }
    
    public void vectorTanqueObjetivo(GameObject objetivo)
    {
    vectorTanqueObjetivo.setOrigen(tanque.getPosicion());
    vectorTanqueObjetivo.setDestino(PVector.sub(objetivo.getPosicion(),tanque.getPosicion()));
    vectorTanqueObjetivo.display();
    }
    
    public void detectarObjetivo()
  {
     magnitud = this.vectorTanqueObjetivo.getDestino().mag();
    
    if (magnitud <= 300)
    {
    rotarTanque();
    dispararProyectil(6);
    fill(#549D83);
    textSize(30);
    text("Magnitud: "+ magnitud,50,100);
    text("¡Enemigo detectado!",50,140);
    }
    else
    {
    image(cabezaTanque, posicion.x, posicion.y , this.cabezaTanque.width/2, this.cabezaTanque.width/2);
    fill(#BF352E);
    textSize(30);
    text("Magnitud: "+ magnitud,50,100);
    }
    
  }
  
  public void rotarTanque()
  {
    float angulo = PVector.angleBetween(this.vectorTanque.getDestino(),this.vectorTanqueObjetivo.getDestino());
    PVector ejeRotacion = this.vectorTanque.getDestino().cross(this.vectorTanqueObjetivo.getDestino());
    int sentidoHorario = 1;
    if (ejeRotacion.z <0)
    {
      sentidoHorario = -1;
    }
    
    pushMatrix();
    imageMode(CENTER);
    translate(tanque.getPosicion().x,tanque.getPosicion().y);
    rotate(angulo*sentidoHorario);
    image(this.cabezaTanque,0,0,this.cabezaTanque.width/2,this.cabezaTanque.height/2);
    popMatrix();
  }
  
   public void dispararProyectil( float velocidadProyectil) {
     
        float tiempoActual = millis(); // Obtiene el tiempo actual en milisegundos
        if (tiempoActual - tiempoUltimoDisparo > intervaloDisparo) {  
        PVector direccion = vectorTanqueObjetivo.getDestino().normalize();// Multiplica la dirección por la velocidad del proyectil para obtener el vector de velocidad
        direccion.mult(velocidadProyectil); // Multiplica la dirección por la velocidad del proyectil para obtener el vector de velocidad
        Proyectil proyectil = new Proyectil(tanque.getPosicion(), direccion); // Crea un nuevo proyectil en la posición del enemigo con la velocidad calculada
        listaProyectiles.add(proyectil); // Agrega el proyectil a la lista de proyectiles
        tiempoUltimoDisparo = tiempoActual;// Actualiza el tiempo del último disparo
    }
   }
}
