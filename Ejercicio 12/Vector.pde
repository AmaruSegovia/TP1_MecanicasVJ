class Vector 
  {
private PVector origen;
private PVector destino;

  //Contructor parametrizado
  public Vector (PVector origen, PVector destino)
    {
  this.origen = origen;
  this.destino = destino;
    }
  //Constructor no parametrizado
  public Vector ()
    {
  this.origen = new PVector();
  this.destino = new PVector();
    }

 // Getters
  public PVector getOrigen() {
    return this.origen;
  }

  public PVector getDestino() {
    return this.destino;
  }

  // Setters
  public void setOrigen(PVector origen) {
    this.origen = origen;
  }

  public void setDestino(PVector destino) {
    this.destino = destino;
  }

  public void display ()
      {
      PVector puntoFinal = obtenerPuntoFinal();
      strokeWeight(1);
      line(origen.x, origen.y, puntoFinal.x,puntoFinal.y);
      point(PVector.add(this.getOrigen(), this.getDestino()).x,
            PVector.add(this.getOrigen(), this.getDestino()).y);
      }
    private PVector obtenerPuntoFinal()
    {
    PVector puntoFinal = new PVector(origen.x+destino.x,origen.y+destino.y);
    return puntoFinal;
    }
    
    
    public float obtenerProductoPunto(Vector vector)
    {
      return PVector.dot(this.getDestino(),vector.getDestino());
    }
    
    public float anguloEntreVectores(Vector vector)
    {
      return degrees(PVector.angleBetween(this.getDestino(), vector.getDestino()));
    }

}
