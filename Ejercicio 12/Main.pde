import java.util.Iterator;

Tanque tanque;
Enemigo enemigo;
PImage historiaU;
public void setup()
{
  size(900,800);
  PVector posicionTanque = new PVector(width/2,height/2);
  PVector posicionEnemigo = new PVector(width/2,height/2);
  tanque = new Tanque(posicionTanque,80,160);
  enemigo = new Enemigo(posicionEnemigo,200,200);
  PFont miFuente = createFont("pixelFont.ttf", 20);
  textFont(miFuente);
  historiaU = loadImage("HU_12.png");
  imageMode(CENTER);
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

        // Si el proyectil sale de la pantalla, remuévelo de la lista usando el iterador
        if (proyectil.colisionEnemigo()) {
            iterator.remove(); // Usa el iterador para eliminar el proyectil de la lista
            enemigo.aumentarContador();
        }
    }

        tanque.display();
        
        
      if (tanque.magnitud <= 20) {
          // Muestra la imagen
        image(historiaU, width/2, height/2,750, 500);
        textSize(20);
        fill(#050000);
        text("El diagrama de clases se encuentra en esta carpeta :D",width/8,750);
      }
      else
      {
      textSize(20);
      fill(#050000);
      text("¡ Mueve el tanque al medio para ver la historia de usuario !",width/8,750);
      }

  

}
