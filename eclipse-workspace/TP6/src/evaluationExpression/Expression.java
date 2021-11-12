package evaluationExpression;

import propriétéArbreBinaire.Noeud;

public class Expression<E> {

	public static void main(String args[]) {
		
		Noeud<Character> expression = new Noeud<Character>('+',
				
				new Noeud<Character>('-', 
						new Noeud<Character>('5'),
						new Noeud<Character>('*', 
								new Noeud<Character>('2'), 
								new Noeud<Character>('6')))
				,
				new Noeud<Character>('*', 
						new Noeud<Character>('+', 
								new Noeud<Character>('5'), 
								new Noeud<Character>('/', 
										new Noeud<Character>('6'), 
										new Noeud<Character>('2'))), 
						new Noeud<Character>('3'))
				
				);
		System.out.println(expression.evaluer());
	}
	
}
