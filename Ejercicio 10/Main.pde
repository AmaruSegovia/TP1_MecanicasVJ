Vector vectorA;
Vector vectorB;
Vector vectorC;
Vector vectorD;
Vector vectorE;
public void setup()
{
  // Definir los puntos A, B y C
  PVector puntoA = new PVector(width/2-40, height/2-80);
  PVector puntoB = new PVector(160, -40);
  PVector puntoC = new PVector(250, 80);
  size (900,900);
  vectorA = new Vector (puntoA, puntoC);
  vectorB = new Vector (puntoA, puntoB);
  vectorC = vectorA.sumar(vectorB);
  vectorD = new Vector (PVector.add(puntoA,vectorA.destino),PVector.sub(vectorC.destino,vectorA.destino));
  vectorE = new Vector (PVector.add(puntoA,vectorB.destino),PVector.sub(vectorC.destino,vectorB.destino));
}
  public void draw ()
  {
    background(#1D0F0F);
    stroke(#ff6961); // Rojo
    vectorA.display();
    stroke(#77dd77); // Verde
    vectorB.display();
    stroke(#fdfd96); // Amarillo
    vectorC.display();
    stroke(#84b6f4); // Azul
    vectorD.display();
    stroke(#ffe4e1); //Rosado
    vectorE.display();
  }
