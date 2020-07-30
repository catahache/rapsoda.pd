import java.io.BufferedWriter;
import java.io.FileWriter;


class Rapsoda {

    /*====| atributos |====*/
    String recuerdos;

    Ideas ideas;
    String palabra;
    float x;//posicion
    float y;
    float vel_x;//velosidad
    float vel_y;
    float ace_x;//aceleracion
    float ace_y;
    float pfinal_x;//posicion final random
    float pfinal_y;
    float peso;//peso para la animacion
    float ela;//elasticidad
    float tam;//tamano de la rapsoda
    int id;//numero de bolia

    /* ===| constructor |=== */
    Rapsoda(int cuerpo_id, int _id, Ideas ideaz) {
        id = _id;//id del objeto
        recuerdos = "r_"+cuerpo_id+"_"+id+".txt";
        ideas = ideaz;
        palabra = ideas.pp();
        x = 0;//posicin inicial
        y = 0;
        tam = tamano(palabra);//tamano

        pfinal_x = random(-10, 10);//random de la pos
        pfinal_y = random(-10, 10);

        ela = elasticidad(palabra);//elasticidad /*dist entre rapsodas*/
        peso = peso(palabra);

    }


    /* ===| METODOS |=== */
    /*====| comentario |====*/
    void update(float _x, float _y, float _radio) {

        recordar(recuerdos, palabra);
        palabra = ideas.sp(palabra);
        tam = tamano(palabra);//tamano
        peso = peso(palabra);
        ela = elasticidad(palabra);//elasticidad /*dist entre rapsodas*/

        ace_x = vel_x - ela * (x - (_x+pfinal_x));
        vel_x = ace_x/peso;
        vel_x = constrain(vel_x,  -_radio, _radio);
        x += vel_x;

        ace_y = vel_y - ela * (y - (_y+pfinal_y));
        vel_y = ace_y/peso;
        vel_y = constrain(vel_y, -_radio, _radio);
        y+=vel_y;

        pfinal_x = random(-5, 5);//un poquito de random
        pfinal_y = random(-5, 5);

    }

    void dibuja (float _x, float _y) {
        //fill(47,186,157,73);
        fill(255);
        //stroke(142,47,186,73);
        stroke(255,255,255,40);
        //stroke(int(random(0,255)),int(random(0,255)),int(random(0,255)),20);
        line(x,y,_x,_y);
        noStroke();
        ellipse(x, y, random(2,tam), random(2,tam));
    }
}

