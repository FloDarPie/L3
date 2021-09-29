package exosSimples;

import java.util.Random;
import java.util.TreeSet;

public class MoyenneEnsemble {
	
	public static void main(String[] args) {
	
	TreeSet<Integer> t = new TreeSet<Integer>();
	
	Random random = new Random();
	
	int taille = 15;
	
	for(Integer i = 0; i<=taille; i++) {
		t.add((Integer) random.nextInt(101));
		}
	
	Integer a = 0;
	
	for(Integer i : t) {
		a+=i;
		System.out.print(i+" ");
	}
	System.out.print("\n"+"Moyenne : ");
	int moy = a/t.size();
	System.out.println(moy);
	
	
	if (moy==t.floor(moy)) {
		System.out.println("Contenue dans l'ensemble.");
	}

	else {
		System.out.println("Valeur la plus proche : "+t.floor(moy));
	}
		
	
	
	}
	
}
