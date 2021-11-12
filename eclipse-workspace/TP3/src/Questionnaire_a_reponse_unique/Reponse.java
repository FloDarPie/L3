package Questionnaire_a_reponse_unique;

public class Reponse {

	String libelle;
	Boolean correct;
	
	public Reponse(String a, Boolean b) {
		this.correct=b;
		this.libelle=a;
	}
}
