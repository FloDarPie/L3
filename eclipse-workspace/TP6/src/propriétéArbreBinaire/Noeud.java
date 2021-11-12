package propriétéArbreBinaire;

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

	
}
