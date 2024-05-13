class Dispensador extends GameObject {
    private PImage cuerpoTanque;
    private PImage cabezaTanque;
    private Vector vectorDispensador;
    private Vector vectorDireccion;
    
    private ArrayList<Pelota> listaPelotas;
    private float tiempoUltimoDisparo; 
    private float intervaloDisparo = 1000; 


    public Dispensador(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.cuerpoTanque = loadImage("cuerpotanque.png");
        this.cabezaTanque = loadImage("cabezatanque.png");
        this.vectorDispensador = new Vector();
        this.vectorDireccion =  new Vector();
        this.listaPelotas = new ArrayList<Pelota>();
    }
    public Dispensador()
    {}
  
    public void display() {
        imageMode(CENTER);
        image(cuerpoTanque, posicion.x, posicion.y , ancho, alto);
        vectorUnitarioArriba();
        vectorDispensadorDireccion(new PVector(mouseX,mouseY));
        dispararPelota(4);
    }
    public void vectorUnitarioArriba()
    {
     this.vectorDispensador = new Vector(dispensador.getPosicion(), new PVector(0,-1));
     vectorDispensador.display();
    }
    
    public void vectorDispensadorDireccion(PVector direccion)
    {
    vectorDireccion.setOrigen(dispensador.getPosicion());
    vectorDireccion.setDestino(PVector.sub(direccion,dispensador.getPosicion()));
    vectorDireccion.display();
    }
    
    public void dispararPelota(float velocidadPelota) {
    float tiempoActual = millis();
    if (tiempoActual - tiempoUltimoDisparo > intervaloDisparo) {
        PVector direccion = vectorDireccion.getDestino().normalize();
        direccion.mult(velocidadPelota);
        // Crear la pelota en una posición independiente de la del dispensador
        Pelota pelota = new Pelota(new PVector(posicion.x, posicion.y), 40, 40, direccion);
        listaPelotas.add(pelota);
        tiempoUltimoDisparo = tiempoActual;
    }
}
}
