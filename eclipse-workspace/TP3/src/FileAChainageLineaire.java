
@SuppressWarnings("rawtypes")
public class FileAChainageLineaire implements File {
	
	
	class Maillon {
		Object valeur;
		Maillon predecesseur;
	}
	
	Maillon premier;

	
	public Maillon tete;
	public Maillon queue;
	
	public FileAChainageLineaire( ) {
		premier = null;
		this.tete=premier;
		this.queue=premier;
	}
	

	@Override
	public boolean estVide() {
		return this.tete == null;
	}

	@Override
	public Object premier() throws ExceptionFileVide {
		if(this.tete == null) throw new ExceptionFileVide();
		return this.premier.valeur;
	}

	@Override
	public void enfiler(Object e) {
		Maillon nouveau = new Maillon();
		nouveau.valeur = e;
		nouveau.predecesseur = this.queue;
		this.queue = nouveau;
		if(this.tete == null)
			this.tete = nouveau;
		
	}

	@Override
	public void defiler() throws ExceptionFileVide {
		if(this.tete == null) throw new ExceptionFileVide();
		this.tete = this.tete.predecesseur; 
		
	}

	
	
}
