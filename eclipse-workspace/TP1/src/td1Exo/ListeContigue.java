package td1Exo;

@SuppressWarnings("rawtypes")
public class ListeContigue implements Liste {
	
	static int CAPCT = 5;
	Object[] valeurs = new Object[CAPCT];
	int taille = 0;
	
	public ListeContigue() {		
	}
	
	public String toString() {
		String s = "";
		
		for(int i = 0; i<this.taille;i++) {
			s+=  this.valeurs[i].toString() + " ";
		}
		return "[ " + s + "]";
	}

	@Override
	public int longueur() {
		int i = 0;
		for(Object Object : valeurs) {
			if(Object != null) {
				i++;
			}
		}
		this.taille = i;
		return this.taille;
	}

	@Override
	public Object ième(int indice) {
		return (Object) this.valeurs[indice];
	}

	@Override
	public void inserer(int indice, Object element) {
		for (int i = ListeContigue.CAPCT-1; i>=indice; i--) {
			if(i != indice) {
				valeurs[i] = valeurs[i-1] ;
			}else {
				valeurs[i] = element;
			}
		}
		
		/*
		for( int i =indice; i<this.CAPCT; i++) {
			valeurs[i]=valeurs[i-1];
		}
		this.taille++;
		*/
		
		this.taille++;
		
	}

	@SuppressWarnings("static-access")
	@Override
	public void supprimer(int indice) {
		for (int i = indice; i<this.CAPCT-1; i++) {
			valeurs[i]=valeurs[i+1];
			}
		this.taille--;
		
	}

}
