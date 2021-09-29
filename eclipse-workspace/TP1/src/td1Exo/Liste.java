package td1Exo;

	
	public interface Liste<E> {
		
		int longueur();
		
		E ième(int indice)throws ExceptionIndiceHorslimite;
		
		void inserer (int indice, E element) throws ExceptionIndiceHorslimite;
		
		void supprimer(int indice) throws ExceptionIndiceHorslimite;
		
	}
