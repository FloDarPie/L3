package exercice3;

import java.util.HashMap;
import java.util.Set;

@SuppressWarnings({ "serial", "rawtypes" })
public class ClassementParType extends HashMap {
	
	HashMap<String, Set<Production>> Classement;
	
	String texte = 
			"Italie;Blé;195053 " + 
			"Allemagne;Légumes secs;40092 " + 
			"Turquie;Blé;114253 " + 
			"France;Légumes secs;115599 " + 
			"Grèce;Riz;1745 " + 
			"Espagne;Légumes secs;34463 " + 
			"Italie;Légumes frais;60732 " + 
			"Roumanie;Riz;2326 " + 
			"Pologne;Légumes frais;29841 " + 
			"France;Maïs;50559 " + 
			"Italie;Fruits;27326 " + 
			"France;Légumes frais;26363 " + 
			"France;Riz;2531 " + 
			"Roumanie;Maïs;26745 " + 
			"France;Fruits;21388 " + 
			"Roumanie;Blé;69684 " + 
			"Espagne;Riz;1360 " + 
			"Lituanie;Légumes secs;29755 " + 
			"Italie;Légumes secs;50477 " + 
			"Italie;Riz;17832 " + 
			"Grèce;Légumes secs;21247 " + 
			"Finlande;Légumes secs;19777 " + 
			"Espagne;Légumes frais;22105 " + 
			"Turquie;Fruits;20608 " + 
			"Pologne;Fruits;12054 " + 
			"France;Blé;133994";
	
	public ClassementParType(String s) {
		//recupération des informations
		String[] section =texte.split(" ");
		for(String section2 : section) {
			String[] block =section2.split(";");
			
			//segmentation des éléments
			String type = block[1];
			String pays = block[0];
			Integer superficie = Integer.parseInt(block[2]);
			
			//génère la production
			Production prod = new Production(pays, superficie);
			
			if(Classement.containsKey(type)) {
				Set<Production> a = Classement.get(type);
				a.add(prod);
				Classement.replace(type, a);			
			
			} /*else {
				*/
		}			//j'y étais presque !!!
	}
	
	
	
	
	
	public static void main(String[] args) {
		
	}

}
