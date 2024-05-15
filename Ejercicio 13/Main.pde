import java.util.Iterator;

Piso piso;
Dispensador dispensador;

public void setup() {
  size(800, 500);
  
  PVector posicionPiso = new PVector(400, 470);
  PVector posicionDispensador = new PVector(width / 2, height / 2);

  piso = new Piso(posicionPiso, 500, 80);
  dispensador = new Dispensador(posicionDispensador, 50, 50);
}

public void draw() {
  background(#1f1e1c);
  
  dispensador.display();
  piso.display();

  Iterator<Pelota> iterator = dispensador.listaPelotas.iterator();
  while (iterator.hasNext()) {
    Pelota pelota = iterator.next();
    pelota.actualizar();
    pelota.display();   
  }
}
