package analyse_freq;

import java.util.HashMap;

public class AnalyseFrequentielle {

	static String texteFR = "la cryptographie est une des disciplines de la cryptologie s'attachant a "
			+ "proteger des messages, assurant confidentialite, authenticite et integrite, en s'aidant souvent "
			+ "de secrets ou cles. elle se distingue de la steganographie qui fait passer inapercu un message "
			+ "dans un autre message alors que la cryptographie rend un message inintelligible a autre que "
			+ "qui de droit. elle est utilisee depuis l'antiquite, mais certaines de ses methodes les plus "
			+ "importantes comme la cryptographie asymetrique, datent de la fin du vingtieme siecle.";

	static String texteEN = "cryptography prior to the modern age was effectively synonymous with encryption,"
			+ "the conversion of information from a readable state to apparent nonsense. the originator of an "
			+ "encrypted message shared the decoding technique needed to recover the original information "
			+ "only with intended recipients, thereby precluding unwanted persons from doing the same. "
			+ "the cryptography literature often uses alice for the sender, bob for the intended recipient, and eve "
			+ "for the adversary.";

	static String texteCS = "kryptografie neboli sifrovani je nauka o metodach utajovani smyslu zprav prevodem "
			+ "do podoby, ktera je citelná jen se specialni znalosti. slovo kryptografie pochazi z rectiny kryptos "
			+ "je skryty a graphein znamena psat. Nekdy je pojem obecneji pouzivan pro vedu o cemkoli spojenem se "
			+ "siframi jako alternativa k pojmu kryptologie. kryptologie zahrnuje kryptografii a kryptoanalyzu, "
			+ "neboli lusteni zasifrovanych zprav.";
	

	public static String analyser(String s) {
		//decoupage
		String[] texte = s.split(" ");
		
		//stockage des lettres et de leurs récurrences
		String[] StockLettres = new String[6];
		int[] StockNombre = new int[6];
		
		//réponse à récupérer
		String reponse = "| ";
		
		//création du dico
		HashMap<String,Integer> dico = new HashMap<String,Integer>();
		
		//remplissage du dico
		for( String mot : texte) {
			String[] motDecoupe = mot.split("") ;
			for(String lettre : motDecoupe) {
				if(dico.containsKey(lettre)) {
					int a = dico.get(lettre);
					a++;
					dico.replace(lettre,a);

				} else {
					dico.put(lettre, 1);
				}
			}	
		}
		
		//affichage du dico
		//System.out.println(dico);
		
		//récupération de la valeur haute du dico puis supression (x6)
		for(int placement =0; placement<StockLettres.length; placement++) {
			int nombre = 0;
			for(String i : dico.keySet()) {
					if(nombre < dico.get(i)) {
						nombre = dico.get(i);
						StockNombre[placement]=nombre;
						StockLettres[placement]=i;
						}
				}
			dico.remove(StockLettres[placement]);
			}
		
		//construction de la réponse
		for(String i : StockLettres) {
			reponse += i +" | ";
		}
			
		
		return reponse;
	}
	
	public static void main(String[] args) {

		System.out.println("Les 6 lettres les plus fréquentes");
		System.out.println("en français : "+analyser(texteFR));
		System.out.println("en anglais : "+ analyser(texteEN));
		System.out.println("en tchèque : "+analyser(texteCS));

	}
}