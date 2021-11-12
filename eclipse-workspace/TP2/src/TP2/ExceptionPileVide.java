package TP2;

@SuppressWarnings("serial")
public class ExceptionPileVide extends RuntimeException{
	
	public ExceptionPileVide() {
		super("--ERROR-- La pile est vide");
	}

}
