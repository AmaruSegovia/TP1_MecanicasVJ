import java.util.Iterator;
// Puntos
PVector puntoA;
PVector posicionJugador;
PVector posicionEnemigo;

//GameObjects
Jugador jugador;
Enemigo enemigo;
public void setup()
{
  size(800,1000);
  //Puntos
  posicionEnemigo = new PVector(width/2-200,height/2);
  posicionJugador = new PVector(0, 0);
  puntoA = new PVector(1, 0);
  
  //GameObjects
  jugador = new Jugador(posicionJugador,20,20);
  enemigo = new Enemigo(posicionEnemigo,50,50);
}

public void draw()
{
 background(#1D0F0F);
     
    //Jugador
    jugador.display();
    jugador.setPosicion(new PVector (mouseX,mouseY));
    //Enemigo
    enemigo.display();     
    
    Iterator<Proyectil> iterator = enemigo.listaProyectiles.iterator();
    while (iterator.hasNext()) {
        Proyectil proyectil = iterator.next();
        proyectil.actualizar(); // Actualiza la posición del proyectil
        proyectil.display();    // Dibuja el proyectil
        
        // Si el proyectil sale de la pantalla, remuévelo de la lista usando el iterador
        if (proyectil.fueraDePantalla()) {
            iterator.remove(); // Usa el iterador para eliminar el proyectil de la lista
        }
    }


}
