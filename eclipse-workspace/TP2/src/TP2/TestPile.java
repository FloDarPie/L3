package TP2;


public class TestPile {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) {

		Pile<Character> l;
		l = new PileContigue();
		//l = new PileChainee<>();
		test1(l);
		/*
		 test2(l);
		test3(l);
		test4(l);
		test5(l);
		test6(l);
		 */
		
	}

	/*
	 * On ne cherche qu'à valider le fonctionnement de la structure.
	 * On évite donc les cas problématiques
	 */
	
	public static void test1(Pile<Character> p) {

		p.empiler('b');
		System.out.println("Sommet : " + p.sommet());
		p.empiler('c');
		System.out.println("Sommet : " + p.sommet());
		p.empiler('d');	
		System.out.println("Sommet : " + p.sommet());
		p.empiler('a');
		System.out.println("Sommet : " + p.sommet());
		
		System.out.println("Pile vide : "+p.estVide());
		
		p.depiler();
		System.out.println("Sommet : "+p.sommet());
		p.depiler();
		System.out.println("Sommet : "+p.sommet());
		p.depiler();
		System.out.println("Sommet : "+p.sommet());
		p.depiler();
		System.out.println("Sommet : "+p.sommet());
		System.out.println("Pile vide : "+p.estVide());
	}

	/*
	 * Dans les fonctions qui suivent, on teste le 
	 * comportement de la Pile dans les cas particuliers
	 */

	public static void test2(Pile<Character> l) {
	
	}

	public static void test3(Pile<Character> l) {

	}

	public static void test4(Pile<Character> l) {

	}

	public static void test5(Pile<Character> l) {

	}

	public static void test6(Pile<Character> l) {

	}

}
