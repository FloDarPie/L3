package structure_ABR;

/**
 * Interface des opérateurs du TAD Ensemble
 * @author David Panzoli
 *
 * @param <E> Le type des éléments de l'ensemble.
 */
public interface Ensemble<E> {

	/**
	 * Ajoute un élément de l'ensemble s'il n'est pas déjà contenu
	 * @param e
	 */
	public void ajouter(E e);
	
	/**
	 * Retire un élément de l'ensemble s'il est contenu
	 * @param e
	 */
	public void enlever(E e);
	
	/**
	 * @param e
	 * @return True si l'élément e est contenu dans l'ensemble, False sinon
	 */
	public boolean contient(E e);
	
	/**
	 * @return le nombre d'éléments contenus dans l'ensemble
	 */
	public int cardinalité();
	
}
