package communicationCrypte;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;

<<<<<<< HEAD


/*
 * @Author 
 * Duzes Florian
 * L3
 * 
 * acheve le 24/10/2021
 * 
 * 
 * 
 * les methodes suiteBitToBlocs et separeEnSousblocs sont similaires, je pense que j'aurais pus mieux faire sur ce point
 */

=======
>>>>>>> c9c5a963d8ac36c612167b143af0ab99615cdfc7

public class Des<E> {
	
	public int taille_bloc = 64;
	public int sous_bloc = this.taille_bloc / 2;
	
	public int nb_ronde = 1;
	
	public int[] perm_initiale = {
			58,50,42,34,26,18,10,2,
			60,52,44,36,28,20,12,4,
			62,54,46,38,30,22,14,6,
			64,56,48,40,32,24,16,8,
			57,49,41,33,25,17,9,1,
			59,51,43,35,27,19,11,3,
			61,53,45,37,29,21,13,5,
			63,55,47,39,31,23,15,7};

	public int[] tab_decalage = {1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};
	public int[] master_key = new int[this.taille_bloc];
	
	public Des() {
		Random r = new Random();
		r.setSeed(0);
		for(int i = 0 ; i < this.taille_bloc ; i++) {
			this.master_key[i] = r.nextInt(1);
		}
		
		//crée tab_cles

	}
	
	//change un string en suite de bit
	public int[] stringToBit(String message) {
		byte[] octet = message.getBytes();
		//System.out.println(octet[0]);
		/*
		 *
		for(int i=0; i<octet.length;i++) {
			System.out.print(octet[i] + " ");
		}
		System.out.println();
		*/
		
		int taille = octet.length;
		int[] listebit = new int [ 8 * taille ]; //on admet ici que les bytes correspondent à des octets
		
		for(int i = 0 ; i < taille ; i++) {
			
			byte mot = octet[i];
			
			String motBinaire  = Integer.toString(mot,2);
			//System.out.println(motBinaire);
			//converti le mot binaire String en int
			
			int[] petitTableau = new int[motBinaire.length()];
			for(int j = 0 ; j < motBinaire.length(); j++){
				petitTableau[j] = Character.getNumericValue((Character) motBinaire.charAt(j));
			}
			
			//mettre ce petit tableau dans une case de notre liste de bit
			for (int j = 8-petitTableau.length; j< 8;j++) {
				listebit[i*8+j] = petitTableau[j - 8 + petitTableau.length];
			}
		}
		/*
		 * affiche le tableau de bit
		 * 
		 *
		for(int i = 0; i<listebit.length;i++) {
			System.out.print(listebit[i]);
		}
		System.out.println();
		*/
		return listebit;
	}
	
	//decoupe en blocs un tableau de bit
	public int[][] suiteBitToBloc(int[] suiteBit, int taille_bloc){
		
		int longueur = suiteBit.length / taille_bloc +1; //decoupe en bloc de 64 par defaut
		int[][] blocs = new int[longueur][taille_bloc];
<<<<<<< HEAD
		ArrayList<Integer> liste = new ArrayList<Integer>();
		for(int i = 0; i < longueur*taille_bloc  ;i++) {
			try {
				liste.add(suiteBit[i]);
			} catch (Exception e) { //on bourre les octets restants avec des zeros
				liste.add(0);
			}
			
		}
=======
		ArrayList liste = new ArrayList();
		
>>>>>>> c9c5a963d8ac36c612167b143af0ab99615cdfc7
		
				
		for(int i = 0; i<longueur ; i++) {
			for(int j = 0 ; j < taille_bloc ; j++) {
				blocs[i][j] = (int) liste.get( taille_bloc * i + j );

			}
		}
		
		System.out.println();
		
		
		return blocs;
	}
	
	//permutation avant
	public int[][] permutAvant(int[][] blocs, int[] reference) {
		
		int[][] blocsPermute = new int[blocs.length][this.taille_bloc]; 
		
		for(int i = 0; i<blocs.length; i++) {
			for (int j = 0; j<reference.length; j++)
			blocsPermute[i][j] = blocs[i][reference[j]-1];;
		}
		return blocsPermute;
	}
	
	
	//separe un bloc de taille 64 en deux objet G et D
	public int[][] separeEnSousblocs (int[] bloc){
		int[] g = new int[this.sous_bloc];
		int[] d = new int[this.sous_bloc];
		for (int i = 0; i < d.length; i++) {
			g[i] = bloc[i];
			d[i] = bloc[i+this.sous_bloc];
		}
		int[][] rep = {
				g,d
		};
		return rep;
		
	}
	
	/*
	 * Construction d'une ronde
	 */
	
	public int[] XOR(int[] a ,int[] b) {
		int[] retour = new int[a.length];
		for (int i = 0; i < retour.length; i++) {
			retour[i] = (2 - a[i] - b[i]) % 2;// (2 -0) %2 = O | (2 -1) %2 = 1 | (2 -2) %2 = O
		}
		return retour;
	
	//construire une clé K
	
	// new G = D
	
	// new D = G XOR f(K,D)

	}
	
	/*
	 * Fin de ronde
	 */
	
	//recolle G et D
	public int[] soudeSousblocs(int[][] blocs) {
		ArrayList<Integer> liste = new ArrayList<Integer>();
		for (int i = 0; i < blocs.length; i++) {
			for (int j = 0; j < blocs[0].length; j++) {
				liste.add(blocs[i][j]);
			}
		}
		
		
		int[] bloc = new int[this.taille_bloc];
		for (int i = 0; i < bloc.length; i++) {
			bloc[i] = liste.get(i);
		}
		
		return bloc;
	}
	
	// permutation inverse finale
	public int[][] permutArriere(int[][] blocs, int[] reference) {		
		int[][] blocsPermute = new int[blocs.length][blocs[0].length]; 
		
		for(int i = 0; i<blocs.length; i++) {
			for (int j = 0; j<reference.length; j++)
				blocsPermute[i][j] =blocs[i][reference[j]-1] ;;
		}
		return blocsPermute;
	}
	
	
	
	
	//convertir une chaine de bit en une suite de string
	public String bitToString(int[] listebit) {
		String mess = "";
		/*
		for(int i = 0;i<listebit.length;i++) {
			System.out.print( listebit[i] );
		}
		System.out.println();
		*/
		//convertir des series de blocs de 8 bits, en une valeur decimal
		for(int i =0; i<listebit.length;i+=8) {
			int lettre=0;
			for(int m=8, k=i;m>0 && k<i+8;m-- , k++) {
				int chiffre = 1;
				for(int l = 0; l<m-1;l++) {
					chiffre *= 2;
				}
				//System.out.println(listebit[k]+" "+chiffre);
				lettre += chiffre * listebit[k];
			}
			//System.out.println(lettre);
			mess += Character.toString((char) lettre );
			
		}
		//System.out.println(mess);
		return mess;
	}
	
	
	
	public int[] crypte(String mess) {
		int[] a = stringToBit(mess);
		
		
		int[][] b = suiteBitToBloc(a,this.taille_bloc);	
		
		int[][] c = permutAvant(b, this.perm_initiale);
		
		int[][] c2 = permutArriere(c, this.perm_initiale);
		
		int[] d = soudeSousblocs(c2);
		return a;
	}

	public String decrypte(int[] code) {
		String mess = new String();

		mess = bitToString(code);

		return mess;
	}


}
