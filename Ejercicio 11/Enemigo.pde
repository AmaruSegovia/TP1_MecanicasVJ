class Enemigo extends GameObject implements IVisualizable
{
  private PImage sprite;
  
  public Enemigo() {}

  /** Constructor parametrizado */
  public Enemigo(PVector posicion, int ancho, int alto)
  {
    this.posicion = posicion;
    this.ancho=ancho;
    this.alto=alto;
    this.sprite = loadImage("enemigo.png");
  }
  
  public void display()
  {
    image(sprite, enemigo.getPosicion().x - sprite.width/4, enemigo.getPosicion().y - sprite.height/4,ancho+80,alto+80);
  }

}
