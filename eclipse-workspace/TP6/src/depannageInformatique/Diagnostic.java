package depannageInformatique;

import propriétéArbreBinaire.Noeud;

public class Diagnostic {

	Noeud<String> courant;
	String etiquette;
	
	public Diagnostic(Noeud<String> noeud){
		this.courant=noeud;
	}
	
	/*
	public String toString() {
		return (String) this.courant;
	}
	*/
	
	public boolean estResolu() {
		return this.courant == null && this.courant == null;
	}
	
	/*
	public void progresse(String rep) {
		
		switch (rep) {
		case "oui":
			this.courant=this.courant.sag;			
			break;
		case "non":
			this.courant=this.courant.sad;			
			break;
		default:
			break;
		}
	}
	
	*/
	
	public String lancement() {
		
		/*
		while (Diagnostic.this.courant.){
			
			
		}*/
		return "en cours d'élaboration";
		
	}
	
	public static void main(String args[]) {
		Noeud<String> diagnostic = 
				new Noeud<String>("Un affichage apparaît-il à l'écran ?",
				/*oui*/ new Noeud<String>("Le pointeur est-il affiché à l'écran ?",
								new Noeud<String>("Le pointeur bouge-t-il lorsqu'on manipule la souris",
										new Noeud<String>("Le système fonctionne correctement."),
										new Noeud<String>("Il s'agit d'une panne de souris.")),
								new Noeud<String>("La souris est-elle branchée correctement ?",
										new Noeud<String>("Il s'agit d'une panne de souris."),
										new Noeud<String>("Brancher la souris.") )),
				
				/*non*/ new Noeud<String>("Le voyant de marche est-il allumé ?",
								new Noeud<String>("L'appareil est-il en veille ?",
										new Noeud<String>("Sortir l'appareil du mode veille."),
										new Noeud<String>("Il s'agit d'une panne d'affichage.")),
								new Noeud<String>("L'appareil est éteint. Allumer l'appareil.")));
		
		System.out.println(diagnostic.hauteur());
		System.out.println(diagnostic.taille());
		
		
		System.out.println(diagnostic);
	}
}







