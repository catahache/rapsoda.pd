class Matrices {

    /*====| atributos |====*/
    int x;
    int y;
    int x_fin;
    int y_fin;
    int tamano_x;
    int tamano_y;
    int id_x;
    int id_y;
    boolean estado;
    boolean enviar;

    /* ===| constructor |=== */
    Matrices(int _id_x, int _id_y,int zx,int zy) {
        id_x = _id_x;
        id_y = _id_y;

        tamano_x=width/zx;
        tamano_y=height/zy;

        x= (id_x * (width/zx));
        y=(id_y * (height/zy));

        estado = false;
        enviar = false;

        x_fin = x + tamano_x;
        y_fin = y + tamano_y;
    }

    /* ===| METODOS |=== */
    /*====| verificar si el cuadro eseta o no vacio |====*/
    boolean compara(float _x, float _y) {
        boolean vuelve = false;
        if (_x > x && _x<x_fin) {
            if (_y > y && _y<y_fin) {
                vuelve = true;
            }
        }
        return vuelve;
    }

    /*====| dfinir el estado del cuadro |====*/
    void update(boolean _ocupado) {
        if ( estado != _ocupado) {
            estado = _ocupado;
            if (estado) {
                enviar = true;
            }
        }
    }

    /*====| dibujar cuadro |====*/
    void dibujar() {
        if (estado) {
            //stroke(255, 73, 64,20);
            stroke(255);
        } else {
            stroke(0, 0, 0,0);
        }
        noFill();
        rect(x, y, tamano_x, tamano_y);
    }
}
