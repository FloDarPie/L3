package Questionnaire_a_reponse_unique;

import java.util.LinkedList;

public class QCU {
	
	LinkedList<Question> file = new LinkedList<Question>();
	
	public QCU() {
		
	Question a = new Question("Quelle est la couleur dominante du ciel ?"); 
	Reponse aa = new Reponse("bleu", true);
	Reponse aaa = new Reponse("vert", false);
	Reponse aaaa = new Reponse("jaune", false);
	
	a.ajouterReponse(aa);
	a.ajouterReponse(aaa);
	a.ajouterReponse(aaaa);
	
	this.file.add(a);
	
	Question b = new Question("Quelle est la hauteur du viaduc de Millau ?"); 
	Reponse bb = new Reponse("42m", false);
	Reponse bbb = new Reponse("100m", false);
	Reponse bbbb = new Reponse("343m", true);
	
	b.ajouterReponse(bb);
	b.ajouterReponse(bbb);
	b.ajouterReponse(bbbb);
	this.file.add(b);

	Question c = new Question("En quelle année est née Louise Brown, le premier bébé éprouvette ?"); 
	Reponse cc = new Reponse("1968", false);
	Reponse ccc = new Reponse("1978", true );
	Reponse cccc = new Reponse("2008", false);
	
	c.ajouterReponse(cc);
	c.ajouterReponse(ccc);
	c.ajouterReponse(cccc);
	this.file.add(c);

	}
	
	
	public Question questionnaire() {
		while(this.file.size()==0)
			System.out.println(/*question*/);
		return null;
		
	}	

}
