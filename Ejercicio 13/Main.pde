import java.util.Iterator;
Piso piso;
Dispensador dispensador;

PVector posicionDispensador;
PVector posicionPiso;
PVector posicionPelota;

public void setup()
{
size(800,500);
posicionPelota = new PVector(width/2,height/2);
posicionDispensador = new PVector(width/2,height/2);
posicionPiso= new PVector(400,470);

piso = new Piso(posicionPiso,500,80);
dispensador = new Dispensador(posicionDispensador,50,50);
}

public void draw()
{
 background(#1f1e1c);
 
 dispensador.display();
 piso.display();
 
 Iterator<Pelota> iterator = dispensador.listaPelotas.iterator();
    while (iterator.hasNext()) {
        Pelota pelota = iterator.next();
        pelota.actualizar(); // Actualiza la posición del proyectil
        pelota.display();    // Dibuja el proyectil
        // Si el proyectil sale de la pantalla, remuévelo de la lista usando el iterador
        if (pelota.fueraDePantalla()) {
             // Usa el iterador para eliminar el proyectil de la lista
            pelota.cambiarDireccionVector();
        }
    }
}
