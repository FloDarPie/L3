package exercice3_ArbresNAires;

import java.util.ArrayList;

public class Noeud<E> {
	
	//utiliser une liste pour les noeuds
	
	E etiquette;
	
	ArrayList<E> fils = new ArrayList<E>();
	
	
	public Noeud(E truc) {
		this.etiquette=truc;
		this.fils.add(this.etiquette);
	}

	@SuppressWarnings("unchecked")
	public void attacher(Noeud<E> n) {
		this.fils.add((E) n);
	}
	
	public int hauteur() {
		int h = 0;
		
		h = this.fils.size();
		
		return h;
	}
	
	
	public static void main(String[] args) {
		//création de l'arbre
		Noeud<String> a = new Noeud<String>("a");
		Noeud<String> b = new Noeud<String>("b");
		Noeud<String> c = new Noeud<String>("c");
		Noeud<String> d = new Noeud<String>("d");
		Noeud<String> e = new Noeud<String>("e");
		Noeud<String> f = new Noeud<String>("f");
		Noeud<String> g = new Noeud<String>("g");
		Noeud<String> h = new Noeud<String>("h");

		b.attacher(e);
		b.attacher(f);
		
		g.attacher(h);
		d.attacher(g);
		
		a.attacher(b);
		a.attacher(c);
		a.attacher(d);
		
		System.out.println(a.hauteur());
		
	}

}
