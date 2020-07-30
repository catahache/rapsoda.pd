import java.util.Map;
import java.util.ArrayList;

class Cuerpos {

    /*====| atributos |====*/
    Rapsoda objeto[];//objetos del tipo Rapsoda
    int cantidad;//cantidad de bolitas
    int id;
    float x;
    Ideas ideas;
    float y;
    float dirx;
    float diry;
    float velocidad=2;
    int umbral_distancia=25;
    float direccion;
    float amplitud = radians( 10 );
    float radio = 0;
    float radio_suma = 0.01;
    float limite_radio=random(3,6);

    /*====| constructor |====*/
    Cuerpos(int _id,Ideas ideaz,int _cantidad) {
        cantidad = _cantidad;
        ideas = ideaz;
        id = _id;
        x=random(width);
        y=random(height);
        dirx=random(-3, 3);
        diry=random(-3, 3);
        objeto = new Rapsoda [cantidad];//inico clase

        for ( int i=0 ; i<cantidad ; i++ ) {
            objeto[i] = new Rapsoda(id,i,ideas);//inicio cada objeto
        }
    }

    /*====| METODOS |====*/
    /*====| nueva posicion |====*/
    void update () {
        //conmtrol velocidad
        direccion += random(-(amplitud), (amplitud));///cambio de angulo

        dirx = velocidad * cos( direccion );//nueva direccion
        diry = velocidad  * sin( direccion );//nueva direccion

        x = x+dirx;
        y = y+diry;

        limite();
        if(radio<limite_radio){
            radio += radio_suma;
        }
        if(radio>limite_radio){
            radio -= radio_suma;
        }

        if(abs(limite_radio - radio) < 0.3){
            limite_radio=int(random(0.5,2))*4;
        }

        for ( int i=1 ; i<cantidad ; i++ ) {
            objeto[i].update(objeto[i-1].x, objeto[i-1].y,radio);
        }
    }


    /*====| delimitar los bordes |====*/
    void limite() {
        /*====| limite en x |====*/
        if (x<0) {
            x=width;
        }
        if (x>width) {
            x=0;
        }
        /*====| limite en y |====*/
        if (y<0) {
            y=height;
        }
        if (y>height) {
            y=0;
        }
    }

    /*====| dibujar cuerpo |====*/
    void dibuja () {
        pushMatrix();
        translate(x, y);
        for ( int i=cantidad-1; i>1 ; i-- ) {// dibujo
            objeto[i].dibuja(objeto[i-1].x, objeto[i-1].y);
        }
        //stroke(107,204,75,100);
        noFill();
        // ellipse(0, 0, 50, 50);
        popMatrix();
    }
}
