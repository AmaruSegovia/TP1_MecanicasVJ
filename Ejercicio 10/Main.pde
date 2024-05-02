Vector vector1;
Vector vector2;
Vector vectorSuma;
Vector vectorResta;
public void setup()
{
  size (500,500);
  vector1 = new Vector (new PVector (width/2,height/2), new PVector(100,250));
  vector2 = new Vector (new PVector (width/2,height/2), new PVector(100,120));
  vectorSuma = vector1.sumar(vector2);
  vectorResta = vector1.restar(vector2);
}
  public void draw ()
  {
    background(255);
    stroke(#FFF40000);
    vector1.display();
    vector2.display();
    stroke(#0000FF);
    vectorSuma.display();
    stroke(#4729C1);
    vectorResta.display();
    //sumarVectores();
    //vector1.origen.x= mouseX;
    //vector1.origen.y= mouseY;
    //vector2.origen.x= mouseX;
    //vector2.origen.y= mouseY;
    //multiplicarPorEscalar(3);
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
