package Hachage;

public class TableHachage<Cle,Valeur> {
	
	class Couple {
		Cle cle;
		Valeur valeur;
		
		public Couple(Cle c, Valeur v) {
			this.cle=c;
			this.valeur=v;
		}
	}
	
	public int CAPCT = 15;
	public Object[] données = new Object[CAPCT];
		
	
	
	
	public void insererCouple(Cle c, Valeur v) {
		int i = Math.abs(c.hashCode()) % CAPCT;
		données[i] = new Couple(c,v);
	}
	
	@SuppressWarnings("unchecked")
	public boolean testerCle(Cle c) {
		int i = Math.abs(c.hashCode()) % CAPCT;
		if (données[i] != null)
			return ((Couple) données[i]).cle.equals(c);
		else
			return false;
		
	}
	
	@SuppressWarnings("unchecked")
	public Object recupererValeur(Cle c) {
		int i = Math.abs(c.hashCode()) % CAPCT;
		
		if (((Couple) données[i]).cle == c)
			return ((Couple) données[i]).valeur;
		else
			return "Pas de couple";
		
	}
	
	@SuppressWarnings("unchecked")
	public void supprimerCouple(Cle c) throws ExceptionCleIntrouvable {
		int i = Math.abs(c.hashCode()) % CAPCT;
		
		if (((Couple) données[i]).cle == c)
			données[i]=null;
		
	}
	
	@SuppressWarnings("unchecked")
	public String toString() {
		String t ="";
		Integer pas =0;
		for( Object i : données)
			if (((Couple) i).valeur == null)
				t+= pas.toString() + " - " +"\n";
			else
				t+= pas.toString() + " - <"+ ((Couple) i).cle +", "+ ((Couple) i).valeur +"\n";
			pas++;

		return t;
	}
	
	
}
