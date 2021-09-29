package Hachage;

@SuppressWarnings("serial")
public class ExceptionCleIntrouvable extends Exception{
	
	public ExceptionCleIntrouvable() {
		super("Pas de clé...");
	}
}
