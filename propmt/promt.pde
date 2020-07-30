import java.io.BufferedWriter;

String file;
int c = 0;
int c2 = 255;
int i = 0;
Letra[] l;
String s;
PFont f;
float x;
float y;
int last;

void NEW() {
    x = width;
    y = height/2;
    for (int j = 0; j < l.length; j++) {
        l[j] = new Letra(s.charAt(j),x,y,f,c);
        x = x + textWidth(s.charAt(j)) + 10;
        last = j;
        println(last);
    }
    if (c == 255) {
        c = 0;
    } else {
        c = 255;
    }
    if (c2 == 255) {
        c2 = 0;
    } else {
        c2 = 255;
    }
}

void setup() {
    frameRate(6);
    size(1366,768);
    file = "presentacion.txt";
    String[] lines = loadStrings(file);
    s = join(lines," ");
    f = createFont("Share Tech Mono",int(height/18),true);
    l = new Letra[s.length()];
    NEW();
    println(last);
}

void draw() {
    noStroke();
    fill(c2);
    rect(0,0,width,height);
    fill(c);
    rect(0,height/2-(height/8),width,height/4);

    /*====| dibujar el texto |====*/
    for (int k = 0 ; k < l.length ; k++ ) {
        l[k].draw();
    }

    /*====| mover las letras |====*/
    for (int m = 0 ; m < l.length ; m++) {
        l[m].mv(textWidth(l[m].l)*-1,0.0);
    }
    if (l[last].pos_x <= 0) {
            NEW();
    }


}
