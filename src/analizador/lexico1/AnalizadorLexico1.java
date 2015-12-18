package analizador.lexico1;

import java.io.File;
import java.io.IOException;

/**
 *INTEGRANTES:
 *  Quimbita Lilian
 *  Santacruz Cristian
 */
public class AnalizadorLexico1 {

    public static void main(String[] args) throws IOException, Exception {
        Interfaz interfaz = new Interfaz();
        String path = "C:/Users/Cristian/Desktop/Algoritmos/WorkSpace Algoritmos/Analizador Lexico1/src/analizador/lexico1/Lex.flex";
	generarLexer(path);
        
        interfaz.probarLexer();       
        interfaz.guardar();
        interfaz.setVisible(true);
    }
    
    public static void generarLexer(String path) {
		File archivo = new File(path);
		jflex.Main.generate(archivo);
	}
}
