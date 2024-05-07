// Puntos
PVector puntoA;
PVector posicionJugador;
PVector posicionEnemigo;

//Vectores
Vector vectorJugador;

//GameObjects
Jugador jugador;
Enemigo enemigo;

public void setup()
{
  size(800,800);
  //Puntos
  posicionEnemigo = new PVector(0,0);
  posicionJugador = new PVector(0, 0);
  puntoA = new PVector(1, 0);
  //Vectores
  vectorJugador = new Vector (posicionJugador, puntoA);
  
  //GameObjects
  jugador = new Jugador(posicionJugador,20,20);
  enemigo = new Enemigo(posicionEnemigo,50,50);
}

public void draw()
{
 background(#1D0F0F);
     
    //Jugador
    jugador.setPosicion(vectorJugador.getOrigen());
    jugador.display();
    
    //Enemigo
    enemigo.display();     
    enemigo.vectorEnemigoJugador(jugador);

    stroke(#ff6961); // Rojo
    vectorJugador.setOrigen(new PVector (mouseX,mouseY));
    vectorJugador.display();
    stroke(#77dd77); // Verde
    //dibujarVectorEnemigoJugador(jugador);
    //vectorEnemigo.display();
    //escribirMensaje();

}
