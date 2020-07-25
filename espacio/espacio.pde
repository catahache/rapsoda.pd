import java.util.Set;
import java.util.Map;
import java.util.ArrayList;
import oscP5.*;///libreria osc
import netP5.*;///libreria net
OscP5 oscP5;///objeto osc
NetAddress myRemoteLocation;//objeto net

/*====| inicializacion de objetos importantes |====*/
int contador = 0;
int lim;
Ideas ideas;
Cuerpos cuerpo[];
int cantidad = 10;//cantidad de cuerpos
int CANTIDAD = 10;//cantidad de rapsodas
Matrices matriz[][];
int cant_mat_x = 100;//cantidad de cuadros en x
int cant_mat_y = 1;//cantidad de cuadros en y


void SETUP () {
    lim = int(random(1,2000));

    /*====| creacion de los cuerpos |====*/
    cuerpo = new Cuerpos[cantidad];
    for ( int i=0; i<cantidad; i++ ) {
        cuerpo[i] = new Cuerpos(i, ideas,CANTIDAD);//inicio cada objeto
    }
}


void setup() {
    ideas = new Ideas("test.txt");
    size(1366, 768);//pantalla

    SETUP();

    /*====| creacion de la matriz |====*/
    matriz = new Matrices [cant_mat_x][cant_mat_y];//inico clase
    for ( int i=0; i<cant_mat_x; i++ ) {
        for ( int j=0; j<cant_mat_y; j++ ) {
            matriz[i][j] = new Matrices(i, j, cant_mat_x, cant_mat_y);//inicio cada objeto
        }
    }

    /*====| coneccion con Pure Data |====*/
    oscP5 = new OscP5(this, 12001);//puerto de escucha de osc
    myRemoteLocation = new NetAddress("127.0.0.1", 9001);//id de envio de datos y puerto

    background(0);
}



void draw() {
    noStroke();
    //fill(0, 0, 0, 15);
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 7);
    rect(0, 0, width/2, height/2);
    fill(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)), 7);
    rect( width/2, height/2, width/2, height/2);

    /*====| movimiento de los cuerpos |====*/
    for ( int i=0; i<cantidad; i++ ) {
        cuerpo[i].update();
    }

    /*====| revisar estado de la matriz |====*/
    for ( int i=0; i<cant_mat_x; i++ ) {
        for ( int j=0; j<cant_mat_y; j++ ) {
            boolean ocupado = false;
            boolean encontro = false;
            for ( int k=0; k<cantidad; k++ ) {
                ocupado = matriz[i][j].compara(cuerpo[k].x, cuerpo[k].y);
                if (ocupado) {
                    encontro=true;
                }
            }
            matriz[i][j].update(encontro);
        }
    }

    /*====| dibujo cuerpo |====*/
    for ( int i=0; i<cantidad; i++ ) {
        cuerpo[i].dibuja();
    }

    /*====| dibjujo matriz |====*/
    for ( int i=0; i<cant_mat_x; i++ ) {
        for ( int j=0; j<cant_mat_y; j++ ) {
        matriz[i][j].dibujar();
            if (matriz[i][j].enviar) {
                matriz[i][j].enviar = false;
                /*====| enviar mensaje por oscP5 |====*/
                OscMessage myMessage = new OscMessage("/t");//encabezado
                int numero = (i+1)+(cant_mat_y * j);
                myMessage.add(numero);//mensaje
                oscP5.send(myMessage, myRemoteLocation);//envio mensaje
                //println(numero);
            }
        }
    }
    //envio osc
    if (contador == lim) {
        SETUP();
        contador = 0;
        fill(0,0,0,200);
        rect( width/2, 0, width/2, height/2);
        fill(0,0,0,200);
        rect( 0, height/2, width/2, height/2);
    } else {
        contador++;
    }
    println(lim+"->"+contador);
}
