import java.util.Set;
import java.util.Map;
import java.util.ArrayList;

class Ideas {

    /*====| atributos |====*/
    String[] words;
    int lenght;

    HashMap<String,ArrayList<String>> word_dic = new HashMap<String,ArrayList<String>>();
    String[] keys;

    /* ===| constructor |=== */
    Ideas (String file_location){

        String[] lines = loadStrings(file_location);
        String entire_text = join(lines," ");
        entire_text = entire_text.toLowerCase();
        words = splitTokens(entire_text,"<> ,.?)(=\"!;:…");

        for ( int i = 0 ; i < words.length ; i++ ) {
            String wrd = words[i];
            if ( !word_dic.containsKey(wrd) ) {
                lenght++;
                word_dic.put(wrd,new ArrayList<String>());
            }

            if ( i < words.length - 2 ) {
                word_dic.get(wrd).add(words[i+1]);
            } else {
                word_dic.get(wrd).add(words[i-1]);
            }
        }
       keys =  word_dic.keySet().toArray(new String[0]);
    }

    /* ===| METODOS |=== */
    /*====| primera palabra |====*/
    String pp() {
        try {
            int random_int = int(random(0,lenght));
            return keys[random_int];
        } catch ( NullPointerException e) {
            return "FAIL";
        }
    }

    /*====| siguiente palabra |====*/
    String sp(String prev_word) {
        ArrayList<String> temp_list = word_dic.get(prev_word);
        try{
            int random_int = int(random(0,temp_list.size()));
            return temp_list.get(random_int);
        } catch (NullPointerException e) {
            print("Fail next_word :(");
            return prev_word;
        }
    }
}
/*====| propidades derivadas de las palabras |====*/
float tamano(String p) {
    return p.length()*0.9;
}

float peso(String p) {
    return tamano(p)*random(-1,1);
}

float elasticidad(String p) {
    float elas = 0.0;
    for ( int i = 0 ; i < p.length() ; i++ ) {
        char c = p.charAt(i);
        if (c == 'a' || c == 'e' || c == 'i') {
            elas -= 0.5;
        } else if ( c == 'o' || c == 'u') {
            elas += 0.5;
        } else {
            elas *= 0.2;
        }
    }
    return elas;
}

void cantar(int cuerpo_id, int rapsoda_id,String p) {
    PrintWriter output;
    output = createWriter("rapsoda"+Integer.toString(cuerpo_id)+"_"+Integer.toString(rapsoda_id)+".txt");
}
