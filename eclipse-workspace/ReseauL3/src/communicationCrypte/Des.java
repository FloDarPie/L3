package communicationCrypte;

import java.util.Arrays;
import java.util.Random;

public class Des<E> {
	
	public int taille_bloc = 64;
	public int sous_bloc = 32;
	
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
	public int[] stringToBit(String message){
		byte[] octet = message.getBytes();
		for(int i=0; i<octet.length;i++) {
			System.out.print(octet[i] + " ");
		}
		System.out.println();
		
		
		int taille = octet.length;
		int[] listebit = new int [ 8 * taille ]; //on admet ici que les bytes correspondent à des octets
		
		for(int i = 0 ; i < taille ; i++) {
			
			byte mot = octet[i];
			
			String motBinaire  = Integer.toString(mot,2);
			
			for(int j = 0 ; j < motBinaire.length() ; j++){
				listebit[ i * 8 + j ] = Character.getNumericValue((Character)motBinaire.charAt(j));
			}
		}
		for(int i = 0; i<listebit.length;i++) {
			System.out.print(listebit[i]);
		}
		System.out.println();
		
		return listebit;
	}
	
	//decoupe en blocs un tableau de bit
	public int[][] suiteBitToBloc(int[] suiteBit){
		
		int taille = suiteBit.length;
		int longueur = taille / this.taille_bloc; //decoupe en bloc de 8 par defaut
		int[][] blocs = new int[longueur][this.taille_bloc];
		
		for(int i = 0; i<longueur; i++) {
			for(int j = 0 ; j < this.taille_bloc ; j++) {
				blocs[i][j] = suiteBit[ this.taille_bloc * i + j ];
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
		String mess = new String();
		String octet = "";
		for(int i = 0; i<listebit.length;i++) {
			octet+=((Integer)listebit[i]).toString();
			
		}
				
		//morceau a convertir
		
		int tailleOctet = octet.length();
		System.out.println(tailleOctet);
		//affichage d'octet
		for(int i = 1; i<tailleOctet; i++) {
			System.out.print(octet.substring(i-1,i));
		}
		System.out.println();
		String[] tableauOctet = new String[tailleOctet/8];
		Integer[] tabValOctet = new Integer[tailleOctet/8];
		int j = 0;
		while(tailleOctet/8 != j) {
			tableauOctet[j] = octet.substring(j*8,j*8+8);
			j++;
		}
		
		//convertir des series de blocs de 8 bits, en une valeur decimal
		for(int i =0; i<tableauOctet.length;i++) {
			tabValOctet[i]=0;
			for(int m=7, k=0;m>-1 && k<8;m-- , k++) {
				int chiffre = 1;
				for(int l = 0; l<m-1;l++) {
					chiffre *= 2;
				}
				tabValOctet[i] += chiffre * Integer.parseInt(tableauOctet[i].substring(k,k+1));;
			}
		}
		
		//affichage des octets
		for(int i=0;i<tabValOctet.length;i++) {
			System.out.print(tabValOctet[i]+" ");
		}System.out.println();
		
		System.out.println(tableauOctet.length == tabValOctet.length);

		//changer une valeur numérique en sa valeur
		/* a changer pour prendre ne compte les carac spéciaux*/
		for(int i = 0; i<tabValOctet.length;i++) {
			
			//pour gerer l'espace
			if(tabValOctet[i]==64) {
				tabValOctet[i]/=2;
			}
			
			mess += ((char)((int)tabValOctet[i]));
		}
		return mess;
	}
	
	
	
	public int[] crypte(String mess) {
		int[] a = stringToBit(mess);
		
		int[][] b = suiteBitToBloc(a);	
		
		System.out.println("suite initiale");
		for(int i=0;i<b.length; i++) {
			for(int j = 0; j<b[0].length;j++) {
				System.out.print(b[i][j]);
			}
		}
		
		int[][] c = permutAvant(b, this.perm_initiale);
		System.out.println("\npermut avant:");
		for(int i=0;i<c.length; i++) {
			for(int j = 0; j<c[0].length;j++) {
				System.out.print(c[i][j]);
			}
		}
		
		int[][] c2 = permutArriere(c, this.perm_initiale);
		System.out.println();
		for(int i=0;i<c2.length; i++) {
			for(int j = 0; j<c2[0].length;j++) {
				System.out.print(c2[i][j]);
			}
		}
		System.out.println("\npermut arriere");
		
		
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
