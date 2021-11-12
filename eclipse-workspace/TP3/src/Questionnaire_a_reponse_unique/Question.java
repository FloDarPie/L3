package Questionnaire_a_reponse_unique;

import java.util.Vector;

public class Question {

	String libelle;
	Vector<Reponse> reponse = new Vector<>();
	
	public Question(String a) {
		this.libelle=a;
		this.reponse=new Vector<Reponse>();
	}
	
	public void ajouterReponse(Reponse rep) {
		this.reponse.add(rep);
	}
	
	public String toString() {
		String resultat = this.libelle+"\n";
		for(int i =0; i<this.reponse.size();i++) 
			resultat +=  i +") "+this.reponse.elementAt(i).libelle+"\n";
		return resultat;
	}
	
	public Boolean estBonneReponse(int i) {
		return reponse.elementAt(i).correct;
	}
}
