package Traduction;

public class Chose {
	
	String nom;
	public static enum Taille {Petit, Grand};
	public static enum Forme {Carre, Rond};
	public static enum Couleur {jaune, Vert, Noir};

	public Taille taille;
	public Forme forme;
	public Couleur couleur;
	
	public  Chose(String s, Taille t, Forme f, Couleur c) {
		this.nom =s;
		this.taille=t;
		this.forme=f;
		this.couleur=c;		
		
	}
	
	public String toString() {
		return this.nom;
	}
}
