import java.util.Iterator;

Tanque tanque;
Enemigo enemigo;
PVector posicionTanque;
PVector posicionEnemigo;

PFont miFuente;
public void setup()
{
  size(900,800);
  posicionTanque = new PVector(width/2,height/2);
  posicionEnemigo = new PVector(width/2,height/2);
  tanque = new Tanque(posicionTanque,80,160);
  enemigo = new Enemigo(posicionEnemigo,200,200);
  miFuente = createFont("pixelFont.ttf", 20);
  textFont(miFuente);
}

public void draw()
{
   background(#ffffff);


  tanque.setPosicion(new PVector(mouseX,mouseY));
        enemigo.display();
  Iterator<Proyectil> iterator = tanque.listaProyectiles.iterator();
    while (iterator.hasNext()) {
        Proyectil proyectil = iterator.next();
        proyectil.actualizar(); // Actualiza la posición del proyectil
        proyectil.display();    // Dibuja el proyectil
        enemigo.aumentarContador();
        // Si el proyectil sale de la pantalla, remuévelo de la lista usando el iterador
        if (proyectil.colisionEnemigo()) {
            iterator.remove(); // Usa el iterador para eliminar el proyectil de la lista
        }
    }

        tanque.display();
}
