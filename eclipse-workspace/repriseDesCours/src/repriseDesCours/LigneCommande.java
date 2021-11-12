package repriseDesCours;

public class LigneCommande {

	String article;
	double prixUnitaire;
	int quantite;
	
	public LigneCommande(String article,int quantite,double prixUnitaire) {
		this.article=article;
		this.quantite= quantite;
		this.prixUnitaire = prixUnitaire;
	}
	
	public static void main(String[] args) {
		
		LigneCommande[] lignes = { 
				new LigneCommande("Bac 16L tri-matière renforcé",1,86.60),
				new LigneCommande("Protection ThermaQuiet aluminium noir",1,14.90),
				new LigneCommande("PFixation à clip 1/8” 6.5mm",5,4.35)		
		};
		
		double montant = 0;
		
		for(LigneCommande l : lignes) {
			montant+= l.quantite*l.prixUnitaire;
		}
		
		System.out.println(montant);
	}

}
