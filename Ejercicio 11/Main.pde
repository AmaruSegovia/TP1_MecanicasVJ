PVector puntoA;
PVector puntoB;
PVector posicionTesoro;
Vector vectorPersonaje;
Vector vectorPersonajeTesoro;
public void setup()
{
  size(500,500);
  puntoA = new PVector(0, 0);
  puntoB = new PVector(1, 0);
  posicionTesoro = new PVector(width/2,height/2);
  vectorPersonaje = new Vector (puntoA, puntoB);
  vectorPersonajeTesoro = new Vector();
}

public void draw()
{
 background(#1D0F0F);
    vectorPersonaje.setOrigen(new PVector (mouseX,mouseY));
    stroke(#ff6961); // Rojo
    vectorPersonaje.display();
    dibujarTesoro();
    dibujarVectorPersonajeTesoro();
    escribirMensaje();
}

public void dibujarTesoro()
{
  strokeWeight(10);
  point(posicionTesoro.x,posicionTesoro.y);
}

public void dibujarVectorPersonajeTesoro()
{
  vectorPersonajeTesoro.setOrigen(vectorPersonaje.getOrigen());
  vectorPersonajeTesoro.setDestino(PVector.sub(posicionTesoro, vectorPersonaje.getOrigen()).normalize());
  vectorPersonajeTesoro.display();
}

public void escribirMensaje()
{
  float dotProducto = vectorPersonaje.obtenerProductoPunto(vectorPersonajeTesoro);
  println(dotProducto);
  textSize(20);
  fill(#ff6961);
  text(dotProducto,100,20);
  
  if (dotProducto == 1)
  {
  text("180Grados",200,400);
  }
  if (0 < dotProducto && dotProducto < 1)
  {
  text("Atras",200,400);
  }
  if (dotProducto == 0)
  {
  text("90 Grados o -90 Grados",200,400);
  }
  if (-1 < dotProducto && dotProducto < 0)
  {
  text("Adelante",200,400);
  }
  if (dotProducto == -1)
  {
  text("0 Grados",200,400);
  }
}
