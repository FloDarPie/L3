package td1Exo;


public class TestListe {

	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

		Liste<Character> l;
		l = new ListeContigue();
		//l = new ListeChainee<>();
		test1(l);
		test2(l);
		test3(l);
		test4(l);
		test5(l);
		test6(l);
		
	}

	/*
	 * On ne cherche qu'à valider le fonctionnement de la structure.
	 * On évite donc les cas problématiques
	 */
	
	public static void test1(Liste<Character> l) {

		l.inserer(0, 'b');
		System.out.println("Liste : "+l.toString());
		l.inserer(1, 'c');
		l.inserer(2, 'd');	
		l.inserer(0, 'a');
		System.out.println("Liste : "+l.toString());
		System.out.println("1er élément : "+l.ième(1));
		System.out.println("3eme élément : "+l.ième(3));
		System.out.println("Longueur de la liste : "+l.longueur());
		l.supprimer(2);
		l.supprimer(0);
		l.inserer(1, 'e');
		System.out.println("Liste : "+l.toString());
	}

	/*
	 * Dans les fonctions qui suivent, on teste le 
	 * comportement de la liste dans les cas particuliers
	 */

	public static void test2(Liste<Character> l) {

		l.inserer(1, 'a');
	}

	public static void test3(Liste<Character> l) {

		l.inserer(15, 'a');
	}

	public static void test4(Liste<Character> l) {

		l.inserer(0, 'a');
		l.inserer(1, 'b');
		l.inserer(2, 'c');
		System.out.println("4ème élément : "+l.ième(3));
	}

	public static void test5(Liste<Character> l) {

		l.inserer(0, 'a');
		l.inserer(1, 'b');
		l.inserer(2, 'c');
		l.supprimer(4);
	}

	public static void test6(Liste<Character> l) {

		l.supprimer(-1);
	}

}
