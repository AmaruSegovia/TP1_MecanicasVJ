class Pelota extends GameObject {
    private PImage sprite;
    private Vector vectorPelota;
    private Vector vectorPelotaDireccion;
    
    private PVector velocidad;

    public Pelota(PVector posicion, int ancho, int alto,PVector velocidad) {
        this.velocidad = velocidad;
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.sprite = loadImage("pelota.png");
        this.vectorPelota = new Vector();
        this.vectorPelotaDireccion = new Vector();
    }
  
    public void display() {
        imageMode(CENTER);
        image(sprite, posicion.x, posicion.y , ancho, alto);
       vectorUnitarioAbajo();
       vectorPelotaDireccion(dispensador.vectorDireccion);
       //productoPunto();
    }
    
    public void vectorUnitarioAbajo()
  {
     this.vectorPelota = new Vector(this.getPosicion(), new PVector(0,1));
     vectorPelota.display();
  }
  
  public void vectorPelotaDireccion(Vector vectorDireccion)
  {
    vectorPelotaDireccion.setOrigen(this.getPosicion());
    vectorPelotaDireccion.setDestino(PVector.sub(this.getPosicion(),dispensador.getPosicion()).normalize());
    vectorPelotaDireccion.display();
  }
  
  public void cambiarDireccionVector()
  {
      //vectorPelotaDireccion.setDestino(PVector.sub(this.getPosicion(),new PVector(-dispensador.getPosicion().x,-dispensador.getPosicion().y)).normalize());
      this.velocidad = new PVector(-this.velocidad.x,-this.velocidad.y );
  }
  
  public void productoPunto()
  {
    float dotProducto = vectorPelota.obtenerProductoPunto(vectorPelotaDireccion);
    float anguloVectores = vectorPelota.obtenerProductoPunto(vectorPelotaDireccion);
    
    println(dotProducto);
    textSize(20);
    fill(#ff6961);
    text("Angulo entre 2 Vectores: "+ anguloVectores,50,260);
    text("Producto Punto: "+ dotProducto,50,290);
    
    int angulo = 30;
    float anguloDeteccion = cos(radians(angulo));  //Radio de deteccion del enemigo
    int anguloGrados = round(degrees(acos(anguloVectores))); //Lo hago solo para mostrar por pantalla
    
    if(dotProducto >= anguloDeteccion)
    {
        fill(#77dd77);
    }
    text("Rango de deteccion: " + angulo +"°",50,320);
    fill(#ff6961);
    text("Angulo: " + anguloGrados +"°",51,350);

    if (anguloVectores >= anguloDeteccion)
  {
    fill(#d53032);
    textSize(40);
    text(" ! ! ! ",this.getPosicion().x-31,this.getPosicion().y-40);
    //Disparar Proyectil
  }else
  {
    fill(#ffbd77);
    textSize(40);
    text(". . .",this.getPosicion().x-21,this.getPosicion().y-40);
  }
  }
  public void actualizar() {
        // Actualiza la posición del proyectil según su velocidad
        this.posicion.add(this.velocidad);
    }
  
  public boolean fueraDePantalla() {
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
