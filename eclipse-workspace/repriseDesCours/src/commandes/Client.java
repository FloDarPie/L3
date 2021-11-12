package commandes;
import java.util.Vector;

public class Client {

	
	
	String nom;
	String prenom;
	String ville;
	
	Vector<Commande>  historique = new Vector<Commande>();
	
	public Client(String nom,String prenom,	String ville) {
		this.nom = nom;
		this.prenom = prenom;
		this.ville = ville;
	}
	
	public void ajouterCommande(Commande cmd ) {
		historique.add(cmd);
	}
	
	public String toString() {
		return (nom + " " +  prenom + " " + "(" + ville + ")"   );
		
	}

}
