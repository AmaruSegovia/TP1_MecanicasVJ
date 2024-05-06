// Puntos
PVector puntoA;
PVector posicionJugador;
PVector posicionEnemigo;

//Vectores
Vector vectorJugador;
Vector vectorEnemigo;
Vector vectorEnemigoJugador;

//GameObjects
private Jugador jugador;
Enemigo enemigo;

public void setup()
{
  size(1000,1000);
  //Puntos
  posicionEnemigo = new PVector(width/2,height/2);
  posicionJugador = new PVector(0, 0);
  puntoA = new PVector(1, 0);
  //Vectores
  vectorJugador = new Vector (posicionJugador, puntoA);
  vectorEnemigo = new Vector (posicionEnemigo,puntoA);
  vectorEnemigoJugador = new Vector();
  
  //GameObject
  jugador = new Jugador(posicionJugador,20,20);
  enemigo = new Enemigo(posicionEnemigo,50,50);
}

public void draw()
{
 background(#1D0F0F);
    jugador.setPosicion(vectorJugador.getOrigen());
    jugador.display();
    
    enemigo.setPosicion(vectorEnemigo.getOrigen());
    enemigo.display();
    
    stroke(#ff6961); // Rojoawd
    vectorJugador.setOrigen(new PVector (mouseX,mouseY));
    vectorJugador.display();
    stroke(#77dd77); // Verde
    dibujarVectorEnemigoJugador();
    vectorEnemigo.display();
    escribirMensaje();
}

public void dibujarVectorEnemigoJugador()
{
  vectorEnemigoJugador.setOrigen(posicionEnemigo);
  vectorEnemigoJugador.setDestino(new PVector(1,0));
  vectorEnemigoJugador.setDestino(PVector.sub(vectorJugador.getOrigen(),posicionEnemigo).normalize());
  vectorEnemigoJugador.display();
}

float anguloEntreVectores(Vector vector1, Vector vector2) {
  // Calcula el producto punto entre los dos vectores
  float productoPunto = PVector.dot(vector1.getDestino(), vector2.getDestino());
  
  // Calcula las magnitudes de los vectores
  float magnitudVector1 = vector1.getDestino().mag();
  float magnitudVector2 = vector2.getDestino().mag();
  
  // Calcula el coseno del ángulo entre los vectores
  float cosenoAngulo = productoPunto / (magnitudVector1 * magnitudVector2);
  
  // Aplica la función arcocoseno para obtener el ángulo en radianes
  float anguloRadianes = acos(cosenoAngulo);
  
  // Convierte el ángulo a grados si es necesario
  float anguloGrados = degrees(anguloRadianes);
  
  return anguloGrados;
}

public void escribirMensaje()
{
  float dotProducto = vectorEnemigo.obtenerProductoPunto(vectorEnemigoJugador);
  println(dotProducto);
  textSize(20);
  fill(#ff6961);
  text("Resultado producto punto: "+ dotProducto,100,30);
  float anguloGrados = 30; //Angulo de deteccion del enemigo
  float anguloRadianes = radians(anguloGrados);
  float cosenoAngulo = cos(anguloRadianes);
  
  float angulo = round(anguloEntreVectores(vectorEnemigo,vectorEnemigoJugador));
  String anguloFormateado = nf(angulo); //Lo formateo con entero para que quede bonito
  
  text("Angulo: " + anguloFormateado +"°",80,170);
  
  
  if (dotProducto > cosenoAngulo)
  {
    fill(#ff6961);
    text("Detectado",100,50);
  }else
  {
    text("No detectado",100,50);
  }
}
