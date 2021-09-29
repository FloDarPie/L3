package communicationCrypte;

import java.util.Arrays;
import java.util.Random;

public class Des<E> {
	
	private int taille_bloc = 64;
	private int sous_bloc = 32;
	
	private int nb_ronde = 1;
	
	private int[] perm_initiale = {
			58,50,42,34,26,18,10,2,
			60,52,44,36,28,20,12,4,
			62,54,46,38,30,22,14,6,
			64,56,48,40,32,24,16,8,
			57,49,41,33,25,17,9,1,
			59,51,43,35,27,19,11,3,
			61,53,45,37,29,21,13,5,
			63,55,47,39,31,23,15,7};

	private int[] tab_decalage = {1,1,2,2,2,2,2,2,1,2,2,2,2,2,2,1};
	private int[] master_key = new int[this.taille_bloc];
	
	public Des() {
		Random r = new Random();
		r.setSeed(0);
		for(int i =0;i<this.taille_bloc;i++) {
			this.master_key[i] = r.nextInt(1);
		}
		
		//crée tab_cles

	}
	private int[] stringToBit(String message){
		byte[] octet = message.getBytes();
		int taille = octet.length;
		int[] listebit = new int[8*taille];
		for(int i=0;i<taille;i++) {
			byte mot = octet[i];
			String motBinaire  = Integer.toString(mot,2);
			for(int j = 0; j<motBinaire.length();j++){
				listebit[i*8+j] = Character.getNumericValue((Character)motBinaire.charAt(j));
			}
		}
		return listebit;
	}
	
	private String bitToString(int[] listebit) {
		String mess = new String();
		String octet = "";
		for(int i = 0; i<listebit.length;i++) {
			octet+=((Integer)listebit[i]).toString();
			if(i%8==0) {
				octet.;//regler en puissance de 2 avec un calcul au fur et à mesure
			}
		}
		
		
		return mess;
	}
	
	public int[] crypte(String mess) {
		int[] a = stringToBit(mess);
		System.out.println(Arrays.toString(a));
		System.out.println(a.length);
		return a;
	}
	
	public String decrypte(int[] code) {
		String mess = new String();
		System.out.println(code.length);
		mess = bitToString(code);
		System.out.println(mess);

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
	
	
	private void permutation(byte[][] blocs){
		
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