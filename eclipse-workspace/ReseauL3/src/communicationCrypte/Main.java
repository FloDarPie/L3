package communicationCrypte;

import java.util.Arrays;

public class Main {

	public static void main(String[] args) {
		Des d = new Des();
		String mess = "Message secret";
		int[] messCrypte = d.crypte(mess);
		System.out.println("crypatage :" +messCrypte);
		/*
		String messDeCrypte = d.decrypte(messCrypte);
		System.out.println("decrypatage :" +messDeCrypte);
		*/
		/*
		byte[][] blocs = new byte[][];
		d.decrypte();
		System.out.println(d);
		*/
	}

}
