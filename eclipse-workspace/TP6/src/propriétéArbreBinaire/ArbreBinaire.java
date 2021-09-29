package propriétéArbreBinaire;

/**
 * @author David Panzoli
 *
 */
public class ArbreBinaire<E> {
	

	public static void main(String args[]) {
		
		Noeud<Character> arbreBinaire = new Noeud<Character>('A',
			new Noeud<Character>('F',
				new Noeud<Character>('C', 
					new Noeud<Character>('R'),
					new Noeud<Character>('P')
					),
				new Noeud<Character>('J')
			),
			new Noeud<Character>('B',
				new Noeud<Character>('M', 
					new Noeud<Character>('S'),
					null
				),
				null
			)
		);
		
		System.out.printf("La taille de l'arbre est de %d\n", arbreBinaire.taille());
		System.out.printf("La hauteur de l'arbre est de %d\n", arbreBinaire.hauteur());
	}
}
