package TAD_Dictionnaire.index.version0;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Index {

	static String[] sections = {"abstract", "intro", "related", "contribution", "foundations", "model", "experiment", "discussion", "conclusion" };

	public static void main(String args[]) throws IOException {

		FileReader in = new FileReader(Index.sections[0]+".txt");
		try (BufferedReader br = new BufferedReader(in)) {
			String ligne = br.readLine();
			while (ligne != null) {
				System.out.println(ligne);
				ligne = br.readLine();
			}
		}
	}


}
