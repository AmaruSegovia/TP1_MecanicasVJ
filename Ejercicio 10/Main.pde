private Vector vectorA;
private Vector vectorB;
private Vector vectorC;
private Vector vectorD;
private Vector vectorE;
PVector puntoA;
public void setup()
{
    size (900,500);
  // Definir los puntos A, B y C
   puntoA = new PVector(width/2-40, height/2-80);
  PVector puntoB = new PVector(160, -40);
  PVector puntoC = new PVector(250, 80);
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
    stroke(#ffe4e1); //Rosa
    vectorE.display();
    stroke(0);
    
    
    fill(#0e8d94);
    strokeWeight(1.5);
    ellipse(puntoA.x,puntoA.y, 8,8);
    
    // Dibujar el rectángulo de fondo
    fill(#f5f6ab);
    rect(100, 160, 200, 160);
    
    fill(#F6FF93,200);
    stroke(#F6FF93,200);
    strokeWeight(0);
    rect(150, 150, 100, 20);
    
    stroke(0);
    // Calcular el centro del rectángulo
    float centerX = 100 + 200/2;
    float centerY = 100 + 200/2;
  
    // Mostrar el texto alineado al centro del rectángulo
    textAlign(CENTER, CENTER); // Alinear el texto al centro
    textSize(14);
    fill(#0e8d94);
    strokeWeight(1.5);
    ellipse(centerY-66, centerX-10, 8,8);
    fill(0);
    text("Punto de Origen (O)", centerX, centerY-10);
    text("Vectores", centerX, centerY + 20);
    text("VectorA = Vector(O,A)", centerX, centerY + 40); //Rojo
    text("VectorB = Vector(O,B)", centerX, centerY + 60); //Verde
    text("VectorC = VectorA + VectorB", centerX, centerY + 80); //Amarillo
  }
