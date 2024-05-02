Vector vector1;
Vector vector2;

public void setup()
{
  size (400,400);
  vector1 = new Vector (new PVector (200,80), new PVector(100,100));
  vector2 = new Vector (new PVector (150,40), new PVector(100,200));
}
  public void draw ()
  {
    background(255);
    vector1.display();
    //vector2.display();
    sumarVectores();
    vector1.origen.x= mouseX;
    vector1.origen.y= mouseY;
    vector2.origen.x= mouseX;
    vector2.origen.y= mouseY;
    multiplicarPorEscalar(3);
  }

  public void sumarVectores()
{
  Vector vectorSuma = new Vector();
  vectorSuma.origen = vector1.origen;
  //vectorSuma.destino.x = vector1.destino.x + vector2.destino.x;
  //vectorSuma.destino.y = vector1.destino.y + vector2.destino.y;
  vectorSuma.destino = PVector.add(vector1.destino,vector2.destino);
  vectorSuma.display();
}
  public void restarVectores()
  {
    Vector vectorSuma = new Vector();
    vectorSuma.origen = vector1.origen;
    //vectorSuma.destino.x = vector1.destino.x + vector2.destino.x;
    //vectorSuma.destino.y = vector1.destino.y + vector2.destino.y;
    vectorSuma.destino = PVector.sub(vector1.destino,vector2.destino);
    vectorSuma.display();
  }

  public void multiplicarPorEscalar(int k)
{
  Vector productoFactor = new Vector();
  productoFactor.origen = new PVector (0, 0);
  productoFactor.destino = new PVector(k * vector1.destino.x, k * vector1.destino.y); 
  //productoFactor.destino = PVector.mult(vector1.destino,k);
  productoFactor.display();
  fill(9);
  text(vector1.destino.mag(),10,10);
  text(productoFactor.destino.mag(),50,50);
}
