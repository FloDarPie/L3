package communicationCrypte;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Random;

import com.sun.tools.javap.TryBlockWriter;

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
		
		int[] octetNulle = {
				0,0,0,0,0,0,0,0
		};

		int longueur = suiteBit.length % taille_bloc; //decoupe en bloc de 64 par defaut
		int[][] blocs = new int[longueur][taille_bloc];
		ArrayList liste = new ArrayList();
		for(int i = 0; i < longueur*taille_bloc  ;i++) {
			try {
				liste.add(suiteBit[i]);
			} catch Exception e {
				
			}
			
		}
		
		
		System.out.println("je suis passé là");
		for(int i = 0; i<longueur; i++) {
			for(int j = 0 ; j < taille_bloc ; j++) {
				blocs[i][j] = suiteBit[ taille_bloc * i + j ];
				System.out.println(blocs[i][j]+" "+suiteBit[ taille_bloc * i + j ]);
			}
		}
		
		
		
		
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
	
	
	//separe un bloc en deux objet G et D
	
	
	/*
	 * Construction d'une ronde
	 */
	//construire une clé K
	
	// new G = D
	
	// new D = G XOR f(K,D)
	
	/*
	 * Fin de ronde
	 */
	
	//recolle G et D
	
	// permutation inverse finale
	public int[][] permutArriere(int[][] blocs, int[] reference) {		
		int[][] blocsPermute = new int[blocs.length][blocs[0].length]; 
		
		for(int i = 0; i<blocs.length; i++) {
			for (int j = 0; j<reference.length; j++)
			blocs[i][reference[j]-1] = blocsPermute[i][j];;
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
			for(int m=8, k=0;m>0 && k<8;m-- , k++) {
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
		System.out.println("ici");
		for(int i=0;i<b.length; i++) {
			for(int j = 0; j<b[0].length;j++) {
				System.out.print(b[i][j]);
			}
		}
		System.out.println("la");
		int[][] c = permutAvant(b, this.perm_initiale);
		for(int i=0;i<c.length; i++) {
			for(int j = 0; j<c[0].length;j++) {
				System.out.print(c[i][j]);
			}
		}
		/*
		int[][] c2 = permutArriere(c, this.perm_initiale);
		System.out.println();
		for(int i=0;i<c2.length; i++) {
			for(int j = 0; j<c2[0].length;j++) {
				System.out.print(c2[i][j]);
			}
		}
		System.out.println("\npermut arriere");
		*/
		
		return a;
	}

	public String decrypte(int[] code) {
		String mess = new String();

		mess = bitToString(code);

		return mess;
	}

	
	/*
	 * @Author
	 * DuzesFlorian
	 * Premiere tentative
	 * Garder en memoire
	 * 
	 *
	public byte[][] crypte(String mess) {
		byte[] bit = mess.getBytes();
		int n = 8;
		int taille = bit.length/n;		
		byte[][] blocs = new byte[taille][n];
		
		for(int j=0; j<taille;j++ ) {
			blocs[j] = Arrays.copyOfRange(bit, j*8,8+j*8);
		}
		//this.permutation(blocs);
		return blocs;
		
	}
	
	
	public void permutation(byte[][] blocs){
		
		for(int i=0; i < blocs.length;i++) {
			
		}
		
	}
	
	public String decrypte(byte[][] messCrypte) {
		String b = new String();

		return b;
		
		
	}
	
	public static void main(String[] args) {
		Des d = new Des();
		byte[][] messCrypte = d.crypte("salut");
		System.out.println(messCrypte);
		d.StringToBit("s");
		String info = d.decrypte(messCrypte);
		System.out.println(info);
		
	}
	*/
}
