package exosSimples;

public class NoeudABR<E extends Comparable<E>> extends Noeud<E> {

	public NoeudABR(E e) {
		super(e);
		new Noeud<E>(e);
	}
	
	public boolean rechercher(E e) {
		
		int a =this.étiquette.compareTo(e);
		
		if(a<0 & this.sag.étiquette!=null)
			this.sag.parcoursProfondeur();
		if(a>0 & this.sad.étiquette!=null)
			this.sad.parcoursProfondeur();
		if(a==0)
			return true;
		else
			return false;		
	}
	
	
	public E insérer(E e) {
		return this.étiquette;
	}

	

	public static void main(String[] args) {


	}

}
