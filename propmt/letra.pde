
class Letra {

    char l;
    PFont f;
    int c;
    float pos_x;
    float pos_y;

    /*====| constructor |====*/
    Letra (char _l, float _pos_x, float _pos_y, PFont _f,int _c) {
        l = _l;
        pos_x = _pos_x;
        pos_y = _pos_y;
        f = _f;
        c = _c;

    }

    /*====| metodos |====*/
    void mv(float _pos_x, float _pos_y) {
        pos_x = pos_x + _pos_x;
        pos_y = pos_y + _pos_y;
    }

    void draw() {
        textFont(f,int(height/18));
        fill(c);
        text(l,pos_x,pos_y);
    }


}

