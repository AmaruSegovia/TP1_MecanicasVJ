PVector puntoA;
PVector puntoB;
PVector posicionTesoro;
Vector vectorPersonaje;
Vector vectorPersonajeTesoro;
public void setup()
{
  size(500,500);
  puntoA = new PVector(0, 0);
  puntoB = new PVector(10, 0);
  posicionTesoro = new PVector(width/2,height/2);
  vectorPersonaje = new Vector (puntoA, puntoB);
  vectorPersonajeTesoro = new Vector();
}

public void draw()
{
 background(#1D0F0F);
    stroke(#ff6961); // Rojo
    vectorPersonaje.setOrigen(new PVector (mouseX,mouseY));
    vectorPersonaje.display();
    stroke(#84b6f4); //Azul
    dibujarTesoro();
    stroke(#77dd77); // Verde
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
  vectorPersonajeTesoro.setDestino(PVector.sub(posicionTesoro, vectorPersonaje.getOrigen()).normalize().mult(10));
  vectorPersonajeTesoro.display();
}

public void escribirMensaje()
{
  float dotProducto = vectorPersonaje.obtenerProductoPunto(vectorPersonajeTesoro);
  println(dotProducto);
  textSize(20);
  fill(#ff6961);
  text(dotProducto,100,20);
  
  if (dotProducto < 0)
  {
    fill(#ff6961);
    text("Esta adelante",100,40);
  }else
  {
    text("Esta atras",100,40);
  }
}
