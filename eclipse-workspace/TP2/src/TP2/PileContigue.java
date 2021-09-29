package TP2;

@SuppressWarnings("rawtypes")
public class PileContigue implements Pile {
	
	private static int cmpt;
	Object[] valeurs = new Object[50];

	
	@SuppressWarnings("static-access")
	public PileContigue() {
		this.cmpt = -1;
	}

	@Override
	public boolean estVide() {
		return PileContigue.cmpt == -1;
	}

	@SuppressWarnings("static-access")
	@Override
	public void empiler(Object e) {
		this.cmpt++;
		valeurs[this.cmpt]=e;
		
	}

	@SuppressWarnings("static-access")
	@Override
	public void depiler() throws ExceptionPileVide {
		if (this.cmpt !=-1)
			this.cmpt--;

	}

	@SuppressWarnings("static-access")
	@Override
	public Object sommet() throws ExceptionPileVide {
		if (this.cmpt >=0)
			return valeurs[this.cmpt];
		else
			return new ExceptionPileVide();
		
	}
	
	

}
