package commandes;

public class Commande {
	
	public static enum StatusCommande {	EN_COURS, VALIDEE, LIVREE, PAYEE }
	
	int id;
	StatusCommande codeStatus;
	
	public Commande(int id, StatusCommande codeStatus) {
		this.id = id;
		this.codeStatus = codeStatus;
	}
	
	public String toString() {
		return (id+ " " + codeStatus );
		
	}

}
