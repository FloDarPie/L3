package correction;

import java.util.ArrayList;
import java.util.List;

/**
 * Arbre n-aire simple avec calcul récursif de la hauteur
 * 
 * @author David Panzoli (INU Champollion)
 *
 */
public class Noeud<E> {


	E etiquette;
	List<Noeud<E>> fils;
	
	public Noeud(E e) {
		this.etiquette = e;
		this.fils = new ArrayList<Noeud<E>>();
	}
	
	public void attacher(Noeud<E> n) {
		this.fils.add(n);
	}
	
	public int hauteur() {
		if (this.fils.isEmpty()) return 1;
		int max = 0;
		for (Noeud<E> f : this.fils) {
			if (f.hauteur()>max) max = f.hauteur();
		}
		return max + 1;
	}
	
	public static void main(String[] args) {
		
		Noeud<Character> racine = new Noeud<Character>('A');
		
		Noeud<Character> b = new Noeud<Character>('B');
		racine.attacher(b);
		Noeud<Character> e = new Noeud<Character>('E');
		b.attacher(e);
		Noeud<Character> f = new Noeud<Character>('F');
		b.attacher(f);
		
		Noeud<Character> c = new Noeud<Character>('C');
		racine.attacher(c);
		
		Noeud<Character> d = new Noeud<Character>('D');
		racine.attacher(c);
		Noeud<Character> g = new Noeud<Character>('G');
		d.attacher(g);
		Noeud<Character> h = new Noeud<Character>('H');
		g.attacher(h);
		
		System.out.println(racine.hauteur());
		
	}
	
	
}
