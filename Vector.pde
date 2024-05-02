class Vector 
  {
public PVector origen;
public PVector destino;

public Vector (PVector origen, PVector destino)
    {
  this.origen = origen;
  this.destino = destino;
    }
public Vector ()
{
  origen = new PVector();
  destino = new PVector();
}

  public void display ()
      {
  PVector puntoFinal = obtenerPuntoFinal();
  line(origen.x, origen.y, puntoFinal.x,puntoFinal.y);
      }
  private PVector obtenerPuntoFinal()
    {
  PVector puntoFinal = new PVector(origen.x+destino.x,origen.y+destino.y);
  return puntoFinal;
    }

  private void sumarVectores()
  {

  }

}
