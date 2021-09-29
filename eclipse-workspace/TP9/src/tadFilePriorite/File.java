package tadFilePriorite;

public interface File<E> {

	public boolean estVide();
	public E premier() throws ExceptionFileVide;
	public void enfiler(E e);
	public void défiler() throws ExceptionFileVide; 
	
}
