class Jugador extends GameObject implements IMovable,IVisualizable
{
  private PVector velocidad;
  private PImage sprite;

  public Jugador() {}

  /** Constructor parametrizado */
  public Jugador(PVector posicion, int ancho, int alto)
  {
    this.posicion = posicion;
    this.ancho=ancho;
    this.alto=alto;
    this.sprite = loadImage("jugador.png");
    this.velocidad = new PVector(80, 80);
  }
  
  public void display()
  {
      image(sprite, jugador.getPosicion().x - sprite.width/2, jugador.getPosicion().y - sprite.height/2,ancho+110,alto+110);
  }
  

  
  public void mover()
  {
    float deltaTime = 1.0/frameRate;
    // Actualizar la posición del jugador basado en las teclas presionadas
    if (keyPressed) {
      if (key == 'w' || key == 'W') {
        // Mover hacia arriba
        posicion.y -= velocidad.y * deltaTime;
      } else if (key == 's' || key == 'S') {
        // Mover hacia abajo
        posicion.y += velocidad.y * deltaTime;
      } else if (key == 'a' || key == 'A') {
        // Mover hacia la izquierda
        posicion.x -= velocidad.x * deltaTime;
      } else if (key == 'd' || key == 'D') {
        // Mover hacia la derecha
        posicion.x += velocidad.x * deltaTime;
      }
    }
  }
  }
