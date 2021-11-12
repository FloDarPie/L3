package exosSimples;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

/**
 * Implémentation du type ArbreBinaire + fonction ususelles
 * @author David Panzoli
 *
 */
public class Noeud<E> implements Iterable<E> { 

	public E étiquette;
	public Noeud<E> sag;
	public Noeud<E> sad;

	/**
	 * Crée une feuille
	 */
	public Noeud(E e) {
		this.étiquette = e;
		this.sag = null;
		this.sad = null;
	}

	/**
	 * Crée un nouvel arbre en assemblant une étiquette et deux sous-arbres existants 
	 */
	public Noeud(E e, Noeud<E> g, Noeud<E> d) {
		this.étiquette = e;
		this.sag = g;
		this.sad = d;
	}

	public int taille() {
		int tailleSag=0, tailleSad=0;
		if (this.sag != null) tailleSag = this.sag.taille();
		if (this.sad != null) tailleSad = this.sad.taille();
		return 1 + tailleSag + tailleSad;
	}

	public int hauteur() {
		int hautSag=0, hautSad=0;
		if (this.sag != null) hautSag = this.sag.hauteur();
		if (this.sad != null) hautSad = this.sad.hauteur();
		return 1 + Math.max(hautSag, hautSad);
	}
	
	@Override
	public String toString() {
		String out = "";
		if (this.sag != null) out += this.sag;
		out += this.étiquette;
		if (this.sad != null) out += this.sad;
		return out;
	}
	
	public ArrayList<E> parcoursProfondeur() {
		ArrayList<E> étiquettes = new ArrayList<>();
		Stack<Noeud<E>> pile = new Stack<>();
		pile.add(this);
		while (!pile.isEmpty()) {
			Noeud<E> courant = pile.pop();
			étiquettes.add(courant.étiquette);
			if (courant.sad != null) pile.add(courant.sad);
			if (courant.sag != null) pile.add(courant.sag);
		}
		return étiquettes;
	}
	
	public ArrayList<E> parcoursLargeur() {
		ArrayList<E> étiquettes = new ArrayList<>();
		Queue<Noeud<E>> file = new LinkedList<>();
		file.add(this);
		while (!file.isEmpty()) {
			Noeud<E> courant = file.poll();
			étiquettes.add(courant.étiquette);
			if (courant.sag != null) file.add(courant.sag);
			if (courant.sad != null) file.add(courant.sad);
		}
		return étiquettes;
	}

	@Override
	public Iterator<E> iterator() {
		return new NoeudIterateur(this); 
	}
	
	/**
	 * Permet d'itérer sur les éléments de l'arbre binaire en mettant
	 * en oeuvre un parcours profondeur d'abord (i.e. avec une pile) 
	 * @author dpanzoli
	 */
	
	public class NoeudIterateur implements Iterator<E> {

		Stack<Noeud<E>> noeuds;
		
		public NoeudIterateur(Noeud<E> ab) {
			this.noeuds = new Stack<Noeud<E>>();
			this.noeuds.push(ab);
		}

		@Override
		public boolean hasNext() {
			return !noeuds.isEmpty();
		}

		@Override
		public E next() {
			Noeud<E> ab = noeuds.peek();
			noeuds.pop();
			if (ab.sad != null) noeuds.push(ab.sad);
			if (ab.sag != null) noeuds.push(ab.sag);
			return ab.étiquette;
		}

		@Override
		public void remove() {
			throw new java.lang.UnsupportedOperationException("Opération non implémentée !");
		}
	}

	
}
