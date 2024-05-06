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
      strokeWeight(4);
      line(origen.x, origen.y, puntoFinal.x,puntoFinal.y);
      point(PVector.add(this.getOrigen(), this.getDestino()).x,
          PVector.add(this.getOrigen(), this.getDestino()).y);
      }
  private PVector obtenerPuntoFinal()
    {
  PVector puntoFinal = new PVector(origen.x+destino.x,origen.y+destino.y);
  return puntoFinal;
    }

  public Vector sumar(Vector segundoVector)
  {
    Vector vectorTotal = new Vector();
    vectorTotal.origen = this.origen;
    vectorTotal.destino = PVector.add(this.destino,segundoVector.destino);
    return vectorTotal;
  }

  public Vector restar(Vector segundoVector)
  {
    Vector vectorTotal = new Vector();
    vectorTotal.origen = this.origen;
    vectorTotal.destino = PVector.sub(this.destino,segundoVector.destino);
    return vectorTotal;
  }

}
