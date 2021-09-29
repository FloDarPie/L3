package exercice1;

import java.util.HashMap;

/**
 * Combien de lettres minuscules *différentes* entre a et z ce texte compte-t-il ?  
 * @author David Panzoli (INU Champollion)
 */
public class Disparition {

	public static void main(String[] args) {

		String extrait = "Anton Voyl n'arrivait pas à dormir. Il alluma. "
				+ "Son Jaz marquait minuit vingt. Il poussa un profond soupir,"
				+ "s'assit dans son lit, s'appuyant sur son polochon. Il prit"
				+ "un roman, il l'ouvrit, il lut; mais il n'y saisissait qu'un"
				+ "imbroglio confus, il butait à tout instant sur un mot dont"
				+ "il ignorait la signification. Il abandonna son roman sur"
				+ "son lit. Il alla à son lavabo; il mouilla un gant qu'il"
				+ "passa sur son front, sur son cou. Son pouls battait trop fort."
				+ "Il avait chaud. Il ouvrit son vasistas, scruta la nuit."
				+ "Il faisait doux. Un bruit indistinct montait du faubourg."
				+ "Un carillon, plus lourd qu'un glas, plus sourd qu'un tocsin,"
				+ "plus profond qu'un bourdon, non loin, sonna trois coups."
				+ "Du canal Saint-Martin, un clapotis plaintif signalait un"
				+ "chaland qui passait. Sur l'abattant du vasistas, un animal"
				+ "au thorax indigo, à l'aiguillon safran, ni un cafard, ni"
				+ "un charançon, mais plutôt un artison, s'avançait, traînant"
				+ "un brin d'alfa. Il s'approcha, voulant l'aplatir d'un coup vif,"
				+ "mais l'animal prit son vol, disparaissant dans la nuit avant "
				+ "qu'il ait pu l'assaillir.";

		String[] texte = extrait.split("");
		HashMap<String,Integer> dico = new HashMap<String,Integer>();
        for(String lettre : texte) {
			//System.out.println(lettre);
			if(dico.containsKey(lettre)) {
				int a = dico.get(lettre);
				a++;
				dico.replace(lettre, a);
			} else {
				dico.put(lettre, 1);
			}
			
		}
        //renvoie un caractère qui est unique --> pourquoi 22 ?
        System.out.println(dico);
		int reponse = 0;
		
		//vérifier si c'est bien une lettre et pas un caractère bizarre
		for(String i : dico.keySet()) {
			if (dico.get(i) == 1 ) {
					reponse++;
					System.out.print(i + " ");
					
			}
		}
		System.out.println();
		System.out.println(reponse);
	}

}
