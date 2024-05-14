class Enemigo extends GameObject {
    private PImage casa;
    private PImage casaDestruida;
    private PImage polvo;
    private int contadorDestruirCasa;


    public Enemigo(PVector posicion, int ancho, int alto) {
        this.posicion = posicion;
        this.ancho = ancho;
        this.alto = alto;
        this.casa = loadImage("casa.png");
        this.casaDestruida = loadImage("casadestruida.png");
        this.polvo = loadImage("polvo.png");
    }

    public void display() {
        if (contadorDestruirCasa >= 5 && contadorDestruirCasa <= 10) {
            float factorTinte2 = map(contadorDestruirCasa-5, 0, 5, 0, 180);
            tint(255 - factorTinte2, 255 - factorTinte2, 255 - factorTinte2); 
            imageMode(CENTER);
            image(casaDestruida, posicion.x, posicion.y, ancho, alto);
            noTint(); 
            
        } 
        
         else if(contadorDestruirCasa > 10)
            {
            imageMode(CENTER);
            image(polvo, posicion.x, posicion.y, ancho-40, alto-40);
            noTint(); 
            }
        
        else {
            float factorTinte = map(contadorDestruirCasa, 0, 5, 0, 180);
            tint(255 - factorTinte, 255 - factorTinte, 255 - factorTinte); 
            imageMode(CENTER);
            image(casa, posicion.x, posicion.y, ancho, alto);
            noTint(); 
        }
        
    }

    public void aumentarContador() {
        contadorDestruirCasa++;
        println(contadorDestruirCasa);
    }
}
