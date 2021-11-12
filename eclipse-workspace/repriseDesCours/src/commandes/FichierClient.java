package commandes;

import java.util.Vector;

import commandes.Commande.StatusCommande;

public class FichierClient {
	
	Vector<Client> catalogue = new Vector<Client>();

	public FichierClient() {
		
		Client client = new Client("Martin","Valerie","Albi");
		client.ajouterCommande(new Commande(12897, Commande.StatusCommande.EN_COURS));
		client.ajouterCommande(new Commande(86416, Commande.StatusCommande.VALIDEE));
		client.ajouterCommande(new Commande(98716, Commande.StatusCommande.LIVREE));
		this.catalogue.add(client);
		
		client = new Client("Ndiaye","Marie","Dakar");
		client.ajouterCommande(new Commande(61573, Commande.StatusCommande.EN_COURS));
		client.ajouterCommande(new Commande(36475, Commande.StatusCommande.LIVREE));
		this.catalogue.add(client);
		
		client = new Client("Smith","Peter","New-York");
		this.catalogue.add(client);
		
	}
	
	
	public Vector<Client> clientsVierge() {
		
		Vector<Client> iiiii = new Vector<Client>();
		
		for (Client client : catalogue) {
			if (client.historique.size()==0){
				iiiii.add(client);
			}
		}
		return iiiii;
		
	}
	
	public Vector<Commande> listerCommandes(StatusCommande codeStatus){
		
		Vector<Commande> ii = new Vector<Commande>();
		
		for (Client client : catalogue) {
			for (Commande commande : client.historique) {
				if (commande.codeStatus == codeStatus){
					ii.add(commande);
				}
			}
		}
		
		return ii;
		
	}
	
	
	public static void main(String[] args) {
		
		FichierClient essai = new FichierClient(); 

		System.out.println(essai.clientsVierge());
		System.out.println(essai.listerCommandes(Commande.StatusCommande.EN_COURS));
		
	}

}
