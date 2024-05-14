import java.util.Iterator;

//GameObjects
Jugador jugador;
Enemigo enemigo;
public void setup()
{
  size(800,900);
  //Puntos
  PVector posicionEnemigo = new PVector(width/2-200,height/2);
  PVector posicionJugador = new PVector(0, 0);
  
  //GameObjects
  jugador = new Jugador(posicionJugador,80,80);
  enemigo = new Enemigo(posicionEnemigo,120,120);
  
  //Fuente
  PFont miFuente = createFont("pixelFont.ttf", 20);
  // Establecer la fuente por defecto
  textFont(miFuente);
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
        if (proyectil.colisionPantalla()) {
            iterator.remove(); // Usa el iterador para eliminar el proyectil de la lista
        }
        if(proyectil.colisionJugador())
        {
          jugador.displayQuemado();
        }
    }


}
