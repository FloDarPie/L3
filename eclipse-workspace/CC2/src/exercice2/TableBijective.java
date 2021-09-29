package exercice2;

import java.util.HashMap;

public class TableBijective<E,F> {
	
	
	public HashMap<E,F> antecedents;
	public HashMap<F,E> image;
	
	public TableBijective() {
		
		this.antecedents = new HashMap<E, F>();
		this.image = new HashMap<F, E>();
	}
	
	//verifier l'appartenance (comme les deux sont liés, on en test uniquement un)
	//si oui, lever exception / sinon ajouter
	public void ajouter(E e, F f)  throws ExceptionCoupleExistant {
		if(this.antecedents.containsKey(e)) {
			throw new ExceptionCoupleExistant();
		} else {
			this.antecedents.put(e, f);
			this.image.put(f, e);
		}	
	}
	
	public E image(F f) {
		return image.get(f);
	}
	
	public F antecedent(E e) {
		return antecedents.get(e);
	}
}
