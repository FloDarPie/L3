package parcoursArbreBinaire;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Stack;

/**
 * Implémentation du type ArbreBinaire + fonction ususelles
 * @author David Panzoli
 *
 */
public class Noeud<E> {

	/**
	 * Crée une feuille
	 */
	Noeud<E> sag;
	Noeud<E> sad;
	Object etiquette;
	
	
	public Noeud(E e) {
		this.etiquette = e;
	}

	/**
	 * Crée un nouvel arbre en assemblant une étiquette et deux sous-arbres existants 
	 */
	
	public Noeud(E e, Noeud<E> g, Noeud<E> d) {
		this.etiquette = e;
		this.sag = g;
		this.sad = d;
	}

	public int taille() {
		int cpt = 1;
		
		if(this.sag != null)
			cpt+=this.sag.taille();
		if(this.sad != null)
			cpt+= this.sad.taille();
		
		return cpt;
	}

	public int hauteur() {
		int hd = 0;
		int hg = 0;
		
		if(this.sag != null)
			hg+= this.sag.hauteur();
		if(this.sad != null)
			hd+= this.sad.hauteur();
		
		if(hd-hg<=0)
			return 1+hg;
		else
			return 1+hd;
	}
	

	public int evaluer() {
		int total = 0;
		
		switch ((Character) this.etiquette){
		case '+':
			total=this.sag.evaluer() + this.sad.evaluer();
			break;
		case '-':
			total=this.sag.evaluer() - this.sad.evaluer();
			break;
		case '*':
			total=this.sag.evaluer() * this.sad.evaluer();
			break;
		case '/':
			total=this.sag.evaluer() / this.sad.evaluer();
			break;
			
		default:
			total = Character.getNumericValue((Character) this.etiquette);
			
			break;
		}
		return total;
	}
	
	
	@Override
	public String toString() {
		String arbreg = "";
		String arbred = "";
		
		if(this.sag != null) 
			arbreg += this.sag;
		
		
		if(this.sad != null) 
			arbred += this.sad;
				
		return arbreg+this.etiquette+arbred;
	}
	
	
	@SuppressWarnings("unchecked")
	public ArrayList<E> parcoursProfondeur(){
        Stack<Noeud<E>> pile = new Stack<>();
        ArrayList<E> liste = new ArrayList<>();

        pile.add(this);

        while(!pile.isEmpty()) {
            Noeud<E> n = pile.pop();

            if (n.sad!=null) pile.add(n.sad);
            if (n.sag!=null) pile.add(n.sag);

            liste.add((E) n.etiquette);

        }

        return liste ;

    }
	
	@SuppressWarnings("unchecked")
	public ArrayList<E> parcoursLargeur(){
		ArrayDeque<Noeud<E>> pile = new ArrayDeque<Noeud<E>>(); 
        ArrayList<E> liste = new ArrayList<>();

        pile.add(this);

        while(!pile.isEmpty()) {
            Noeud<E> n = pile.poll();

            
            if (n.sag!=null) pile.add(n.sag);
            if (n.sad!=null) pile.add(n.sad);
            
            liste.add((E) n.etiquette);

        }

        return liste ;
	}

	
	
	public class NoeudIterateur implements Iterator<E> {
        public Stack<Noeud<E>> pileIterator;

        public NoeudIterateur(Noeud<E> root) {
            this.pileIterator = new Stack<Noeud<E>>();
            this.pileIterator.push(root);
        }
        @Override
        public boolean hasNext() {
            return !this.pileIterator.isEmpty();
        }
        @SuppressWarnings("unchecked")
		@Override
        public E next() {
            Noeud<E> next = this.pileIterator.pop();
            if (next.sad != null)
                this.pileIterator.push(next.sad);
            if (next.sag != null)
                this.pileIterator.push(next.sag);
            return (E) next.etiquette;
        }
    }
	
    public Iterator<E> iterator() {
        return new NoeudIterateur(this);
    }
	
}
