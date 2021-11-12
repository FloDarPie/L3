package TP2;

public interface Pile<E> {
	
	public boolean estVide();
	public void empiler(E e);
	public void depiler() throws ExceptionPileVide;
	public E sommet() throws ExceptionPileVide;
	

}
