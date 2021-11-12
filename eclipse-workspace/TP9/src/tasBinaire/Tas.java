package tasBinaire;


@SuppressWarnings("rawtypes")
public class Tas<E> implements Comparable{
	
	int Indicemax = 0;
	
	private static final int cpct=15;
	public Comparable[] valeurs = new Comparable[cpct];
	
	
	public Tas(Comparable elem){
		this.valeurs[0]=elem;
		this.Indicemax=0;
	}
	
	
	@SuppressWarnings("unchecked")
	public void inserer(Tas t, Comparable elem) {
		t.Indicemax++;
		t.valeurs[t.Indicemax] = elem;
		int fils = t.Indicemax;
		int pere = (fils-1)/2;
		
		while (pere>=0 | ( t.valeurs[fils]).compareTo(t.valeurs[pere])>0){
			Comparable a = t.valeurs[pere];
			t.valeurs[pere] = t.valeurs[fils];
			t.valeurs[fils]=a;
			fils=pere;
			pere=(fils-1)/2;
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}


	@Override
	public int compareTo(Object arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

}
